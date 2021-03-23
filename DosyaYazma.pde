import java.io.FileWriter;
import java.io.RandomAccessFile;

class DosyaYazma {

  private String path;

  DosyaYazma(String path) {
    this.path = path;
  }

  void yaz(String text) {  
    try {
      File f = new File(path);
      f.createNewFile();
      f.setWritable(true);

      FileWriter fw = new FileWriter(f);
      fw.write(text);
      fw.flush();
      fw.close();
    } 
    catch (IOException ex) {
      print("HATA");
    }
  }

  void ekle(String text) {  
    try {
      File f = new File(path);
      f.createNewFile();
      f.setWritable(true);

      FileWriter fw = new FileWriter(f, true);
      fw.write(text);
      fw.flush();
      fw.close();
    } 
    catch (IOException ex) {
      print("HATA");
    }
  }

  String sondanSil() {     
    StringBuilder sb = new StringBuilder();

    try {
      RandomAccessFile f = new RandomAccessFile(new File(path), "rw");
      long lineLength = f.length() - 1;
      byte b;

      do { // son satırda kaç harf var 
        lineLength -= 1;
        if (lineLength < 0) {
          lineLength = -1;
          break;
        }
        f.seek(lineLength);
        b = f.readByte();
        if (b != 10) {
          sb.append((char)b);
        }
      } while (b != 10);

      // uzunluğunuset ediyoruz böylece  son satır silinmiş oluyor

      f.setLength(lineLength + 1); 
      f.close();
    } 
    catch (IOException ex) {
      print("HATA", ex);
    }
    return sb.reverse().toString();
  }
}
