import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:persotrainer/models/responses/transactionResponse.dart';
import 'package:persotrainer/models/user.dart';
import 'package:persotrainer/services/authentication_service.dart';
import 'package:persotrainer/services/converter/jsonToType_converter.dart';
import 'package:persotrainer/services/database_service.dart';
import 'package:persotrainer/services/escrow_service.dart';
import 'package:persotrainer/states/chat_state.dart';
import 'package:persotrainer/states/seller_state.dart';
import 'package:persotrainer/states/signup_state.dart';
import 'package:persotrainer/states/user_state.dart';
import 'package:persotrainer/ui/views/appointment_screen.dart';
import 'package:persotrainer/ui/views/edit_profile.dart';
import 'package:persotrainer/ui/views/homepage.dart';
import 'package:persotrainer/ui/views/sign_up.dart';
import 'package:persotrainer/ui/views/videocall_screen.dart';
import 'package:persotrainer/utils/const.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'services/authentication_service.dart';
import 'ui/views/sign_in.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  await Firebase.initializeApp();
  Hive.registerAdapter(UserAdapter());
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 2280),
      builder: () => MultiProvider(
        providers: [
          Provider<AuthenticationService>(
              create: (_) =>
                  AuthenticationService(firebaseAuth.FirebaseAuth.instance)),
          Provider<UserState>(create: (_) => UserState()),
          Provider<DatabaseService>(
              create: (_) => DatabaseService(FirebaseFirestore.instance)),
          StreamProvider(
            initialData: null,
            create: (context) =>
                context.read<AuthenticationService>().authStateChanges,
          ),
          ChangeNotifierProvider<SignUpState>(
            create: (_) => SignUpState(),
          ),
          ChangeNotifierProvider<SellerState>(
            create: (_) => SellerState(),
          ),
          Provider<ChatState>(
            create: (_) => ChatState(),
          ),
          Provider<EscrowService>(
            create: (_) => EscrowService.create(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
            primaryColor: Color(0xFF50CB87),
          ),
          home: AuthenticationWrapper(),
        ),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final signUpState = Provider.of<SignUpState>(context);
    final firebaseUser = context.watch<firebaseAuth.User>();
    if (firebaseUser != null) {
      return Homepage();
    }
    return signUpState.showSignUp ? SignUp() : SignIn();
  }
}
