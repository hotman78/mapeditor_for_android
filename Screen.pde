import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
Map map;
Palette palette;
Brush brush;
TouchManager tm;
Camera cam;
PaletteSelect paletteSelect;
Brank brank;
Activity act;
Context con;
GestureDetector gestureDetector;
int screenId=1;
class Screen{
  Screen(){
    act = getActivity();
    con = act.getApplicationContext();
    tm=new TouchManager();
    Handler mHandler = new Handler(Looper.getMainLooper());
    gestureDetector =new GestureDetector(con, tm, mHandler);
    brush=(Brush)new Brush().handleSetup(0,0,128,height,pApplet);
    map=(Map)new Map().handleSetup(128,0,width-128*2,height,pApplet);
    palette=(Palette)new Palette().handleSetup(width-128,0,128,height,pApplet);
    cam=(Camera)new Camera().handleSetup(128,height-400,400,400,pApplet);
    paletteSelect=(PaletteSelect)new PaletteSelect().handleSetup(width-128*(chipSizeX+3),0,128*(chipSizeX+1),height,pApplet);
    brank=(Brank)new Brank().handleSetup(0,0,width-128*(chipSizeX+3),height,pApplet);
  }
  void draw(){
    if(screenId==0){
      brush.handleDraw();
      map.handleDraw();
      cam.handleDraw();
      palette.handleDraw();
    }
    if(screenId==1){
      paletteSelect.handleDraw();
      brank.handleDraw();
    }
  }
}