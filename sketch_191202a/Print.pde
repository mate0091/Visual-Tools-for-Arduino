public class PrintBlock extends Block
{
  Input val;
  Input prevIns;
  Output nextIns;
  
  public PrintBlock(int x, int y)
  {
    super(x, y, 70, 40);
    
    val = new Input(this, 60, 15);
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
    text("Print", middleX() - 17, middleY() + 8);
    
    drawIO();
  }
  
  public String toText()
  {
    if(val.getOutput() == null) return "";
    return "\nSerial.print(" + val.getOutput().getParent().toText() +"); \n" + nextIns.toText();
  }
}
