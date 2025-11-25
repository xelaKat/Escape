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
boolean game_start = true;
///////////////////

void setup(){
  size(800,800);
  textAlign(CENTER);

  //map initialization and declaration center
  Maps = new ArrayList<Barrier[]>();
  current_map = 0;
  map0();
  map1();

  //ghost initialization and declaration center
  ghosts = new ArrayList<Ghost>();
  
  p1 = new Player(); //maybe add player selection later? if i have time
}

void draw(){
  if(game_start){ //intro sequence
    game_start();
  }
  else{
    background(0);

    for(Barrier b: Maps.get(current_map)){ //displays all the barriers in the current map
      b.display();
    }
      
    p1.display(); //displays the player

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

    //Sequence of maps
    if(current_map == 0){
      if(frameCount>=30 && frameCount<120){
        message_1();
      }
      if(frameCount>=120){
        message_2();
      }
    }

    if(current_map == 0 && p1.x == 800 && p1.y >= 700){
      current_map = 1;
      p1.x = 0;
      p1.y = 100;
      ghosts.add(new Ghost());
    }

    if(current_map == 1){
      
      //if you go back go to past map
      //if you go forward, go to next map

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

float counter_1 = 0;
String[] message = {"W", "h", "e", "r", "e", " ", "a", "m", " ", "I", "?"};
String display_1 = "";

void message_1(){
  text(display_1, 400,330);
  if(counter_1%1==0 && counter_1<message.length){
    display_1 += message[int(counter_1)];
  }
  counter_1+=0.25;
}

float counter_2 = 0;
String[] message_again = {"I", " ", "h", "a", "v", "e", " ", "t", "o", " ", "g", "e", "t", " ", "o", "u", "t", " ", "o", "f", " ", "h", "e", "r", "e", ".", ".", "."};
String display_2 = "";
void message_2(){
  text(display_2, 400,330);
  if(counter_2%1==0 && counter_2<message_again.length){
    display_2 += message_again[int(counter_2)];
  }
  counter_2+=0.25;
}

void game_over(){
  background(0);
  noLoop();
  fill(255);

  textSize(50);
  text("GAME OVER", 400,300);

  //final time
  int time_min = int(frameCount/3600);
  int time_sec = int(frameCount/60);
  textSize(35);
  text("Final time: " + time_min + " minutes " + time_sec + " seconds", 400,400);
  //make a better way to track time? ex just minutes and scale the seconds
}
