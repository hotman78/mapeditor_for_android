PImage mapImage=createImage(200*16,200*16,ARGB);
class Map extends BaseGraphics {
  PVector[][] mapData=new PVector[200][200];
  PImage dispImage=createImage(width,height,ARGB);
  PVector camera=new PVector(0,0);
  PVector select=new PVector(0,0);
  void setup() {
    mapImage.loadPixels();
    for(int i=0;i<200;i++)for(int j=0;j<200;j++){
      mapData[i][j]=new PVector(2,4);
      for(int k=0;k<16;k++)for(int l=0;l<16;l++){
        mapImage.pixels[i*16+k+mapImage.width*(j*16+l)]=mapChips[(int)mapData[i][j].x][(int)mapData[i][j].y].pixels[k+16*l];
      }
    }
    mapImage.updatePixels();
  }
  
  void draw() {
    camera=cam.camera;
    background(0);
    image(mapImage.get((int)camera.x/8,(int)camera.y/8,width/8,height/8),0,0,width,height);
  }
  
  void onTouchEvent(){
    select.set((int)(mouseX+camera.x)/128,((int)mouseY+camera.y)/128);
    if((int)select.x<0||200<(int)select.x||(int)select.y<0||200<(int)select.y)return;
    noFill();
    map.mapData[(int)select.x][(int)select.y]=palette.getSelectedChip();
    mapImage.set((int)select.x*16,(int)select.y*16,palette.getSelectedChipImage());
  }
  boolean isInternal(float x,float y){
    return 0<x&&x<width&&0<y&&y<height&&dist(200,height-200,x,y)>200;
  }
}
