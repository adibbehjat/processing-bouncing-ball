// Global variables
ArrayList<whiteStripe> tri = new ArrayList<whiteStripe>();
int x = 0;
int space = 0;
boolean flip = true;

void setup() {
  background(0);
  size(500, 600);
  noStroke();
  rectMode(CENTER);
  frameRate(100);
}

void draw() {
  if(x >= space) {
    tri.add(new whiteStripe(25.0, 2.0));
    space += 50;
  }
  
  x += 1;
  
  for (int i = 0; i < tri.size(); i++) {
    whiteStripe part = tri.get(i);
    part.update();
  }
  
}

void mousePressed() {
  flip = !flip;
}


class whiteStripe {
  float mass, inc;
  color col;
  
  whiteStripe(float m, float i) {
    mass = m;
    inc = i;
    if(flip){
      col = color(255,255,255);
    } else {
      col = color(255,0,0);
    }
  }

  void update() {
    float x,y;
    x = width/2;
    y = height/2;
    
    //quad(x - 50 - mass, y + mass, x - 25 - mass, y + mass, x, y - 75 - mass, x - 25, y - 75 - mass);
    //quad(x, y - 75 - mass, x + 25, y - 75 - mass, x + mass + 50, y + mass, x + mass + 25, y + mass);
    
    // Line method: Round edges
    //line(x - 25 - mass, y + mass,  x, y - 75 - mass);
    //line(x, y - 75 - mass, x + 25 + mass, y + mass);
    
    // Triangle method: Disadvantage? No blending option
    fill(col);
    triangle(x - 20 - mass, y + mass, x, y - 80 - mass, x + 20 + mass, y + mass);
    fill(0);
    triangle(x - mass, y + mass, x, y - 40 - mass, x + mass, y + mass);
    fill(255/4);
    triangle(x - 20 - mass, y + mass, x, y + 80*2 + mass, x + 20 + mass, y + mass);
    fill(0);
    triangle(x - mass, y + mass, x, y + 40*5 + mass, x + mass, y + mass);
    mass += inc;
    
  }
}