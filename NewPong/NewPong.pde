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
boolean welcome = true;

void setup() {
  fullScreen();
  fill(0, 255, 0);
  new_Game();
}


void new_Game() {
  x = width/2;
  y = height/2;
  counter_3 = 0;
  counter_4 = 0;
  speedX = random(-5, 6);
  speedY = random(-5, 6);
}



void welcome_Screen() {
  background(0);
  text("Welcome to the game. To play, press c.", width/2-250, height/2-50);
  textSize(25);
  if (keyPressed) {
    if (key == 'c') {
      gameCheck = false;
      test();
    }
  }
}


void draw() {
  if (gameCheck == true) {
    welcome_Screen();
  }
  if (gameCheck == false) {
    test();
  }
}

/*  if (counter_1 + counter_2 >= 1){
 x = int(random(width));
 y = int(random(height));
 ellipse(x, y, 30, 30);
 }
 */
//welcome_Screen();

void test() {
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
  line(width/2 + 50, 0, width/2 + 50, 40 );//Line in the right of time
  
  line(0, height-50, width, height-50); //Long line appears top of player strings.
  
  line(width/2-170, height-50, width/2-170, height );//Line right Player 1.
  line(width/2+170, height-50, width/2+170, height );//Line left Player 2.
  
  line(width/2-170, height-50, width/2-170, 0 );//Line right Player 1.
  line(width/2+170, height-50, width/2+170, 0 );//Line left Player 2.
  
  ellipse(x, y, diameter, diameter);

  rect(0, a, 10, rect_Size);// Left Hand Side 
  rect(width-10, b, 10, rect_Size); //Right Hand Side


  x += speedX;
  y += speedY;

  if (speedY > 2) {
    speedY = 2;
  }
  if (x <= 10+diameter && y > a && y < 200+a) { //Left hand side rectangle.
    speedX = -speedX;
  }

  if (x >= width-10-diameter && y < 200+b && y+ diameter > b) { // Right hand side rectangle.
    speedX = -speedX;
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
    speedY = -speedY ;
  }
  if (a < 40) { //Limit rect
    a = 40;
  }
  if (b < 40) { //Limit rect
    b = 40;
  }
  if (a+200 > height-50) { //Limit rect
    a = height - 250;
  }
  if (b + 200 > height - 50) { //Limit rect
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
  if(x > width/2+170 && x < width/2-170){
    println("this");
  }
}



void keyPressed() {
  if (key == 'r') {
    new_Game();
  }
}
