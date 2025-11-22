//Maps
Barrier[] map1;

//Player
Player p1;
final float final_speed = 5; //the player's speed - needed for collision logic

//movement variables
boolean upPressed;
boolean leftPressed;
boolean downPressed;
boolean rightPressed;

void setup(){
  size(800,800);

  //map initialization and declaration center
  map1 = new Barrier[10];
  create_map1();
  
  p1 = new Player(); //maybe add player selection later? if i have time
}

void draw(){
  background(0);
  for(Barrier b: map1)
    b.display();
  
  p1.display();
  
  //movement logic - calls the functions which actually move the player
  if(upPressed) p1.move_up();
  if(leftPressed) p1.move_left();
  if(downPressed) p1.move_down();
  if(rightPressed) p1.move_right();
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
