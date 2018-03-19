
// the tab name stands for conversation Module in the domain Faiths.

String testOnFaiths(String enteredTextLocal) {

  enteredTextLocal= trim(enteredTextLocal); 

  String prefix = "Who was "; 
  if (enteredTextLocal.indexOf(prefix)==0) { 
    enteredTextLocal= enteredTextLocal.substring(prefix.length()) ;
  }

  enteredTextLocal= trim(enteredTextLocal);

  prefix = "Who is "; 
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

    // the core : 
    String test1 = evalFaithInfo ( enteredTextLocal);

    println ("Here 2  " + test1 );

    if (!test1.equals("")) {
      //  answerPC=test1;
      stateConversation=faith; 
      return test1; // success
    }
  }

  // failed 
  return ""; 

  //
}
//
String evalFaithInfo( String input ) {

  // typical table with many columns and 
  // especially one column category
  // 

  input=trim(input);
  input=input.toUpperCase();

  println ("Here 3 " + input );

  for (int i = 0; i < tableFaiths.getRowCount(); i++) {

    TableRow row = tableFaiths.getRow(i);

    String category = row.getString("Category");  
    category = trim (category); 
    category = category.toUpperCase();

    // println ("Here 3 " + category );

    // Is the category part of the input? 
    if (input.indexOf(category)>-1  ||
      checkSynonyms( input, category) ) {

      // Yes. 

      for (int j = 1; j < faithTitels.length; j++) {

        String faithTitelsLocal=trim(faithTitels[j]); 
        faithTitelsLocal=faithTitelsLocal.toUpperCase();

        // Is the RELIGION TITLE part of the input? 
        if (input.indexOf(faithTitelsLocal)>-1) {

          // Yes

          String answer1 = row.getString(faithTitels[j]);  
          answer1=trim(answer1);
          return answer1;  // success
        }//if
        //
      }//for
    }//if
  }//for 
  // 
  return "";
}
//
boolean checkSynonyms(String searchInInput, String searchWhatCategory) {

  // this is a synonym finder for the categories in the domain religion 

  boolean foundPhaseONE = false;  

  // each line is one synonym-family. 
  // Must start and end and separated with # always. The order of the words doesn't matter.  
  String[] synonyms = {
    "#VIEWS#BELIEFS##VIEW#BELIEF#BELIEVE##BELIEV#CONTENT#ATTITUDE#", 
    "#HOLY TEXTS#BIBLE##BIBEL#HOLY TEXT#HOLY SCRIPTURE##HOLY SCRIPTURES#KORAN#QORAN#QURAN#HOLY WRITINGS##HOLY WRITING#", 
    "#HOW MANY GODS#HOW MANY GOD#ONE GOD#GOD#GD#G_D#", 
    "#WHERE#REGIONS#REGION#CITY#CITIES#PART#PARTS#PARTS OF WORLD#PARTS OF THE WORLDS#PARTS OF THE WORLD#", 
    "#TYPES#TYPE#BRANCH#BRANCHES#BRANCHS#FAMILY#FAMILIES#GROUPS#SECTIONS#SECTION#", 
    "#FOUNDER#ESTIMATED#FUNDED#FOUND#FOUNDED#FUND#FOUNDER#ESTABLISHED#ESTABLISH#DISCOVERED#DISCOVER#"
  };

  // loop over all synonyms we know and try to find the Category
  for (String synonym : synonyms) {

    if (synonym.indexOf("#"+searchWhatCategory+"#")>-1) {

      //YES

      foundPhaseONE = true; 
      String[] list = split (synonym, "#");
      for (String synonym2 : list) {
        synonym2=synonym2.replaceAll("#", "");
        synonym2=trim(synonym2); 
        if (!synonym2.equals("")) {
          if (searchInInput.indexOf(synonym2)>-1) {
            return true;
          }
        }
      }// for
    }// if 
    //
  }// for 


  if (!foundPhaseONE) {
    println ("found not true with " +  searchWhatCategory);
    exit();
    return false;
  }

  return false;
} // 
// 