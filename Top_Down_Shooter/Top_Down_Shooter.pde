import processing.sound.*;
Game g;
Player p;
Bullet bullets[] = new Bullet[1000000];
Wall walls[] = new Wall[80];
Weapons w;
Pickup pick;
Zombie z[] = new Zombie[100];
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
int title;
PFont zFont;

void setup() {
  smooth();
  size(1280, 750);
  zFont = createFont("Courier Bold", 10);
  run = false;
  wi = width;
  h = height;
  title = int(random(8));
  titlefont = createFont("ArnoPro-Bold", 200);

  g = new Game();

  for (int q = 0; q < z.length; q++) {
    z[q] = new Zombie();
  }

  looking = new PVector(0, 0);
  gunshot = new SoundFile(this, "gunshot.mp3");
  knife = new SoundFile(this, "knife.mp3");

  p = new Player(width/2, height/2);
  w = new Weapons();
  pick = new Pickup();

  g.gsetup();
}

void draw() {
  if (run == false) {
    background(0);
    textFont(titlefont, 100);
    textAlign(CENTER);
    fill(255);
    rect(wi/2, height-h/2 - 10, wi/4, h/11, 5);
    rect(wi/2, height-h/3 - 10, wi/4, h/11, 5);
    textSize(35);
    text("By: Brendan Leder", width-wi/7, height-h/21);
    textSize(107);
    if (title == 7) {
      text("They Call him Gordonger", wi/2, h/4);
    } else if (title == 6) {
      text("They call me Bread", wi/2, h/4);
    } else if (title == 5) {
      text("Practiacally Arma IV", wi/2, h/4);
    } else if (title == 4) {
      text("A Game I Made", wi/2, h/4);
    } else if (title == 3) {
      text("Prepare 4 Disupointmnt", wi/2, h/4);
    } else if (title == 2) {
      text("Bethasta - Eldank Scralls", wi/2, h/4);
    } else if (title == 1) {
      text("Game of the Year Edition", wi/2, h/4);
    } else {
      text("Guy With A Gun", wi/2, h/4);
    }
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
  title = int(random(8));
  if (run == true) {
    g.gkeyPressed();
  }
}

void mouseReleased() {
  if (run == true) {
    g.gmouseReleased();
  }
}
