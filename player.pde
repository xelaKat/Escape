class Player{ //player! aka you
  float x;
  float y;
  float speed;
  float size;
  
  Player(){ //might make some customization later
    x=100;
    y=200;
    speed = 5;
    size = 15; //the radius of the player (who is a circle)
  }

  void display(){ //displays the player on the screen
    circle(x,y,size*2);
  }
  
  void move_right() { //if player isn't touching the left of a barrier, move right
    if(!(check() && check_left()) && x < width) 
      x += speed;
  }
  void move_left() { //if player isn't touching the right of a barrier, move left
    if(!(check() && check_right()) && x > 0)
      x-=speed;
  }
  void move_up() { //if player isn't touching the bottom of a barrier, move up
    if(!(check() && check_down()) && y>0)
      y-=speed;
  }
  void move_down() { //if player isn't touching the top of a barrier, move down
    if(!(check() && check_up()) && y<height)
      y+=speed;
  } 
}
