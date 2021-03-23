class Button extends Component { //<>//

  boolean enabled = true;

  Button(float x, float y, float w, float h) {
    super(new Point(x, y), new Dimension(w, h));
    this.rectStrokeColor = #5D5D5D;
    this.rectColor = #9B9797;
    this.textColor = #2C2A2A;
  }

  Button(float x, float y, String text) {
    this(x, y, 100, 50, text);
  }

  Button(float x, float y) {
    this(x, y, 100, 50);
  }

  Button(float x, float y, float w, float h, String text) {
    this(x, y, w, h);
    this.text = text;
  }

  boolean animating = false;

  void draw() {
    super.draw();
    if (animating) {
      drawRect();
      drawText();
      animate();
      c++;
    }
    if (visible) {
      drawRect();
      drawText();
    }
  }

  void mousePressed() {
    super.mousePressed();
    if (listener == null) {
      return;
    }
    if (enabled && contains(mouseX, mouseY)) {
      listener.onClick();
      animating = true;
    }
  }

  int c = 0;
  color previousColor;

  void animate() {
    if (c <= 5) {
      if (c == 0)
        previousColor = rectColor;
      rectColor = 255;
    } else {
      rectColor = previousColor;
      animating = false;
      c = 0;
    }
  }

  void setEnabled(boolean enabled) {
    this.enabled = enabled;
  }
}
