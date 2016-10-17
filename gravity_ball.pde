// Global Variable
float ballX = 0;
float ballY = 0;
float dropRate = 0;
float R, G, B;
float GRAVITY = 0.3;
float friction = -2.5;
boolean dropBall = false;

void setup() {
 size(500,650);
}

void draw() {
  background(255);
  stroke(10);
  if(dropBall){
    fill(R,G,B);
    ellipse(ballX,ballY,50,50);
    ballY = ballY + dropRate;
    dropRate = dropRate + GRAVITY;
    if(ballY >= (height - 50/2)){
      println(dropRate);
      dropRate = dropRate + friction;
      dropRate = -1 * dropRate;
      ballY = height - 50/2;
    }
  }
}

void mouseClicked() {
  R = random(255);
  G = random(255);
  B = random(255);
  ballX = mouseX;
  ballY = mouseY;
  dropBall = true;
  dropRate = 0;
}