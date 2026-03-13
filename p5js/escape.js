//VARIABLES//

//Maps
let current_map;
let Maps = [];

let ghosts = [];

//Player
let p1;
let final_speed; //the player's speed - needs to be global

//Keys
let keyring = []; //arraylist of keys - arraylist because keys are deleted after they're used
let lock2; //the door to room 2 is locked
let lock3; //the door to room 3 is locked
let lock4; //the door to room 4 is locked
let lock5; //the door to room 5 is locked
let lock6; //the door to room 6 is locked
let lock7; //the door to room 7 is locked
let lock8; //the door to room 8 is locked

//movement variables
let upPressed;
let leftPressed;
let downPressed;
let rightPressed;

//sequence
let intro;
let tutorial;
let game_start;
let game_over ;
let end_game;
let pause ; //pause controls whether the player or ghost(s) can move

//Instructions
let instructions = new Array(6);
let instruction_count;

//Images
let keys; //ATTRIBUTION: <a href="https://www.flaticon.com/free-icons/key" title="key icons">Key icons created by Freepik - Flaticon</a>
let special_key;

///////////////////
function preload(){
    keys = loadImage("key.png");
    special_key = loadImage("special_key.png");
}

function setup(){
  createCanvas(800,800);
  textAlign(CENTER);
  noStroke();
   lock2 = true; //the door to room 2 is locked
 lock3 = true; //the door to room 3 is locked
 lock4 = true; //the door to room 4 is locked
 lock5 = true; //the door to room 5 is locked
 lock6 = true; //the door to room 6 is locked
 lock7 = true; //the door to room 7 is locked
 lock8 = true; //the door to room 8 is locked
  upPressed = false;
 leftPressed = false;
 downPressed = false;
 rightPressed = false;
  intro = true;
  tutorial = false;
 game_start = false;
 game_over = false;
 end_game = false;
 pause = false;
 instruction_count = 0;
  final_speed = 5;

  //Keys
  keyring.push(new Key(720,720,1,false)); //map1
  keyring.push(new Key(600,100,2,false)); //map2
  keyring.push(new Key(600,400,2,false)); //map2
  keyring.push(new Key(730,730,3,false)); //map3
  keyring.push(new Key(375,575,5,false)); //map5
  keyring.push(new Key(60,60,6,false)); //map6

  //map initialization and declaration center
  current_map = 0;
  map0(); map1(); map2(); map3(); map4(); map5(); map6(); map7(); map8(); //creates all the maps - go to the maps tab

  //Instructions
  instructions[0] = "Welcome, WANDERER.\nIt seems you have lost your way.";
  instructions[1] = "This place is not happy with your presence.\nMany BARRIERS will block your way.";
  instructions[2] = "Moreover, RED doorways will block your entry\nunless you have a KEY.";
  instructions[3] = "KEYS are scattered throughout.\nAn unlocked doorway is GREEN.";
  instructions[4] = "Be careful. GHOSTS haunt these rooms.\nThey will leave you be if you leave them be.";
  instructions[5] = "Good luck, WANDERER.\nMay you find the exit, and ESCAPE...";

  p1 = new Player(); //maybe add player selection later? if i have time
}

class Player{ //player! aka you
  constructor(){ //might make some customization later
    this.x = 400;
    this.y = 400;
    this.speed = final_speed;
    this.size = 15; //the radius of the player (who is a circle)
    this.prevx = this.x;
    this.prevy = this.y; //coords for the ghost to chase
    this.count = 0;
  }

  display(){ //displays the player on the screen
    fill(255);
    circle(this.x,this.y,this.size*2);

    this.count++;
    if(this.count==30){ //sets a .5 second delay for the ghost
      this.prevx = this.x;
      this.prevy = this.y;
      this.count = 0;
    }
  }
  
  move_right() { //move right
    if(!pause){
      this.x+=this.speed;
    }
    if(collisionX() !== checkResult.NotTouched || this.x > width) { //predicts collision - if yes, goes back
      this.x -= this.speed;
    }
  }
  move_left() { //move left
    if(!pause){
      this.x-=this.speed;
    }
    if(collisionX() !== checkResult.NotTouched || this.x < 0) //predicts collision - if yes, goes back
      this.x+=this.speed;
  }
 move_up() { //move up
    if(!pause){
      this.y-=this.speed;
    }
    if(collisionY() !== checkResult.NotTouched || this.y < 0) //predicts collision - if yes, goes back
      this.y+=this.speed;
  }
 move_down() { //move down
    if(!pause){
      this.y+=this.speed;
    }
    if(collisionY() !== checkResult.NotTouched || this.y > height) //predicts collision - if yes, goes back
      this.y-=this.speed;
  } 
}

function map0(){
    let map0 = new Array(8);
    map0[0] = new Barrier(200,200,200,5);
    map0[1] = new Barrier(595,200,5,200);
    map0[2] = new Barrier(400,595,200,5);
    map0[3] = new Barrier(200,400,5,200);

    //walls
    map0[4] = new Barrier(0,-5,700,5);
    map0[5] = new Barrier(800,0,5,700);
    map0[6] = new Barrier(100,800,700,5);
    map0[7] = new Barrier(-5,100,5,700);
    Maps.push(map0);
}

function map1(){ //testing for now - not the actual map
    let map1 = new Array(6);
    map1[0] = new Barrier(0,395,200,10);
    map1[1] = new Barrier(600,395,200,10);

    //walls
    map1[2] = new Barrier(0,-5,800,5);
    map1[3] = new Barrier(800,100,5,700);
    map1[4] = new Barrier(0,800,800,5);
    map1[5] = new Barrier(-5,0,5,700);
    Maps.push(map1);
}

function map2(){
    let map2 = new Array(8);
    map2[0] = new Barrier(500,200,300,15);
    map2[1] = new Barrier(200,230,300,15);
    map2[2] = new Barrier(500,600,300,15);
    map2[3] = new Barrier(200,570,300,15);

    //walls
    map2[4] = new Barrier(0,-5,800,5);
    map2[5] = new Barrier(800,0,5,800);
    map2[6] = new Barrier(0,800,700,5);
    map2[7] = new Barrier(-5,0,5,800);
    Maps.push(map2);
}

function map3(){
    let map3 = new Array(26);
    //vertical walls
    map3[0] = new Barrier(695,0,10,500);
    map3[1] = new Barrier(595,150,10,200);
    map3[2] = new Barrier(495,0,10,300);
    map3[3] = new Barrier(195,100,10,600);
    map3[4] = new Barrier(95,150,10,400);
    map3[5] = new Barrier(95,700,10,100);
    map3[6] = new Barrier(495,400,10,200);
    map3[7] = new Barrier(495,700,10,100);
    map3[18] = new Barrier(295,265,10,160);
    map3[21] = new Barrier(310,540,10,100);

    //horizontal
    map3[8] = new Barrier(95,90,300,10);
    map3[9] = new Barrier(295,190,200,10);
    map3[10] = new Barrier(200,490,200,10);
    map3[11] = new Barrier(400,590,400,10);
    map3[12] = new Barrier(200,690,305,10);
    map3[13] = new Barrier(600,690,305,10);
    map3[14] = new Barrier(500,490,105,10);
    map3[15] = new Barrier(0,190,100,10);
    map3[16] = new Barrier(0,390,100,10);
    map3[17] = new Barrier(0,610,100,10);
    map3[19] = new Barrier(750,295,50,10);
    map3[20] = new Barrier(695,500,50,10);

    //walls
    map3[22] = new Barrier(0,-5,800,5);
    map3[23] = new Barrier(800,100,5,700);
    map3[24] = new Barrier(0,800,800,5);
    map3[25] = new Barrier(-5,0,5,700);
    Maps.push(map3);
}

function map4(){
    let map4 = new Array(17);
    //cell1
    map4[0] = new Barrier(150,0,10,100);
    map4[1] = new Barrier(0,150,100,10);
    //cell2
    map4[2] = new Barrier(650,0,10,100);
    map4[3] = new Barrier(700,150,100,10);
    //cell3
    map4[4] = new Barrier(0,650,100,10);
    map4[5] = new Barrier(150,700,10,100);
    //cell4
    map4[6] = new Barrier(700,650,100,10);
    map4[7] = new Barrier(650,700,10,100);
    //square
    map4[8] = new Barrier(345,335,110,10);
    map4[9] = new Barrier(345,335,10,110);
    map4[10] = new Barrier(445,335,10,110);
    map4[11] = new Barrier(345,435,110,10);

    //walls
    map4[12] = new Barrier(100,-5,700,5);
    map4[13] = new Barrier(800,0,5,800);
    map4[14] = new Barrier(0,800,345,5);
    map4[15] = new Barrier(455,800,345,5);
    map4[16] = new Barrier(-5,0,5,800);
    Maps.push(map4);
}

function map5(){
    let map5 = new Array(4);

    //walls
    map5[0] = new Barrier(0,-5,800,5);
    map5[1] = new Barrier(800,0,5,800);
    map5[2] = new Barrier(0,800,800,5);
    map5[3] = new Barrier(-5,100,5,700);
    Maps.push(map5);
}

function map6(){
    let map6 = new Array(4);

    //walls
    map6[0] = new Barrier(0,-5,800,5);
    map6[1] = new Barrier(800,0,5,700);
    map6[2] = new Barrier(0,800,800,5);
    map6[3] = new Barrier(-5,0,5,800);
    Maps.push(map6);
}

function map7(){
    let map7 = new Array(8);

    //box for big ghost
    map7[0] = new Barrier(300,300,200,10);
    map7[1] = new Barrier(300,300,10,200);
    map7[2] = new Barrier(490,300,10,200);
    map7[3] = new Barrier(300,490,200,10);

    //walls
    map7[4] = new Barrier(0,-5,345,5);
    map7[5] = new Barrier(455,-5,345,5);
    map7[6] = new Barrier(800,0,5,800);
    map7[7] = new Barrier(-5,0,5,800);
    Maps.push(map7);
}

function map8(){
    let map8 = new Array(1);
    map8[0] = new Barrier(305,610,190,10);
    Maps.push(map8);
}

class Key{
    constructor(_x, _y, _m, _s){
        this.x = _x;
        this.y = _y;
        this.size = 50;
        this.collected = false;
        this.used = false;
        this.map = _m; //determines which map the key shows up in
        this.special = _s; //is it a special key? only used for room 4
    }

    display(){
        if(this.special) image(special_key,this.x,this.y);
        else image(keys,this.x,this.y);
    }

    collision(){
        //slightly modified the collision code from barriers for the shape of the key
        let overlapX = p1.x + p1.size >= this.x + this.size/2 && p1.x - p1.size <= this.x + this.size/2;
        let overlapY = p1.y + p1.size >= this.y && p1.y - p1.size <= this.y + this.size;
        return overlapX && overlapY;
    }
}
class Ghost{
    constructor(_x, _y, _sp, _sz){ //default
        this.x = _x;
        this.y = _y;
        this.speed = _sp;
        this.size = _sz; //radius of the ghost (which is a circle) normal:20
    }

    display(){
        fill(255,150);
        circle(this.x,this.y,this.size*2);

        textSize(this.size*3/2); //makes text proportional to the ghost size
        fill(0);
        text(">:)", this.x,this.y+textWidth(">")/2); //ghosts are evil! >:)
    }

    //check player position vs ghost position
    player_right(px, gx){
        return px - gx;
    }
    player_up(py, gy){
        return gy - py;
    } 

    //movement logic
    move_right() { //move right
        if(!pause){
            this.x+=this.speed;
        }
    }
    move_left() { //move left
        if(!pause){
            this.x-=this.speed;
        }
     }
    move_up() { //move up
        if(!pause){
            this.y-=this.speed;
        }
     }
    move_down() { //move down
        if(!pause){
            this.y+=this.speed;
       }
     } 

    collision(){
        if (dist(p1.x, p1.y, this.x, this.y) <= p1.size + this.size) {
            game_over = true;
        }
    }
}

// class Barrier{ //barriers! aka walls
// constructor(_x, _y, l, w){
//     this.x = _x;
//     this.y = _y;
//     this.x_length = l; //has to be bigger than final_speed or else player will teleport
//     this.y_length = w; //has to be bigger than final_speed or else player will teleport
//     this.endx = this.x + this.x_length;
//     this.endy = this.y + this.y_length;
//   }
  
//  display(){ //displays barriers on screen
//     fill(255);
//     rect(this.x-this.final_speed,this.y-this.final_speed,this.x_length+2*this.final_speed,this.y_length+2*this.final_speed);
//     //final_speed is required to make the barrier visually aligned with the code
//   }
// }

// // enum checkResult {
// //   NotTouched,
// //   TouchRight,
// //   TouchLeft,
// //   TouchUp,
// //   TouchDown
// // }

// const checkResult = {
//   NotTouched: 0,
//   TouchRight: 1,
//   TouchLeft: 2,
//   TouchUp: 3,
//   TouchDown: 4
// };

// //barrier collision logic
// function collisionX(){ //checks if the player is touching the barrier horizontally
//   for(let b of Maps[current_map]){
//     let overlapX = p1.x + p1.size >= b.x && p1.x - p1.size <= b.endx;
//     let overlapY = p1.y + p1.size >= b.y && p1.y - p1.size <= b.endy;
//       if (overlapX && overlapY) { 
//         if (check_right(b)) {
//           return checkResult.TouchRight; //player is touching the right
//         }
//         else if (check_left(b)) {
//           return checkResult.TouchLeft; //player is touching the left
//         } 
        
//       }
//   }
//   return checkResult.NotTouched;
// }

// function collisionY(){ //checks if the player is touching the barrier vertically
//   for(let b of Maps[current_map]){
//     let overlapX = p1.x + p1.size >= b.x && p1.x - p1.size <= b.endx;
//     let overlapY = p1.y + p1.size >= b.y && p1.y - p1.size <= b.endy;
//       if (overlapX && overlapY) { 
//         if (check_up(b)){
//           return checkResult.TouchUp; //player is touching the top
//         } 
//         else if(check_down(b)){
//           return checkResult.TouchDown; //player is touching the bottom
//         }
//       }
//   }
//   return checkResult.NotTouched;
// }

// function check_right(b){ //checks if the player is on the right of the barrier
//     if((p1.x-p1.size)<=b.endx && (p1.x+p1.size)>=b.endx)
//       return true;
//   return false;
// }
// function check_left(b){ //checks if the player is on the left of the barrier
//     if((p1.x+p1.size)>=b.x && (p1.x-p1.size)<=b.x)
//       return true;
//   return false;
// }
// function check_up(b){ //checks if the player is on the top of the barrier
//     if((p1.y+p1.size)>=b.y && (p1.y-p1.size)<=b.y){
//       return true;
//   }
//   return false;
// }
// function check_down(b){ //checks if the player is on the bottom of the barrier
//     if((p1.y-p1.size)<=b.endy && (p1.y+p1.size)>=b.endy){
//       return true;
//   }
//   return false;
// }
class Barrier{
  constructor(_x, _y, l, w){
    this.x = _x;
    this.y = _y;
    this.x_length = l;
    this.y_length = w;
    this.endx = this.x + this.x_length;
    this.endy = this.y + this.y_length;
  }

  display(){
    fill(255);
    rect(
      this.x - final_speed,
      this.y - final_speed,
      this.x_length + 2 * final_speed,
      this.y_length + 2 * final_speed
    );
  }
}

// ENUM Replacement
const checkResult = {
  NotTouched: 0,
  TouchRight: 1,
  TouchLeft: 2,
  TouchUp: 3,
  TouchDown: 4
};

function collisionX(){

  for(let b of Maps[current_map]){

    let overlapX =
      p1.x + p1.size >= b.x &&
      p1.x - p1.size <= b.endx;

    let overlapY =
      p1.y + p1.size >= b.y &&
      p1.y - p1.size <= b.endy;

    if(overlapX && overlapY){

      if(check_right(b)){
        return checkResult.TouchRight;
      }

      else if(check_left(b)){
        return checkResult.TouchLeft;
      }

    }
  }

  return checkResult.NotTouched;
}

function collisionY(){

  for(let b of Maps[current_map]){

    let overlapX =
      p1.x + p1.size >= b.x &&
      p1.x - p1.size <= b.endx;

    let overlapY =
      p1.y + p1.size >= b.y &&
      p1.y - p1.size <= b.endy;

    if(overlapX && overlapY){

      if(check_up(b)){
        return checkResult.TouchUp;
      }

      else if(check_down(b)){
        return checkResult.TouchDown;
      }

    }
  }

  return checkResult.NotTouched;
}

function check_right(b){

  if((p1.x - p1.size) <= b.endx &&
     (p1.x + p1.size) >= b.endx){

    return true;
  }

  return false;
}


function check_left(b){

  if((p1.x + p1.size) >= b.x &&
     (p1.x - p1.size) <= b.x){

    return true;
  }

  return false;
}


function check_up(b){

  if((p1.y + p1.size) >= b.y &&
     (p1.y - p1.size) <= b.y){

    return true;
  }

  return false;
}


function check_down(b){

  if((p1.y - p1.size) <= b.endy &&
     (p1.y + p1.size) >= b.endy){

    return true;
  }

  return false;
}

function draw(){
  // if(keyIsPressed && key == 'q'){ //allows me to skip the intro sequence when testing, or else it just takes too long lol
  //   game_start = false;
  //   tutorial = false;
  //   pause = false;
  // }
  if(tutorial){
    tuTorial();
  }
  else if(game_start){ //intro sequence
    gameStart();
  }
  else if(game_over){
    gameOver();
  }
  else if(end_game){
    endGame();
  }
  else{
    background(0);

    sequence(); //map logic & creates ghosts - go to the sequence file

    p1.display(); //displays the player

    for(let b of Maps[current_map]){ //displays all the barriers in the current map
      b.display();
    }

    for(let g of ghosts){ //displays the ghosts
      g.display();
    }

    for(let k of keyring){
      if(!k.collected && current_map == k.map){ //if the key isn't collected and the player is in the correct map
        k.display();
      }
      if(k.collision() && current_map == k.map){
        k.collected = true;
      }
    }
    
    //player movement logic - combined with void keyIsPressed and keyReleased
    // if(upPressed) p1.move_up();
    // if(leftPressed) p1.move_left();
    // if(downPressed) p1.move_down();
    // if(rightPressed) p1.move_right();

    if(keyIsDown(UP_ARROW) || keyIsDown(87)) p1.move_up();
    if(keyIsDown(LEFT_ARROW) || keyIsDown(65)) p1.move_left();
    if(keyIsDown(DOWN_ARROW) || keyIsDown(83)) p1.move_down();
    if(keyIsDown(RIGHT_ARROW) || keyIsDown(68)) p1.move_right();

    //ghost movement logic
    for(let g of ghosts){
      if(g.player_right(p1.prevx, g.x)>0){ g.move_right(); } //Right
      else if(g.player_right(p1.prevx, g.x)<0){ g.move_left(); } //Left
      if(g.player_up(p1.prevy, g.y)>0){ g.move_up(); } //Up
      else if(g.player_up(p1.prevy, g.y)<0){ g.move_down(); } //Down

      g.collision(); //if ghost touches player, game ends
    }
  }

  if(intro){ //goes to start screen
    inTro();
  }
}

function inTro(){ //start screen
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

function tuTorial(){
  textSize(30);

  if(frameCount<100){ //fading animation
    fill(0,18);
    rect(-5,-5,810,810);
  }

  if(instruction_count==instructions.length){
    fill(255);
    text(instructions[instruction_count-1], 400,390); //shows the last instruction
    frameCount = 0;   
    tutorial = false; 
    pause = false;
    game_start = true;
    loop();
  }

  //VISUALS to accompany the instructions
  if(instruction_count==1){ //introduces barriers
    fill(255);
    rect(250,550,20,200); //example of barrier
    rect(500,600,200,20); //example of barrier
    rect(170,200,200,20); //example of barrier
    rect(550,70,20,200); //example of barrier
  }
  else if(instruction_count==2){ //introduces doorways and keys
    fill(255,0,0);
    rect(250,250,100,5); //example of locked doorway
    image(keys, 600,500); //example of key
  }
  else if(instruction_count==3){ //introduces unlocked doorways and more keys
    fill(50, 230, 50);
    rect(550,520,100,5); //example of unlocked doorway
    image(keys, 220,220); //example of key
  }
  else if(instruction_count==4){ //introduces ghosts
    //example of ghost: look at ghost code for more detail
    fill(255,150);
    circle(200,200,20*2);
    fill(0,150);
    circle(195,195,30*2); //repeated (bigger) circle to make sure the opacity shows up correctly
    textSize(20*3/2);
    fill(0);
    text(">:)", 200,200+textWidth(">")/2);

    //example of ghost
    fill(255,150);
    circle(600,600,20*2);
    fill(0,150);
    circle(595,595,30*2); //repeated circle to make sure the opacity shows up correctly
    textSize(20*3/2);
    fill(0);
    text(">:)", 600,600+textWidth(">")/2);
  }

  if(frameCount>=120 && instruction_count<instructions.length){
    fill(255);
    text(instructions[instruction_count], 400,390); //shows the instructions - check mouseClicked for code
  }
  
  fill(200);
  textSize(15);
  if(frameCount>=120){
    text("Click anywhere to continue",400,700);
  }
}

function gameStart(){
  if(frameCount>=120 && frameCount<=180){
    textSize(24);

    //thought bubble
    fill(255,15); //opacity 15
    stroke(180); //a dim white
    rect(400-textWidth("   Hello?")/2,372,textWidth(display_1 + "Hello?   "),40,25);
    //a second rect prevents the original rect from getting too white and covering the text, since there is no background(0) that resets the opacity display
    fill(0,55);
    rect(400-textWidth("   Hello?")/2,372,textWidth(display_1 + "Hello?   "),40,25);
    noStroke();

    //display message
    fill(255);
    text("Hello?",400,400);
  }
  else if(frameCount<120 || frameCount>=180){
    fill(0,30);
    rect(-5,-5,810,810);
  }
  if(frameCount==300){
    frameCount = 0;
    game_start = false;
  }
}

function gameOver(){
  background(0);
  fill(255);

  textSize(50);
  text("YOU DIED", 400,300);
  
  if(lock4){
    textSize(35);
    text("Click to respawn", 400,400);
  }
  else{
    textSize(35);
    text("No more chances. You only had one shot.", 400,400);
  }
}

let end_game_count = 0;
function endGame(){
  background(50, 230, 50);
  end_game_count++;
  if(end_game_count > 60){
    background(255);
    fill(0);
    textSize(50);
    text("ESCAPE!", 400,300);
    textSize(35);
    text("Good job!", 400,350);
    noLoop();
  }
}

function mouseClicked(){
  if(tutorial && frameCount>=120 && instruction_count<instructions.length){
    background(0);
    instruction_count++;
  }
  if(intro){  
    intro = false;
    tutorial = true;
    pause = true;
    frameCount = 0;
    loop();
  }

  if(game_over && lock4){
    game_over = false;
    current_map = 0;
    for(let i = ghosts.length-1; i>-1; i--){
      ghosts.splice(i,1);
    }
    p1.x = 400;
    p1.y = 400;
    pause = false;
  }
}

function sequence() {
  if(current_map == 0){
    if(!tutorial && frameCount>=60 && frameCount<150){
      message_1();
    }
    if(!tutorial && frameCount>=150){
      message_2();
    }
    if(frameCount>=300){
      pause = false; //move after the messages are done playing
    }

    if(p1.x==800 && p1.y>=700){ //go to map1 - map1 is already unlocked
      current_map = 1;
      p1.x = 5;
      p1.prevx = 5; //makes sure the ghost will immediately go to the new position instead of the old position (which is opposite of where the player is)
      ghosts.push(new Ghost(400,400,final_speed/2,20));
    }

    if(p1.x>=700 && p1.y==0){ //go to map2 - locked until a key is used
      door2();
      /*
      checks if the door is locked - if so, display message
      if you have no keys, display a message
      if you do have a key, display a message. press k to open the door
      */    
    }

    if(p1.x==0 && p1.y<=100){ //go to map3 - locked until a key is used
      door3();
      /*
      checks if the door is locked - if so, display message
      if you have no keys, display a message
      if you do have a key, display a message. press k to open the door
      */
    }

    if(p1.x<=100 && p1.y==800){ //go to map4
      door4();
      /*
      checks if the door is locked - if so, display message
      if you have no keys, display a message
      if you do have a key, display a message. press k to open the door
      */
    }

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(795, 700, 10, 100); //doorway to map1

    fill(50, 230, 50); //green - unlocked
    if(lock2){ fill(255,0,0); } //red - locked
    rect(700, -5, 100, 10); //doorway to map2

    fill(50,230,50); //green - unlocked
    if(lock3){ fill(255,0,0); } //red - locked
    rect(-5, 0, 10, 100); //doorway to map3

    fill(250,0,250); //purple - special door - locked
    rect(0, 795, 100, 10); //doorway to map4
  }


  //// MAP1 ////
  //Stats: ONE ghost, ONE key
  if(current_map == 1){
    message_3();

    if(p1.x==0 && p1.y>=700){ //go back to map0
      current_map = 0;
      p1.x = 795;
      ghosts.splice(0,1);
    }

    if(p1.x==800 && p1.y<=100){ //go to map5
      door5();
    }

    //room number
    textSize(50);
    fill(180);
    text("1", 400, 400);

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(-5, 700, 10, 100); //doorway to map0

    if(lock5){ fill(255,0,0); } //red - locked
    rect(795, 0, 10, 100); //doorway to map5
  }


  //// MAP2 ////
  //Stats: ZERO ghost, TWO key
  if (current_map == 2) {
    if (p1.x>=700 && p1.y==800){ //go back to map0
      current_map = 0;
      p1.y = 5;
      ghosts.splice(0,1);
    }

    //room number
    textSize(50);
    fill(180);
    text("2", 400, 400);

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(700, 795, 100, 10); //doorway to map0
  }


  //// MAP3 ////
  //Stats: ZERO ghost, ONE key
  if(current_map == 3){
    if(p1.x==800 && p1.y<=100){ //go back to map0
      current_map = 0;
      p1.x = 5;
    }

    if(p1.x==0 && p1.y>=700){ //go to map6
      door6();
    }

    //room number
    textSize(50);
    fill(180);
    text("3", 400, 400);

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(795, 0, 10, 100); //doorway to map0

    if(lock6){ fill(255,0,0); } //red - locked
    rect(-5, 700, 10, 100); //doorway to map6
  }


  //// MAP4 ////
  //Stats: 3 ghost, ZERO key
  if(current_map == 4){
    //CAN'T RETURN TO MAP0!!!
    if(p1.x<=100 && p1.y==0){
      fill(255);
      textSize(20);
      text("locked", 50,30);
    }
    if(p1.x>=350 && p1.x<=450 && p1.y==800){ //go to map7
      door7();
    }

    //room number
    textSize(50);
    fill(180);
    text("4", 400, 400); 

    //doorways
    fill(250,0,250); //purple - special door - locked
    rect(0, -5, 100, 10); //doorway to map0

    if(lock7){ fill(255,0,0); } //red - locked
    rect(350,795,100,10); //doorway to map7
  }


  //// MAP5 ////
  //Stats: 0 ghost, SPECIAL key
  if(current_map == 5){
    if(p1.x==0 && p1.y<=100){ //go to map1
      current_map = 1;
      p1.x = 795;
      ghosts.push(new Ghost(400,400,final_speed/2,20));
    }

    //interactive guy
    fill(250,250,0,200); //yellow opacity: 150
    circle(400,700,40);
    if(dist(400,700,p1.x,p1.y)<=110 && keyring[0].collected && keyring[1].collected && keyring[2].collected && keyring[3].collected && keyring[4].collected && keyring[5].collected){
      circle(400,700,40); //makes the circle more visible
      message_13();
      if(keyring.length<7){
        keyring.push(new Key(400,100,5,true)); //special key
      }
    }
    else if(dist(400,700,p1.x,p1.y)<=110){
      circle(400,700,40); //makes the circle more visible
      message_7();
    }

    //room number
    textSize(50);
    fill(180);
    text("5", 400, 400);

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(-5, 0, 10, 100); //doorway to map1
  }


  //// MAP6 ////
  //Stats: 3 ghost, ONE key
  if(current_map == 6){

    if(p1.x==800 && p1.y>=700){ //go to map3
      current_map = 3;
      p1.x = 5;
      if(ghosts.length>0){
        ghosts.splice(2,1);
        ghosts.splice(1,1);
        ghosts.splice(0,1);
      }
    }

    if(p1.x<160 && p1.y<160 && ghosts.length<3){
      ghosts.push(new Ghost(600,200,2,20));
      ghosts.push(new Ghost(200,600,2,20));
      ghosts.push(new Ghost(600,600,2,20));
    }
    else if(ghosts.length>0){
      message_6();
    }

    //ghost line - crossing this line wakes up dormant ghosts
    strokeWeight(5);
    stroke(180);
    line(160,0,160,160);
    line(0,160,160,160);
    strokeWeight(1);
    noStroke();


    //room number
    textSize(50);
    fill(180);
    text("6", 400, 400);

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(795, 700, 10, 100); //doorway to map3
  }


  //// MAP7 ////
  //Stats: LOTS ghost, ZERO key
  if(current_map == 7){
    message_5();

    if(p1.x>=350 && p1.x<=450 && p1.y==0){ //go to map4
      current_map = 4;
      p1.y = 795;
      ghosts.splice(0,1);
      ghosts.push(new Ghost(75,775,3,20));
      ghosts.push(new Ghost(775,75,3,20));
      ghosts.push(new Ghost(775,775,3,20));
    }

    if(p1.x>650 && p1.x<800 && p1.y<350 && p1.y>200){
      ghosts.push(new Ghost(random(300,500),random(300,500),random(1,4),20));
    }
    else if(p1.x>0 && p1.x<150 && p1.y<250 && p1.y>100){
      ghosts.push(new Ghost(random(300,500),random(300,500),random(1,4),20));
    }
    else if(p1.x>0 && p1.x<150 && p1.y>500 && p1.y<650){
      ghosts.push(new Ghost(random(300,500),random(300,500),random(1,4),20));
    }
    else if(p1.x>650 && p1.x<800 && p1.y>550 && p1.y<700){
      ghosts.push(new Ghost(random(300,500),random(300,500),random(1,4),20));
    }

    if(p1.y==800){ //go to map8
      current_map = 8;
      p1.y = 5;
      ghosts.length = 0;
    }

    //room number
    textSize(50);
    fill(180);
    text("7", 400, 400);

    //ghost line - crossing this line wakes up dormant ghosts
    strokeWeight(5);
    stroke(180);
    //cell1
    line(650,200,800,200);
    line(650,350,800,350);
    line(650,200,650,350);
    //cell2
    line(0,100,150,100);
    line(0,250,150,250);
    line(150,100,150,250);
    //cell3
    line(0,500,150,500);
    line(0,650,150,650);
    line(150,500,150,650);
    //cell4
    line(650,550,800,550);
    line(650,700,800,700);
    line(650,550,650,700);
    strokeWeight(1);
    noStroke();

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(350, -5, 100, 10); //doorway to map3
    rect(0, 795, 800, 10); //doorway to map8
  }


  //// MAP8 ////
  //Stats: ESCAPE!!!!
  if(current_map == 8){ //go back to map7
    if(p1.y==0){
      current_map = 7;
      p1.y = 795;
      p1.prevy = 795; //makes sure the ghost will immediately go to the new position instead of the old position (which is opposite of where the player is)
      ghosts.push(new Ghost(400,600,4,100)); //big boss ghost
    }
    if(p1.y==590 && p1.x>=300 && p1.x<=500){
      fill(255);
      textSize(20);
      text("You have one key remaining. Use key?", 410,540);
      if(keyIsPressed && key=='k'){
        end_game = true;
      }
    }

    //room number
    textSize(50);
    fill(180);
    text("8", 400, 400);

    //doorways
    fill(50, 230, 50); //green - unlocked
    rect(0, -5, 800, 10); //doorway to map7
    rect(300,600,200,5); //door to the ESCAPE!!!!
  }
}



//// Messages that play on map0 ////
let counter_1 = 0;
let message = ["W", "h", "e", "r", "e", " ", "a", "m", " ", "I", "?"];
let display_1 = "";

function message_1(){
  textSize(24);
  
  //thought bubble
  stroke(180); //a dim white
  fill(255,35); //opacity 35
  rect(400-textWidth("   " + display_1)/2,302,textWidth(display_1 + "   "),40,25);
  noStroke();

  //display message
  fill(255);
  text(display_1, 400,330);

  if(counter_1%1==0 && counter_1<message.length){
    display_1 += message[floor(counter_1)];
  }
  counter_1+=0.25; //adding 0.25 gives the text typing effect a slight delay - basically it's just for aesthetics
}

let counter_2 = 0;
let message_again = ["I", " ", "h", "a", "v", "e", " ", "t", "o", " ", "g", "e", "t", " ", "o", "u", "t", " ", "o", "f", " ", "h", "e", "r", "e", ".", ".", "."];
let display_2 = "";
function message_2(){
  textSize(24);

  //thought bubble
  stroke(180); //a dim white
  fill(255,35); //opacity 35
  rect(400-textWidth("   " + display_2)/2,302,textWidth(display_2 + "   "),40,25);
  noStroke();

  ///display message
  fill(255);
  text(display_2, 400,330);

  if(counter_2%1==0 && counter_2<message_again.length){
    display_2 += message_again[floor(counter_2)];
  }
  counter_2+=0.25; //adding 0.25 gives the text typing effect a slight delay - basically it's just for aesthetics
}

//// Messages that play on map1 ////
let counter_3 = 0;
let message_thrice = ["I", "s", " ", "t", "h", "a", "t", " ", "a", " ", "g", "h", "o", "s", "t", "?"];
let display_3 = "";
let message_quad = ["L", "o", "o", "k", "s", " ", "a", " ", "l", "i", "t", "t", "l", "e", " ", "a", "n", "g", "r", "y", ".", ".", "."];
let display_4 = "";
function message_3(){
  pause = true; //stops all movement (p1 and ghost)
  textSize(24);

  //thought bubble
  stroke(180); //a dim white
  fill(255,35); //opacity 35
  rect(200-textWidth("   " + display_3)/2,572,textWidth(display_3 + "   "),40,25);
  if(display_4.length>0){
    rect(200-textWidth("   " + display_4)/2,612,textWidth(display_4 + "   "),40,25);
  }
  noStroke();

  ///display message
  fill(255);
  text(display_3, 200,600);
  text(display_4, 200,640);

  if(counter_3%1==0 && counter_3<message_thrice.length){
    display_3 += message_thrice[floor(counter_3)];
  }
  if(counter_3%1==0 && counter_3>message_thrice.length+4 && counter_3<message_quad.length+message_thrice.length+5){
    display_4 += message_quad[floor(counter_3-message_thrice.length-5)];
  }
  counter_3+=0.25; //adding 0.25 gives the text typing effect a slight delay - basically it's just for aesthetics
  
  //determines when to turn off pause (after the messages play plus a little time)
  if(counter_3>message_quad.length+message_thrice.length+12){
    pause=false;
  }
}

//// Message that plays on map7 ////
let counter_5 = 0;
let display_5 = "";
let message_quint = ["Y", "O", "U", " ", "S", "H", "A", "L", "L", " ", "N", "O", "T", " ", "P", "A", "S", "S"];
function message_5(){
  pause = true; //stops all movement
  textSize(24);

  //thought bubble
  stroke(180); //a dim white
  fill(255,35); //opacity 35
  rect(400-textWidth("   " + display_5)/2,222,textWidth(display_5 + "   "),40,25);
  noStroke();

  ///display message
  fill(255);
  text(display_5, 400,250);

  if(counter_5%1==0 && counter_5<message_quint.length){
    display_5 += message_quint[floor(counter_5)];
  }
  counter_5+=0.25; //adding 0.25 gives the text typing effect a slight delay - basically it's just for aesthetics

  //determines when to turn off pause (after the message plays plus a little time)
  if(counter_5>message_quint.length+12){ 
    pause=false;
  }
}

//// Message that play on map6
let counter_6 = 0;
let display_6 = "";
let message_hex = ["S", "e", "v", "e", "r", "a", "l", " ", "d", "o", "r", "m", "a", "n", "t", " ", "G", "h", "o", "s", "t", "s", " ", "w", "a", "k", "e", " ", "a", "t", " ", "y", "o", "u", "r", " ", "i", "n", "t", "r", "u", "s", "i", "o", "n"];
function message_6(){
  pause = true; //stops all movement
  textSize(24);

  //dialouge bubble
  stroke(100); // gray
  fill(255,70); //opacity 70
  rect(400-textWidth("   " + display_6)/2,272,textWidth(display_6 + "   "),40,10);
  noStroke();

  //display message
  fill(255);
  text(display_6, 400,300);

  if(counter_6%1==0 && counter_6<message_hex.length){
    display_6 += message_hex[floor(counter_6)];
  }
  counter_6+=0.50; //adding 0.50 gives the text typing effect a slight delay - basically it's just for aesthetics

  //determines when to turn off pause (after the message plays plus a little time)
  if(counter_6>message_hex.length+12){ 
    pause=false;
  }
}

//// Messages that play on map5
let counter_7 = 0;
let display_7 = "";
let message_a = ["!", "!", "!"];
function message_7(){
  pause = true; //stops all movement
  textSize(24);

  //dialouge bubble
  stroke(100); // gray
  fill(255,20); //opacity 20
  rect(400-textWidth("   " + display_7)/2,622,textWidth(display_7 + "   "),40);
  noStroke();

  //display message
  fill(230);
  text(display_7, 400,650);

  if(counter_7%1==0 && counter_7<message_a.length){
    display_7 += message_a[floor(counter_7)];
  }
  counter_7+=0.25; //adding 0.25 gives the text typing effect a slight delay - basically it's just for aesthetics

  //determines when to turn off pause (after the message plays plus a little time)
  if(counter_7>message_a.length+12){ 
    message_8();
  }
}
let counter_8 = 0;
let display_8 = "";
let message_b = ["A", " ", "W", "a", "n", "d", "e", "r", "e", "r", "?", " ", "H", "o", "w", " ", "d", "i", "d", " ", "y", "o", "u", " ", "g", "e", "t", " ", "h", "e", "r", "e", "?"];
function message_8(){
  fill(0);
  rect(0,620,800,670);
  fill(250,250,0,180); //yellow opacity: 180
  circle(400,700,40);
  
  pause = true; //stops all movement
  textSize(24);

  //dialouge bubble
  stroke(100); // gray
  fill(255,20); //opacity 20
  rect(400-textWidth("   " + display_8)/2,622,textWidth(display_8 + "   "),40);
  noStroke();

  //display message
  fill(230);
  text(display_8, 400,650);

  if(counter_8%1==0 && counter_8<message_b.length){
    display_8 += message_b[floor(counter_8)];
  }
  counter_8+=0.25; //adding 0.25 gives the text typing effect a slight delay - basically it's just for aesthetics

  //determines when to turn off pause (after the message plays plus a little time)
  if(counter_8>message_b.length+12){ 
    pause=false;
    message_9();
  }
}
let counter_9 = 0;
let display_9 = "";
let message_c = ["N", "o", " ", "m", "a", "t", "t", "e", "r", ".", " ", "Y", "o", "u", " ", "m", "u", "s", "t", " ", "e", "s", "c", "a", "p", "e", " ", "t", "h", "i", "s", " ", "p", "l", "a", "c", "e", "!"];
function message_9(){
  fill(0);
  rect(0,620,800,670);
  fill(250,250,0,180); //yellow opacity: 180
  circle(400,700,40);

  pause = true; //stops all movement
  textSize(24);

  //dialouge bubble
  stroke(100); // gray
  fill(255,20); //opacity 20
  rect(400-textWidth("   " + display_9)/2,622,textWidth(display_9 + "   "),40);
  noStroke();

  //display message
  fill(230);
  text(display_9, 400,650);

  if(counter_9%1==0 && counter_9<message_c.length){
    display_9 += message_c[floor(counter_9)];
  }
  counter_9+=0.25; //adding 0.25 gives the text typing effect a slight delay - basically it's just for aesthetics

  //determines when to turn off pause (after the message plays plus a little time)
  if(counter_9>message_c.length+12){ 
    pause=false;
    message_10();
  }
}
let counter_10 = 0;
let display_10 = "";
let message_d = ["I", " ", "h", "a", "v", "e", " ", "a", " ", "s", "p", "e", "c", "i", "a", "l", " ", "k", "e", "y", " ", "n", "e", "e", "d", "e", "d", " ", "t", "o", " ", "r", "e", "a", "c", "h", " ", "t", "h", "e", " ", "e", "x", "i", "t", ","];
function message_10(){
  fill(0);
  rect(0,620,800,670);
  fill(250,250,0,180); //yellow opacity: 180
  circle(400,700,40);

  pause = true; //stops all movement
  textSize(24);

  //dialouge bubble
  stroke(100); // gray
  fill(255,20); //opacity 20
  rect(400-textWidth("   " + display_10)/2,622,textWidth(display_10 + "   "),40);
  noStroke();

  //display message
  fill(230);
  text(display_10, 400,650);

  if(counter_10%1==0 && counter_10<message_d.length){
    display_10 += message_d[floor(counter_10)];
  }
  counter_10+=0.25; //adding 0.25 gives the text typing effect a slight delay - basically it's just for aesthetics

  //determines when to turn off pause (after the message plays plus a little time)
  if(counter_10>message_d.length+12){ 
    pause=false;
    message_11();
  }
}

let counter_11 = 0;
let display_11 = "";
let message_e = ["b", "u", "t", " ", "u", "s", "i", "n", "g", " ", "i", "t", " ", "m", "e", "a", "n", "s", " ", "y", "o", "u", " ", "o", "n", "l", "y", " ", "h", "a", "v", "e", " ", "o", "n", "e", " ", "s", "h", "o", "t", " ", "t", "o", " ", "e", "s", "c", "a", "p", "e"];
function message_11(){
  fill(0);
  rect(0,620,800,670);
  fill(250,250,0,180); //yellow opacity: 180
  circle(400,700,40);

  pause = true; //stops all movement
  textSize(24);

  //dialouge bubble
  stroke(100); // gray
  fill(255,20); //opacity 20
  rect(400-textWidth("   " + display_11)/2,622,textWidth(display_11 + "   "),40);
  noStroke();

  //display message
  fill(230);
  text(display_11, 400,650);

  if(counter_11%1==0 && counter_11<message_e.length){
    display_11 += message_e[floor(counter_11)];
  }
  counter_11+=0.25; //adding 0.25 gives the text typing effect a slight delay - basically it's just for aesthetics

  //determines when to turn off pause (after the message plays plus a little time)
  if(counter_11>message_e.length+12){ 
    pause=false;
    message_12();
  }
}

let counter_12 = 0;
let display_12 = "";
let message_f = ["I", "f", " ", "y", "o", "u", " ", "a", "r", "e", " ", "s", "e", "r", "i", "o", "u", "s", ",", " ", "c", "o", "m", "e", " ", "b", "a", "c", "k", " ", "a", "f", "t", "e", "r", " ", "y", "o", "u", " ", "h", "a", "v", "e", " ", "c", "o", "l", "l", "e", "c", "t", "e", "d", " ", "a", "l", "l", " ", "o", "t", "h", "e", "r", " ", "k", "e", "y", "s", "."];
function message_12(){
  fill(0);
  rect(0,620,800,670);
  fill(250,250,0,180); //yellow opacity: 180
  circle(400,700,40);

  pause = true; //stops all movement
  textSize(24);

  //dialouge bubble
  stroke(100); // gray
  fill(255,20); //opacity 20
  rect(400-textWidth("   " + display_12)/2,622,textWidth(display_12 + "   "),40);
  noStroke();

  //display message
  fill(230);
  text(display_12, 400,650);

  if(counter_12%1==0 && counter_12<message_f.length){
    display_12 += message_f[floor(counter_12)];
  }
  counter_12+=0.25; //adding 0.25 gives the text typing effect a slight delay - basically it's just for aesthetics

  //determines when to turn off pause (after the message plays plus a little time)
  if(counter_12>message_f.length+12){ 
    pause=false;
  }
}

let counter_13 = 0;
let display_13 = "";
let message_g = ["G", "o", "o", "d", " ", "l", "u", "c", "k", "."];
function message_13(){
  fill(0);
  rect(0,620,800,670);
  fill(250,250,0,180); //yellow opacity: 180
  circle(400,700,40);

  pause = true; //stops all movement
  textSize(24);

  //dialouge bubble
  stroke(100); // gray
  fill(255,20); //opacity 20
  rect(400-textWidth("   " + display_13)/2,622,textWidth(display_13 + "   "),40);
  noStroke();

  //display message
  fill(230);
  text(display_13, 400,650);

  if(counter_13%1==0 && counter_13<message_g.length){
    display_13 += message_g[floor(counter_13)];
  }
  counter_13+=0.25; //adding 0.25 gives the text typing effect a slight delay - basically it's just for aesthetics

  //determines when to turn off pause (after the message plays plus a little time)
  if(counter_13>message_g.length+12){ 
    pause=false;
  }
}


//// DOORS ////
function door2(){
  if(lock2){ //is the door locked?
    let key_count = 0; //count makes sure the message only shows up if EVERY key in the keyring is uncollected
    textSize(20);
    text("locked door", 700,30);
    for(let i = keyring.length-1; i>-1; i--){ //goes through every key in keyring
      if(keyring[i].collected && !keyring[i].used){ //if player has a key that isn't used,
        text("press 'k' to use key", 700,50);

        if(keyIsPressed && key == 'k'){ //unlocks the door
          keyring[i].used = true;
          lock2 = false;
          i=-1; //turns off the for loop so only one key is used
        }
      }
      else{ //if player doesn't have a key, tell the player they don't have a key
        if(!keyring[i].collected){
          key_count++;
        }
        if(key_count == keyring.length){ //if all keys aren't collected
          textSize(20);
          text("you have no keys", 700,50); // :( sad
        }
      }
    }
  }
  if(!lock2){ //if not locked, then you can enter!
    current_map = 2;
    p1.y = 795;
    p1.prevy = 795; //makes sure the ghost will immediately go to the new position instead of the old position (which is opposite of where the player is)
    ghosts.push(new Ghost(100,100,final_speed/2,20));
  }
}

function door3(){
  if(lock3){ //is the door locked?
    let key_count = 0; //count makes sure the message only shows up if EVERY key in the keyring is uncollected
    textSize(20);
    text("locked door", 90,40);
    for(let i = keyring.length-1; i>-1; i--){ //goes through every key in keyring
      if(keyring[i].collected && !keyring[i].used){ //if player has a key that isn't used,
        text("press 'k' to use key", 90,60);

        if(keyIsPressed && key == 'k'){ //unlocks the door
          keyring[i].used = true;
          lock3 = false;
          i=-1; //turns off the for loop so only one key is used
        }
      }
      else{ //if player doesn't have a key, tell the player they don't have a key
        if(!keyring[i].collected){
          key_count++;
        }
        if(key_count == keyring.length){ //if all keys aren't collected
          textSize(20);
          text("you have no keys", 90,60); // :( sad
        }
      }
    }
  }
  if(!lock3){ //if not locked, then you can enter!
    current_map = 3;
    p1.x = 795;
  }
}

function door4(){
  if(lock4){ //is the door locked?
    textSize(20);
    if(keyring.length==7 && keyring[6].collected){
      text("you only have one shot...", 115,770);

      if(keyIsPressed && key == 'k'){ //unlocks the door
        keyring[6].used = true;
        lock4 = false;
      }
    }
      else{
        text("special key required", 95, 760);
      }
    }
    // for(let i = keyring.length-1; i>-1; i--){ //goes through every key in keyring
    //   if(keyring[i].special){
    //     text("press 'k' to use special key", 115,770);

    //    if(keyIsPressed && key == 'k'){ //unlocks the door
    //      keyring[6].used = true;
    //      lock4 = false;
    //    }
    //  }
    //   else{ //if player doesn't have a key, tell the player they don't have a key
    //       text("special key required", 95,770); // :( sad
    //     }
    // }
  
  if(!lock4){ //if not locked, then you can enter!
    current_map = 4;
    p1.y = 5;
    p1.prevy = 5; //makes sure the ghost will immediately go to the new position instead of the old position (which is opposite of where the player is)
    ghosts.push(new Ghost(75,775,3,20));
    ghosts.push(new Ghost(775,75,3,20));
    ghosts.push(new Ghost(775,775,3,20));
  }
}

function door5(){
  if(lock5){ //is the door locked?
    let key_count = 0; //count makes sure the message only shows up if EVERY key in the keyring is uncollected
    textSize(20);
    text("locked door", 700,50);
    for(let i = keyring.length-1; i>-1; i--){ //goes through every key in keyring
      if(keyring[i].collected && !keyring[i].used){ //if player has a key that isn't used,
        text("press 'k' to use key", 700,70);

        if(keyIsPressed && key == 'k'){ //unlocks the door
          keyring[i].used = true;
          lock5 = false;
          i=-1; //turns off the for loop so only one key is used
        }
      }
      else{ //if player doesn't have a key, tell the player they don't have a key
        if(!keyring[i].collected){
          key_count++;
        }
        if(key_count == keyring.length){ //if all keys aren't collected
          textSize(20);
          text("you have no keys", 700,70); // :( sad
        }
      }
    }
  }
  if(!lock5){ //if not locked, then you can enter!
    current_map = 5;
    p1.x = 5;
    ghosts.splice(0,1);
  }
}

function door6(){
  if(lock6){ //is the door locked?
    let key_count = 0; //count makes sure the message only shows up if EVERY key in the keyring is uncollected
    textSize(20);
    text("locked door", 90,740);
    for(let i = keyring.length-1; i>-1; i--){ //goes through every key in keyring
      if(keyring[i].collected && !keyring[i].used){ //if player has a key that isn't used,
        text("press 'k' to use key", 90,760);

        if(keyIsPressed && key == 'k'){ //unlocks the door
          keyring[i].used = true;
          lock6 = false;
          i=-1; //turns off the for loop so only one key is used
        }
      }
      else{ //if player doesn't have a key, tell the player they don't have a key
        if(!keyring[i].collected){
          key_count++;
        }
        if(key_count == keyring.length){ //if all keys aren't collected
          textSize(20);
          text("you have no keys", 90,760); // :( sad
        }
      }
    }
  }
  if(!lock6){ //if not locked, then you can enter!
    current_map = 6;
    p1.x = 795;
  }
}

function door7(){
  if(lock7){ //is the door locked?
    let key_count = 0; //count makes sure the message only shows up if EVERY key in the keyring is uncollected
    textSize(20);
    fill(255);
    text("locked door", 400,750);
    for(let i = keyring.length-1; i>-1; i--){ //goes through every key in keyring
      if(keyring[i].collected && !keyring[i].used){ //if player has a key that isn't used,
        text("press 'k' to use key", 400,770);

        if(keyIsPressed && key == 'k'){ //unlocks the door
          keyring[i].used = true;
          lock7 = false;
          i=-1; //turns off the for loop so only one key is used
        }
      }
      else{ //if player doesn't have a key, tell the player they don't have a key
        if(!keyring[i].collected){
          key_count++;
        }
        if(key_count == keyring.length){ //if all keys aren't collected
          textSize(20);
          text("you have no keys", 400,770); // :( sad
        }
      }
    }
  }
  if(!lock7){ //if not locked, then you can enter!
    current_map = 7;
    p1.y = 5;
    p1.prevy = 5; //makes sure the ghost will immediately go to the new position instead of the old position (which is opposite of where the player is)
    ghosts.splice(2,1); //deletes prev ghosts
    ghosts.splice(1,1); //deletes prev ghosts
    ghosts.splice(0,1); //deletes prev ghosts
    ghosts.push(new Ghost(400,600,4,100)); //big boss ghost
  }
}