
// the tab name stands for conversation Module in the domain Math 2.
// tab math2 for more complex math

String factorial ( String strInput ) {

  //Factorial
  //n! 

  strInput=trim(strInput);

  if  (strInput.length() != 1) {
    return "";
  }

  if ("0123456789".indexOf(strInput) <= -1) {
    return "";
  }

  strInput=strInput.replace("?", "");
  strInput=strInput.replace("please", "");

  strInput=trim(strInput);

  int n = int(   strInput   ); 

  // int n = 9;  // int(input('Fakultaet von n = '))
  int f = 1;

  for (int i=1; i<n+1; i++) {
    f = f * i;
  }

  println(n +  "! = " +  f);
  stateConversation=math; 
  return "The factorial is " + str(f) + "."; 

  // return f;
}

String toSquare( String strInput ) {

  // to square 
  //

  println("square testing "); 


  strInput=trim(strInput);
  strInput=trim(strInput.toUpperCase());

  if (enteredText2.indexOf("SQUARE")<=-1) {
    return "";
  }//if

  strInput=strInput.replace("SQUARE", "");
  strInput=strInput.replace("?", "");

  strInput=trim(strInput);

  if  (strInput.length() <= 0) {
    return "";
  }

  // strInput.isNumeric  / to do  
  if ("0123456789".indexOf(strInput) <= -1) {
    return "";
  }

  println(strInput); 

  int n = int(   strInput   ); 
  int f = n * n;

  stateConversation=math; 

  return "The square of "
    +n
    +" is "
    + str(f) + ".";
}

String toCube( String strInput ) {

  // to cube 
  //

  strInput=trim(strInput);

  strInput=trim(strInput.toUpperCase());

  if (enteredText2.indexOf("CUBE")<=-1)
    return "";

  strInput=strInput.replace("CUBED", "");
  strInput=strInput.replace("CUBE", "");
  strInput=strInput.replace("?", "");
  strInput=strInput.replace("PLEASE", "");
  strInput=strInput.replace(",", "");

  strInput=trim(strInput);

  if  (strInput.length() <= 0) {
    return "";
  }

  // strInput.isNumeric  / to do  
  if ("0123456789".indexOf(strInput) <= -1) {
    return "";
  }

  int n = int(   strInput   ); 
  int f = n * n * n; 

  stateConversation=math; 
  return "The cube of "
    +n
    +" is "
    + str(f) + " (cubed).";
}

// --------------------

String toPercentage( String strInput ) {

  //  
  //

  strInput=trim(strInput);
  strInput=trim(strInput.toUpperCase());

  if (enteredText2.indexOf("%")<=-1)
    return ""; 

  strInput=strInput.replace("WHAT IS ", "");
  strInput=trim(strInput);
  strInput=strInput.replace("WHAT'S ", "");
  strInput=trim(strInput);

  strInput=strInput.replace("WHAT IS ", "");
  strInput=strInput.replace("PLEASE", "");
  strInput=strInput.replace(",", "");
  strInput=strInput.replace("?", "");
  strInput=trim(strInput);
  strInput=strInput.replace("WHAT'S ", "");
  strInput=trim(strInput);

  strInput=trim(strInput);

  if  (strInput.length() <= 0) {
    return "";
  }

  // strInput.isNumeric  / to do  
  int percentIndex = strInput.indexOf("%"); 

  if (percentIndex<0) 
    return""; 

  String leftPart = strInput.substring(0, percentIndex);
  leftPart=trim(leftPart);
  leftPart=leftPart.replace("%", "");
  leftPart=trim(leftPart);

  String rightPart = strInput.substring(percentIndex);
  rightPart=trim(rightPart);
  rightPart=rightPart.replace("%", "");
  rightPart=trim(rightPart);
  println(rightPart);

  rightPart=trim(rightPart);

  rightPart=rightPart.replace("OF", "");
  rightPart=rightPart.replace("?", "");

  rightPart=trim(rightPart);

  println(leftPart, rightPart);


  int n1 = int(   leftPart   );
  int n2 = int(   rightPart   );
  int f = (n2/100)  * n1; 

  stateConversation=math; 
  return "The result is "
    + str(f) + ".";
}

String toRuleOfThree( String strInput ) {

  //  "If 4 Yards of Cloth cost 9 Shillings, what will 6 Yards cost at that Rate?" 
  //

  strInput=trim(strInput);

  String[] list = splitTokens (strInput, ", ?"); 

  for (String s1 : list) {
    s1=trim(s1); 
    println(s1);
  }

  int count=0;
  float n1=0, n2=0, n3=0;

  for (int i=0; i < list.length; i++) { 
    list[i]=trim(list[i]); 
    if ("0123456789".indexOf(list[i]) > -1) {

      switch(count) {
      case 0:
        n1=float(list[i]);
        break;

      case 1:
        n2=float(list[i]);
        break;

      case 2:
        n3=float(list[i]);
        break;
      }

      count++;
    }
  }

  if (count!=3)
    return ""; 

  strInput=strInput.replace("what is ", "");
  strInput=trim(strInput);
  strInput=strInput.replace("what's ", "");
  strInput=trim(strInput);

  strInput=strInput.replace("What is ", "");
  strInput=trim(strInput);
  strInput=strInput.replace("What's ", "");
  strInput=trim(strInput);

  strInput=trim(strInput);

  if  (strInput.length() <= 0) {
    return "";
  }

  float f = n3 * (n2/n1) ; 

  stateConversation=math; 
  return "The result is "
    + str(f) + ".";
}
//