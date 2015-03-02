import processing.serial.*;

import processing.sound.*;
Player p;
Target t;
Target g;
Bullet bullets[] = new Bullet[1000000];
Wall walls[] = new Wall[10];
boolean pause;
PImage floor;
SoundFile gunshot;


//Serial myPort;

void setup() {
  smooth();
  size(1100, 700);
  /*
  myPort = new Serial(this, Serial.list()[3], 9600);
   myPort.buffer(1);
   */
  floor = loadImage("floor.jpg");
  gunshot = new SoundFile(this, "gunshot.mp3");
  p = new Player(width/2, height/2);
  t = new Target(width/2, height/2, 2, color(255, 0, 0));
  g = new Target(width/2, height/2, 3, color(0, 255, 0));
  for (int q = 0; q < bullets.length; q++) {
    bullets[q] = new Bullet();
  }

  for (int y = 0; y < walls.length; y++) {
    walls[y] = new Wall(random(0, width), random(0, height), random(0, width/10), random(0, height/10));
  }
  rectMode(CENTER);
}

void draw() {

  if (pause == false) {

    //image(floor, 0, 0);
    background(100);

    p.count -= 1;

    for (int q = 0; q < p.i; q++) {
      bullets[q].call();
      if (bullets[q].x > -100 && bullets[q].x < width+100 && bullets[q].y > -100 && bullets[q].y < height +100) {
        bullets[q].move();
        bullets[q].display();
        bullets[q].collide();
      }
    }

    for (int u = 0; u < walls.length; u++) {
      walls[u].display();
    }

    t.move();
    t.shot();
    t.display();
    g.move();
    g.shot();
    g.display();
    p.move();
    p.shoot();
    p.display();
  }
}

void keyPressed() {
  if (key == ' ') {

    if (pause == true) {
      pause = false;
    } else {
      pause = true;
    }
  }
}
