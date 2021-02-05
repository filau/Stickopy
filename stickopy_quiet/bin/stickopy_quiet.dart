import "dart:io";
import "dart:convert";
import 'package:file_utils/file_utils.dart';

void main() {
  Process.run("powershell", [
    "-command",
    "if (Test-Path C:\\Users\\Public\\AppData\\sp.txt) {Remove-Item C:\\Users\\Public\\AppData\\sp.txt}"
  ]);

  Process.run("powershell", [
    "-command",
    "New-Item -ItemType Directory -Force -Path C:\\Users\\Public\\AppData"
  ]); // Create folder where files will be copied.

  Process.run("powershell", [
    "-command",
    "\$f=get-item C:\\Users\\Public\\AppData -Force;\$f.attributes='Hidden'"
  ]); // Set the folder as hidden.

  List emptyList = [];

  FileUtils.chdir("C:\\Users\\Public\\AppData");
  new File("sp.txt").writeAsString(jsonEncode(emptyList));

  Process.run('wmic', [
    'logicaldisk',
    'where',
    'drivetype=2',
    'get',
    'DeviceID'
  ]) // Check all drives of type "2" (= removable disk) connected to the device.

      .then((result) {
    String output = result.stdout;
    output = output.replaceAll("DeviceID", "").replaceAll(
        " ", ""); // Remove all useless infos in the output of the command.

    LineSplitter ls = new LineSplitter();
    List<String> lines = ls.convert(output); // Divide the output into a List.

    lines.removeWhere(
        (content) => content == ""); // Remove empty elements of the list.

    for (String deviceID in lines) {
      // Iterate through all disponible removable disks.
      print(deviceID);
    }
  });
}
