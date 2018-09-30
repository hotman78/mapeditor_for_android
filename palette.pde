PVector[] palettes;
int selected;
class Palette extends BaseGraphics{
  void setup(){
    palettes=new PVector[8];
    for(int i=0;i<8;i++){
      palettes[i]=new PVector(i,4);
    }
  }
  void draw(){
    background(color(0,0,255));
    for(int i=0;i<8;i++){
      image(mapChips[(int)palettes[i].x][(int)palettes[i].y],0,128*i+64,128,128);
    }
    noFill();
    strokeWeight(10);
    stroke(0);
    rect(0,selected*128+64,128,128);
  }
  void onTouchEvent(){
   for(int i=0;i<8;i++){
      if(0<mouseX&&mouseX<128&&128*i+64<mouseY&&mouseY<128*(i+1)+64){
        selected=i;
      }
    }
  }
  PVector getSelectedChip(){
    return palettes[selected];
  }
  PImage getSelectedChipImage(){
    return mapChips[(int)palettes[selected].x][(int)palettes[selected].y];
  }
}