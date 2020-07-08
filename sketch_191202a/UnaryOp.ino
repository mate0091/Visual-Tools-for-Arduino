public class UnaryOpBlock extends Block
{
  Input a;
  Output out;
  String op = "";
  String opTemp = "";
  boolean enteringText = false;
  
  public UnaryOpBlock(int x, int y)
  {
    super(x, y, 50, 50);
    a = new Input(this, 20, 0);
    out = new Output(this, 20, 40);
    
    addInput(a);
    addOutput(out);
  }
  
   public void draw()
  {
    drawBox();
    fill(0);
    
    if(enteringText)
    {
      text(opTemp, middleX() - 15 , middleY() + 7);
    }
    
    else
    {
      text(op, middleX() - 15, middleY() + 7);
    }
    
    drawIO();
  }
  
  void keyPressed()
  {
    if(selected)
    {
      if(key != CODED)
      {
        if(key == ENTER)
        {
          //clear string
          op = opTemp;
          opTemp = "";
          enteringText = false;
        }
        
        else
        {
          opTemp += key;
          enteringText = true;
        }
      }
    }
  }
  
  public String toText()
  {
    if(a.getOutput() == null) return "";
    return "(" + op + "(" + a.getOutput().getParent().toText() + "))";
  }
}
