import ddf.minim.*;
boolean changed = true;
int secondChanges = 7;

movingCircle toRightCircle;
movingCircle toLeftCircle;
movingCircle toUpCircle;
movingCircle toDownCircle;

void setup() {
  size(1280, 720);
  
  toRightCircle = new movingCircle(width/2, height/2, width/6, 1, #ffffff, 150, 1);
  toLeftCircle = new movingCircle(width/2, height/2, width/6, -1, #ffffff, 150, 1);
  toUpCircle = new movingCircle(width/2, height/2, height/6, 1, #ffffff,70, -1);
  toDownCircle = new movingCircle(width/2, height/2, height/6, -1, #ffffff, 70, -1);
  
  randomSeed(12);
}

void draw() {
  
  if(floor(millis()/1000) % secondChanges > 0) {
    changed = true;
  }
  
  if(changed && floor(millis()/1000) % secondChanges == 0) {
    changed = !changed;
    
    //fixed Y, random X
    int randomX = (int)random(width/6, height-width/6);
    toRightCircle = new movingCircle(randomX, height/2, width/6, 1, #ffffff, 150, 1);
    toLeftCircle = new movingCircle(width-randomX, height/2, width/6, -1, #ffffff, 150, 1);
    
    //random Y, fixed X
    int randomY = (int)random(width/6, height-width/6);
    toUpCircle = new movingCircle(width/2, randomY, height/6, 1, #ffffff,70, -1);
    toDownCircle = new movingCircle(width/2, height-randomY, height/6, -1, #ffffff, 70, -1);
  }
  
  background(0);
  
  toRightCircle.display();
  toRightCircle.move();

  toLeftCircle.display();
  toLeftCircle.move();

  toUpCircle.display();
  toUpCircle.move();
  
  toDownCircle.display();
  toDownCircle.move();  
}

void mousePressed() {
  saveFrame("output/eminsphere_#####.png");
}