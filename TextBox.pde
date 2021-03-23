class TextBox extends Component {

  private boolean haveFocus;

  private StringBuilder stringBuilder; 
  private int separatorIndex = 0;

  TextBox(float x, float y) {
    this(x, y, 100, 25);
  }

  TextBox(float x, float y, float w, float h) {
    super(new Point(x, y), new Dimension(w, h));
    stringBuilder = new StringBuilder();
    this.rectColor = 255;
    this.rectStrokeColor = #555151;
    this.textSize = 13;
    this.rectStrokeWeight = 1.5;
    this.text = "";
  }

  void draw() {
    super.draw();
    drawRect();
    drawText();
  }

  void mousePressed() {
    super.mousePressed();
    setFocus(contains(mouseX, mouseY));
  }

  void keyPressed() {
    super.keyPressed();
    if (!haveFocus) {
      return;
    }
    if (keyCode == ENTER) {
      if (stringBuilder.length() > 0)
        kaydet();
      return;
    }
    if (keyCode == SHIFT) {
      geriAl();
      return;
    }
    if (keyCode == BACKSPACE) {
      if (stringBuilder.length() > 0) {
        stringBuilder.deleteCharAt(stringBuilder.length() - 1);
        separatorIndex--;
        this.text = stringBuilder.toString();
      }
    } else {
      stringBuilder.insert(separatorIndex, key + "");        
      separatorIndex++;
      this.text = stringBuilder.toString();
    }
  }

  String getText() {
    return stringBuilder.toString();
  }

  void setText(String text) {
    super.setText(text);
    stringBuilder = new StringBuilder(text);
    separatorIndex = text.length();
  }

  void setFocus(boolean focus) {
    haveFocus = focus;
    this.rectStrokeColor = haveFocus ? #A50C0C : #555151;
  }
}
