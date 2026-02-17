import 'dart:io';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class VoiceRecorder {
  final AudioRecorder _recorder = AudioRecorder();

  // Max 5 minutes
  static const maxDuration = Duration(minutes: 5);
  Future<void> startRecording() async {
    try {
      if (await _recorder.hasPermission()) {
        final dir = await getTemporaryDirectory();
        final path =
            '${dir.path}/voice_${DateTime.now().millisecondsSinceEpoch}.m4a';

        await _recorder.start(
          const RecordConfig(encoder: AudioEncoder.aacLc),
          path: path,
        );
 
        // Auto-stop after 5 minutes
        Future.delayed(maxDuration, () async {
          if (await _recorder.isRecording()) {
            await stopRecording();
          }
        });
      }
    } catch (e) {
      debugPrint("Start recording error: $e");
    }
  }
  Future<String?> stopRecording() async {
    try {
      final path = await _recorder.stop();
      return path; // File path to send
    } catch (e) {
      debugPrint("Stop recording error: $e");
      return null;
    }
  }
  Future<void> cancelRecording() async {
    try {
      final path = await _recorder.stop();
      if (path != null) {
        final file = File(path);
        if (await file.exists()) {
          await file.delete();
        }
      }
    } catch (e) {
      debugPrint("Cancel recording error: $e");
    }
  }
  Future<bool> isRecording() async {
    return await _recorder.isRecording();
  }
  void dispose() {
    _recorder.dispose();
  }
}
