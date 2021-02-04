import "dart:io";
import "dart:convert";

main() {

  Process.run('wmic', ['logicaldisk', 'where', 'drivetype=2', 'get', 'DeviceID']).then((result) {

    String output = result.stdout;
    output = output.replaceAll("DeviceID", "");
    //print(output);

    LineSplitter ls = new LineSplitter();
    List<String> lines = ls.convert(output);

    print(lines);

  });


  //List out;
}