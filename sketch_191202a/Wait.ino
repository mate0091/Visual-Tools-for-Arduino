public class WaitBlock extends Block
{
  Input val;
  Input prevIns;
  Output nextIns;
  
  public WaitBlock(int x, int y)
  {
    super(x, y, 140, 40);
    
    val = new Input(this, 90, 15);
    prevIns = new Input(this, 5, 5);
    nextIns = new Output(this, 5, 25);
    addInput(val);
    addInput(prevIns);
    addOutput(nextIns);
  }
  
  public void draw()
  {
    drawBox();
    fill(0);
    text("Wait for", middleX() - 50, middleY() + 8);
    text("ms", middleX() + 45, middleY() + 8);
    
    drawIO();
  }
  
  public String toText()
  {
    return "\ndelay(" + val.getOutput().getParent().toText() +"); \n" + nextIns.toText();
  }
}
