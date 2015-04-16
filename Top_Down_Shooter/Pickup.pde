class Pickup {
  int ax;
  int ay;
  int px;
  int py;
  int arot;
  int prot;
  boolean a = false;
  boolean p = false;

  void run() { 
    if (frameRate % 100 == 0) {
      if (a == false && p == true) {
        a = true;
        move(ax, ay);
        arot = int(random(100));
      } else if (a == true && p == false) {
        p = true;
        move(px, py);
        prot = int(random(100));
      } else if (a == false && p == false) {
        if (int(random(10)) % 2 == 0) {
          a = true;
          move(ax, ay);
          prot = int(random(100));
        } else {
          p = true;
          move(px, py);
          prot = int(random(100));
        }
      }
    }
  }

  void display() {
    pushMatrix();
    translate(ax, ay);
    rotate(arot);

    popMatrix();

    pushMatrix();
    translate(px, py);
    rotate(prot);

    popMatrix();
  }
  void move(int a, int b) {
    a = int(random(width));
    b = int(random(width));
    for (int i = 0; i < walls.length; i++) {
      if (a > walls[i].x - walls[i].wide/2 && a < walls[i].x + walls[i].wide/2 && b > walls[i].y - walls[i].high/2 && b < walls[i].y + walls[i].high/2) {
        a = int(random(width));
        b = int(random(width));
      }
    }
  }
}
