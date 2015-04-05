class Player {
  PVector location;
  float ammo;
  int i;
  int count;
  PVector velocity;
  int bang;

  Player(float tempX, float tempY) {
    location = new PVector (0, 0);
    velocity = new PVector (0, 0);
    location.x = tempX;
    location.y = tempY;
    i = 1;
    bang = 0;
  }

  void move() {

    //  for (int i = 0; i < walls.length; i++) { 

    if (keyPressed) {
      if (key == 'a') {
        velocity.x -= 2;

        for (int i = 0; i < walls.length; i++) {
          if (location.x-2 > walls[i].x - walls[i].wide/2 && location.x-2 < walls[i].x + walls[i].wide/2 && location.y > walls[i].y - walls[i].high/2 && location.y < walls[i].y + walls[i].high/2) {
            velocity.x += +2;
          }
        }
      }
      if (key == 'd') {
        velocity.x += 2;
        for (int i = 0; i < walls.length; i++) {
          if (location.x+2 > walls[i].x - walls[i].wide/2 && location.x+2 < walls[i].x + walls[i].wide/2 && location.y > walls[i].y - walls[i].high/2 && location.y < walls[i].y + walls[i].high/2) {
            velocity.x -= 2;
          }
        }
      }
      if (key == 'w') {
        velocity.y -= 2;
        for (int i = 0; i < walls.length; i++) {
          if (location.x > walls[i].x - walls[i].wide/2 && location.x < walls[i].x + walls[i].wide/2 && location.y-2 > walls[i].y - walls[i].high/2 && location.y-2 < walls[i].y + walls[i].high/2) {
            velocity.y += 2;
          }
        }
      }
      if (key == 's') {
        velocity.y += 2;

        for (int i = 0; i < walls.length; i++) {
          if (location.x > walls[i].x - walls[i].wide/2 && location.x < walls[i].x + walls[i].wide/2 && location.y+2 > walls[i].y - walls[i].high/2 && location.y+2 < walls[i].y + walls[i].high/2) {
            velocity.y -= 2;
          }
        }
      }
    }
    velocity.normalize();
    velocity.mult(3);
    location.add(velocity);
    velocity.mult(0);
    //}
  }

  void display() {


    stroke(0);
    strokeWeight(1);

    pushMatrix();

    translate(location.x, location.y);
    rotate(atan2(mouseY-location.y, mouseX-location.x));

    if (w.weapon == 1) {
      fill(210, 55, 55);
      beginShape();
      vertex(8, -18);
      vertex(28, -10);
      vertex(38, 1);
      vertex(38, 3);
      vertex(26, 13);
      vertex(1, 20);

      vertex(4, 7);
      vertex(23, 7);
      vertex(27, 5);
      vertex(29, 3);
      vertex(21, -5);
      vertex(-3, -17);

      endShape(CLOSE);

      fill(210, 200, 150);

      ellipse(34, 2, 15, 10);

      fill(200, 220, 220);

      rect(50, 2, 14, 3);

      rect(38, 2, 15, 5);
    }
    if (w.weapon == 2) {
      fill(210, 55, 55);
      beginShape();
      vertex(9, -21);
      vertex(20, -20);
      vertex(27, 0);
      vertex(40, 4);
      vertex(22, 18);
      vertex(-1, 22);

      vertex(4, 14);
      vertex(21, 9);
      vertex(25, 2);
      vertex(18, 1);
      vertex(14, -13);
      vertex(-8, -15);

      endShape(CLOSE);
      fill(210, 200, 150);
      ellipse(23, 3, 12, 10);
      ellipse(36, 3, 9, 8);
      fill(200, 220, 220);

      rect(45, 3, 30, 3);

      rect(30, 3, 25, 5);
    }

    fill(210, 55, 55);
    rect(0, 0, 15, 40, 5);

    fill(210, 200, 150);
    ellipse(0, 0, 20, 20);


    if (bang > 0) {
      noStroke();
      fill(255, 0, 0, bang);
      ellipse(55, 0, bang/10-5, bang/10-5);
      bang -= 30;
    }

    popMatrix();
  }

  void shoot() {
    if (mousePressed) {
      if (w.canShoot <= 0 && w.shot == false) {
        bang = 255;
        w.canShoot = w.fireRate;
        w.shot=true;
        gunshot.play();
        i += 1;
        w.recoil += 20;
        if(w.weapon == 1) {
         w.recoil += 50; 
        }
      }
    }
  }
}
