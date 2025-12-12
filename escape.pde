//VARIABLES//

//Maps
int current_map;
ArrayList<Barrier[]> Maps;

ArrayList<Ghost> ghosts;

//Player
Player p1;
final float final_speed = 5; //the player's speed - needs to be global

//Keys
ArrayList<Key> keyring; //arraylist of keys - arraylist because keys are deleted after they're used
boolean lock2 = true; //the door to room 2 is locked
boolean lock3 = true; //the door to room 3 is locked
boolean lock4 = true; //the door to room 4 is locked
boolean lock5 = true; //the door to room 5 is locked
boolean lock6 = true; //the door to room 6 is locked
boolean lock7 = true; //the door to room 7 is locked
boolean lock8 = true; //the door to room 8 is locked

//movement variables
boolean upPressed;
boolean leftPressed;
boolean downPressed;
boolean rightPressed;

//sequence
boolean intro = true;
boolean tutorial = false;
boolean game_start = false;
boolean pause = false; //pause controls whether the player or ghost(s) can move

//Instructions
String[] instructions = new String[6];
int instruction_count = 0;

//Images
PImage keys; //ATTRIBUTION: <a href="https://www.flaticon.com/free-icons/key" title="key icons">Key icons created by Freepik - Flaticon</a>

///////////////////

void setup(){
  size(800,800);
  textAlign(CENTER);
  noStroke();

  //Keys
  keys = loadImage("key.png");
  keyring = new ArrayList<Key>();
  keyring.add(new Key(720,720,1));
  keyring.add(new Key(600,100,2));
  keyring.add(new Key(600,400,2));
  keyring.add(new Key(730,730,3));
  keyring.add(new Key(400,400,5));
  keyring.add(new Key(400,400,6));
  
  keyring.add(new Key(400,400,0));
  keyring.add(new Key(400,400,0));

  //map initialization and declaration center
  Maps = new ArrayList<Barrier[]>();
  current_map = 0;
  map0(); map1(); map2(); map3(); map4(); map5(); map6(); map7(); map8(); //creates all the maps - go to the maps tab

  //Instructions
  instructions[0] = "Welcome, WANDERER.\nIt seems you have lost your way.";
  instructions[1] = "This place is not happy with your presence.\nMany BARRIERS will block your way.";
  instructions[2] = "Moreover, RED doorways will block your entry\nunless you have a KEY.";
  instructions[3] = "KEYS are scattered throughout.\nAn unlocked doorway is GREEN.";
  instructions[4] = "Be careful. GHOSTS haunt these rooms.\nThey will leave you be if you leave them be.";
  instructions[5] = "Good luck, WANDERER.\nMay you find the exit, and ESCAPE...";

  //ghost initialization and declaration center
  ghosts = new ArrayList<Ghost>();
  
  p1 = new Player(); //maybe add player selection later? if i have time
}

void draw(){
  if(keyPressed && key == 'q'){ //allows me to skip the intro sequence when testing, or else it just takes too long lol
    game_start = false;
    tutorial = false;
    pause = false;
  }
  if(tutorial){
    tutorial();
  }
  else if(game_start){ //intro sequence
    game_start();
  }
  else{
    background(0);

    sequence(); //map logic & creates ghosts - go to the sequence file

    p1.display(); //displays the player

    for(Barrier b: Maps.get(current_map)){ //displays all the barriers in the current map
      b.display();
    }

    for(Ghost g: ghosts){ //displays the ghosts
      g.display();
    }

    for(Key k: keyring){
      if(!k.collected && current_map == k.map){ //if the key isn't collected and the player is in the correct map
        k.display();
      }
      if(k.collision() && current_map == k.map){
        k.collected = true;
      }
    }
    
    //player movement logic - combined with void keyPressed and keyReleased
    if(upPressed) p1.move_up();
    if(leftPressed) p1.move_left();
    if(downPressed) p1.move_down();
    if(rightPressed) p1.move_right();

    //ghost movement logic
    for(Ghost g: ghosts){
      if(g.player_right(p1.prevx, g.x)>0){ g.move_right(); } //Right
      else if(g.player_right(p1.prevx, g.x)<0){ g.move_left(); } //Left
      if(g.player_up(p1.prevy, g.y)>0){ g.move_up(); } //Up
      else if(g.player_up(p1.prevy, g.y)<0){ g.move_down(); } //Down

      g.collision(); //if ghost touches player, game ends
    }
  }

  if(intro){ //goes to start screen
    intro();
  }

  if(!intro && tutorial){
    tutorial();
  }
}

//movement logic (to make movement continuous)
void keyPressed(){
  if (key=='w' || keyCode==UP) upPressed = true;
  if (key=='a' || keyCode==LEFT) leftPressed = true;
  if (key=='s' || keyCode==DOWN) downPressed = true;
  if (key=='d' || keyCode==RIGHT) rightPressed = true;
}

void keyReleased(){
  if (key=='w' || keyCode==UP) upPressed = false;
  if (key=='a' || keyCode==LEFT) leftPressed = false;
  if (key=='s' || keyCode==DOWN) downPressed = false;
  if (key=='d' || keyCode==RIGHT) rightPressed = false;
}

void intro(){ //start screen
  noLoop();
  background(0);
  fill(255);

  textSize(100);
  text("ESCAPE", 400,250); //title for now - make art later

  textSize(20);
  text("Use the WASD or arrow keys to move", 400,350);
  text("Find the exit", 400,400);
  text("Escape", 400,450);
  
  fill(200);
  textSize(15);
  text("Click anywhere to start",400,700);
}

void tutorial(){
  textSize(30);

  if(frameCount<100){ //fading animation
    fill(0,18);
    rect(-5,-5,810,810);
  }

  if(instruction_count==instructions.length){
    fill(255);
    text(instructions[instruction_count-1], 400,390); //shows the last instruction
    frameCount = 0;   
    tutorial = false; 
    game_start = true;
  }

  //VISUALS to accompany the instructions
  if(instruction_count==1){ //introduces barriers
    fill(255);
    rect(250,550,20,200); //example of barrier
    rect(500,600,200,20); //example of barrier
    rect(170,200,200,20); //example of barrier
    rect(550,70,20,200); //example of barrier
  }
  else if(instruction_count==2){ //introduces doorways and keys
    fill(255,0,0);
    rect(250,250,100,5); //example of locked doorway
    image(keys, 600,500); //example of key
  }
  else if(instruction_count==3){ //introduces unlocked doorways and more keys
    fill(50, 230, 50);
    rect(550,520,100,5); //example of unlocked doorway
    image(keys, 220,220); //example of key
  }
  else if(instruction_count==4){ //introduces ghosts
    //example of ghost: look at ghost code for more detail
    fill(255,150);
    circle(200,200,20*2);
    fill(0,150);
    circle(195,195,30*2); //repeated (bigger) circle to make sure the opacity shows up correctly
    textSize(20*3/2);
    fill(0);
    text(">:)", 200,200+textWidth(">")/2);

    //example of ghost
    fill(255,150);
    circle(600,600,20*2);
    fill(0,150);
    circle(595,595,30*2); //repeated circle to make sure the opacity shows up correctly
    textSize(20*3/2);
    fill(0);
    text(">:)", 600,600+textWidth(">")/2);
  }

  if(frameCount>=120 && instruction_count<instructions.length){
    fill(255);
    text(instructions[instruction_count], 400,390); //shows the instructions - check mouseClicked for code
  }
}

void game_start(){
  if(frameCount>=120 && frameCount<=180){
    textSize(24);

    //thought bubble
    fill(255,15); //opacity 35
    stroke(180); //a dim white
    rect(400-textWidth("   Hello?")/2,372,textWidth(display_1 + "Hello?   "),40,25);
    //a second rect prevents the original rect from getting too white and covering the text, since there is no background(0) that resets the opacity display
    fill(0,55);
    rect(400-textWidth("   Hello?")/2,372,textWidth(display_1 + "Hello?   "),40,25);
    noStroke();

    //display message
    fill(255);
    text("Hello?",400,400);
  }
  else if(frameCount<120 || frameCount>=180){
    fill(0,30);
    rect(-5,-5,810,810);
  }
  if(frameCount==300){
    frameCount = 0;
    game_start = false;
  }
}

void game_over(){
  noLoop();
  background(0);
  fill(255);

  textSize(50);
  text("GAME OVER", 400,300);

  //final time
  int time_min = int(frameCount/3600);
  int time_sec = int(frameCount/60);
  if(frameCount>3600){
    time_sec = int(frameCount/100/60);
  }
  textSize(35);
  text("Final time: " + time_min + " minutes " + time_sec + " seconds", 400,400);
}

void mouseClicked(){
  if(tutorial && frameCount>=120 && instruction_count<instructions.length){
    background(0);
    instruction_count++;
  }
  if(intro){  
    intro = false;
    tutorial = true;
    pause = true;
    loop();
  }
}
