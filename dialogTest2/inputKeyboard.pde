
// inputs keyboard 

void keyPressed () {

  switch (state) {

  case startScreen:
  case showDialog:
    // go to next state
    state=PCmustAnswer;  
    // when hitting ESC 
    key=0; // kill ESC
    break; 

  case userTypes: 
    //
    keyPressedForEnteringText();
    // when hitting ESC 
    key=0; // kill ESC
    break;

  case PCmustAnswer:
    //
    break;

  default:
    exit(); 
    println ("Unknown state in tab inputKeyboard"); 
    break;
    //
  } // switch
}//func 

void keyPressedForEnteringText() {

  // keyPressed in a text field situation

  if (key!=CODED) {

    switch (key) {

    case BACKSPACE:
      if (enteredText.length()>0)
        enteredText=enteredText.substring(0, enteredText.length()-1);
      break;

    case ESC:
      // when hitting ESC 
      key=0; // kill ESC
      fullOutput(); 
      break;

    case RETURN:
    case ENTER:
      state=PCmustAnswer;
      println("Human: "+enteredText);
      lines.add(new String("Human: "+enteredText));
      enteredText2 = enteredText;
      enteredText = "";      
      break;

    case 16:
      // shift 
      break; 

    default:
      if (key>=' ') {
        // normal: just add the key to the word in the text field 
        enteredText = enteredText + key;
        // println (key);
      }
      break;
      //
    }// switch
  } // if (key!=CODED)
  else {
    println (keyCode);
    switch(keyCode) {
    case 33:
      state=showDialog; 
      break;
    case 34:
      if (exampleIndex>examples.length-1)
        exampleIndex=0;
      enteredText= examples[exampleIndex]; 
      exampleIndex++;
      break;
    }
  }
} // func 
//