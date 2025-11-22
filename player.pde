class Player{ //player! aka you
  float x, y;
  float speed;
  float size;
  
  Player(){ //might make some customization later
    x=100;
    y=200;
    speed = final_speed;
    size = 15; //the radius of the player (who is a circle)
  }

  void display(){ //displays the player on the screen
    circle(x,y,size*2);
  }
  
  void move_right() { //move right
    x+=speed;
    if((collisionX()==checkResult.TouchLeft) || x>width) { //predicts collision - if yes, goes back
      x -= speed;
    }
  }
  void move_left() { //move left
    x-=speed;
    if((collisionX()==checkResult.TouchRight) || x<0) //predicts collision - if yes, goes back
      x+=speed;
  }
  void move_up() { //move up
    y-=speed;
    if((collisionY()==checkResult.TouchDown) || y<0) //predicts collision - if yes, goes back
      y+=speed;
  }
  void move_down() { //move down
    y+=speed;
    if((collisionY()==checkResult.TouchUp) || y>height) //predicts collision - if yes, goes back
      y-=speed;
  } 
}
