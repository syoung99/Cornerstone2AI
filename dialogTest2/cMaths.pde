
// the tab name stands for conversation Module in the domain Math.

String testOnMathDirect(String enteredTextLocal) {

  // pretty direct approach to eval the user input (as math) 

  enteredTextLocal= trim(enteredTextLocal); 

  if (!enteredTextLocal.equals("")) {

    String test1 = evalJS(this, js1, enteredTextLocal);

    if (!test1.equals("")) {
      stateConversation=math; 
      return test1; // success
    }
  }

  // failed 
  return ""; 

  //
}

String testOnMathDirectWithXConversion(String enteredTextLocal) {

  // pretty direct approach to eval the user input but with x to * conversion. 
  // Some users tend to write x instead of * so we convert this sign. 

  enteredTextLocal= trim(enteredTextLocal); 

  enteredTextLocal= enteredTextLocal.replaceAll("x", "*"); // small x 

  enteredTextLocal= enteredTextLocal.replaceAll("X", "*"); // big X 

  enteredTextLocal= enteredTextLocal.replaceAll("times", "*"); // 

  enteredTextLocal= enteredTextLocal.replaceAll("this", prevResult); //  

  if (!enteredTextLocal.equals("")) {

    String test1 = evalJS(this, js1, enteredTextLocal);

    if (!test1.equals("")) {
      stateConversation=math; 
      return test1; // success
    }
  }

  // failed 
  return ""; 

  //
}

String testOnMath(String enteredTextLocal) {

  // more long winded approach to eval the user input (for math) 

  enteredTextLocal= trim(enteredTextLocal); 

  String prefix = "What is "; 
  if (enteredTextLocal.indexOf(prefix)==0) { 
    enteredTextLocal= enteredTextLocal.substring(prefix.length()) ;
  }

  enteredTextLocal= trim(enteredTextLocal);

  prefix = "How much is "; 
  if (enteredTextLocal.indexOf(prefix)==0) { 
    enteredTextLocal= enteredTextLocal.substring(prefix.length()) ;
  }

  enteredTextLocal= trim(enteredTextLocal);

  String infix = "please";
  if (enteredTextLocal.indexOf(infix)>-1) {
    enteredTextLocal=enteredTextLocal.replace(infix, "");
    enteredTextLocal=enteredTextLocal.replaceAll(infix, "");
  }

  enteredTextLocal= trim(enteredTextLocal);

  infix = "?";
  if (enteredTextLocal.indexOf(infix)>-1) {
    enteredTextLocal = enteredTextLocal.replace(infix, "");
    enteredTextLocal = enteredTextLocal.replace(infix, "");
    enteredTextLocal = enteredTextLocal.replace(infix, "");
    enteredTextLocal = enteredTextLocal.replace(infix, "");
    enteredTextLocal = enteredTextLocal.replace(infix, "");
    enteredTextLocal = enteredTextLocal.replace(infix, "");
    enteredTextLocal = enteredTextLocal.replace(infix, "");

    // replace all doesn't work here... enteredTextLocal = enteredTextLocal.replaceAll(infix, "");
  }


  enteredTextLocal= enteredTextLocal.replaceAll("x", "*"); // small x 

  enteredTextLocal= enteredTextLocal.replaceAll("X", "*"); // big X 

  enteredTextLocal= enteredTextLocal.replaceAll("times", "*"); // 

  enteredTextLocal= enteredTextLocal.replaceAll("this", prevResult); //

  enteredTextLocal= trim(enteredTextLocal);

  if (!enteredTextLocal.equals("")) {

    String test1 = evalJS(this, js1, enteredTextLocal);

    if (!test1.equals("")) {
      //  answerPC=test1;
      stateConversation=math; 
      return test1; // success
    }
  }

  // failed 
  return ""; 

  //
}
//