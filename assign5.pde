Ball  []  balls;
Bar       board;
Brick []  bricks;


final int GAME_START   = 0;
final int GAME_PLAYING_READY = 1;
final int GAME_PLAYING_2 = 2;
final int GAME_WIN     = 3;
final int GAME_LOSE    = 4;
int   status;
int   life = 3;
int   deadNum=0;


void setup()
  {
  status = GAME_START;
  size(640,480); 
  rectMode(CENTER);
// locate memory   
  board = null;
  balls = new Ball[1]; 
  bricks = new Brick[50];
  drawLife();
// bricks.display();
// reset() 
// create bar object 
  board = new Bar(100);
//create balls object 
  for (int i=0; i<balls.length; i++)
    {    
      balls[i] = new Ball();
    }
// create bricks object
  reset();
/*  brickMake(50,10);
  life=3;
  deadNum=0;*/
  }

void draw(){  
  background(255);  
  switch(status) {
   case GAME_START:
     textAlign(CENTER);
     text("Press Enter To Start", width/2, height/2);        
     break;
   
   case GAME_PLAYING_READY:     
     drawLife();
 //    bricks.display(50,10);
 //  brick display 
     for (int i=0; i<bricks.length;i++)
       {
         bricks[i].display();
       }
     board.move();
     board.display();          
     for (int i=0; i<balls.length; i++)
       {    
       balls[i] = new Ball();
       balls[i].display();
       }         
     break;
     
   case GAME_PLAYING_2:
     drawLife(); 
     board.move();
     board.display();  
     for (int i=0; i<balls.length; i++)
       {       
       balls[i].move();
       balls[i].display();
       }         
 //    bricks.display(50,10);
 //  brick display 
     for (int i=0; i<bricks.length;i++)
       { 
         if (bricks[i] != null && !bricks[i].die)
           {
           bricks[i].display();
           }
       }
     checkBrickDead();
     checkWinLose();
            
     break;
    
   case GAME_LOSE:     
     textAlign(CENTER);   
     text("You Lose!!!", width/2, height/2);      
     break;
    
   case GAME_WIN:
     textAlign(CENTER);   
     text("You WIN!!!", width/2, height/2);      
     break;
  }
}
void drawLife() {
  textSize(28);
  fill(230, 74, 96);
  text("LIFE:", 40, 460); 
  for(int i=0 ; i < life ; i++){
    ellipse(90+25*i,450,18,18);
  }  
}

void gameflow() {
  if (key == ENTER) {
    switch(status) {

    case GAME_START:
      status = GAME_PLAYING_READY;
      break;
          
    case GAME_WIN:
      reset();    
      status = GAME_PLAYING_READY;
      break;
      
    case GAME_LOSE:
      reset();    
      status = GAME_PLAYING_READY;            
      break;
    }
  }

}

void checkWinLose(){
  //win
  if(deadNum >= 50){
    status = GAME_WIN;
  }
  //lose when life = 0
  if(life <= 0){
    status = GAME_LOSE;
    }   
}

void reset(){  
 life=3;
 deadNum=0;
 brickMake(50,10);
// bricks.display(50,10);
}

void keyPressed(){
  gameflow();
}

void mousePressed()
{
   if (mousePressed && (mouseButton == RIGHT)) 
   {
    switch(status) 
      {
    case GAME_PLAYING_READY:
      status = GAME_PLAYING_2;
      break;
      }
    }
}

void brickMake(float num,float col)
  {
  for(int i=0 ; i < bricks.length; i++){    
      int k = int (i /col);
      int p = int (i %col);
      bricks[i]= new Brick(int(115+45*p), int(40+45*k));  
  }
}

void checkBrickDead() 
  {
    for (int i=0; i<=balls.length-1; i++) 
      {
      Ball Aball = balls[i];
      for (int j=0; j<=bricks.length-1; j++) 
        {
        Brick Abricks = bricks[j];
        if (Aball != null && Abricks != null && !Abricks.die) 
           {
           //left rigt up down
           if(Aball.x + 5 >= Abricks.x - 17.5 && Aball.x - 5 <= Abricks.x + 17.5 && 
              Aball.y + 5 >= Abricks.y - 17.5 && Aball.y - 5 <= Abricks.y + 17.5)
              {        
               removeBrick(bricks[j]);                                      
               deadNum ++;
              }                     
            }
        }
     }
  }

void removeBrick(Brick obj) {
  obj.die = true;
  obj.x = 1000;
  obj.y = 1000;
}
