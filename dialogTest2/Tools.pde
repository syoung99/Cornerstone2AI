
// Tools / other functions 

void blinkingCursor(int y) {
  // blinkingCursor for entering text.
  // 
  y+=6;
  // every 40 frames toggle a boolean 
  if (frameCount%40==0) { 
    lineTextfieldShow = !lineTextfieldShow;
  }
  // depending on that boolean show or show not 
  // a cursor line :  
  if (lineTextfieldShow) {
    stroke(0, 0, 244); // blue
    line (25+textWidth(enteredText)+5, y, 
      25+textWidth(enteredText)+5, y+30);
    // reset stroke color back to normal (being polite)
    stroke(0);
  } // if
}// func
//

String evalJS(PApplet pa, ScriptEngine js, String expression) {
  js.put("p", pa);

  try {
    Object obj1=js.eval("" + expression);
    return obj1.toString();
  }

  catch (ScriptException cause) {
    //throw new RuntimeException(cause);
    return "";
  }
} // 

void fullOutput() {

  //lines 
  String dummy=""; 
  if (lines.size()>0)
    for (String currentLine : lines) {
      dummy += currentLine + "\n";
    } // for
  println ("***********************");
  println (dummy);
  println ("***********************");
}

String oneStringOutOf(String[] list) {
  int index = int(random(list.length));
  return list[index];
}

// 