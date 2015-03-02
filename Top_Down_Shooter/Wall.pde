
class Wall {
  float x;
  float y;
  float wide;
  float high;

  Wall(float tempX, float tempY, float tempWide, float tempHigh) {
    x = tempX; 
    y = tempY;
    wide = tempWide;
    high = tempHigh;
  }
  
  void display() {
   fill(50, 40, 30); 
   noStroke();
   rect(x, y, wide, high);
  }
  
  
}
