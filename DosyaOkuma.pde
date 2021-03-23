import java.io.FileReader;
import static java.util.stream.Collectors.*;
import java.util.stream.Collectors;
import java.util.List;

class DosyaOkuma {

  private String path;

  DosyaOkuma(String path) {
    this.path = path;
  }

  List < String > tamaminiOku() { 
    try {
      BufferedReader br = new BufferedReader(new FileReader(new File(path)));
      List < String > lines = (List)br.lines().collect(Collectors.toList());
      br.close();
      return lines;
    }
    catch (IOException ex) {
      print("Dosya okunamadı");
    }
    return null;
  }

}
