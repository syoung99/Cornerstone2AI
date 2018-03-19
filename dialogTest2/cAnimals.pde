

// the tab name "cAnimals" stands for conversation Module in the domain Animals. 

String testOnAnimals(String enteredTextLocal) {

  enteredTextLocal= trim(enteredTextLocal); 

  return "";
}
//


String testOnAnimalSpeed(String enteredTextLocal) {

  enteredTextLocal= trim(enteredTextLocal); 

  String prefix = "How fast "; 
  if (enteredTextLocal.indexOf(prefix)==0) { 
    enteredTextLocal= enteredTextLocal.substring(prefix.length()) ;
  }

  enteredTextLocal= trim(enteredTextLocal);

  prefix = "How much speed "; 
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
    // enteredTextLocal=enteredTextLocal.replaceAll(infix, "");
  }

  enteredTextLocal= trim(enteredTextLocal);

  println ("Here 1"); 

  if (!enteredTextLocal.equals("")) {

    String test1 = evalSpeedAnimal ( enteredTextLocal);

    println ("Here 2  " + test1 );

    if (!test1.equals("")) {
      //  answerPC=test1;
      stateConversation=animalSpeed; 
      return test1; // success
    }
  }

  // failed 
  return ""; 

  //
}
//
String evalSpeedAnimal( String input ) {

  // typical table with two columns : 
  // Animal;Speed(mph)

  input=trim(input);
  input=input.toUpperCase();

  // println ("Here 3 " + input );

  for (int i = 0; i < tableSpeed.getRowCount(); i++) {

    TableRow row = tableSpeed.getRow(i);

    String animal1 = row.getString("Animal");  
    animal1 = trim (animal1); 
    animal1 = animal1.toUpperCase();

    println ("Here 3 " + animal1 );

    if (input.indexOf(animal1)>-1) {
      String speed1 = row.getString("Speed(mph)");  
      speed1=trim(speed1);
      println (speed1);
      speed1=speed1.replace(".00", "");
      speed1+= " mph.";
      return speed1;  //
    }//if
  }//for 


  return "";
}
//