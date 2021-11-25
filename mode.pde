void mouseReleased () {
  if (mode == intro) {
    introClick();
  }

  if (mode == gameover) {
    gameoverClick();
  }

  if (mode == win) {
    winClick();
  }

  if (mode == pause) {
    pauseClick();
  }
}
