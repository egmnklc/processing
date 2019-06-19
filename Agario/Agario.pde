void setup() {
  size(400, 600);
  background(255);
  speedX = 2;
  speedY = 2;
}

float speedX, speedY;
float a = width/2;
float b = height/2;
float x = 25;
float y = 25;
float d = 20;
int r = 30;
int counter = 0;

void draw() {
  background(255);
  fill(0);  
  fill(255, 0, 0);
  ellipse(x, y, 20, 20);
  ellipse(a, b, r, r);


  if (dist(x, y, a, b) < d) {
    x = random(width);
    y = random(height);
    r = r + 5;
    d = d + 2.5;
    speedX = 0.95 * speedX;
    speedY = 0.95 * speedY;    
    counter = counter + 1;
  }
  if (mouseX >= a) {
    a = a + speedX;
  }

  if (mouseX < a) {
    a = a - speedX;
  }

  // y-direction movement
  if (mouseY >= b) {
    b = b + speedY;
  }

  if (mouseY < b) {
    b = b - speedY;
  }
  fill(0);
  text(counter, width*.91, height*.95);
  text("Score: ", width*.70, height*.95 );
  textSize(20);
}
