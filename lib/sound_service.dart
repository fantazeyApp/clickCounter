import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class SoundService {
  Soundpool? pool;
  int? soundId, soundId2;
  SoundService() {
    init();
  }
  Future init() async {
    pool = Soundpool.fromOptions();
    soundId = await rootBundle
        .load('assets/sounds/click_button.mp3') //your sound file name here
        .then((ByteData soundData) {
      return pool!.load(soundData);
    });
    soundId2 = await rootBundle
        .load('assets/sounds/click_button.mp3') //your sound file name here
        .then((ByteData soundData) {
      return pool!.load(soundData);
    });
  }

  playSound() {
    pool!.play(soundId!);
  }

  playSound2() {
    pool!.play(soundId2!);
  }
}
