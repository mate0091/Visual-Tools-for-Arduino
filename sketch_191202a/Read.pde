public class ReadBlock extends Block
{
  Input val1, val2;
  Input prevIns;
  Output nextIns;
  
  public ReadBlock(int x, int y)
  {
    super(x, y, 170, 40);
    
    val1 = new Input(this, 95, 15);
    val2 = new Input(this, 155, 15);
    prevIns = new Input(this, 5, 5);
    nextIns = new Output(this, 5, 25);
    addInput(val1);
    addInput(val2);
    addInput(prevIns);
    addOutput(nextIns);
  }
  
  public void draw()
  {
    drawBox();
    fill(0);
    text("Read pin", middleX() - 65, middleY() + 8);
    text("into", middleX() + 30, middleY() + 8);
    
    drawIO();
  }
  
  public String toText()
  {
    if(val1.getOutput() == null || val2.getOutput() == null) return "";
    return "\n" + val2.getOutput().getParent().toText() + " = digitalRead(" + val1.getOutput().getParent().toText() +"); \n" + nextIns.toText();
  }
}
