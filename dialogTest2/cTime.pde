

// the tab name stands for conversation Module in the domain Date and Time.

// a list of the days 
final String[] daysWeek = { 
  "MO", "TU", "WE", "TH", "FR", "SA", "SU"
};

// and months
final String[] monthsNames = { 
  "January", "February", "March", "April", "May", "June", "July", 
  "August", "September", "October", "November", "December"
};



String testOnDateAndTime(String enteredTextLocal) {

  //

  int d = day();    // Values from 1 - 31
  int m = month();  // Values from 1 - 12
  int y = year();   // 2003, 2004, 2005, etc.

  int s = second();  // Values from 0 - 59
  int min = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23

  //

  enteredTextLocal= trim(enteredTextLocal);
  enteredTextLocal= trim(enteredTextLocal.toUpperCase());

  if (enteredTextLocal.indexOf("WHAT TIME IS IT")>-1 || 
    enteredTextLocal.indexOf("WHAT'S THE TIME")>-1  || 
    enteredTextLocal.indexOf("WHAT IS THE TIME")>-1 ) {  
    return "It's " + h+":"+min; // success
  }

  if (enteredTextLocal.indexOf("WHAT DATE IS IT")>-1 || 
    enteredTextLocal.indexOf("WHAT'S THE DATE")>-1  ) {  
    return m+"/"+d+"/"+y+".";  // success
  }

  if (enteredTextLocal.indexOf("WHAT DAY OF THE WEEK") > -1 ) {

    int dayAsInt =  dow (d, m, y  ) ; 

    dayAsInt--;
    if (dayAsInt<0) 
      dayAsInt=6;  
    return daysWeek [ dayAsInt ];
    // return m+"/"+d+"/"+y+".";  // success
  }

  // fail
  return "";
}
//
// Wikipedia.org/wiki/Zeller's_congruence
// by Gotoloop
int dow(int d, int o, int y) {
  // day of the week - int for a list like 
  // Sun, Mon etc. (we use here Mon, Tue...)
  if (o < 3) {
    o += 12;
    y--;
  }

  return ( d + (int) ((o + 1)*2.6) + y + (y>>2)
    + (y/100 | 0)*6 + ~~(y/400) + 6 ) % 7;
}
//