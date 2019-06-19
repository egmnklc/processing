void setup() {
  size(300, 400);
  fill(255, 0, 0);
  background(255);
  ellipse(x, y, 30, 30);
}


int x = 30;
int y = 30;
int r = 20;




void draw() {
  if (dist(x, y, mouseX, mouseY) < r) {
    background(255);
    x = int(random(width));
    y = int(random(height));
    ellipse(x, y, 30, 30);
  }
}
