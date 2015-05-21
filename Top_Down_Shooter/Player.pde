class Player {
  PVector location;
  int health = 300;
  int maxBullets;
  PVector velocity;
  int bang;
  int pun1 = 24;
  int pun2 = 19;
  boolean punch = false;
  int puncher = 1;
  PFont fontext;
  boolean sprinting = false;
  int sprint = 300;
  int runtimer = 0;
  float legs = 0;
  int legflip = 2;
  boolean runninga;
  boolean runningb;
  boolean runningc;
  boolean runningd;
  int sr = 0;
  int sg = 0;
  int sb = 0;
  int pr = 0;
  int pg = 0;
  int pb = 0;
  int dead = 0;
  int bloodx;
  int bloody;

  Player(float tempX, float tempY) {
    fontext = createFont("SukhumvitSet-Light", 100);
    location = new PVector (0, 0);
    velocity = new PVector (0, 0);
    location.x = tempX;
    location.y = tempY;
    maxBullets = 2;
    bang = 0;
    bloodx = int(random(-10, 10));
    bloody = int(random(-10, 10));
    dead = 0;


    health = 300;
    maxBullets=0;
    bang = 0;
    pun1 = 24;
    pun2 = 19;
    punch = false;
    puncher = 1;
    sprinting = false;
    sprint = 300;
    runtimer = 0;
    legs = 0;
    legflip = 2;
  }

  void move() {

    if (health > 0) {

      if (frameCount%5==0) {
        if (legs > 26) {
          legflip = -2;
        } else if (legs < -26) {
          legflip = 2;
        }
      }


      if (runninga == true||runningb == true||runningc == true||runningd == true) {
        legs += legflip;
        if (sprinting == true && sprint > 1) {
          legs += legflip/2;
        }
      } else {
        legs = 0;
      }



      if (runtimer > 0 && (sprinting == false || sprint == 0)) {
        runtimer -= 1;
      }

      if (keyPressed) {

        if (key == 'r' || key == 'R') {
          if (w.weapon == 1 && w.pammo + w.totpammo >= 15) {
            w.totpammo -= 15 - w.pammo;
            w.pammo = 15;
          } else if (w.weapon == 1 && w.pammo + w.totpammo < 15) {
            w.pammo += w.totpammo;
            w.totpammo = 0;
          }

          if (w.weapon == 2 && w.mammo + w.totmammo >= 30) {
            w.totmammo -= 30 - w.mammo;
            w.mammo = 30;
          } else if (w.weapon == 2 && w.mammo + w.totmammo < 30) {
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
      if (sprinting == true && sprint > 1) {
        sprint -= 1;
        velocity.mult(1.5);
        runtimer = 60;
      }
      if (frameCount % 2 == 0 && sprint < 300 && sprinting == false && runtimer == 0) {
        sprint+=1;
      }
      location.add(velocity);
    }
  }

  void display() {
    if (health > 0) {


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
    }

    stroke(0);
    strokeWeight(1);

    pushMatrix();

    translate(location.x, location.y);

    rotate(atan2(mouseY-height/2, mouseX-width/2));
    if (health > 0) {

      fill(210, 200, 150);

      ellipse(legs, 10, 15, 12);
      ellipse(-1*legs, -10, 15, 12);

      fill(pr, pg, pb);

      rect(legs/2 * -1, -10, legs, 10);
      rect(legs/2, 10, legs, 10);

      if (w.weapon == 1) {
        fill(sr, sg, sb);
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
        fill(sr, sg, sb);
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
        fill(sr, sg, sb);
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

      fill(sr, sg, sb);
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
    } else {


      strokeWeight(1);
      stroke(100, 0, 0, dead);
      fill(150, 10, 10, dead - 20);
      ellipse(-55 + bloodx, 0 + bloody, 10, 10);
      ellipse(-65 - bloodx, 0 + bloody, 10, 10);
      ellipse(-75 - bloodx, 5 - bloody, 10, 10);
      ellipse(-50 + bloody, -10 + bloodx, 10, 10);
      ellipse(-65 - bloody, 2 + bloodx, 10, 10);
      ellipse(-50 - bloody, -5 - bloodx, 10, 10);
      ellipse(-75 - bloodx, 2 + bloodx, 10, 10);
      ellipse(-70 - bloodx, -5 - bloodx, 10, 10);
      ellipse(-60 + bloodx, 5 + bloodx, 10, 10);
      ellipse(-55 - bloody, 2 + bloody, 10, 10);
      ellipse(-70 - bloody, -5 - bloody, 10, 10);
      ellipse(-80 + bloody, 5 + bloody, 10, 10);
      fill(189, 168, 121, dead/2);
      stroke(0, dead/3);
      strokeWeight(1);
      rect(67, 14, 10, 17, 3);
      rect(71, -11, 17, 10, 3);
      ellipse(6, 48, 13, 13);
      ellipse(14, -30, 13, 13);
      ellipse(-40, 0, 30, 30);
      fill(sr, sg, sb, dead/3);
      pushMatrix();
      rotate(1);
      rect(23, 21, 38, 11);
      popMatrix();
      pushMatrix();
      rotate(-13);
      rect(7, -22, 38, 11);
      popMatrix();
      rect(44, 10, 40, 12, 2);
      rect(44, -10, 40, 12, 2);
      rect(0, 0, 50, 35, 5);
    }
    popMatrix();
  }

  void HUD2() {
    if (p.health > 0) {
      fill(255, 0, 0, 200);
      noStroke();
      rect(location.x, location.y-37, health/6, 7);
      fill(150, 150, 0, 200);
      rect(location.x, location.y-30, sprint/6, 7);
      textFont(zFont, 7);
      pushMatrix();
      translate(location.x, location.y);
      scale(1.5, 1);
      fill(0);
      textAlign(CENTER);
      text(health/3, 0, -35) ;
      text(sprint/3, 0, -28);
      popMatrix();
    }
  }


  void HUD() {
    fill(255, 0, 0, 200);
    noStroke();
    rect(width - 21 - health/2, height -50, health - 1, 26, 3);
    stroke(255);
    fill(40, 80, 80, 0);
    rect(width-172, height -50, 300, 28, 3);
    // fill(255, 0, 0, 200);
    // noStroke();
    // rect(location.x, location.y-37, health/6, 7);
    // rect(width - 21 - health/2, height -50, health - 1, 26, 3);
    // fill(150, 150, 0, 200);
    // rect(location.x, location.y-30, sprint/6, 7);
    // textFont(zFont, 7);
    // pushMatrix();
    // translate(location.x, location.y);
    // scale(1.5, 1);
    // fill(0);
    // textAlign(CENTER);
    // text(health/3, 0, -35) ;
    // text(sprint/3, 0, -28);
    // popMatrix();
    fill(0);
    textFont(fontext, 20);
    text("Health: " + health/3 + "/100", width-250, height-43);
    fill(255, 0, 0, dead);
    textSize(100);
    text("YOU DIED", width/2, height/2);
  }

  void shoot() {
    if (health > 0) {

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
            } else {
              fill(20, 0, 0);
              textSize(50);
              textFont(zFont, 50);
              if (w.weapon == 1 && w.totpammo > 0 || w.weapon == 2 && w.totmammo > 0) {
                text("Reload", p.location.x, p.location.y - 50);
              } else {
                text("Out of Ammo", p.location.x, p.location.y - 50);
              }
            }
          }
        }
      }
    } else {
      health = 0;
      dead += 1;
      if (dead > 100) {
        fill(255);
        pushMatrix();
        rect(p.location.x, p.location.y+40, 100, 10, 3);   
        rect(p.location.x, p.location.y+80, 100, 10, 3); 
        fill(0);
        text("Restart", p.location.x, p.location.y + 40);
        text("Quit", p.location.x, p.location.y + 80);
        if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height/2+40-5&&mouseY<height/2+40+5) {
          if (mousePressed) {
            g.gsetup();
            setup();
          } else if (mouseX>width/2-50&&mouseX<width/2+50&&mouseY>height/2+80-5&&mouseY<height/2+80+5) {
            stop();
          }
        }
        popMatrix();
      }
    }
  }
}
