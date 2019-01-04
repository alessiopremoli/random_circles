class movingCircle {
  
  float x, y; //centro
  float r; //raggio
  float speed;
  color c;
  float t;
  float direction;
  
  movingCircle(float tx, float ty, float tradius, float tspeed, color tc, float tt, float tdirection) {
    
    x = tx;
    y = ty;
    r = tradius;
    speed = tspeed;
    c = tc;
    t = tt;
    direction = tdirection;
    
  }
  
  void display() {
    
    fill(c, t);
    ellipse(x, y, 2*r, 2*r);
    
  }
  
  void move() {
    
    if (direction > 0) {
      x = x + speed;
      if(x+r == width || x-r == 0) {
        speed = -speed;
      }
    } else {
      y = y + speed;
      if(y+r == height || y-r == 0) {
        speed = -speed;
      }
    }
    
  }

};