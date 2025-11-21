class Player{
  float x;
  float y;
  float speed;
  float size;
  
  Player(){
    x=100;
    y=200;
    speed = 5;
    size = 25;
  }
  
  void display(){
    circle(x,y,size);
  }
  
  void move_right() {
    if((check_horizontal()==false||check_vertical()==false)&&x<width)
      x += speed;
  }
  void move_left() {
    if((check_horizontal()==false||check_vertical()==false)&&x>0)
      x-=speed;
  }
  void move_up() {
    if((check_vertical()==false||check_horizontal()==false)&&y>0)
      y-=speed;
  }
  void move_down() {
    if((check_vertical()==false||check_horizontal()==false)&&y<height)
      y+=speed;
  } 
}
