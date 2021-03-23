

TextBox tb;
Button kaydet, geriAl;

DosyaOkuma dosyaOku;
DosyaYazma dosyaYaz;

void setup() {
  size(250, 250);
  tb = new TextBox(75, 75);
  kaydet = new Button(50, 150, 50, 25, "Kaydet");
  geriAl = new Button(150, 150, 50, 25, "Geri al");

  String path 
    = System.getProperty("user.dir")+"\\words.txt";

  dosyaOku = new DosyaOkuma(path);
  dosyaYaz = new DosyaYazma(path);

  kaydet.setOnClickListener(new OnClickListener() {
    public void onClick() {
      kaydet();
    }
  }
  );

  geriAl.setOnClickListener(new OnClickListener() {
    public void onClick() {
      geriAl();
    }
  }
  );
}

void kaydet() {
  String kelime = tb.getText();
  dosyaYaz.ekle(kelime + "\n");
  tb.setText("");
}

void geriAl() {
  String kelime = dosyaYaz.sondanSil();
  tb.setText(kelime);
  tb.setFocus(true);
}


void draw() {
  background(0);
  tb.draw(); 
  kaydet.draw(); 
  geriAl.draw();
}

void mousePressed() {
  tb.mousePressed();  
  kaydet.mousePressed(); 
  geriAl.mousePressed();
}

void keyPressed() {
  tb.keyPressed();
}
