public class InitSerialBlock extends Block
{
  Input prevIns;
  Output nextIns;
  
  public InitSerialBlock(int x, int y)
  {
    super(x, y, 100, 40);
    
    prevIns = new Input(this, 5, 5);
    nextIns = new Output(this, 5, 25);
    addInput(prevIns);
    addOutput(nextIns);
  }
  
  public void draw()
  {
    drawBox();
    fill(0);
    text("Init Serial", middleX() - 30, middleY() + 8);
    
    drawIO();
  }
  
  public String toText()
  {
    return "\nSerial.begin(9600); \n" + nextIns.toText();
  }
}
