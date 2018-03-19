//Wishlist
//chat functions for each level of the robot

//change output based on power level

//if user input is longer than x use escape character to end line
//maybe decrease font size to keep it centered, etc

Console code = new Console(10, 100, 100);
Console chat = new Console(10, 250, 24);
Console info = new Console (10, 180, 24);
Console cbot = new Console (10, 300, 24);

String[][] answers = {{"0000"}, {"1111", "2222"}, {"3333", "4444"}, {"5555", "6666"}};
boolean[][] progress = {{false}, {false, false}, {false, false}, {false, false}};

void setup()
{
  size(800, 480);
  code.activate();
  chat.activate();
  info.activate();
  cbot.activate();
}

void draw()
{
  background(0);
  if (code.isActive()==true)
    code.display();
  if (chat.isActive()==true)
    chat.display();
  if (info.isActive()==true)
    info.display();
  if (cbot.isActive()==true)
    cbot.display();
  if (code.numChars()>3)
  {
    checkCode(code.readString());
    code.reset();
  }
  if (progress[3][0]==true && progress[3][1]==true)
  {
    code.deactivate();
    chat.deactivate();
    info.deactivate();
    cbot.deactivate();
    textSize(100);
    text("VICTORY", 400, 240);
    textAlign(CENTER, CENTER);
  }
}

void keyPressed()
{
  if (keyAnalyzer(key).compareTo("LETTER") == 0)
  {
    chat.addChar(key);
    code.reset();
  } else if (keyAnalyzer(key).compareTo("NUMBER") == 0)
  {
    code.addChar(key);
    chat.reset();
  } else if (keyCode == BACKSPACE)
  {
    code.deleteChar();
    chat.deleteChar();
  } else if (keyCode == ENTER)
  {
    cbot.chat();
    chat.reset();
  }
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
  if (guess.equals(answers[3][1]) && progress[0][0]==true && progress[1][1]==true && progress[1][1]==true && progress[2][0]==true && progress[2][1]==true && progress[3][1]==false)
  {
    info.reset();
    info.addString("solution 7");
    progress[3][1] = true;
  } else if (guess.equals(answers[3][0]) && progress[0][0]==true && progress[1][1]==true && progress[1][1]==true && progress[2][0]==true && progress[2][1]==true && progress[3][0]==false)
  {
    info.reset();
    info.addString("solution 6");
    progress[3][0] = true;
  } else if (guess.equals(answers[2][1]) && progress[0][0]==true && progress[1][1]==true && progress[1][1]==true && progress[2][1]==false)
  {
    info.reset();
    info.addString("solution 5");
    progress[2][1] = true;
  } else if (guess.equals(answers[2][0]) && progress[0][0]==true && progress[1][0]==true && progress[1][1]==true && progress[2][0]==false)
  {
    info.reset();
    info.addString("solution 4");
    progress[2][0] = true;
  } else if (guess.equals(answers[1][1]) && progress[0][0]==true && progress[1][1]==false)
  {
    info.reset();
    info.addString("solution 3");
    progress[1][1] = true;
  } else if (guess.equals(answers[1][0]) && progress[0][0]==true && progress[1][0]==false)
  {
    info.reset();
    info.addString("solution 2");
    progress[1][0] = true;
  } else if (guess.equals(answers[0][0]) && progress[0][0]==false)
  {
    info.reset();
    info.addString("\tYou've solved the shadow box puzzle and turned me on\nThe next step will");
    progress[0][0] = true;
  } else
  {
    info.reset();
    info.addString("Maybe you should try again");
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
}