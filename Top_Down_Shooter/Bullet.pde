
class Bullet {
  PVector velocity;
  float x;
  float y;
  int can;

  Bullet() {

    velocity = new PVector(0, 0);

    int can = 0;
  }

  void call() {
    if (can == 0) {

      velocity.x = mouseX - p.location.x;
      velocity.y = mouseY - p.location.y;
      velocity.normalize();
      velocity.mult(20);

      if (w.weapon == 2) {
        velocity.x = velocity.x + random(-0.7 * w.recoil/15, 0.7 * w.recoil/15);
        velocity.y = velocity.y+ random(-0.7 * w.recoil/15, 0.7 * w.recoil/15);
      }
      if (w.weapon == 1) { 
        velocity.x = velocity.x + random(-1 * w.recoil/45, 1 * w.recoil/45);
        velocity.y = velocity.y+ random(-1 * w.recoil/45, 1 * w.recoil/45);
      }

      x = p.location.x + velocity.x*2;
      y = p.location.y + velocity.y*2;
      can = 1;
    }
  }

  void move() { 
    x += velocity.x;
    y += velocity.y;
  }

  void collide() {
    for (int i = 0; i < walls.length; i++) {
      if (x > walls[i].x - walls[i].wide/2 && x < walls[i].x + walls[i].wide/2 && y > walls[i].y - walls[i].high/2 && y < walls[i].y + walls[i].high/2) {
        x = -100;
        y = -100;
      }
    }
  }

  void display() {
    strokeWeight(1);
    fill(255, 100, 0);
    stroke(255);
    ellipse(x, y, 2, 2);
  }
}
