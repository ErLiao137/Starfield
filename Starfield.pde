double x = Math.random()*601;
double y = Math.random()*601;
class explodeShape { //regular explosion, red
  double xExplode, yExplode, speedExplode, angleExplode; //opacityExplode;
  //int colorExplode;
  explodeShape(){};
  explodeShape(double x,double y) {
    xExplode = x;
    yExplode = y;
    angleExplode = Math.random()*(2*Math.PI);
    speedExplode = (Math.random()*10)+1;
    //opacityExplode = 30;
    //colorExplode = (int)(Math.random()*50)+50;
  }
  void move() {
    xExplode = xExplode +(Math.cos(angleExplode)*speedExplode);
    yExplode = yExplode +(Math.sin(angleExplode)*speedExplode);
    /*if(xExplode >=600 || xExplode <=0) {
     xExplode = xExplode  - Math.cos((Math.cos(angleExplode)*speedExplode));
     }
     if(yExplode >=600 || yExplode <= 0) {
     yExplode = yExplode  - Math.sin((Math.sin(angleExplode)*speedExplode));
     }*/
  }
  void show() {
    fill(255, 0, 0);
    ellipse((float)(xExplode), (float)(yExplode), 10, 10);
  }
}

explodeShape [] boom;
starShape [] bah;
spiralShape [] bleh;
gridShape [] biii;
void setup() {
  size(600, 600);
  noStroke();
  background(0);
  boom = new explodeShape[100];
  bah = new starShape[100];
  bleh = new spiralShape[100];
  biii = new gridShape[100];
  for (int i = 0; i < boom.length; i++) {
    boom[i] = new explodeShape(x,y);
    bah[i] = new starShape(x,y);
    bleh[i] = new spiralShape(x,y);
    biii[i] = new gridShape((int)x,(int)y);
}
for(int i = 180; i < boom.length; i++) {
    boom[i] = new oddExplode( x, y);
  }
}
void draw() {
  fill(0, 0, 0, 10);
  rect(0, 0, 600, 600);
  for (int i = 0; i < boom.length; i++) {
    boom[i].move();
    boom[i].show();
    bah[i].move();
    bah[i].show();
    bleh[i].move();
    bleh[i].show();
    biii[i].move();
    biii[i].show();
  }
}


class starShape { //form a star shape, also blue
  double xStar, yStar, speedStar;
  int angleStar;
  starShape(double x, double y) {
    xStar = x;
    yStar = y;
    angleStar = (int)(Math.random()*(2*Math.PI));
    speedStar = (Math.random()*10)+1;
  }
  void move() {
    xStar = xStar +(Math.cos(angleStar)*speedStar);
    yStar = yStar + (Math.sin(angleStar)*speedStar);
  }
  void show() {
    fill(0, 0, 255);
    ellipse((float)(xStar), (float)(yStar), 10, 10);
  }
}

class spiralShape { //form spiral shape, green
  double xSpiral, ySpiral, angleSpiral;
  int speedSpiral;
  spiralShape(double x, double y) {
    xSpiral = x;
    ySpiral = y;
    angleSpiral = Math.random()*(2*Math.PI);
    speedSpiral = (int)(Math.random()*10)+1;
  }
  void move() {
    xSpiral = xSpiral + (Math.cos(angleSpiral)*speedSpiral);
    ySpiral = ySpiral + (Math.sin(angleSpiral)*speedSpiral);
  } 
  void show() {
    fill(0, 255, 0);
    ellipse((float)(xSpiral), (float)(ySpiral), 10, 10);
  }
}

class gridShape { //form grid shape, purple
  double angleGrid, speedGrid;
  int xGrid, yGrid;
  gridShape(int x, int y) {
    xGrid = x;
    yGrid = y;
    angleGrid = Math.random()*(2*Math.PI);
    speedGrid = (Math.random()*10)+1;
  }
  void move() {
    xGrid = xGrid + (int)(Math.cos(angleGrid)*speedGrid);
    yGrid = yGrid + (int)(Math.sin(angleGrid)*speedGrid);
  }
  void show() {
    fill(255, 0, 255);
    ellipse(xGrid, yGrid, 10, 10);
  }
}
class oddExplode extends explodeShape {
oddExplode(double x,double y) {
  xExplode = x;
  yExplode = y;
    angleExplode = Math.random()*(2*Math.PI);
    speedExplode = (Math.random()*5)+1;
}
void move() {
  xExplode = xExplode +((int)(Math.random()*5)-2)*(speedExplode);
  yExplode = yExplode +((int)(Math.random()*5)-2)*(speedExplode);
}
void show() {
fill(0,255,255);
ellipse((float)xExplode,(float)yExplode,50,50);
}
}

void mousePressed() {
  if(mouseButton == LEFT) {
     x = Math.random()*601;
     y = Math.random()*601;
    for (int i = 0; i < boom.length; i++) {
    boom[i] = new explodeShape(x,y);
    bah[i] = new starShape(x,y);
    bleh[i] = new spiralShape(x,y);
    biii[i] = new gridShape((int)x,(int)y);
}
for(int i = 40; i < boom.length; i++) {
    boom[i] = new oddExplode( x, y);
  }
}
}
