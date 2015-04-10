class Zombie {
  int seen;
  int looking;
  float x;
  float y;
  float xspeed;
  float yspeed;
  float xlook;
  float ylook;
  float spotx;
  float spoty;
  PVector movement;

  void spawn() {
    seen = 0;
    looking = 0;
    int chooser = int(random(100));
    int picker = int(random(100));
    if (chooser % 2 == 0) {
      x = random(30, width-30);
      if (picker % 2 == 0) {
        y = 30;
      } else {
        y = height - 30;
      }
    } else {
      y = random(30, height - 30);
      if (picker % 2 == 0) {
        x = 30;
      } else {
        x = width - 30;
      }
    }

    xspeed = 1;
    yspeed = 1;
    movement = new PVector(0, 0);
  }

  void move() {

    if (seen == -180) {
      seen = 0;
      xspeed = 1;
      yspeed = 1;
    }


    seen -= 1;

    println(seen);
    if (frameCount % 10 == 0) {
     

      if (dist(x, y, p.location.x, p.location.y) < 400) {
        seen = 30;
        xlook= (p.location.x - x) / 50;
        ylook= (p.location.y - y) / 50;
        spotx = x;
        spoty = y;
        for (int u = 0; u < 100; u++) {
          spotx = x + (xlook * u);
          spoty = y + (ylook * u);
          for (int i = 0; i < walls.length; i++) {
            if (spotx > walls[i].x - walls[i].wide/2 && spotx < walls[i].x + walls[i].wide/2 && spoty > walls[i].y - walls[i].high/2 && spoty < walls[i].y + walls[i].high/2) {
              seen = 0;
            }
          }
        }
      }
      if (seen > 0) {
        movement.x = xlook;
        movement.y = ylook;
        movement.normalize();
        movement.mult(2);
        xspeed = movement.x;
        yspeed = movement.y;
        seen -=1;
        println("seen");
      }
    }
    for (int i = 0; i < walls.length; i++) {
       if (frameCount % 100 == 0 && x > walls[i].x - walls[i].wide/2 && x < walls[i].x + walls[i].wide/2 && y > walls[i].y - walls[i].high/2 && y < walls[i].y + walls[i].high/2) {
        spawn();
      }
      if (x > walls[i].x - walls[i].wide/2 && x < walls[i].x + walls[i].wide/2 && y+yspeed > walls[i].y - walls[i].high/2 && y+yspeed < walls[i].y + walls[i].high/2) {
        yspeed = yspeed * -1;
      }

      if (x+xspeed > walls[i].x - walls[i].wide/2 && x+xspeed < walls[i].x + walls[i].wide/2 && y > walls[i].y - walls[i].high/2 && y < walls[i].y + walls[i].high/2) {
        xspeed = xspeed * -1;
      }
    }

    x+=xspeed;
    y+=yspeed;
  }
  void display() {
    pushMatrix();
    translate(x, y);
    rotate(atan2((y + yspeed)-y, (x + xspeed)-x));
    strokeWeight(2);
    stroke(0);
    fill(30, 55, 42);
    rect(20, 20, 20, 10, 2);
    rect(20, -20, 20, 10, 2);
    rect(0, 0, 20, 50, 5);
    fill(0, 100, 0);
    ellipse(0, 0, 30, 30);
    ellipse(30, -20, 15, 15);
    ellipse(30, 20, 15, 15);
    popMatrix();
  }
  //dank
  void attack() {
    for (int q = 0; q < p.i; q++) {
      if (dist(bullets[q].x, bullets[q].y, x, y) < 20) {
        spawn();
        if(q == 0) {
         w.canknife = false; 
        }
        bullets[q].x = -100;
        x = -100;
        
      }
    }//so dank
    if (dist(p.location.x, p.location.y, x, y) < 20) {
      p.location.x = width/2;
      p.location.y = height/2;
      p.health -= 40;
      spawn();
    }
  }//how dank?
}
//as dank as possebru
