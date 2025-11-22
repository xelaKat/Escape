class Barrier{ //barriers! aka walls
  float x, y;
  float x_length; //how wide it is
  float y_length; //how tall it is
  float endx; //edge of the x_length
  float endy; //edge of the y_length
  
Barrier(float _x, float _y, float l,float w){
    x = _x;
    y = _y;
    x_length = l; //has to be bigger than final_speed or else player will teleport
    y_length = w; //has to be bigger than final_speed or else player will teleport
    endx = x + x_length;
    endy = y + y_length;
  }

  Barrier(){ //skeleton for testing
    x = 100;
    y = 100;
    y_length = 5; //has to be bigger than final_speed or else player will teleport
    x_length = 100; //has to be bigger than final_speed or else player will teleport
    endx = x + x_length;
    endy = y + y_length;
  }
  
  void display(){ //displays barriers on screen
    rect(x-final_speed,y-final_speed,x_length+2*final_speed,y_length+2*final_speed);
    //final_speed is required to make the barrier visually aligned with the code
  }
}

enum checkResult {
  NotTouched,
  TouchRight,
  TouchLeft,
  TouchUp,
  TouchDown
}

//barrier collision logic
checkResult collisionX(){ //checks if the player is touching the barrier horizontally
  for(Barrier b: map1){
    boolean overlapX = p1.x + p1.size >= b.x && p1.x - p1.size <= b.endx;
    boolean overlapY = p1.y + p1.size >= b.y && p1.y - p1.size <= b.endy;
      if (overlapX && overlapY) { 
        if (check_right(b)) {
          return checkResult.TouchRight; //player is touching the right
        }
        else if (check_left(b)) {
          return checkResult.TouchLeft; //player is touching the left
        } 
        
      }
  }
  return checkResult.NotTouched;
}

checkResult collisionY(){ //checks if the player is touching the barrier vertically
  for(Barrier b: map1){
    boolean overlapX = p1.x + p1.size >= b.x && p1.x - p1.size <= b.endx;
    boolean overlapY = p1.y + p1.size >= b.y && p1.y - p1.size <= b.endy;
      if (overlapX && overlapY) { 
        if (check_up(b)){
          return checkResult.TouchUp; //player is touching the top
        } 
        else if(check_down(b)){
          return checkResult.TouchDown; //player is touching the bottom
        }
      }
  }
  return checkResult.NotTouched;
}

boolean check_right(Barrier b){ //checks if the player is on the right of the barrier
    if((p1.x-p1.size)<=b.endx && (p1.x+p1.size)>=b.endx)
      return true;
  return false;
}
boolean check_left(Barrier b){ //checks if the player is on the left of the barrier
    if((p1.x+p1.size)>=b.x && (p1.x-p1.size)<=b.x)
      return true;
  return false;
}
boolean check_up(Barrier b){ //checks if the player is on the top of the barrier
    if((p1.y+p1.size)>=b.y && (p1.y-p1.size)<=b.y){
      return true;
  }
  return false;
}
boolean check_down(Barrier b){ //checks if the player is on the bottom of the barrier
    if((p1.y-p1.size)<=b.endy && (p1.y+p1.size)>=b.endy){
      return true;
  }
  return false;
}
