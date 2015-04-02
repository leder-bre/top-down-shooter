
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

      if (w.weapon == 2) {
        velocity.x = mouseX - p.location.x + random(-25, 25);
        velocity.y = mouseY - p.location.y+ random(-25, 25);
      }
      if (w.weapon == 1) { 
        velocity.x = mouseX - p.location.x + random(-15, 15);
        velocity.y = mouseY - p.location.y+ random(-15, 15);
      }
      velocity.normalize();
      velocity.mult(20);
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
