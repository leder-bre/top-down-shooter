import processing.sound.*;
Player p;
Bullet bullets[] = new Bullet[1000000];
Wall walls[] = new Wall[10];
Weapons w;
boolean pause;
float distance;
float accuracy;
PImage floor;
SoundFile gunshot;


//Serial myPort;

void setup() {
  smooth();
  size(1100, 700);
  // noCursor();
  floor = loadImage("floor.jpg");
  gunshot = new SoundFile(this, "gunshot.mp3");
  p = new Player(width/2, height/2);
  w = new Weapons();
  for (int q = 0; q < bullets.length; q++) {
    bullets[q] = new Bullet();
  }
  walls[0]= new Wall(width/2, 5, width, 10);
  walls[1]= new Wall(5, height/2, 10, height);
  walls[2]= new Wall(width/2, height-5, width, 10);
  walls[3]= new Wall(width-5, height/2, 10, height);
  for (int y = 4; y < walls.length; y++) {
    walls[y] = new Wall(random(0, width), random(0, height), random(0, width/10), random(0, height/10));
  }
  rectMode(CENTER);
}

void draw() {

  distance = sqrt(((mouseX - p.location.x)*(mouseX - p.location.x))+((mouseY - p.location.y)*(mouseY - p.location.y)))/(width/4);
  if (w.weapon == 1) {
    accuracy = 0.5;
  }
  if (w.weapon == 2) {
    accuracy = 1.5;
  }
  if (pause == false) {
    distance += w.recoil/10;
    distance *= accuracy;
    //image(floor, 0, 0);
    background(100);
    stroke(255);
    strokeWeight(2);
    line(mouseX + 10 * distance, mouseY, mouseX + 15* distance, mouseY);
    line(mouseX - 10* distance, mouseY, mouseX - 15* distance, mouseY);
    line(mouseX, mouseY + 10* distance, mouseX, mouseY + 15* distance);
    line(mouseX, mouseY - 10* distance, mouseX, mouseY - 15* distance);
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

    p.move();
    p.shoot();
    p.display();
    w.run();
  }
  println(w.recoil);
}

void mouseReleased() {
  w.shot = false;
}

void keyPressed() {
  if (key == ' ') {

    if (pause == true) {
      pause = false;
    } else {
      pause = true;
    }
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
