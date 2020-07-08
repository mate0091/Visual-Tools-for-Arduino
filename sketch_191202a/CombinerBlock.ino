public class CombinerBlock extends Block
{
  Input a, b;
  Output out;
  String op = "";
  String opTemp = "";
  boolean enteringText = false;
  
  public CombinerBlock(int x, int y)
  {
    super(x, y, 50, 50);
    a = new Input(this, 0, 0);
    b = new Input(this, 40, 0);
    out = new Output(this, 20, 40);
    
    addInput(a);
    addInput(b);
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
    if(a.getOutput() == null || b.getOutput() == null) return "";
    return "(" + a.getOutput().getParent().toText() + " " + op + " " + b.getOutput().getParent().toText() + ")";
  }
}
