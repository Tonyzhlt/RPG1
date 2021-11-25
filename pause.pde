int pauseClick;

void pause() {
  background (0);
  //text
  textAlign(CENTER);
  orbitron = createFont("Orbitron-VariableFont_wght.ttf", 100);
  fill(225);
  textFont( orbitron);
  textSize (100);
  text("RESUME", 700, 400);
}
void pauseClick() {
  if (mouseY < 900) {
    if (mouseY > 100) {
      mode=1;
    }
  }
}
