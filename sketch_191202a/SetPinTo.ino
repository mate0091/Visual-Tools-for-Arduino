public class SetPinToBlock extends Block
{
  Input def, prevIns;
  Output nextIns;
  
  String txt = "";
  
  public SetPinToBlock(int x, int y, char type)
  {
    super(x, y, 200, 40);
    
    if(type == 'h')
    {
      txt = "HIGH";
    }
    
    else
    {
      txt = "LOW";
    }
    
    def = new Input(this, 85, 15);
    prevIns = new Input(this, 5, 5);
    nextIns = new Output(this, 5, 25);
    addInput(prevIns);
    addInput(def);
    addOutput(nextIns);
  }
  
  public void draw()
  {
    drawBox();
    fill(0);
    text("Set pin", middleX() - 80, middleY() + 8);
    text("to " + txt, middleX() + 10, middleY() + 8);
    
    drawIO();
  }
  
  public String toText()
  {
    if(def.getOutput() == null) return "";
    return "\ndigitalWrite(" + def.getOutput().getParent().toText() + ", " + txt + "); \n" + nextIns.toText();
  }
}
