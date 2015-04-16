import processing.sound.*;
Player p;
Bullet bullets[] = new Bullet[1000000];
Wall walls[] = new Wall[40];
Weapons w;
Zombie z[] = new Zombie[20];
boolean pause;
float distance;
float accuracy;
PVector looking;
SoundFile gunshot;
SoundFile knife;

void setup() {
  smooth();
  size(1280, 700);
  looking = new PVector(0, 0);
  gunshot = new SoundFile(this, "gunshot.mp3");
  knife = new SoundFile(this, "knife.mp3");
  p = new Player(width/2, height/2);
  w = new Weapons();
  for (int q = 0; q < z.length; q++) {
    z[q] = new Zombie();
  }
  for (int q = 0; q < bullets.length; q++) {
    bullets[q] = new Bullet();
  }
  walls[0]= new Wall(width/2, 5, width, 10);
  walls[1]= new Wall(5, height/2, 10, height);
  walls[2]= new Wall(width/2, height-5, width, 10);
  walls[3]= new Wall(width-5, height/2, 10, height);
  for (int y = 4; y < walls.length; y++) {
    walls[y] = new Wall(random(0, width), random(0, height), random(width/40, width/10), random(height/40, height/10));
  }
  rectMode(CENTER);
  for (int q = 0; q < z.length; q++) {
    z[q].spawn();
  }
  w.mammo = 30;
  w.pammo = 15;
}

void draw() {

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
  }
  if (w.weapon == 2) {
    accuracy = 1.5;
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

    for (int q = 1; q < p.i; q++) {
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

    p.move();
    p.shoot();
    p.display();
    w.run();
    bullets[1].display();
  }
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

void keyReleased() {
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
}
