import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:persotrainer/utils/const.dart';

class VideoCallScreen extends StatefulWidget {
  final String channelName;
  final ClientRole role;
  const VideoCallScreen({Key key, this.role, this.channelName})
      : super(key: key);
  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final _users = <int>[];
  final _infoStrings = <String>[];
  bool muted = false;
  RtcEngine _engine;

  @override
  void dispose() {
    // clear users
    _users.clear();
    // destroy sdk
    _engine.leaveChannel();
    _engine.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    if (APP_ID.isEmpty) {
      setState(() {
        _infoStrings.add(
          'APP_ID missing, please provide your APP_ID in settings.dart',
        );
        _infoStrings.add('Agora Engine is not starting');
      });
      return;
    }

    await _initAgoraRtcEngine();
    _addAgoraEventHandlers();
    await _engine.enableWebSdkInteroperability(true);
    VideoEncoderConfiguration configuration = VideoEncoderConfiguration();
    configuration.dimensions = VideoDimensions(1920, 1080);
    await _engine.setVideoEncoderConfiguration(configuration);
    await _engine.joinChannel(Token, widget.channelName, null, 0);
  }

  Future<void> _initAgoraRtcEngine() async {
    _engine = await RtcEngine.create(APP_ID);
    await _engine.enableVideo();
    await _engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await _engine.setClientRole(widget.role);
  }

  void _addAgoraEventHandlers() {
    _engine.setEventHandler(RtcEngineEventHandler(error: (code) {
      setState(() {
        final info = 'onError: $code';
        _infoStrings.add(info);
      });
    }, joinChannelSuccess: (channel, uid, elapsed) {
      setState(() {
        final info = 'onJoinChannel: $channel, uid: $uid';
        _infoStrings.add(info);
      });
    }, leaveChannel: (stats) {
      setState(() {
        _infoStrings.add('onLeaveChannel');
        _users.clear();
      });
    }, userJoined: (uid, elapsed) {
      setState(() {
        final info = 'userJoined: $uid';
        _infoStrings.add(info);
        _users.add(uid);
      });
    }, userOffline: (uid, elapsed) {
      setState(() {
        final info = 'userOffline: $uid';
        _infoStrings.add(info);
        _users.remove(uid);
      });
    }, firstRemoteVideoFrame: (uid, width, height, elapsed) {
      setState(() {
        final info = 'firstRemoteVideo: $uid ${width}x $height';
        _infoStrings.add(info);
      });
    }));
  }

  List<Widget> _getRenderViews() {
    final List<StatefulWidget> list = [];
    if (widget.role == ClientRole.Broadcaster) {
      list.add(RtcLocalView.SurfaceView());
    }
    _users.forEach((int uid) => list.add(RtcRemoteView.SurfaceView(uid: uid)));
    return list;
  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    _engine.switchCamera();
  }

  @override
  Widget build(BuildContext context) {
    final views = _getRenderViews();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: 1.sh,
                child: views[0],
              ),
              Positioned(
                right: 5,
                bottom: 104,
                child: Container(
                  height: 177,
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Color(0xFF53D187),
                    ),
                  ),
                  child: views.length > 1
                      ? views[1]
                      : Container(
                          height: 10,
                          width: 10,
                          child: Center(child: CircularProgressIndicator())),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   child: Image.asset(
                  //     'assets/images/videocallfront.jpg',
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 94,
                  width: 1.sw,
                  color: Colors.white.withOpacity(.84),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => _onSwitchCamera(),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.switch_camera,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _onCallEnd(context),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/icons/stop.png',
                              height: 45,
                              width: 45,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _onToggleMute(),
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: muted ? Colors.redAccent : Colors.grey,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/icons/mute.png',
                              height: 25,
                              width: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
