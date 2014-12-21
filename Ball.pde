class Ball{
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float size;
  
  void move(){
    x+=xSpeed;
    y+=ySpeed;
    
    if (x<size/2 || x>width-size/2){
      xSpeed *= -1;
    }
    if (y<size/2){
      ySpeed *= -1;
    }
    if (y>height-size/2){
      life = life - 1;
      x = board.x;//the start ball follow the board
      y = board.y-10/2-size/2;
      status = GAME_PLAYING_READY;
    }
    
    float bottom = y+size/2;
    float bl = board.y - 10/2;
    float bLeft = board.x-board.len/2;
    float bRight = board.x+board.len/2;
    if (bottom >= bl && x>bLeft && x<bRight){
        ySpeed *= -1;
        y =y+ySpeed;
    }
   
  }
  void display(){
    ellipse(x,y,size,size);
  }
  
  boolean isHit(
        float circleX,
        float circleY,
        float radius,
        float rectangleX,
        float rectangleY,
        float rectangleWidth,
        float rectangleHeight)
  {
      circleX = this.x;
      circleY = this.y;
      radius = this.size/2;
      rectangleWidth = 35;
      rectangleHeight =35;
      for (int j=0; j<bricks.length-1; j++) {

      }
      
      
      float circleDistanceX = abs(circleX - rectangleX);
      float circleDistanceY = abs(circleY - rectangleY);
   
      if (circleDistanceX > (rectangleWidth/2 + radius)) { return false; }
      if (circleDistanceY > (rectangleHeight/2 + radius)) { return false; }
   
      if (circleDistanceX <= (rectangleWidth/2)) { return true; }
      if (circleDistanceY <= (rectangleHeight/2)) { return true; }
   
      float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
                           pow(circleDistanceY - rectangleHeight/2, 2);
   
      return (cornerDistance_sq <= pow(radius,2));
  }
  
  Ball(){   
    size = 10;
    x = board.x;//the start ball follow the board
    y = board.y-10/2-size/2;
    xSpeed = random(-10,10);
    ySpeed = 5;
    
  }
  
  Ball(float size, float xSpeed){
    x = random(width);
    y = random(height);
    this.xSpeed = xSpeed;
    this.ySpeed = size;
    this.size = size;
  }
}
