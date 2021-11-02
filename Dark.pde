class DarknessCell{
 
  float opacity;
  float x,y,size;
  
  DarknessCell (float _x, float _y, float s) {
    size = s;
    x=_x;
    y=_y;
    opacity = 0;
  }
  
  void show() {
    noStroke();

    opacity = map( dist(x,y,myHero.location.x,myHero.location.y),0,600,0,255);
    fill(0,opacity);
    rectMode(CORNER);
    square(x,y,size);
    
    
    
    
    
  }
}
  
  
  
  
