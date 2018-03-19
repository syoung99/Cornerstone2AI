
// inputs mouse 

void mousePressed() {

  switch (state) {

  case startScreen:
  case showDialog:
    state=PCmustAnswer;  
    break; 

  case userTypes: 
    //
    break;

  case PCmustAnswer:
    //
    break;

  default:
    exit(); 
    println ("Unknown state in tab inputMouse"); 
    break;
    //
  } // switch
}
//