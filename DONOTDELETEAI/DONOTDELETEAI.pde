//Wishlist
//chat functions for each level of the robot
//begin at each end of the computer and alternate left and right for conversation

//change output based on power level

import processing.video.*;
Movie theMov;



Console code = new Console(10, 100, 100);
//Console chat = new Console(10, 250, 24);
Console info = new Console (10, 180, 24);
//Console cbot = new Console (10, 300, 24);

String[][] goodans = {{"8008"}, {"----", "5628"}, {"2315", "8271"}, {"5239", "5739"}};
                   //  portal    shadow    laser    magnet  tile     maze    testtubes
String[][] badans = {{"1488"}, {"1502", "----"}, {"6121", "6492"}, {"1957", "9375"}};
boolean[][] progress = {{false}, {false, false}, {false, false}, {false, false}};
int goodpower = 0;
int badpower = 0;
String duncan = "4909125254";

void setup()
{
  size(800, 480);
  //fullScreen();
  noCursor();
  code.activate();
  //chat.activate();
  info.activate();
  //cbot.activate();
  theMov = new Movie(this, "hal3.0.mp4");
  theMov.loop();
}

void draw()
{
  //background(0);
  image(theMov, 0, 0);
  fill(135,206,250);
  noStroke();
  rect(0,480-goodpower*5,30,goodpower*5);
  fill(255,165,0);
  noStroke();
  rect(770,480-badpower*5,30,badpower*5);
  
  fill(255);
  if (code.isActive()==true)
    code.display();
  /*
  if (chat.isActive()==true)
    chat.display();
  */
  if (info.isActive()==true)
    info.display();
  /*
  if (cbot.isActive()==true)
    cbot.display();
  */
  if (code.numChars()>3)
  {
    info.reset();
    checkCode(code.readString());
    code.reset();
  }
  checkProgress();
  if (progress[3][0]==true && progress[3][1]==true)
  {
    code.deactivate();
    //chat.deactivate();
    info.deactivate();
    //cbot.deactivate();
    textSize(100);
    text("VICTORY", 400, 240);
    textAlign(CENTER, CENTER);
  }
}

void movieEvent(Movie m) { 
  m.read(); 
} 

void keyPressed()
{
  /*if (keyAnalyzer(key).compareTo("LETTER") == 0)
  {
    chat.addChar(key);
    code.reset();
  } else */
  if (keyAnalyzer(key).compareTo("NUMBER") == 0)
  {
    code.addChar(key);
    //chat.reset();
    //cbot.reset();
  } else if (keyCode == BACKSPACE)
  {
    code.deleteChar();
    //chat.deleteChar();
  }
  /*
  else if (keyCode == ENTER)
  {
    cbot.chat();
    chat.reset();
  }
  */
}

String keyAnalyzer(char c)
{
  if (c == '0' || c == '1' || c == '2' || c == '3' || c == '4' || c == '5' || c == '6' || c == '7' || c == '8' || c == '9')
  {
    return "NUMBER";
  } else if (c == 'A' || c == 'a' || c == 'B' || c == 'b' || c == 'C' || c == 'c' || c == 'D' || c == 'd' || c == 'E' || c == 'e' ||
    c == 'F' || c == 'f' || c == 'G' || c == 'g' || c == 'H' || c == 'h' || c == 'I' || c == 'i' || c == 'J' || c == 'j' ||
    c == 'K' || c == 'k' || c == 'L' || c == 'l' || c == 'M' || c == 'm' || c == 'N' || c == 'n' || c == 'O' || c == 'o' ||
    c == 'P' || c == 'p' || c == 'Q' || c == 'q' || c == 'R' || c == 'r' || c == 'S' || c == 's' || c == 'T' || c == 't' ||
    c == 'U' || c == 'u' || c == 'V' || c == 'v' || c == 'W' || c == 'w' || c == 'X' || c == 'x' || c == 'Y' || c == 'y' ||
    c == 'Z' || c == 'z' || c == ' ' || c == '?')
  {
    return "LETTER";
  } else
  {
    return "OTHER";
  }
}

void checkCode(String guess)
{ 
  if (guess.equals(goodans[3][1]) && progress[0][0]==true && progress[1][1]==true && progress[1][1]==true && progress[2][0]==true && progress[2][1]==true && progress[3][1]==false)
  {
    info.reset();
    info.addString("\tYou've organized the test tubes but you haven't\n"
                    + "solved my computer maze puzzle");
    progress[3][1] = true;
    goodpower += 10;
  } else if (guess.equals(badans[3][1]) && progress[0][0]==true && progress[1][1]==true && progress[1][1]==true && progress[2][0]==true && progress[2][1]==true && progress[3][1]==false)
  {
    info.reset();
    info.addString("\tYou've organized the test tubes but you haven't\n"
                    + "solved my computer maze puzzle (evil)");
    progress[3][1] = true;
    badpower += 10;
  } else if (guess.equals(goodans[3][0]) && progress[0][0]==true && progress[1][1]==true && progress[1][1]==true && progress[2][0]==true && progress[2][1]==true && progress[3][0]==false)
  {
    info.reset();
    info.addString("\tYou've solved my computer maze but you still need to\n"
                    + "organize the test tubes hidden around the room");
    progress[3][0] = true;
    goodpower += 10;
  } else if (guess.equals(badans[3][0]) && progress[0][0]==true && progress[1][1]==true && progress[1][1]==true && progress[2][0]==true && progress[2][1]==true && progress[3][0]==false)
  {
    info.reset();
    info.addString("\tYou've solved my computer maze but you still need to\n"
                    + "organize the test tubes hidden around the room (evil)");
    progress[3][0] = true;
    badpower += 10;
  } else if (guess.equals(goodans[2][1]) && progress[0][0]==true && progress[1][1]==true && progress[1][1]==true && progress[2][1]==false)
  {
    info.reset();
    info.addString("\tYou've solved my tile slide but you still need to\n"
                    + "solve my magnet maze");
    progress[2][1] = true;
    goodpower += 10;
  } else if (guess.equals(badans[2][1]) && progress[0][0]==true && progress[1][1]==true && progress[1][1]==true && progress[2][1]==false)
  {
    info.reset();
    info.addString("\tYou've solved my tile slide but you still need to\n"
                    + "solve my magnet maze (evil)");
    progress[2][1] = true;
    badpower += 10;
  } else if (guess.equals(goodans[2][0]) && progress[0][0]==true && progress[1][0]==true && progress[1][1]==true && progress[2][0]==false)
  {
    info.reset();
    info.addString("\tYou've solved my magnet maze but you still need to\n"
                    + "solve my tile slide puzzle");
    progress[2][0] = true;
    goodpower += 10;
  } else if (guess.equals(badans[2][0]) && progress[0][0]==true && progress[1][0]==true && progress[1][1]==true && progress[2][0]==false)
  {
    info.reset();
    info.addString("\tYou've solved my magnet maze but you still need to\n"
                    + "solve my tile slide puzzle (evil)");
    progress[2][0] = true;
    badpower += 10;
  } else if (guess.equals(goodans[1][1]) && progress[0][0]==true && progress[1][1]==false)
  {
    info.reset();
    info.addString("\tYou've solved my laser puzzle but you still need to\n"
                    + "assemble my portal gun to get the next code");
    progress[1][1] = true;
    goodpower += 10;
  } else if (guess.equals(badans[1][1]) && progress[0][0]==true && progress[1][1]==false)
  {
    info.reset();
    info.addString("\tYou've solved my laser puzzle but you still need to\n"
                    + "assemble my portal gun to get the next code (evil)");
    progress[1][1] = true;
    badpower += 10;
  } else if (guess.equals(goodans[1][0]) && progress[0][0]==true && progress[1][0]==false)
  {
    info.reset();
    info.addString("\tYou've built the portal gun and now you must solve my\n"
                    + "laser puzzle");
    progress[1][0] = true;
    goodpower += 10;
  } else if (guess.equals(badans[1][0]) && progress[0][0]==true && progress[1][0]==false)
  {
    info.reset();
    info.addString("\tYou've built the portal gun and now you must solve my\n"
                    + "laser puzzle (evil)");
    progress[1][0] = true;
    badpower += 10;
  } else if (guess.equals(goodans[0][0]) && progress[0][0]==false)
  {
    info.reset();
    info.addString("\tYou've solved the shadow box but now you must solve my\n"
                    + "laser puzzle and assemble my portal gun");
    progress[0][0] = true;
    goodpower += 10;
  } else if (guess.equals(badans[0][0]) && progress[0][0]==false)
  {
    info.reset();
    info.addString("\tYou've solved the shadow box but now you must solve my\n"
                    + "laser puzzle and assemble my portal gun (evil)");
    progress[0][0] = true;
    badpower += 10;
  } else
  {
    info.reset();
    info.addString("Maybe you should try again");
  }
}

void checkProgress()
{
  if (progress[0][0]==true && progress[1][1]==true && progress[1][1]==true && progress[2][0]==true && progress[2][1]==true && progress[3][0]==false && progress[3][1]==false)
  {
    info.reset();
    info.addString("\tYou've solved a lot of puzzles up to this point,\n"
                    + "now you must solve my computer maze and arrange\n"
                    + "test tubes in the correct order");
  } else if (progress[0][0]==true && progress[1][1]==true && progress[1][1]==true && progress[2][0]==false && progress[2][1]==false)
  {
    info.reset();
    info.addString("\tYou must now finish solving my magnet maze and my\n"
                  + "tile slide puzzle");
  } else if (progress[0][0]==true && progress[1][0]==false && progress[1][1]==false)
  {
    info.reset();
    info.addString("\tYou've solved the shadow box puzzle and turned on the AI\n"
                    + "The next step will be to solve my laser puzzle and\n"
                    + "assemble a portal gun (hint: 451)");
  } else if (progress[0][0]==false)
  {
    info.reset();
    info.addString("\tNeed power\n");
  }
}

class Console
{
  float x;
  float y;
  String chars;
  int numChars;
  boolean active;
  int font;

  Console(float x, float y, int font)
  {
    this.x = x;
    this.y = y;
    active = false;
    this.font = font;
    chars = "";
    numChars = 0;
  }

  void display()
  {
    line(x, y, x, y+font);
    textSize(font);
    text(chars, x, y);
  }

  void addChar(char c)
  {
    chars += c;
    numChars++;
  }

  void addString(String s)
  {
    chars += s;
    numChars += s.length();
  }
  
  void addGood(String s)
  {
    chars += s;
    numChars += s.length();
    fill(0,255,0); 
  }
  
  
  void addEvil(String s)
  {
    chars += s;
    numChars += s.length();
    fill(255,0,0); 
  }

  String readString()
  {
    return chars;
  }

  boolean isActive()
  {
    return active;
  }

  void activate()
  {
    active = true;
  }

  void deactivate()
  {
    active = false;
  }

  void reset()
  {
    chars = "";
    numChars = 0;
  }

  void deleteChar()
  {
    if (numChars > 0)
    {        
      chars = chars.substring(0, chars.length()-1);
      numChars -= 1;
    }
  }

  int numChars()
  {
    return numChars;
  }

  /*
  void chat()
  {
    cbot.reset();
    if (chat.readString().contains("Who"))
    {
      cbot.addString("You");
    } else if (chat.readString().contains("What"))
    {
      cbot.addString("That");
    } else if (chat.readString().contains("Where"))
    {
      cbot.addString("There");
    } else if (chat.readString().contains("When"))
    {
      cbot.addString("Then");
    } else if (chat.readString().contains("Why"))
    {
      cbot.addString("Just because");
    }
  }
  */
}
