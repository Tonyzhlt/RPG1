


class Hero extends GameObject {
  Weapon myWeapon;
  PVector direction;
  float speed;
  int Cdown;
  AnimatedGIF currentAction;

  Hero() {
    super();
    location = new PVector (width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector (0, -0.1);
    myWeapon = new ElegyForTheEnd();
    currentAction = manDown; 
    size = 70;
    roomX=1;
    roomY=1;
    hp = 10000;
  }

  void show() {
    pushMatrix();
    //translate(location.x, location.y);
    //rotate(direction.heading());
    //image (hutao, 0, 0);
    currentAction.show(location.x, location.y, size/1.5, size);
    
    if (Cdown != 0) {
      translate(location.x, location.y);
      stroke(0, 255, 0);
      noFill();
      ellipse( 0, 0, 100, 100);
    }
    popMatrix();
  }


  void act() {
    super.act();
    textSize(20);
    fill(0);
    text(hp, location.x, location.y - 45);
    fill(0, 255, 150);
    textSize(40);
    text( hp, 140, 75);


    if (velocity.mag() > 6)
      velocity.setMag(6);

    if (upkey) {
      velocity. add(0, -1);
    } else if (downkey) {
      velocity. sub (0, -1);
    } else if (!upkey && !downkey) {
      velocity.y = 0;
    }
    if (rightkey) {
      velocity. sub(-1, 0);
    } else if (leftkey) {
      velocity. add(-1, 0);
    } else if (!rightkey && !leftkey) {
      velocity.x = 0;
    }
    if (fkey) {
      //file. play();
    }
    
    
    // Animated Hero
    
    if (abs(velocity.y) > abs(velocity.x)){
      if (velocity.y >= 0) currentAction = manDown; 
      else currentAction= manUp;
    } else  {
      if (velocity.x >= 0) currentAction = manRight;
      else currentAction = manLeft; 
    
    }

    if (southRoom != #FFFFFF && location.y >= 800 && location.x >= width/2-50 && location.x <= width/2+50) {
      roomY++;
      location = new PVector (width/2, 50);
      println("going west");
    } else if (northRoom != #FFFFFF && location.y <= 50 && location.x >= width/2-50 && location.x <= width/2+50) {
      roomY--;
      location = new PVector (width/2, 800);
      println("going west");
    } else if (eastRoom != #FFFFFF && location.x >= 1330 && location.y >= height/2-50 && location.y <= height/2+50) {
      roomX++;
      location = new PVector (70, height/2);
      println("going east");
    } else if (westRoom != #FFFFFF && location.x <= 70 && location.y >= height/2-50 && location.y <= height/2+50) {
      roomX--;
      location = new PVector (1330, height/2);
      println("going west");
    }

    myWeapon.update();
    if (spacekey) myWeapon. shoot();

    int i = 0;
    while (i < myObjects.size() && Cdown ==0) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof enemybullet) {

        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {

          myObj.lives=0;

          hp = hp - 10;
          myObj.hp = 0;
          Cdown = 180;
        }
      }
      i++;
    }
    int ii = 0;
    while (ii < myObjects.size()  && Cdown == 0) {
      GameObject myObj = myObjects.get(ii);
      if (myObj instanceof enemybullet2) {

        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {

          myObj.lives=0;

          hp = hp - 1000;
          myObj.hp = 0;
          Cdown = 180;
        }
      }

      ii++;
    }


    int iii = 0;
    while (iii < myObjects.size() ) {
      GameObject myObj = myObjects.get(iii);
      if (myObj instanceof dropitem) {

        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2 + myObj.size) {
          dropitem item = (dropitem) myObj;
          if (item.type == HEALTH) {
            hp = hp + 3000;
          }
          if (item.type == GUN) {
            myWeapon = item.w;
            item.hp = 0;
          }
        }
        
      }
      iii++;
    }


    if (Cdown != 0) {
      Cdown --;
      noStroke();
      fill(0, 255, 0);
      rect (700, 850, 180, 10);
      fill(255, 0, 0);
      rect (700, 850, Cdown, 10);
    }
  }
}
