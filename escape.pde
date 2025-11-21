Barrier[] map1;
Player p1;

//movement variables
boolean upPressed;
boolean leftPressed;
boolean downPressed;
boolean rightPressed;

void setup(){
  size(800,800);
  map1 = new Barrier[1];
  map1[0] = new Barrier();
  
  p1 = new Player();
}

void draw(){
  background(0);
  map1[0].display();
  
  p1.display();
  
  //movement
  if(upPressed) p1.move_up();
  if(leftPressed) p1.move_left();
  if(downPressed) p1.move_down();
  if(rightPressed) p1.move_right();
}

//movement
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

boolean check_horizontal(){
  boolean check = false;
  for(Barrier b: map1){
    if(abs(b.midx-p1.x)<b.blength/2+p1.size/2){
      check = true;
    }
  }
  return check;
}
boolean check_vertical(){
  boolean check = false;
  for(Barrier b: map1){
    if(abs(b.midy-p1.y)<b.bwidth/2+p1.size/2){
      check = true;
    }
  }
  return check;
}
