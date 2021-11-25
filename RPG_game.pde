PFont orbitron;
Hero myHero;
int x;
int y; 
AnimatedGIF manUp;
AnimatedGIF manDown;
AnimatedGIF manLeft;
AnimatedGIF manRight;

//Images
PImage hutao;
PImage map;
PImage riden;
PImage Genshin; 
color northRoom, southRoom, eastRoom, westRoom;

//sound
import processing.javafx.*;
import processing.sound.*;
SoundFile file;
SoundFile introsong;


//GameObjects
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;

//dropitem
final int ammo = 7;
final int health = 8;
final int GUN = 9; 


boolean upkey, downkey, leftkey, rightkey, spacekey, fkey;

color blue   = #009BFF;

color pink   = #FA05DE; 
color yellow = #FFF387;
color red = #FF1500;
color black = #000000;
color green = #66C100; 


color white  = #FFFFFF;
int mode;
final int intro = 0;
final int game = 1;
final int gameover = 2;
final int win = 3;
final int pause = 4;

void setup () {
  //load gifs
  manUp = new AnimatedGIF(4, 10, "man/up/sprite_",".png");
  manDown = new AnimatedGIF(4, 10, "man/down/sprite_",".png");
  manLeft = new AnimatedGIF(4, 10, "man/left/sprite_",".png");
  manRight = new AnimatedGIF(4, 10, "man/right/sprite_",".png");
  myGIF = new AnimatedGIF(61, "frame_", "_delay-0.02s.png", 700, 450, 1400, 900);

  
  
  
  //import images
  hutao = loadImage( "hutao.png");
  map = loadImage("MicrosoftTeams-image (4).png");
  riden= loadImage("Riden.png");
  Genshin =  loadImage("Genshin.png"); 
  
  mode = 0;
  
  bkg = white;
  blueButton  = new Button("START", 700, 775, 200, 150, blue, pink);
  myHero= new Hero();
  myObjects = new ArrayList<GameObject>(1000);
  
  //initialize loading enemy
  x=0;
  y=0; 
  while ( y < map.height) {
    color roomColor = map.get(x,y);
    if (roomColor == pink) {
      myObjects.add(new Gunman(x,y));
      myObjects.add(new missile(x,y));
    }
    if (roomColor == yellow) {
      myObjects.add( new Follower(x,y));
      myObjects.add(new gunfollower(x,y));
    }
    if (roomColor == red) {
      
    }
    if (roomColor == green) {
      
    }
    if (roomColor == black) {
      
    }
    x++;
    if (x == map.width) {
      x=0;
      y++;
    }
  }
  
  
  //add objects
  myObjects.add(myHero);
//  //myObjects.add(new Enemy);
//  myObjects.add(new Follower(1, 2));
//  myObjects.add(new Follower(2, 1));
//  myObjects.add(new Gunman(1, 1));
//    //myObjects.add(new Follower(1, 1));
//    //myObjects.add(new gunfollower(1,1));
//    //myObjects.add( new Follower (1,1));
//myObjects.add (new missile (1,1));


  //Darkness
  noStroke();
  darkness = new ArrayList<DarknessCell> (2000);
  float size = 5;
  rectMode(CORNER);
  float x = 0, y = 0;
  darkness.add(new DarknessCell(0, 0, size));
  while (x <= width && y <= height) {
    darkness.add(new DarknessCell(x, y, size));
    x = x + size;
    if (x==width) {
      y= y + size;
      x=0;
    }
  }




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
