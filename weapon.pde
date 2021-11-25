class Weapon {

  int sTimer;
  int fire;
  int bulletSpeed;

  Weapon() {
    sTimer = 0;
    fire = 30;
    bulletSpeed = 5;
  }

  Weapon(int thr, int bs) {
    sTimer = 0;
    fire = thr;
    bulletSpeed = bs;
  }

  void update() {
    sTimer++;
  }

  void shoot() {
    if (sTimer >= fire) {
      PVector aimVector = new PVector(mouseX-myHero.location.x, mouseY-myHero.location.y);
      aimVector.setMag(bulletSpeed);
      myObjects.add(new bullet(aimVector, blue, 10));
      sTimer = 0;
    }
  }
}
