public class Connection implements ITextProducer
{
  protected Block parent;
  protected int x, y, w, h;
  protected int xoffset, yoffset;
  
  protected boolean deleted = false;
  
  public Connection(Block parent, int xoffset, int yoffset)
  {
    this.parent = parent;
    this.x = this.parent.getX() + xoffset;
    this.y = this.parent.getY() + yoffset;
    this.w = 10;
    this.h = 10;
    this.xoffset = xoffset;
    this.yoffset = yoffset;
  }
  
  public String toText()
  {
    return "";
  }
  
  public void draw()
  {
     this.x = this.parent.getX() + xoffset;
     this.y = this.parent.getY() + yoffset;
  }
  
  public boolean insideArea()
  {
    //if is inside an input or output, draw a line and 
    if(mouseX > this.x && mouseX < this.x + this.w && mouseY > this.y && mouseY < this.y + this.h) return true;
    return false;
  }
  
  public int getX() {return x;}
  public int getY() {return y;}
  public int getWidth() {return w;}
  public int getHeight() {return h;}
  
  public void setPosition(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  public Block getParent()
  {
    return parent;
  }
}
