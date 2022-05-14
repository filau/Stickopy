# How to compile Stickopy?

## Requirements
* the [Dart SDK](https://dart.dev/get-dart), with `dart2native` reachable in the PATH;
* a PC running Windows 10 or 11 (64 bits CPU required!).

## Steps
* download the source code of the [latest version](https://github.com/FLA-Coding/Stickopy/releases/latest) of Stickopy and unzip it;
* open a Command Prompt in the source code folder;
* type:
  * if you have GNU Make installed: `make`;
  * else: ```dart2native bin\stickopy.dart -o stickopy.exe```.

**An executable of *Stickopy* called** `stickopy.exe` **should be at the root of the source code.**
