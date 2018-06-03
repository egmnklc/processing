import ddf.minim.*;

float x, y, speedX, speedY, speedX1, speedY1;
float diameter = 10;
float rect_Size = 200;
int rect_x1 = 30;
int counter_1 = 0;
int counter_2 = 0;
int counter_3 = 0;
int counter_4 = 0;
int r = 20;
int x1 = 30;
int y1 = 30;

float a = 30;
float b = 10;
int f, g;
boolean gameCheck = true;

void setup() {
  fullScreen();
  fill(0, 255, 0);
  ellipse(x1, y1, 30, 30);
  new_Game();
}


void new_Game() {
  //welcome_Screen();
  x = width/2;
  y = height/2;
  counter_3 = 0;
  counter_4 = 0;
  speedX = random(-5, 6);
  speedY = random(-5, 6);
  while (abs(speedX) <= 2 && abs(speedY) <= 2) {
    speedX = random(-4, 4);
    speedY = random(-4, 4);
    gameCheck = true;
    speedX = speedX + 0.2;
    speedY = speedY + 0.2;
  }
}

void draw() { 
/*  if (counter_1 + counter_2 >= 1){
      x = int(random(width));
      y = int(random(height));
      ellipse(x, y, 30, 30);
    }
*/
  //welcome_Screen();
  background(0);

  text(counter_1, 100, height-20);
  text("Player 1: ", 10, height - 20);
  textSize(20);
  text("Player 2: ", width-120, height-20);
  text(counter_2, width-30, height-20);
  text("Time: " + (millis()/1000) + "s", width/2-60, 30);
  text("Hits: " + counter_3, 20, 30);
  text("Hits: " + counter_4, width - 80, 30);
  stroke(0, 255, 0);

  strokeWeight(3);

  line(0, 40, width, 40); //Long line under time.
  line(width/2-70, 0, width/2-70, 40 ); //Line in the left of time.
  line(width/2 + 40, 0, width/2 + 40, 40 );//Line in the right of time
  line(0, height-50, width, height-50); //Long line appears top of player strings.
  line(width/2-170, height-50, width/2-170, height );//Line near Player 1.
  line(width/2-170, height-50, width/2-170, height );//Line near Player 1.
  line(width/2+170, height-50, width/2+170, height );//Line near Player 1.


  ellipse(x, y, diameter, diameter);

  rect(0, a, 10, rect_Size);// Left Hand Side 
  rect(width-10, b, 10, rect_Size); //Right Hand Side


  x += speedX;
  y += speedY;

  if (speedY > 2) {
    speedY = 2;
  }
  if (x <= 10 && y > a && y < 200+a) {
    speedX = 1.4*(-speedX);
    counter_3 += 1;
    gameCheck = false;
    speedY += speedY*1.1;
    while (abs(speedX) >= 3 && abs(speedY) >= 3) {
      speedX = random(-2, 2);
      speedY = random(-2, 2);
      gameCheck = true;
      speedX = speedX + random(-1, 1);
      speedY = speedY + random(-1, 1);
    }
  }

  if (x >= width-10 && y < 200+b && y > b) {
    speedX = 1.4*(-speedX);
    counter_4 += 1;
    speedY += random(3, -3)*1.2;
  }

  if (keyPressed) {
    if (key  == 'w') {
      a = a  - 5;
    } else if (key  == 's') {
      a = a  + 5;
    } else if (keyCode  == UP) {
      b = b  - 5;
    } else if (keyCode  == DOWN) {
      b = b  + 5;
    }
  }
  if (x >= width && true) {
    counter_1 += 1;
    new_Game();
  }
  if (x <= 0 && true) {
    counter_2 += 1;
    new_Game();
  }
  if (y <= 45) {
    speedY = -speedY;
  }
  if (y >= height-60) {
    speedY = -speedY - 1;
  }
  if (a < 40) {
    a = 40;
  }
  if (b < 40) {
    b = 40;
  }
  if (a+200 > height-50) {
    a = height - 250;
  }
  if (b + 200 > height - 50) {
    b = height - 250;
  }


  /*if (counter_1 + counter_2 >= 2) {
   f = width/2;
   g = height/2;
   ellipse(f, g, diameter, diameter);
   speedX1 = random(-5, 6);
   speedY1 = random(-5, 6);
   while (abs(speedX1) <= 1 && abs(speedY1) <= 1) {
   speedX1 = random(-6, 6);
   speedY1 = random(-6, 6);
   f += speedX1;
   g += speedY1;
   }
   */
  if (x <= 0 || x >= width) {
    new_Game();
  }
}


void keyPressed() {
  if (key == 'r') {
    new_Game();
  }
}
