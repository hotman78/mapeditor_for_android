import processing.event.TouchEvent.*;
import java.util.Arrays;
import java.util.List;
class BaseGraphics {
  int x, y, width, height;
  int parentX=0;
  int parentY=0;
  float mouseX,mouseY,pmouseX,pmouseY,startX,startY;
  PApplet parent;
  boolean mousePressed=false;
  boolean pMousePressed,justMousePressed,mouseReleased;
  BaseGraphics handleSetup(int x, int y, int width, int height, PApplet parent) {
    this.x=x;
    this.y=y;
    this.width=width;
    this.height=height;
    this.parent=parent;
    translate(x, y);
    setup();
    translate(-x, -y);
    return this;
  }
  void setParent(int x,int y){
    parentX=x;
    parentY=y;
  }
  void handleDraw() {
    mouseReleased=pMousePressed&&!mousePressed;
    justMousePressed=!pMousePressed&&mousePressed;
    translate(x, y);
    fastdraw();
    translate(-x, -y);
    handleTouchEvent();
    translate(x, y);
    draw();
    translate(-x,-y);
    pMousePressed=mousePressed;
  }
  void handleTouchEvent(){
    for(Pointer t:touches){
      mouseX=t.x-x-parentX;
      mouseY=t.y-y-parentY;
      startX=t.sx-x-parentX;
      startY=t.sy-y-parentY;
      if(isInternal(startX,startY)){
        if(!t.dead){
          translate(x,y);
          onTouchEvent();
          translate(-x,-y);
        }else{
          translate(x,y);
          mouseReleased();
          translate(-x,-y);
        }
      }
    }
  }
  void setup() {
  }
  void draw() {
  }
  void fastdraw(){
    
  }
  void onTouchEvent(){
    
  }
  void mouseReleased(){
    
  }
  void background(int c) {
    fill(c);
    noStroke();
    rect(0, 0, width, height);
  }
  boolean isInternal(float x,float y){
    return 0<x&&x<width&&0<y&&y<height;
  }
}
