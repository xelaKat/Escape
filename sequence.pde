void sequence() {
  if(current_map == 0){
    if(!tutorial && frameCount>=60 && frameCount<150){
      message_1();
    }
    if(!tutorial && frameCount>=150){
      message_2();
    }
    if(frameCount>=300){
      pause = false; //move after the messages are done playing
    }

    if(p1.x==800 && p1.y>=700){ //go to map1 - map1 is already unlocked
      current_map = 1;
      p1.x = 5;
      p1.prevx = 5; //makes sure the ghost will immediately go to the new position instead of the old position (which is opposite of where the player is)
      ghosts.add(new Ghost());
    }

    if(p1.x>=700 && p1.y==0){ //go to map2 - locked until a key is used
      door2();
      /*
      checks if the door is locked - if so, display message
      if you have no keys, display a message
      if you do have a key, display a message. press k to open the door
      */    
    }

    if(p1.x==0 && p1.y<=100){ //go to map3 - locked until a key is used
      door3();
      /*
      checks if the door is locked - if so, display message
      if you have no keys, display a message
      if you do have a key, display a message. press k to open the door
      */
    }

    if(p1.x<=100 && p1.y==800){ //go to map4
      door4();
      /*
      checks if the door is locked - if so, display message
      if you have no keys, display a message
      if you do have a key, display a message. press k to open the door
      */
      //ghosts.add(new Ghost());
    }

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(795, 700, 10, 100); //doorway to map1

    fill(50, 230, 50); //green - unlocked
    if(lock2){ fill(255,0,0); } //red - locked
    rect(700, -5, 100, 10); //doorway to map2

    fill(50,230,50); //green - unlocked
    if(lock3){ fill(255,0,0); } //red - locked
    rect(-5, 0, 10, 100); //doorway to map3

    fill(50,230,50); //green - unlocked
    if(lock4){ fill(255,0,0); } //red - locked
    rect(0, 795, 100, 10); //doorway to map4
  }


  //// MAP1 ////
  //Stats: ONE ghost, ONE key
  if(current_map == 1){
    message_3();

    if(p1.x==0 && p1.y>=700){ //go back to map0
      current_map = 0;
      p1.x = 795;
      ghosts.remove(0);
    }

    if(p1.x==800 && p1.y<=100){ //go to map5
      door5();
    }

    //room number
    textSize(50);
    fill(180);
    text("1", 400, 400);

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(-5, 700, 10, 100); //doorway to map0

    if(lock5){ fill(255,0,0); } //red - locked
    rect(795, 0, 10, 100); //doorway to map5
  }


  //// MAP2 ////
  //Stats: ZERO ghost, TWO key
  if (current_map == 2) {
    if (p1.x>=700 && p1.y==800){ //go back to map0
      current_map = 0;
      p1.y = 5;
      ghosts.remove(0);
    }

    //room number
    textSize(50);
    fill(180);
    text("2", 400, 400);

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(700, 795, 100, 10); //doorway to map0
  }


  //// MAP3 ////
  //Stats: ZERO ghost, ONE key
  if(current_map == 3){
    if(p1.x==800 && p1.y<=100){ //go back to map0
      current_map = 0;
      p1.x = 5;
    }

    if(p1.x==0 && p1.y>=700){ //go to map6
      door6();
    }

    //room number
    textSize(50);
    fill(180);
    text("3", 400, 400);

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(795, 0, 10, 100); //doorway to map0

    if(lock6){ fill(255,0,0); } //red - locked
    rect(-5, 700, 10, 100); //doorway to map6
  }


  //// MAP4 ////
  //Stats: 3 ghost, ZERO key
  if(current_map == 4){
    if(p1.x <= 100 && p1.y==0){ //go back to map0
      current_map = 0;
      p1.y = 795;
      ghosts.remove(2);
      ghosts.remove(1);
      ghosts.remove(0);
    }

    if(p1.x>=350 && p1.x<=450 && p1.y==800){ //go to map7
      door7();
    }

    //room number
    textSize(50);
    fill(180);
    text("4", 400, 400); 

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(0, -5, 100, 10); //doorway to map0

    if(lock7){ fill(255,0,0); } //red - locked
    rect(350,795,100,10); //doorway to map7
  }


  //// MAP5 ////
  //Stats: ?? ghost, ONE key
  if(current_map == 5){
    if(p1.x==0 && p1.y<=100){ //go to map1
      current_map = 1;
      p1.x = 795;
      ghosts.add(new Ghost());
    }

    //room number
    textSize(50);
    fill(180);
    text("5", 400, 400);

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(-5, 0, 10, 100); //doorway to map1
  }


  //// MAP6 ////
  //Stats: ?? ghost, ONE key
  if(current_map == 6){
    if(p1.x==800 && p1.y>=700){ //go to map3
      current_map = 3;
      p1.x = 5;
    }

    //room number
    textSize(50);
    fill(180);
    text("6", 400, 400);

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(795, 700, 10, 100); //doorway to map3
  }


  //// MAP7 ////
  //Stats: LOTS ghost, ZERO key
  if(current_map == 7){
    message_5();

    if(p1.x>=350 && p1.x<=450 && p1.y==0){ //go to map4
      current_map = 4;
      p1.y = 795;
      ghosts.remove(0);
      ghosts.add(new Ghost(75,775,3,20));
      ghosts.add(new Ghost(775,75,3,20));
      ghosts.add(new Ghost(775,775,3,20));
    }

    if(p1.y==800){ //go to map8
      current_map = 8;
      p1.y = 5;
      ghosts.remove(0);
    }

    //room number
    textSize(50);
    fill(180);
    text("7", 400, 400);

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(350, -5, 100, 10); //doorway to map3
    rect(0, 795, 800, 10); //doorway to map8
  }


  //// MAP8 ////
  //Stats: ESCAPE!!!!
  if(current_map == 8){ //go back to map7
    if(p1.y==0){
      current_map = 7;
      p1.y = 795;
      p1.prevy = 795; //makes sure the ghost will immediately go to the new position instead of the old position (which is opposite of where the player is)
      ghosts.add(new Ghost(400,600,3,100)); //big boss ghost
    }

    //room number
    textSize(50);
    fill(180);
    text("8", 400, 400);

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(0, -5, 800, 10); //doorway to map7
  }
}



//// Messages that play on map0 ////
float counter_1 = 0;
String[] message = {"W", "h", "e", "r", "e", " ", "a", "m", " ", "I", "?"};
String display_1 = "";

void message_1(){
  textSize(24);
  
  //thought bubble
  stroke(180); //a dim white
  fill(255,35); //opacity 35
  rect(400-textWidth("   " + display_1)/2,302,textWidth(display_1 + "   "),40,25);
  noStroke();

  //display message
  fill(255);
  text(display_1, 400,330);

  if(counter_1%1==0 && counter_1<message.length){
    display_1 += message[int(counter_1)];
  }
  counter_1+=0.25; //adding 0.25 gives the text typing effect a slight delay - basically it's just for aesthetics
}

float counter_2 = 0;
String[] message_again = {"I", " ", "h", "a", "v", "e", " ", "t", "o", " ", "g", "e", "t", " ", "o", "u", "t", " ", "o", "f", " ", "h", "e", "r", "e", ".", ".", "."};
String display_2 = "";
void message_2(){
  textSize(24);

  //thought bubble
  stroke(180); //a dim white
  fill(255,35); //opacity 35
  rect(400-textWidth("   " + display_2)/2,302,textWidth(display_2 + "   "),40,25);
  noStroke();

  ///display message
  fill(255);
  text(display_2, 400,330);

  if(counter_2%1==0 && counter_2<message_again.length){
    display_2 += message_again[int(counter_2)];
  }
  counter_2+=0.25; //adding 0.25 gives the text typing effect a slight delay - basically it's just for aesthetics
}

//// Messages that play on map1 ////
float counter_3 = 0;
String[] message_thrice = {"I", "s", " ", "t", "h", "a", "t", " ", "a", " ", "g", "h", "o", "s", "t", "?"};
String display_3 = "";
String[] message_quad = {"L", "o", "o", "k", "s", " ", "a", " ", "l", "i", "t", "t", "l", "e", " ", "a", "n", "g", "r", "y", ".", ".", "."};
String display_4 = "";
void message_3(){
  pause = true; //stops all movement (p1 and ghost)
  textSize(24);

  //thought bubble
  stroke(180); //a dim white
  fill(255,35); //opacity 35
  rect(200-textWidth("   " + display_3)/2,572,textWidth(display_3 + "   "),40,25);
  if(display_4.length()>0){
    rect(200-textWidth("   " + display_4)/2,612,textWidth(display_4 + "   "),40,25);
  }
  noStroke();

  ///display message
  fill(255);
  text(display_3, 200,600);
  text(display_4, 200,640);

  if(counter_3%1==0 && counter_3<message_thrice.length){
    display_3 += message_thrice[int(counter_3)];
  }
  if(counter_3%1==0 && counter_3>message_thrice.length+4 && counter_3<message_quad.length+message_thrice.length+5){
    display_4 += message_quad[int(counter_3-message_thrice.length-5)];
  }
  counter_3+=0.25; //adding 0.25 gives the text typing effect a slight delay - basically it's just for aesthetics
  
  //determines when to turn off pause (after the messages play plus a little time)
  if(counter_3>message_quad.length+message_thrice.length+12){
    pause=false;
  }
}

//// Message that plays on map7 ////
float counter_5 = 0;
String display_5 = "";
String[] message_quint = {"O", "M", "G"};
void message_5(){
  pause = true; //stops all movement
  textSize(24);

  //thought bubble
  stroke(180); //a dim white
  fill(255,35); //opacity 35
  rect(400-textWidth("   " + display_5)/2,272,textWidth(display_5 + "   "),40,25);
  noStroke();

  ///display message
  fill(255);
  text(display_5, 400,300);

  if(counter_5%1==0 && counter_5<message_quint.length){
    display_5 += message_quint[int(counter_5)];
  }
  counter_5+=0.25; //adding 0.25 gives the text typing effect a slight delay - basically it's just for aesthetics

  //determines when to turn off pause (after the message plays plus a little time)
  if(counter_5>message_quint.length+12){ 
    pause=false;
  }
}

void door2(){
  if(lock2){ //is the door locked?
    int key_count = 0; //count makes sure the message only shows up if EVERY key in the keyring is uncollected
    textSize(20);
    text("locked door", 700,30);
    for(int i = keyring.size()-1; i>-1; i--){ //goes through every key in keyring
      if(keyring.get(i).collected && !keyring.get(i).used){ //if player has a key that isn't used,
        text("press 'k' to use key", 700,50);

        if(keyPressed && key == 'k'){ //unlocks the door
          keyring.get(i).used = true;
          keyring.remove(i);
          lock2 = false;
          i=-1; //turns off the for loop so only one key is used
        }
      }
      else{ //if player doesn't have a key, tell the player they don't have a key
        if(!keyring.get(i).collected){
          key_count++;
        }
        if(key_count == keyring.size()){ //if all keys aren't collected
          textSize(20);
          text("you have no keys", 700,50); // :( sad
        }
      }
    }
  }
  if(!lock2){ //if not locked, then you can enter!
    current_map = 2;
    p1.y = 795;
    p1.prevy = 795; //makes sure the ghost will immediately go to the new position instead of the old position (which is opposite of where the player is)
    ghosts.add(new Ghost(100,100));
  }
}

void door3(){
  if(lock3){ //is the door locked?
    int key_count = 0; //count makes sure the message only shows up if EVERY key in the keyring is uncollected
    textSize(20);
    text("locked door", 90,40);
    for(int i = keyring.size()-1; i>-1; i--){ //goes through every key in keyring
      if(keyring.get(i).collected && !keyring.get(i).used){ //if player has a key that isn't used,
        text("press 'k' to use key", 90,60);

        if(keyPressed && key == 'k'){ //unlocks the door
          keyring.get(i).used = true;
          keyring.remove(i);
          lock3 = false;
          i=-1; //turns off the for loop so only one key is used
        }
      }
      else{ //if player doesn't have a key, tell the player they don't have a key
        if(!keyring.get(i).collected){
          key_count++;
        }
        if(key_count == keyring.size()){ //if all keys aren't collected
          textSize(20);
          text("you have no keys", 90,60); // :( sad
        }
      }
    }
  }
  if(!lock3){ //if not locked, then you can enter!
    current_map = 3;
    p1.x = 795;
  }
}

void door4(){
  if(lock4){ //is the door locked?
    int key_count = 0; //count makes sure the message only shows up if EVERY key in the keyring is uncollected
    textSize(20);
    text("locked door", 90,750);
    for(int i = keyring.size()-1; i>-1; i--){ //goes through every key in keyring
      if(keyring.get(i).collected && !keyring.get(i).used){ //if player has a key that isn't used,
        text("press 'k' to use key", 90,770);

        if(keyPressed && key == 'k'){ //unlocks the door
          keyring.get(i).used = true;
          keyring.remove(i);
          lock4 = false;
          i=-1; //turns off the for loop so only one key is used
        }
      }
      else{ //if player doesn't have a key, tell the player they don't have a key
        if(!keyring.get(i).collected){
          key_count++;
        }
        if(key_count == keyring.size()){ //if all keys aren't collected
          textSize(20);
          text("you have no keys", 90,770); // :( sad
        }
      }
    }
  }
  if(!lock4){ //if not locked, then you can enter!
    current_map = 4;
    p1.y = 5;
    p1.prevy = 5; //makes sure the ghost will immediately go to the new position instead of the old position (which is opposite of where the player is)
    ghosts.add(new Ghost(75,775,3,20));
    ghosts.add(new Ghost(775,75,3,20));
    ghosts.add(new Ghost(775,775,3,20));
  }
}

void door5(){
  if(lock5){ //is the door locked?
    int key_count = 0; //count makes sure the message only shows up if EVERY key in the keyring is uncollected
    textSize(20);
    text("locked door", 700,50);
    for(int i = keyring.size()-1; i>-1; i--){ //goes through every key in keyring
      if(keyring.get(i).collected && !keyring.get(i).used){ //if player has a key that isn't used,
        text("press 'k' to use key", 700,70);

        if(keyPressed && key == 'k'){ //unlocks the door
          keyring.get(i).used = true;
          keyring.remove(i);
          lock5 = false;
          i=-1; //turns off the for loop so only one key is used
        }
      }
      else{ //if player doesn't have a key, tell the player they don't have a key
        if(!keyring.get(i).collected){
          key_count++;
        }
        if(key_count == keyring.size()){ //if all keys aren't collected
          textSize(20);
          text("you have no keys", 700,70); // :( sad
        }
      }
    }
  }
  if(!lock5){ //if not locked, then you can enter!
    current_map = 5;
    p1.x = 5;
    ghosts.remove(0);
  }
}

void door6(){
  if(lock6){ //is the door locked?
    int key_count = 0; //count makes sure the message only shows up if EVERY key in the keyring is uncollected
    textSize(20);
    text("locked door", 90,740);
    for(int i = keyring.size()-1; i>-1; i--){ //goes through every key in keyring
      if(keyring.get(i).collected && !keyring.get(i).used){ //if player has a key that isn't used,
        text("press 'k' to use key", 90,760);

        if(keyPressed && key == 'k'){ //unlocks the door
          keyring.get(i).used = true;
          keyring.remove(i);
          lock6 = false;
          i=-1; //turns off the for loop so only one key is used
        }
      }
      else{ //if player doesn't have a key, tell the player they don't have a key
        if(!keyring.get(i).collected){
          key_count++;
        }
        if(key_count == keyring.size()){ //if all keys aren't collected
          textSize(20);
          text("you have no keys", 90,760); // :( sad
        }
      }
    }
  }
  if(!lock6){ //if not locked, then you can enter!
    current_map = 6;
    p1.x = 795;
  }
}

void door7(){
  if(lock7){ //is the door locked?
    int key_count = 0; //count makes sure the message only shows up if EVERY key in the keyring is uncollected
    textSize(20);
    fill(255);
    text("locked door", 400,740);
    for(int i = keyring.size()-1; i>-1; i--){ //goes through every key in keyring
      if(keyring.get(i).collected && !keyring.get(i).used){ //if player has a key that isn't used,
        text("press 'k' to use key", 400,760);

        if(keyPressed && key == 'k'){ //unlocks the door
          keyring.get(i).used = true;
          keyring.remove(i);
          lock7 = false;
          i=-1; //turns off the for loop so only one key is used
        }
      }
      else{ //if player doesn't have a key, tell the player they don't have a key
        if(!keyring.get(i).collected){
          key_count++;
        }
        if(key_count == keyring.size()){ //if all keys aren't collected
          textSize(20);
          text("you have no keys", 400,760); // :( sad
        }
      }
    }
  }
  if(!lock7){ //if not locked, then you can enter!
    current_map = 7;
    p1.y = 5;
    p1.prevy = 5; //makes sure the ghost will immediately go to the new position instead of the old position (which is opposite of where the player is)
    ghosts.remove(2); //deletes prev ghosts
    ghosts.remove(1); //deletes prev ghosts
    ghosts.remove(0); //deletes prev ghosts
    ghosts.add(new Ghost(400,600,3,100)); //big boss ghost
  }
}
