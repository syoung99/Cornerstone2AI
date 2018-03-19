
// tab for state PCmustAnswer

// PC

void pcSearchesAnAnswer() {

  //

  generalLayout();

  answerPC="Hello";
  state=userTypes;
  String buffer = "";

  // store original 
  String enteredText3 = enteredText2; 

  // --------------------------------------
  // Now we try to get an answer in different ways.
  // The order determines which answer gets used.
  // When you add answer functions: Do the most specific / better answer functions at the top.
  // The most dumb / random answers at the bottom. 

  if ( enteredText2.equals("Quit")||
    enteredText2.equals("QUIT")||
    enteredText2.equals("quit")     ) {
    fullOutput();
    exit();
    return;
  }

  if (buffer.equals("")) {
  if (askingName) 
  buffer = checkName();
  }

  // -------------------------------
  // math 1. 

  if (buffer.equals(""))
    buffer = testOnMathDirect(enteredText2); // 1. Math direct

  if (buffer.equals(""))
    buffer = testOnMathDirectWithXConversion(enteredText2); // 2. Math

  if (buffer.equals(""))
    buffer = testOnMath(enteredText2); // 3. Math

  // An even longer 4th approach would be to remove letters from start and end until a
  // formula would remain. So we would cover: What gives 3*4 please? What is 3*4 please?
  // and What's 3*4 please???? and all other kind of stuff. To be done later.   


  // -----------------------------------------

  if (buffer.equals("")) {
    if (enteredText2.length()>1 && enteredText2.indexOf("Tell me a joke")>-1)
      buffer = toJoke1(enteredText2);
  }

  if (buffer.equals("")) {
    if (enteredText2.length()>1)
      buffer = toName1(enteredText2);
  }

  if (buffer.equals("")) {
    if (enteredText2.length()>1 )
      buffer = toAskName(enteredText2);
  }

  // -----------------------------------------
  // extended maths / math 2. 

  if (buffer.equals("")) {
    if (enteredText2.length()>1)
      buffer = toRuleOfThree(enteredText2);
  }

  if (buffer.equals("")) {
    if (enteredText2.length()>1&&enteredText2.charAt(1)=='!')
      buffer = factorial(enteredText2.charAt(0)+"");
  }

  if (buffer.equals("")) {
    if (enteredText2.length()>1) {
      buffer = toSquare(enteredText2);
    }
  }

  if (buffer.equals("")) {
    if (enteredText2.length()>1)
      buffer = toCube(enteredText2);
  }

  // what is 19 % of 200 
  if (buffer.equals("")) {
    if (enteredText2.length()>1 && enteredText2.indexOf("%")>-1)
      buffer = toPercentage(enteredText2);
  }

  //   enteredText="If 4 Yards of Cloth cost 9 Shillings, what will 6 Yards cost at that Rate?" ; 
  if (buffer.equals("")) {
    if (enteredText2.length()>1)
      buffer = toPercentage(enteredText2);
  }

  // -----------------------------------------



  if (buffer.equals("")) {
    buffer = testOnDateAndTime(enteredText3);
  } else prevResult=buffer;

  // -----------------------------------------



  if (buffer.equals("")) {
    buffer = testOnAnimalSpeed(enteredText3);
  }

  if (buffer.equals("")) {
    buffer = testOnAnimals(enteredText3);
  }

  if (buffer.equals("")) {
    buffer = testOnFaiths(enteredText3);
  }

  // this is the last ressort and a pretty dumb function 
  if (buffer.equals("")) {
    buffer = testOnStateConversation(enteredText3);
  }


  // ---------------------
  // use result 
  if (!buffer.equals("")) { 
    answerPC=buffer;
  } else 
  answerPC="I don't know. ";

  println("Computer: "+answerPC);
  lines.add(new String("Computer: "+answerPC));
}
//