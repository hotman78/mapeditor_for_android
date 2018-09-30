class PaletteSelect extends BaseGraphics implements ActionListener{
  int camera=0;
  GUI up,down;
  void setup(){
    up=new GUI();
    up.handleSetup(128*(chipSizeX+1),0,256,height/2,pApplet);
    up.setText("UP");
    up.setActionListener(this);
    up.setId(0);
    up.setParent(x,y);
    down=new GUI();
    down.handleSetup(128*(chipSizeX+1),height/2,256,height/2,pApplet);
    down.setText("DOWN");
    down.setActionListener(this);
    down.setId(1);
    down.setParent(x,y);
  }
  void fastdraw(){
    background(0);
    for(int i=0;i<8;i++){
      image(mapChips[(int)palettes[i].x][(int)palettes[i].y],0,128*i+64,128,128);
    }
    image(mapChip.get(0,camera*16,16*8,16*8),128,64,chipSizeX*128,chipSizeX*128);
    up.handleDraw();
    down.handleDraw();
  }
  void onTouchEvent(){
    int selectX=(int)(startX/128)-1;
    int selectY=((int)(startY-64)/128)+camera;
    imageMode(CENTER); 
    image(mapChips[selectX][selectY],mouseX,mouseY,128,128);
    imageMode(CORNER);
  }
  void mouseReleased(){
    int selectX=(int)(startX/128)-1;
    int selectY=((int)(startY-64)/128)+camera;
   for(int i=0;i<8;i++){
      if(0<mouseX&&mouseX<128&&128*i+64<mouseY&&mouseY<128*(i+1)+64){
        palettes[i].set(selectX,selectY);
      }
    }
  }
  @Override
  void actionPerformed(int id){
    switch(id){
      case 0:camera--;break;
      case 1:camera++;break;
    }
    camera=constrain(camera,0,chipSizeY-chipSizeX);
  }
}

class Brank extends BaseGraphics{
  void draw(){
    background(0);
  }
  void mouseReleased(){
    if(isInternal(mouseX,mouseY))screenId=0;
  }
}