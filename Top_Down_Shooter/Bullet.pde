
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
        velocity.x = mouseX - p.location.x + random(-70*(150*distance/width), 70*(150*distance/width));
        velocity.y = mouseY - p.location.y+ random(-70*(150*distance/width), 70*(150*distance/width));
      }
      if (w.weapon == 1) { 
        velocity.x = mouseX - p.location.x + random(-40*(150*distance/width), 40*(150*distance/width));
        velocity.y = mouseY - p.location.y+ random(-40*(150*distance/width), 40*(150*distance/width));
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
