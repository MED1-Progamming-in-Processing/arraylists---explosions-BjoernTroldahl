ArrayList<Circle> circles = new ArrayList<Circle>();
int shape=0;
boolean shapeshift=false;
void setup() {
  size(500, 500);
}

void mouseClicked(){
  for(int i = 0; i < 100; i++){
    circles.add(new Circle(mouseX, mouseY));
    shapeshift=true;
}
if (shapeshift==true){
  shape=shape+1;
}
else{
  shapeshift=false;
}
if (shape>3){
  shape=shape-3;
}
}
void draw() {
  background(200);
  
  for (int i = circles.size()-1; i >= 0; i--) {
    circles.get(i).move();
    circles.get(i).display();
    
    if(circles.get(i).isOffScreen()){
      circles.remove(i);
    }
  }
}

class Circle {

  float x;
  float y;
  float xSpeed = random(-3, 3);
  float ySpeed = random(-3, 3);
  
  float yAcc = 0.02;
  
  Circle(float x, float y){
    this.x = x;
    this.y = y;
  }
 
  void move() {
    //ySpeed+yAcc emulates gravity, as the objects gradually increase their downwards speed as they fall.
    ySpeed=ySpeed+yAcc;
      //If you want to emulate wind, then add a number after xSpeed
    x += xSpeed+2;
    y += ySpeed;
  }

  void display() {
    if (shape==1){
     shapeshift=true;
    ellipse(x, y, 20, 20);
    }
    else if (shape==2){
      shapeshift=true;
    rect(x, y, 20, 20);
    }
    else if (shape==3){
      shapeshift=true;
    triangle(x, y, x+10,y-20,x+20,y+10);
  }
  } 
  boolean isOffScreen(){
    return x < 0 || x > width || y < 0 || y > height;
  }
}
