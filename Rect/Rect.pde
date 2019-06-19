void setup() {
  size(400, 600);
}


int widthX = 10; //Set the value of widthX to 10 //Double does not work with the parameters of rect(), sinceit requires float numbers.
int lengthY = 20; // Set the value of widthY to 20.


void draw() {
  if (widthX < 50 ||lengthY < 50) { //Check if the value of widthX and lengthY are less than 50.
    rect(widthX, lengthY, 50, 60); //Draw a rectangle with the values of widthX and widthY but only draw them using the values less than 50.
    widthX = widthX + 10; //Increase the valueof widthX 10 by 10.
    lengthY =lengthY + 10; // Increase the value of lengthY 10 by 10.
  }
}
