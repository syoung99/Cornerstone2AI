
// tab for states 

void startScreen() {
  background(153);
  fill(0); 
  text("Small Dialog programm\n\n"
    +"Hit Esc to copy the dialog into the direct window of processing."
    +"\nPg up to show dialog.\nEnd each line by hitting return. "
    +"\nPg down to show many examples. Hit return to enter an example. "
    +"\n\nType 'quit' and hit return to leave the program."
    +"\n\nHit any key.", 
    121, 222);
}

void showDialog() {
  // show lines 
  background(153);
  // lines 
  textSize(14);
  String dummy=""; 
  if (lines.size()>0) {
    for (String currentLine : lines) {
      dummy+= " "
        + currentLine
        + "\n";
    } // for
  }

  text(dummy, 31, 55, 
    width-70, height);
  fill(255, 2, 2);
  text("Hit any key.", 244, height-22);  
  fill(0);
  textSize(18);
}

void textField(String message, int lengthOfFieldInPixels) { 

  //TextField for entering text 
  // 
  generalLayout();

  int y = 266;
  fill(255);
  text (message, 27, 37); 
  fill(255, 2, 2, 11);
  rect(25, y, lengthOfFieldInPixels, 40); // 200
  fill(0);
  text(enteredText, 25+5, y+30);
  blinkingCursor(y);
}
//