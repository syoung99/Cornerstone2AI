char Left = 'a';
char Right = 'd';
char Up = 'w';
char Down = 's';

color c = color(0);
float x = 0;
float y = 100;
float speed = 1;

void setup()
{
  background(255,255,255);
  size(1000,1000);
  frameRate(60);
}


void display() {
  fill(c);
  rect(x,y,30,10);
}


String myString = "Please press 3581!";
void draw(){
  background(0);
  text(myString, 50, 50);
}
void keyPressed(){
  if(key == '3'){d
    myString = "3";
  }
  else{
    myString = "I said X!";
  }
}