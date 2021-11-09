


class Hero extends GameObject {
  Weapon myWeapon; 
  PVector direction;
  float speed;
  int roomX, roomY;


  Hero() {
   
    super();

    
    location = new PVector (width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector (0, -0.1);
  
    myWeapon = new Weapon();
 
    
    roomX=1;
    roomY=1;

  }

  void show() {

    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    image (hutao, 0,0); 
    popMatrix();
  }
  void act() {
    super.act();

    if (velocity.mag() > 6)
      velocity.setMag(6);


   




   
    if (upkey) {

      velocity. add(0,-1);
       
    } else if (downkey){
      velocity. sub (0,-1);
    }
      else if (!upkey && !downkey){
        velocity.y = 0;
      }
      
      if (rightkey) {
      velocity. sub(-1,0);
     
    } else if (leftkey) {
     velocity. add(-1,0);
     
    } else if(!rightkey && !leftkey) {
      velocity.x = 0;
    }
    
    if (fkey) {
      //file. play();
    }
    
    
    
    
    if (southRoom != #FFFFFF && location.y >= 800 && location.x >= width/2-50 && location.x <= width/2+50){
      roomY++;
      location = new PVector (width/2, 50); 
      println("going west");
       
    } else if (northRoom != #FFFFFF && location.y <= 50 && location.x >= width/2-50 && location.x <= width/2+50){
      roomY--;
      location = new PVector (width/2, 800); 
      println("going west");
      
    } else if (eastRoom != #FFFFFF && location.x >= 1330 && location.y >= height/2-50 && location.y <= height/2+50){
      roomX++;
      location = new PVector (70, height/2); 
      println("going east");
      
    } else if (westRoom != #FFFFFF && location.x <= 70 && location.y >= height/2-50 && location.y <= height/2+50){
      roomX--;
      location = new PVector (1330, height/2); 
      println("going west");
      
    } 
    
    myWeapon.update();
    if(spacekey) myWeapon. shoot();
  }
}
