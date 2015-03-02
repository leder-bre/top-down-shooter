class Target {
  float x;
  float y;
  float ymove;
  float xmove;
  float size;
  int port; 
  color c;
  Target(float tempX, float tempY, int tempPort, color tempC) {
    x = tempX;
    y=tempY;
    xmove = random(3, 5);
    ymove = random(3, 5);
    port = tempPort;
    c = tempC;
    size = 30;
  }

  void move() {
    if (x < 0) {
      xmove = random(3, 5);
    }
    if (x > width) {
      xmove = random(3, 5);
      xmove = xmove * -1;
    }

    if (y < 0) {
      ymove = random(3, 5);
    }
    if (y > height) {
      ymove = random(3, 5);
      ymove = ymove * -1;
    }


    x += xmove;
    y += ymove;
  }

  void shot() {
    for (int i = 0; i < p.i; i++) {
      if (x > bullets[i].x - size/2 && x < bullets[i].x + size/2 && y > bullets[i].y - size/2 && y < bullets[i].y + size/2) {
        x = random(0, width);
        y = random(0, height);
        /*
        myPort.write(port);
        */
      }
    }
  }
  void display() {
    fill(c);
    ellipse(x, y, size, size);
  }
}
