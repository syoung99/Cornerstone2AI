
// the tab name stands for conversation Module in the domain general conversation. 

String testOnStateConversation(String a1) {
  //
  switch ( stateConversation ) {
    
  case unknown:  
    // ---> free to choose topic / weather    
    stateConversation=weather;
    return "It's nice weather, isn't it?";
    //break; 

  case sayHello:
    return "Hi";

  case sayBye:
    return "I gotta go...";
    //break;

  case weather:
    return "It shall rain tomorrow.";
    //break; 

  case animals:
    return "I like talking about animals."; 
    //break; 

  case persons:
    return "I like talking about humans."; 
    //break;

  case movies:
    return "I like the movies";
    //break;

  case math:
    return "Math always comes easy to me. ";

  case animalSpeed:
    return "It's amazing how fast some animals are... ";

  case faith: 
    return "A man who has his faith is blessed. ";

  default:
    println ("**********  unknown conversation type "
      + stateConversation 
      + "************************************************************************"); 
    exit();
    stateConversation=movies;
    return "Do you like to go to the cinema?";
    //
  }//switch
}
//