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
String[] instructions = new String[5];
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
  keyring.add(new Key(400,400,2));
  keyring.add(new Key(400,600,2));
  
  keyring.add(new Key(400,400,0));
  keyring.add(new Key(400,400,0));

  //map initialization and declaration center
  Maps = new ArrayList<Barrier[]>();
  current_map = 0;
  map0(); map1(); map2(); map3(); map4(); map5(); map6(); map7(); map8(); //creates all the maps - go to the maps tab

  //Instructions
  instructions[0] = "Instructions will show up here";
  instructions[1] = "After I make them";
  instructions[2] = "Along with some visuals, hopefully";
  instructions[3] = "OK let's get on with this game";
  instructions[4] = "Good luck. And ESCAPE";

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
  if(game_start){ //intro sequence
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
  background(0);
  textSize(24);

  if(instruction_count<instructions.length){
    text(instructions[instruction_count], 400,400); //shows the instructions - check mouseClicked for code
  }

  if(instruction_count==instructions.length){
    text(instructions[instruction_count-1], 400,400); //shows the last instruction
    frameCount = 0;   
    tutorial = false; 
    game_start = true;
  }
}

void game_start(){
  if(frameCount>=120 && frameCount<=180){
    fill(255);
    textSize(24);
    text("Hello?",400,400);
  }
  else if(frameCount<120 || frameCount>=180){
    fill(0,18);
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
  textSize(35);
  text("Final time: " + time_min + " minutes " + time_sec + " seconds", 400,400);
}

void mouseClicked(){
  if(tutorial && instruction_count<instructions.length){
    instruction_count++;
  }
  if(intro){  
    intro = false;
    tutorial = true;
    pause = true;
    loop();
  }
}
