

void generalLayout() {

  background(153);

  text (answerPC, 33, 100, 
    width-66, 400); 

  text("This little program provides a dialog. "
    +"Type something like 3*4, hit enter and the program gives you an answer. ", 
    33, height-66, 
    width-66, 400);

  //lines 
  textSize(13);
  String dummy=""; 
  if (lines.size()>0)
    for (int i = lines.size()-1; i>=0; i--) {
      dummy+=i+" "+lines.get(i) + "\n";
    }// for
  text(dummy, width-311, 355, 
    200, height-440);

  textSize(18);
} // func 
//