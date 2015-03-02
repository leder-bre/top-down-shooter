class Player {
  PVector location;
  float ammo;
  int i;
  int count;
  PVector velocity;

  Player(float tempX, float tempY) {
    location = new PVector (0, 0);
    velocity = new PVector (0, 0);
    location.x = tempX;
    location.y = tempY;
    i = 1;
  }

  void move() {

    if (keyPressed) {
      if (key == 'a') {
        velocity.x -= 2;
      }
      if (key == 'd') {
        velocity.x += 2;
      }
      if (key == 'w') {
        velocity.y -= 2;
      }
      if (key == 's') {
        velocity.y += 2;
      }
    }
    location.add(velocity);
    velocity.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(1);

    pushMatrix();

    translate(location.x, location.y);
    rotate(atan2(mouseY-location.y, mouseX-location.x));

    fill(210, 55, 55);
    beginShape();
    vertex(-3, -22);
    vertex(20, -18);
    vertex(38, 3);
    vertex(26, 3);
    vertex(19, 20);
    vertex(0, 22);

    vertex(6, 11);
    vertex(14, 13);
    vertex(17, 2);
    vertex(29, 3);
    vertex(17, -9);
    vertex(-8, -15);

    endShape(CLOSE);

    fill(200, 220, 220);

    rect(40, 0, 30, 3);

    rect(25, 1, 25, 5);

    fill(210, 55, 55);
    rect(0, 0, 15, 40, 5);

    fill(210, 200, 150);
    ellipse(0, 0, 20, 20);

    popMatrix();
  }

  void shoot() {
    if (mousePressed) {
      if (count <= 0) {
        count = 5;
        gunshot.play();
        i += 1;
      }
    }
  }
}
