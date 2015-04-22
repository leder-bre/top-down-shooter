class Game {
  

  void gdraw() {

    looking.x=mouseX - p.location.x;
    looking.y=mouseY - p.location.y;
    looking.normalize();

    if (w.weapon == 3 && w.knife<50 && w.canknife == true) {
      for (int i = -20; i < 60; i++) {
        bullets[0].x = p.location.x + looking.x * i;
        bullets[0].y = p.location.y + looking.y * i;
      }
    } else {
      bullets[0].x = -99;
    }

    distance = sqrt(((mouseX - p.location.x)*(mouseX - p.location.x))+((mouseY - p.location.y)*(mouseY - p.location.y)))/(width/4);
    if (w.weapon == 1) {
      accuracy = 0.5;
    } else if (w.weapon == 2) {
      accuracy = 1.5;
    } else {
      accuracy = 0.2;
    }
    if (pause == false) {

      if (w.recoil > 10) {
        distance *= w.recoil/10;
        distance *= accuracy;
      } else {
        distance += w.recoil/20;
        distance *= accuracy;
      }
      background(100);
      stroke(255);
      strokeWeight(2);
      line(mouseX + 10 * distance, mouseY, mouseX + 15* distance, mouseY);
      line(mouseX - 10* distance, mouseY, mouseX - 15* distance, mouseY);
      line(mouseX, mouseY + 10* distance, mouseX, mouseY + 15* distance);
      line(mouseX, mouseY - 10* distance, mouseX, mouseY - 15* distance);
      p.count -= 1;

      for (int q = 1; q < p.maxBullets; q++) {
        bullets[q].call();
        if (bullets[q].x > -100 && bullets[q].x < width+100 && bullets[q].y > -100 && bullets[q].y < height +100) {
          bullets[q].move();
          bullets[q].display();
          bullets[q].collide();
        }
      }

      for (int q = 0; q < z.length; q++) {
        if (z[q].x > 0) {   
          z[q].move();
          z[q].display();
          z[q].attack();
          z[q].walk();
        }
      }

      for (int u = 0; u < walls.length; u++) {
        walls[u].display();
      }
      fill(200);
      rect(width/2, height - 40, width, 80);
      pick.run();
      pick.display();
      p.move();
      p.shoot();
      p.display();
      w.run();
      bullets[1].display();
    }
  }

  void gmouseReleased() {
    w.shot = false;
  }

  void gkeyPressed() {
    if (key == ' ') {

      if (pause == true) {
        pause = false;
      } else {
        pause = true;
      }
    }

    if (key == 'a') {
      p.velocity.x = -2;
    }

    if (key == 'd') {
      p.velocity.x = +2;
    }

    if (key == 'w') {
      p.velocity.y = -2;
    }

    if (key == 's') {
      p.velocity.y = +2;
    }

    if (key == '1') {
      w.weapon = 1;
    }

    if (key == '2') {
      w.weapon = 2;
    }
    if (key == '3') {
      w.weapon = 3;
    }
  }

  void gkeyReleased() {
    if (key == 'a') {
      p.velocity.x = 0;
    }

    if (key == 'd') {
      p.velocity.x = 0;
    }

    if (key == 'w') {
      p.velocity.y = 0;
    }

    if (key == 's') {
      p.velocity.y = 0;
    }
    if (key == 'p') {
      for (int q = 0; q < z.length; q++) {
        z[q].spawn();
      }
    }
  }
}
