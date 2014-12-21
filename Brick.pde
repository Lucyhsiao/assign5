class Brick
{
  float x;
  float y;
  float size=35;
  boolean die = false;
  

  
  void display()
    {
    stroke(255,0,0);
    rectMode(CENTER);
    rect(this.x,this.y,this.size,this.size,7);
    }
    
  Brick(float x,float y)
    {
     this.x=x;
     this.y=y;
     this.size=35;
    }
}
