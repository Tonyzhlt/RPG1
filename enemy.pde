class Enemy extends GameObject {
  int damageshow;

  Enemy() {
    location = new PVector(width/2, height/2);
    velocity = new PVector (0, 0);
    hp = 100;
    roomX = 1;
    roomY = 1;
    size = 50;
  }
  
    Enemy(int x, int y) {
    location = new PVector(width/2, height/2);
    velocity = new PVector (0, 0);
    hp = 100;
    roomX = x;
    roomY = y;
    size = 50;
  }
  
  
  Enemy( int _hp, int s, int x, int y, int Px, int Py) {
    location = new PVector(Px, Py);
    velocity = new PVector (0, 0);
    hp = _hp;
    size = s;
    roomX = x;
    roomY = y;
  }


  void show() {
    damageshow = 0;
    noStroke();
    fill(255);
    circle(location.x, location.y, size);
    //image (riden, location.x,location.y);
    fill(0);
    textSize(20);
    text(hp, location.x, location.y - 40);
  }

void explode (int n) {
  int i = 0;
  while (i < n) {
  i++; 
  }
}
  void act() {
    super.act();
    int i = 0;
 
    while (i < myObjects. size()) {
      GameObject obj = myObjects.get(i);
      if (obj instanceof bullet) {
        float d = dist(obj.location.x, obj.location.y, location.x, location.y);
        if (d <= size/2 + obj.size/2) {
          hp = hp - int(obj.velocity.mag());
         
          fill(255,0,0);
          textSize(50);
          text(int(obj.velocity.mag()),location.x, location.y+30);
          
          
          
          obj.hp = 0;
          if (hp <= 0) {
            explode(size);
            myObjects.add(new dropitem(location.x,location.y,roomX,roomY));
            
            
          }
          
        }
      }

      i++;
    }
   
      
      
    }
  }
