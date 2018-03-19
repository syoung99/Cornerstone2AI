
// the tab name stands for conversation Module in the domain Name.

String toName1(String s1) {

  boolean plausible=false; 

  enteredText2 = trim (enteredText2);
  enteredText2 = trim (enteredText2.toUpperCase());

  enteredText2=enteredText2.replace("?", "");

  if (enteredText2.indexOf("WHAT'S YOUR NAME")>-1) {
    plausible=true;
  }

  if (enteredText2.indexOf("WHATS YOUR NAME")>-1) {
    plausible=true;
  }

  if (enteredText2.indexOf("WHAT IS YOUR NAME")>-1) {
    plausible=true;
  }

  if (enteredText2.indexOf("WHAT YOUR NAME")>-1) {
    plausible=true;
  }

  if (enteredText2.indexOf("WHAT YOUR NAME")>-1) {
    plausible=true;
  }

  if (enteredText2.indexOf("TELL ME YOUR NAME")>-1) {
    plausible=true;
  }

  if (enteredText2.indexOf("SAY YOUR NAME")>-1) {
    plausible=true;
  }

  // -----------------------

  if (!plausible) { 
    return "";
  }

  String[] list = {"You can call me Al.", "Call me Al.", "Al.", "I'm Al.", "Hi, I'm Al.", "Hi, I'm Al. How are you?"}; 
  String answer = oneStringOutOf (  list   );
  return answer;
}

String toAskName(String enteredText2) {

  enteredText2 = trim (enteredText2.toUpperCase());
  enteredText2=enteredText2.replace("?", "");
  enteredText2=enteredText2.replace("!", "");

  if (enteredText2.indexOf("HELLO")>-1) {
    askingName=true; 
    return "What's your name?";
  }
  // askingName=true; 

  return "";
}

String checkName() {

  boolean userAskingName=false; 
  String buffer=""; 

  if (!askingName)
    return ""; 

  String copyenteredText2 =     enteredText2; 

  enteredText2 = trim (enteredText2.toUpperCase());
  enteredText2=enteredText2.replace("?", "");
  enteredText2=enteredText2.replace("!", "");
  enteredText2=enteredText2.replace(".", "");
  enteredText2=enteredText2.replace(",", "");
  enteredText2=enteredText2.replace("MY NAME IS", "");

  String[] list = split(enteredText2, " "); 
  println (list.length); 

  if (list.length==1) {
    list[0]=trim (list[0].toUpperCase());
    for (int i=0; i<allnames.length; i++) {
      String allName = trim (allnames[i].toUpperCase());
      if (allName.indexOf(list[0])==1  && 
        abs(allName.length()-list[0].length()) < 2) { 
        presumedName=list[0];
        println("FOUND 1 " + presumedName); 
        break;
      }
    }
  } // if

  println("FOUND 2 " + presumedName);

  if (presumedName.equals("")) {
    if (list.length>1) {

      for (int i=0; i<allnames.length; i++) {
        String allName= trim (allnames[i].toUpperCase());

        for (int j=0; j<list.length; j++) {

          list[j]= trim (list[j].toUpperCase());

          if (allName.indexOf(list[j])==1 && 
            abs(allName.length()-list[j].length()) < 2) { 
            presumedName=list[j];
            break;
          }
        }
      } // if
    }
  }

  println("FOUND 3 " + presumedName);

  if (!presumedName.equals("")) {
    buffer= "Hi, "+presumedName;
    println("FOUND 4 " + presumedName+ buffer );
    askingName=false;
  }

  // --------------------------

  if (enteredText2.indexOf("WHAT IS YOURS")>-1)  
    userAskingName=true;

  if (enteredText2.indexOf("AND YOURS")>-1)  
    userAskingName=true;

  if (enteredText2.indexOf("WHAT IS YOUR")>-1)  
    userAskingName=true;

  if (enteredText2.indexOf("WHAT IS YOUR NAME")>-1)  
    userAskingName=true;


  if (!buffer.equals("")) {
    if (userAskingName) {
      buffer+=", mine is Al";
    }
  }

  if (!buffer.equals("")) {
    buffer+=".";
  }//if

  return buffer;
}//func

//