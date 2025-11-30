class Player{ //player! aka you
  float x, y;
  float speed;
  float size;
  float prevx, prevy; //coords for the ghost to chase
  int count = 0;
  
  Player(){ //might make some customization later
    x=400;
    y=400;
    speed = final_speed;
    size = 15; //the radius of the player (who is a circle)
  }

  void display(){ //displays the player on the screen
    fill(255);
    circle(x,y,size*2);

    count++;
    if(count==30){ //sets a .5 second delay for the ghost
      prevx = x;
      prevy = y;
      count = 0;
    }
  }
  
  void move_right() { //move right
    if(!tutorial){
      x+=speed;
    }
    if((collisionX()==checkResult.TouchLeft) || x>width) { //predicts collision - if yes, goes back
      x -= speed;
    }
  }
  void move_left() { //move left
    if(!tutorial){
      x-=speed;
    }
    if((collisionX()==checkResult.TouchRight) || x<0) //predicts collision - if yes, goes back
      x+=speed;
  }
  void move_up() { //move up
    if(!tutorial){
      y-=speed;
    }
    if((collisionY()==checkResult.TouchDown) || y<0) //predicts collision - if yes, goes back
      y+=speed;
  }
  void move_down() { //move down
    if(!tutorial){
      y+=speed;
    }
    if((collisionY()==checkResult.TouchUp) || y>height) //predicts collision - if yes, goes back
      y-=speed;
  } 
}
