class Weapons {
  int weapon = 1;
  int canShoot = 0;
  int fireRate = 0;
  int recoil = 0;
  int pammo = 10;
  int mammo = 40;
  int knife = 200;
  boolean canknife = true;
  boolean shot = false;
  boolean shoot = true;
  /*
  Weapon
   1  = Pistol
   2 = AR
   3 = Melee
   */
  void run() {

    if (recoil > 0) {
      recoil -= recoil/20;
      recoil -= 2;
    }
    if (weapon == 1) {
      canShoot = 0;
      fireRate = 0;
    }

    if (weapon == 2) {
      fireRate = 5;
      shot = false;
      if (canShoot > 0) {
        canShoot -= 1;
      }
    }

    if (weapon == 3) {
      fireRate = 10;
      if (canShoot > 0) {
        canShoot -= 1;
      }
    }
    if (weapon == 1) {
      for (int p = 0; p < 15; p++) {
        fill(140, 140, 40, 150);
        stroke(70, 70, 20, 200);
        rect(width - 25 - p * 23, height - 26, 16, 28, 2);
      }
      for (int o = 0; o < pammo; o++) {
        fill(200, 200, 90, 200);
        stroke(255);
        rect(width - 25 - o * 23, height - 26, 16, 28, 2);
      }
    }
    if (weapon == 2) {
      for (int p = 0; p < 40; p++) {
        fill(140, 140, 40, 150);
        stroke(70, 70, 20, 200);
        rect(width - 20 - p * 10, height - 26, 7, 28, 1);
      }
      for (int o = 0; o < mammo; o++) {
        fill(200, 200, 90, 200);
        stroke(255);
        rect(width - 20 - o * 10, height - 26, 7, 28, 1);
      }
    }
    if (weapon == 3) {
      if (knife < 200) {
        knife += 8;
      } else {
        canknife = true;
      }
      fill(140, 140, 40, 150);
      if (knife < 200) {
        stroke(70, 70, 20, 200);
      } else {
        stroke(255);
      }
      rect(width - 120, height - 30, 200, 28, 3);
      fill(200, 200, 90, 200);
      rect(width - 20 - knife/2, height - 30, knife, 28, 3);
    }
  }
}
