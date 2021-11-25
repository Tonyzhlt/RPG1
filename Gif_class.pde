class AnimatedGIF {

  PImage[] pics;
  int currentFrame;
  int numFrames;
  float x, y, w, h;
  int rate;
  int images;
  AnimatedGIF(int nf, String pre, String post) {
    x = width/2;
    y = height/2;
    w = width;
    h = height;
    numFrames = nf;
    pics = new PImage[numFrames];
    int i = 0;
    while (i < numFrames) {
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
  }
  
  


  AnimatedGIF(int nf, int r, String pre, String post) {
    rate = r;
    pics = new PImage[nf];
    currentFrame = 0;
    int i = 0;
    while (i < nf) {
    pics[i] = loadImage(pre+i+post);
    i++;
    }
    currentFrame = 0;
  }


  AnimatedGIF(int nf, String pre, String post, float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    numFrames = nf;
    pics = new PImage[numFrames];
    int i = 0;
    while (i < numFrames) {
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
  }

  void show(float x, float y, float w, float h) {
    if (currentFrame >= pics.length) {
      currentFrame = 0;
    }
    image(pics[currentFrame], x, y, w, h);
    if (frameCount % rate == 0) currentFrame++;
  }

  void show() {
    imageMode(CENTER);
    if (currentFrame == numFrames) currentFrame = 0;
    image(pics[currentFrame], x, y, w, h);
    currentFrame++;
  }
} //end of class
