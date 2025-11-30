//VARIABLES//

//Maps
int current_map;
ArrayList<Barrier[]> Maps;

ArrayList<Ghost> ghosts;

//Player
Player p1;
final float final_speed = 5; //the player's speed - needs to be global

//movement variables
boolean upPressed;
boolean leftPressed;
boolean downPressed;
boolean rightPressed;

//sequence
boolean intro = true;
boolean tutorial = true;
boolean game_start = true;
///////////////////

void setup(){
  size(800,800);
  textAlign(CENTER);
  noStroke();

  //map initialization and declaration center
  Maps = new ArrayList<Barrier[]>();
  current_map = 0;
  map0(); map1(); map2(); map3(); map4(); map5(); map6(); map7(); map8(); //creates all the maps - go to the maps tab

  //ghost initialization and declaration center
  ghosts = new ArrayList<Ghost>();
  
  p1 = new Player(); //maybe add player selection later? if i have time
}

void draw(){
  if(keyPressed && key == 'q'){ //allows me to skip the intro sequence when testing, or else it just takes too long lol
    game_start = false;
    tutorial = false;
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

void mousePressed(){
  if(intro){  
    intro = false;
    game_start = true;
    loop();
  }
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
