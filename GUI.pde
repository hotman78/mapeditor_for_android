interface ActionListener{
  void actionPerformed(int id);
}
class GUI extends BaseGraphics{
  int textSize=100;
  String text="";
  boolean continuous=false;
  boolean isVisible=true;
  boolean dead=false;
  int id=0;
  ActionListener actionListener=null;
  void draw(){
    background(0);
    if(!isVisible)return;
    fill(0,0,255,100);
    strokeJoin(ROUND);
    strokeWeight(10);
    stroke(100);
    rect(10,10,width-20,height-20);
    textSize(textSize);
    textAlign(CENTER);
    fill(255);
    text(text,20,20,width-20,height-20);
  }
  
  void mouseReleased(){
    if(isInternal(mouseX,mouseY)&&actionListener!=null)actionListener.actionPerformed(id);
  }
  GUI setText(String text){
    this.text=text;
    return this;
  }
  GUI isContinuous(){
    continuous=true;
    return this;
  }
  GUI setVisible(boolean isVisible){
    this.isVisible=isVisible;
    return this;
  }
  GUI setTextSize(int textSize){
    this.textSize=textSize;
    return this;
  }
  GUI setActionListener(ActionListener actionListener){
    this.actionListener=actionListener;
    return this;
  }
  GUI setId(int id){
    this.id=id;
    return this;
  }
  void remove(){
    dead=true;
  }
}