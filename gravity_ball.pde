// Global Variable
// Location of mouse (x and y axis)
float ballX, ballY;

// Velocity
float dropRate;

// Should we create the ball and drop it?
boolean dropBall = false;

// For color
float R, G, B;

// Constants
float GRAVITY = 0.5;
float FRICTION = -2.5;

// Setup screen size
void setup() {
 size(500,650);
}

// Most critical part. Our ball depends on the location of the mouse
// When the user 'clicks' on the window, it collects the location of
// the mouse using X and Y axis coordinates.
// It also 'activates' dropBall by setting it true. This helps inform
// processing's 'draw' function that "Yo! The user clicked on the screen!
// so draw the ball!"
//
// You can also see that we set the color here (RGB) and initialize the drop
// When you drop the ball from your hand. On the 0th second, the velocity is 0.
void mouseClicked() {
  R = random(255);
  G = random(255);
  B = random(255);
  ballX = mouseX;
  ballY = mouseY;
  dropBall = true;
  dropRate = 0;
}

// The draw() function is a default processing function. It 'loops'
// in a way that it creates a new canvas each time it loops, and places
// the ball in a new location.
void draw() {
  // Set the background as white
  background(255);
  
  // Did the user click something to drop the ball?
  if(dropBall){
    
    // Give the ball a color based on the random value it got
    // from 'mouseClicked'
    fill(R,G,B);
    
    // Draw our ball based on the coordinates of the mouse (ballX and ballY)
    ellipse(ballX,ballY,50,50);
    
    // Position of the ball on the Y axis depends on the velocity of the drop
    // Which we call dropRate
    ballY = ballY + dropRate;
    
    // dropRate accelerates, which we call here 'gravity'
    dropRate = dropRate + GRAVITY;
    
    // Once the ball reaches the bottom, which is literally the height of the
    // window we created initially minus the size of half the ball (so it won't
    // have the ball fall half in
    if(ballY >= (height - 50/2)){
      
      // Like real life, when ball hits the ground, it loses energy with
      // friction from the ground
      dropRate = dropRate + FRICTION;
      
      // Direction of the velocity changes (bounces upwards)
      dropRate = -1 * dropRate;
      
      // This is here to ensure that once the ball settles in the end
      // it's Y-location will be position exactly flushed against the floor
      ballY = height - 50/2;
    }
  }
}
