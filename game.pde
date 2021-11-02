
void games() {
  drawRoom();
  drawGameObjects();
  drawLightLayer();
  drawMinimap();
  
  
   myHero.show();
   myHero.act();
  int ii = 1;
  while (ii < darkness.size()) {
    DarknessCell dark = darkness.get(ii);
    dark.show();
    ii++;
    
  }
   
  }
  
  
  void drawRoom() {
  translate(0,0);
  background(#152681);
  //noStroke();
  //fill(#3B6718);
  //rect(700,25,1400,50);
  //rect(25,425, 50,850);
  //rect(700,825,1400,50);
  //rect(1375,425,50,850);
  
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom = map.get(myHero.roomX+1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom = map.get(myHero.roomX-1, myHero.roomY);
  
  
  
  fill(#666F07);
  if (northRoom != #FFFFFF) {
    ellipse(width/2,height*0.05,100,100);
  }
   if (eastRoom != #FFFFFF) {
    ellipse(width*0.95,height/2,100,100);
  }
 if (southRoom != #FFFFFF) {
    ellipse(width/2,height*0.95,100,100);
  }
   if (westRoom != #FFFFFF) {
    ellipse(width*0.05,height/2,100,100);
  }

rectMode(CENTER);
stroke(0);
fill(#BCB5C1);
rect(width/2, height/2, width*0.9, height*0.9);
    
  }
  
  void drawGameObjects() {
  }

  
  void drawLightLayer() {
    
  }
  
  void drawMinimap() {

    //image (map, 100,100);
    
  }
  
