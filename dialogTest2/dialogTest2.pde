
// search to do

// other to dos 

// determine 
// what has been asked for: person, actor, movie, number, city, city in the U.S. ...., year, month, weekday... 

// being in a domain / stateConversation he can bring up new topics within that domain

// world model 

// http://www.factmonster.com/ipka/A0004737.html
// http://www.factmonster.com/ipka/A0921143.html

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

// program state 
final int userTypes    = 0;
final int PCmustAnswer = 1;
final int startScreen  = 2;
final int showDialog   = 3;
int state=startScreen;

// conversation situations / domains
final int unknown   = 0;   // ---> free to choose topic / weather  
final int sayHello  = 1; 
final int sayBye    = 2;
final int weather   = 3;
final int animals   = 4;
final int persons   = 5;
final int movies    = 6;
final int math      = 7;
final int animalSpeed = 8;
final int timeDate    = 9;    
final int faith       = 10;
int stateConversation = sayHello;

// for evaluation of math 
javax.script.ScriptEngine js1; 

// for the text field 
String enteredText = "";
String enteredText2 = "";
boolean lineTextfieldShow = false; // cursor blinks 

// PC answer 
String answerPC="";

// record the dialog
ArrayList<String> lines = new ArrayList(); 

// DATA **** 
Table tableSpeed; // animals  
Table tableFaiths; 
String[] faithTitels;  

//----
// misc 

// for math 
String prevResult = "";

// name stuff  
boolean askingName=false; 
String presumedName=""; 

// -------------------------------------------------
// Main functions 

void setup() {
  size (900, 920);
  background(153);

  fill(255);
  textSize(18);

  js1 = new ScriptEngineManager().getEngineByName("js");

  tableSpeed = loadTable(dataPath("")+"\\speed.csv", "header");
  tableFaiths = loadTable(dataPath("")+"\\faiths.tsv", "header");

  String[] dummy = loadStrings(dataPath("")+"\\faiths.tsv"); 
  faithTitels = split (dummy[0], char(9));

  for (String s1 : dummy) {
    String[] dummy2 = split (s1, char(9));
    for (String s2 : dummy2) {
      println(s2);
    }
  } 
  // printArray(faithTitels);
} // func 

void draw() { 

  // see tabes beginning with states to see the functions that are called here

  switch (state) {

  case startScreen:
    startScreen(); 
    break; 

  case showDialog:
    showDialog(); 
    break; 

  case userTypes: 
    textField("", 742);
    break;

  case PCmustAnswer:
    pcSearchesAnAnswer();
    break;

  default:
    exit(); 
    println ("Unknown state in tab Main "); 
    break;
    //
  } // switch
} //func 
// --------------------------------------------------------