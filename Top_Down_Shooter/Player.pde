class Player {
  PVector location;
  float ammo;
  int health = 300;
  int maxBullets;
  int count;
  PVector velocity;
  int bang;
  int pun1 = 24;
  int pun2 = 19;
  boolean punch = false;
  int puncher = 1;
  PFont fontext;

  Player(float tempX, float tempY) {
    fontext = createFont("SukhumvitSet-Light", 100);
    location = new PVector (0, 0);
    velocity = new PVector (0, 0);
    location.x = tempX;
    location.y = tempY;
    maxBullets = 1;
    bang = 0;
  }

  void move() {

    //  for (int i = 0; i < walls.length; i++) { 

    if (keyPressed) {
      if (key == 'r') {
        if (w.weapon == 1 && w.pammo + w.totpammo >= 15) {
          w.totpammo -= 15 - w.pammo;
          w.pammo = 15;
        } else if (w.weapon == 1 && w.pammo + w.totpammo < 15){
          w.pammo += w.totpammo;
          w.totpammo = 0;
        }

        if (w.weapon == 2 && w.mammo + w.totmammo >= 30) {
          w.totmammo -= 30 - w.mammo;
          w.mammo = 30;
        } else if (w.weapon == 2 && w.mammo + w.totmammo < 30){
          w.mammo += w.totmammo;
          w.totmammo = 0;
        }
      }
    }

    /*
    for (int i = 0; i < walls.length; i++) {
     if (location.x-3 > walls[i].x - walls[i].wide/2 && location.x-3 < walls[i].x + walls[i].wide/2 && location.y > walls[i].y - walls[i].high/2 && location.y < walls[i].y + walls[i].high/2) {
     velocity.x = 0;
     }
     }
     
     
     for (int i = 0; i < walls.length; i++) {
     if (location.x+3 > walls[i].x - walls[i].wide/2 && location.x+3 < walls[i].x + walls[i].wide/2 && location.y > walls[i].y - walls[i].high/2 && location.y < walls[i].y + walls[i].high/2) {
     velocity.x = 0;
     }
     }
     
     
     for (int i = 0; i < walls.length; i++) {
     if (location.x > walls[i].x - walls[i].wide/2 && location.x < walls[i].x + walls[i].wide/2 && location.y-3 > walls[i].y - walls[i].high/2 && location.y-3 < walls[i].y + walls[i].high/2) {
     velocity.y = 0;
     }
     }
     
     
     
     for (int i = 0; i < walls.length; i++) {
     if (location.x > walls[i].x - walls[i].wide/2 && location.x < walls[i].x + walls[i].wide/2 && location.y+3 > walls[i].y - walls[i].high/2 && location.y+3 < walls[i].y + walls[i].high/2) {
     velocity.y = 0;
     }
     }
     */

    for (int i = 0; i < walls.length; i++) {
      if (location.x > walls[i].x - walls[i].wide/2 && location.x < walls[i].x + walls[i].wide/2 && location.y+velocity.y > walls[i].y - walls[i].high/2 && location.y+velocity.y < walls[i].y + walls[i].high/2) {
        location.y-=velocity.y * 1.1;
      }
      if (location.x+velocity.x > walls[i].x - walls[i].wide/2 && location.x+velocity.x < walls[i].x + walls[i].wide/2 && location.y > walls[i].y - walls[i].high/2 && location.y < walls[i].y + walls[i].high/2) {
        location.x-=velocity.x * 1.1;
      }
    }

    velocity.normalize();
    velocity.mult(3);
    location.add(velocity);
  }

  void display() {

    if (punch == true) {
      if (pun1 == 19) {
        puncher = -1;
      }
      pun1 -= puncher;
      pun2 += puncher * 7;
      if (pun1 == 24) {
        punch = false;
        puncher = 1;
        pun1 = 24;
        pun2 = 19;
      }
    }

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
      vertex(-10, -17);

      endShape(CLOSE);

      fill(210, 200, 150);

      ellipse(34, 2, 15, 10);

      fill(200, 220, 220);

      rect(50, 2, 14, 3);

      rect(38, 2, 15, 5);
    } else if (w.weapon == 2) {
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
      fill(10);
      rect(43, 4, 30, 3);
      fill(165, 75, 15);
      rect(39, 4, 22, 4);
      triangle(-6, 15, 3, 3, 31, 4);
      fill(10);
      rect(30, 4, 25, 5);
    } else {
      fill(210, 55, 55);
      beginShape();
      vertex(2, -21);
      vertex(20, -26 + pun2/4);
      vertex(43-pun2/2, 0);
      vertex(36-pun2/2, -1);
      vertex(16, -17+ pun2/4);
      vertex(7, -9);
      endShape(CLOSE);
      beginShape();
      vertex(11, pun1 - 10);
      vertex(14, pun1 - 10);
      vertex(pun2, 1);
      vertex(pun2 + 2, 12);
      vertex(14, pun1);
      vertex(-7, 19);

      endShape(CLOSE);
      fill(210, 200, 150);
      ellipse(40 - pun2/2, 0, 11, 11);
      ellipse(pun2 + 1, 6, 11, 11);
      fill(100, 100, 100);
      pushMatrix();
      translate(pun2 + 1, 4);
      rotate(pun2/14+20.7);
      rect(0, 0, 5, 15);
      fill(200, 200, 200);
      noStroke();
      rect(0, 11, 5, 11);
      triangle(-2, 16, 3, 14, 2, 22);
      strokeWeight(1);
      stroke(0);
      popMatrix();
    }

    fill(210, 55, 55);
    rect(0, 0, 15, 40, 5);

    fill(210, 200, 150);
    ellipse(0, 0, 20, 20);


    if (bang > 0) {
      noStroke();
      fill(255, 200, 200, bang/4);
      ellipse(57, 2, bang/10-5, bang/10-5);
      fill(255, 80, 20, bang);
      ellipse(57, 2, bang/10-10, bang/10-10);
      fill(255, 0, 0, bang/2);
      ellipse(57, 2, bang/12-10, bang/12-10);
      bang -= 30;
    }

    popMatrix();

    stroke(255);
    fill(40, 80, 80, 150);
    rect(width-172, height -50, 300, 28, 3);
    fill(255, 0, 0, 200);
    noStroke();
    rect(width - 21 - health/2, height -50, health - 1, 26, 3);
    fill(0);
    textFont(fontext, 20);
    text("Health: " + health/3 + "/100", width-250, height-43);
  }

  void shoot() {

    if (mousePressed) {
      if (w.weapon == 3 && w.knife == 200) {
        if (punch == false && w.shot == false) {
          punch = true;
          knife.play();
          w.shot = true;
          w.knife = 0;
        }
      }
      if (w.weapon != 3) {
        if (w.canShoot <= 0 && w.shot == false) {
          if (w.weapon == 1 && w.pammo > 0 || w.weapon == 2 && w.mammo > 0) {
            bang = 255;
            w.canShoot = w.fireRate;
            w.shot=true;
            gunshot.play();
            maxBullets += 1;
            w.recoil += 20;
            if (w.weapon == 1) {
              w.recoil += 20;
              w.pammo -= 1;
            } else {
              w.mammo -= 1;
            }
          }
        }
      }
    }
  }
}
