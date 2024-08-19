import 'dart:convert';
import 'dart:io';

import 'package:just_audio/just_audio.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'audioplayer_model.dart';
export 'audioplayer_model.dart';

class AudioplayerWidget extends StatefulWidget {
  const AudioplayerWidget({
    super.key,
    required this.magazineref,
  });

  final DocumentReference? magazineref;

  @override
  State<AudioplayerWidget> createState() => _AudioplayerWidgetState();
}

class _AudioplayerWidgetState extends State<AudioplayerWidget> {
  late AudioplayerModel _model;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;
  late String audioFilePath;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AudioplayerModel());

    // Initialize the audio player
    _initializeAudio();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _model.dispose();
    super.dispose();
  }

  Future<void> _initializeAudio() async {
    try {
      final newsRecord = await NewsRecord.getDocumentOnce(widget.magazineref!);
      if (newsRecord != null) {
        // Generate the TTS audio
        await _playTextToSpeech(newsRecord.descriptions);
      }
    } catch (e) {
      print('Error initializing audio: $e');
    }
  }

  Future<void> _playTextToSpeech(String text) async {
    try {
      final apiKey =
          'AIzaSyBmZU2WdsfFwE4rG2CgFYtGgmpl7OKvykY'; // Replace with your API key
      final url = Uri.parse(
          'https://texttospeech.googleapis.com/v1/text:synthesize?key=$apiKey');

      final requestPayload = jsonEncode({
        'input': {'text': text},
        'voice': {
          'languageCode': 'kn-IN', // Language code for Kannada
          'ssmlGender': 'FEMALE',
        },
        'audioConfig': {
          'audioEncoding': 'MP3',
        },
      });

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: requestPayload,
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final audioContent = responseData['audioContent'];

        // Decode the base64 audio content and save it as an MP3 file
        final directory = await getApplicationDocumentsDirectory();
        audioFilePath = '${directory.path}/output.mp3';
        final file = File(audioFilePath);
        await file.writeAsBytes(base64Decode(audioContent));

        // Load the audio into the player
        await _audioPlayer.setFilePath(audioFilePath);
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  void _togglePlayPause() {
    if (isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryText,
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 24.0,
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: StreamBuilder<NewsRecord>(
            stream: NewsRecord.getDocument(widget.magazineref!),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                );
              }

              final newsRecord = snapshot.data!;
              return Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(newsRecord.photo).image,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        newsRecord.photo,
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: MediaQuery.sizeOf(context).height * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    IconButton(
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_filled,
                        size: 64.0,
                        color: Colors.white,
                      ),
                      onPressed: _togglePlayPause,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _audioPlayer.stop();
                        Navigator.pop(context);
                      },
                      child: Text('Stop and Go Back'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
