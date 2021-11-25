AnimatedGIF myGIF;



void intro() {








  myGIF.show();


  if (mousePressed) hadPressed = true;
  if (hadPressed && !mousePressed) {
    mouseReleased = true;
    hadPressed = false;
  }
  blueButton.show();
  if (blueButton.clicked) {
    bkg = blue;
  }
  orbitron = createFont("Orbitron-VariableFont_wght.ttf", 100);
  textFont(orbitron);
  textAlign(CENTER);
  textSize(150);
  fill(255);
  text ( "RPG", 700, 350);
}

void introClick() {
  mode = 1;

  //introsong.play();
}
