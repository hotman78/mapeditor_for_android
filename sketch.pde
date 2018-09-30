import processing.a2d.*;
import android.view.*;
import android.widget.*;
import android.content.pm.*;
Screen screen;
FrameLayout fl;
PImage mapChip;
PImage[][] mapChips;
int chipSize, chipSizeX, chipSizeY;
boolean pMousePressed, mouseReleased,justMousePressed;
boolean UISettingCompleated=false;
boolean setupCompleated=false;
PApplet pApplet;
Pointer[] touches;
void onResume() {
  super.onResume();
  touchesList.clear();
  UISettingCompleated=false;
  runOnUiThread(new Runnable() {
    public void run() {
      settingSurface();
      setUI();
      UISettingCompleated=true;
    }
  });
  for(;;){
    if(UISettingCompleated)break;
    try{Thread.sleep(1);}catch(InterruptedException e){println(e);}
  }
}
void setup() {
  background(0);
  textSize(200);
  text("Now Loading",width/2,height/2);
  pApplet=this;
  chipSize=16;
  mapChip = loadImage("WorldMap.png");
  chipSizeX=mapChip.width/chipSize;
  chipSizeY=mapChip.height/chipSize;
  mapChips=new PImage[chipSizeX][chipSizeY];
  for (int i=0; i<chipSizeX; i++)for (int j=0; j<chipSizeY; j++) {
    mapChips[i][j]=mapChip.get(i*chipSize, j*chipSize, chipSize, chipSize);
  }
  screen=new Screen();
}
void draw() {
  touches = touchesList.toArray(new Pointer[touchesList.size()]);
  mouseReleased=pMousePressed&&!mousePressed;
  justMousePressed=!pMousePressed&&mousePressed;
  screen.draw();
  textSize(60);
  noFill();
  for(Pointer t:touches)ellipse(t.x,t.y,100,100);
  synchronized (touchesList) {
    for(Pointer t:touchesList){
      if(t.dead)touchesList.remove(t);
    }
  }
  pMousePressed=mousePressed;
}


void setUI() { 
  getSurface().getSurfaceView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_VISIBLE);
  getActivity().setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
}

void settingSurface() {
  fl=new FrameLayout(getContext());
  View surfaceView=getSurface().getSurfaceView(); 
  ViewGroup parent=(ViewGroup)surfaceView.getParent(); 
  parent.removeView(surfaceView); 
  parent.addView(fl); 
  fl.addView(surfaceView);
}
