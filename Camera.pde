class Camera extends BaseGraphics {
  PVector camera=new PVector(0, 0);
  PVector cameraVelocity=new PVector(0, 0);
  void onTouchEvent() {
    cameraVelocity.set(mouseX-200, mouseY-200);
  }
  void mouseReleased() {
    cameraVelocity.set(0, 0);
  }
  void draw() {
    camera.add(cameraVelocity.setMag(80));
    camera.set(constrain(camera.x, -128*2, mapImage.width*8-width+128*2), constrain(camera.y, -128*2, mapImage.height*8-height+128*2));
    fill(#FF0000);
    ellipse(200, 200, 400, 400);
    fill(color(0, 0, 255));
    ellipse(200+cameraVelocity.setMag(100).x, height-200+cameraVelocity.setMag(100).y, 200, 200);
  }
  boolean isInternal(float x, float y) {
    return dist(200, 200, x, y)<200;
  }
}
