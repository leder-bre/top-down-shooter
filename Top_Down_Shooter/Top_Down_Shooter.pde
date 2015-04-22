import processing.sound.*;
Game g;
Player p;
Bullet bullets[] = new Bullet[1000000];
Wall walls[] = new Wall[80];
Weapons w;
Pickup pick;
Zombie z[] = new Zombie[20];
boolean pause;
float distance;
float accuracy;
PVector looking;
SoundFile gunshot;
SoundFile knife;
PFont titlefont;
float wi;
float h;
boolean run;

void setup() {
  smooth();
  size(1280, 750);
  run = false;
  wi = width;
  h = height;
  titlefont = createFont("ArnoPro-Bold", 200);

  g = new Game();

  looking = new PVector(0, 0);
  gunshot = new SoundFile(this, "gunshot.mp3");
  knife = new SoundFile(this, "knife.mp3");

  p = new Player(width/2, height/2);
  w = new Weapons();
  pick = new Pickup();
  for (int q = 0; q < z.length; q++) {
    z[q] = new Zombie();
  }


  for (int q = 0; q < bullets.length; q++) {
    bullets[q] = new Bullet();
  }
  walls[0]= new Wall(width/2, 5, width, 10);
  walls[1]= new Wall(5, height/2, 10, height);
  walls[2]= new Wall(width/2, height-45, width, 90);
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
  if (run == false) {
    background(0);
    textFont(titlefont, 100);
    textAlign(CENTER);
    fill(255);
    rect(wi/2, height-h/2 - 10, wi/4, h/11);
    rect(wi/2, height-h/3 - 10, wi/4, h/11);
    textSize(35);
    text("By: Brendan Leder", width-wi/7, height-h/21);
    textSize(157);
    text("Top Down Shooter", wi/2, h/4);
    fill(0);
    textSize(50);
    text("Start", wi/2, height-h/2);
    text("Quit", wi/2, height-h/3);
    if (mousePressed) {
      if (mouseX < wi/2 + wi/8 && mouseX > wi/2 - wi/8) {
        if (mouseY > height - h/2 - h/22 && mouseY < height - h/2 + h/22) {
          run = true;
        }
        if (mouseY > height - h/3 - h/22 && mouseY < height - h/3 + h/22) {
          exit();
        }
      }
    }
  } else {
    g.gdraw();
  }
}

void keyReleased() {
  if (run == true) {
    g.gkeyReleased();
  }
}

void keyPressed() {
  if (run == true) {
    g.gkeyPressed();
  }
}

void mouseReleased() {
  if (run == true) {
    g.gmouseReleased();
  }
}
