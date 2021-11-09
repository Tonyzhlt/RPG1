PFont orbitron;
Hero myHero;

PImage hutao;
PImage map;
color northRoom, southRoom, eastRoom, westRoom; 
import processing.javafx.*;
import processing.sound.*;
//SoundFile file;
//SoundFile introsong;


//GameObjects
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness; 




boolean upkey, downkey, leftkey, rightkey, spacekey, fkey;

color blue   = #000000;
color green  = #CEF255;
color pink   = #FFFFFF;
color yellow = #FFF387;

color white  = #FFFFFF;
int mode;
final int intro = 0;
final int game = 1;
final int gameover = 2;
final int win = 3; 
final int pause = 4;

void setup () {
  hutao = loadImage( "hutao.png");
  map = loadImage("MicrosoftTeams-image.png");
  mode = 0;
   bkg = white;
  blueButton  = new Button("START",  700, 775, 200, 150, blue,  pink);
   myHero= new Hero();
   myObjects = new ArrayList<GameObject>(1000);
   myObjects.add(myHero);
   
   //Darkness
   noStroke();
   darkness = new ArrayList<DarknessCell> (2000);
   float size = 5; 
   rectMode(CORNER);
   float x = 0, y = 0; 
   darkness.add(new DarknessCell(0,0,size));
   while (x <= width && y <= height) {
     darkness.add(new DarknessCell(x, y, size));
     x = x + size;
     if(x==width) {
       y= y + size;
       x=0;
     }
   }

  
myGIF = new AnimatedGIF(61, "frame_", "_delay-0.02s.png", 700, 450, 1400, 900);
 
  size (1400, 850, FX2D);
  imageMode(CENTER);

 
  

  rectMode(CENTER);
  //file = new SoundFile(this,"song.mp3");
  //introsong = new SoundFile(this,"introsong.mp3");

  
}

void draw() {
  if (mode == intro) {
    intro();
    
  } else if (mode== game) {
    games();
   
  } else if (mode == gameover) {
    gameover();
  } else if (mode == win) {
    win();
  } else if (mode == pause) {
    pause();
  }
  
  
}
 
void keyPressed() {
  if (keyCode == 'w' || keyCode == 'W') upkey = true;
  if (keyCode == 's' || keyCode == 'S') downkey = true;
  if (keyCode == 'a'|| keyCode == 'A') leftkey = true;
  if (keyCode == 'd'|| keyCode == 'D') rightkey = true;
  if (keyCode == ' ') spacekey = true;
  if (keyCode == 'f'|| keyCode == 'F') fkey = true;
}

void keyReleased() {
  if (keyCode == 'w'|| keyCode == 'W') upkey = false;
  if (keyCode == 's'|| keyCode == 'S') downkey = false;
  if (keyCode == 'a'|| keyCode == 'A') leftkey = false;
  if (keyCode == 'd'|| keyCode == 'D') rightkey = false;
  if (keyCode == ' ') spacekey = false;
  if (keyCode == 'f'|| keyCode == 'F') fkey = false;
}
