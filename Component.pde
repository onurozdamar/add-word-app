abstract class Component {
  protected Point position;
  protected Dimension dimension;

  protected String text = "text";
  protected int textAlign1 = CENTER, textAlign2 = CENTER;
  protected float textSize = 12;
  protected color textColor = color(0);
  protected float alpha = 255;

  protected color rectColor = color(0);
  protected color rectStrokeColor = color(0);
  protected float rectStrokeWeight = 2;
  protected float rectRadius = 0;

  protected boolean visible = true;

  protected OnClickListener listener;

  Component(Point position) {
    this(position, new Dimension(100, 50));
  }

  Component(Point position, Dimension dimension) {
    this.position = position;
    this.dimension = dimension;
  }

  void drawText(float x, float y, String text, color fill, float alpha, 
    float textSize, int align1, int align2) {      
    textAlign(align1, align2);
    textSize(textSize);
    fill(fill, alpha);
    text(text, x, y);
  }

  void drawText() {      
    drawText(position.x + dimension.w / 2, position.y + dimension.h / 2, 
      text, textColor, alpha, textSize, textAlign1, textAlign2);
  }

  void drawRect(Point pos, color fill, color stroke, float strokeWeight, float radius) {      
    fill(fill);
    stroke(stroke);
    strokeWeight(strokeWeight);
    rect(pos.x, pos.y, dimension.w, dimension.h, radius);
  } 

  void drawRect() {      
    drawRect(position, rectColor, rectStrokeColor, rectStrokeWeight, rectRadius);
  }

  boolean contains(float mx, float my) {
    return (mx >= this.position.x && mx <= this.position.x + this.dimension.w 
      && my >= this.position.y && my <= this.position.y + this.dimension.h);
  }

  void draw() { 
    if (!visible) {
      return;
    }
  }

  void mousePressed() { 
    if (!visible) {
      return;
    }
  }

  void keyPressed() { 
    if (!visible) {
      return;
    }
  }

  void mouseDragged() { 
    if (!visible) {
      return;
    }
  }

  void setOnClickListener(OnClickListener listener) {
    this.listener = listener;
  }

  void setVisible(boolean visible) {
    this.visible = visible;
  }

  boolean isVisible() {
    return visible;
  }

  void setText(String text) {
    this.text = text;
  }

  String getText() {
    return text;
  }
}

interface OnClickListener {
  void onClick();
}

class Point {
  float x, y;

  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }

  Point(Point p) {
    this(p.x, p.y);
  }

  void add(float x, float y) {
    this.x += x;
    this.y += y;
  }

  void set(float x, float y) {    
    this.x = x;
    this.y = y;
  }
}

class Dimension {
  float w, h;

  Dimension() {
  }

  Dimension(float w, float h) {
    this.w = w;
    this.h = h;
  }

  Dimension(Dimension d) {
    this(d.w, d.h);
  }
}
