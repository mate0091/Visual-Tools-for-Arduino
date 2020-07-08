public class DefineNumberBlock extends Block
{
  Input def, prevIns;
  Output nextIns;
  
  public DefineNumberBlock(int x, int y)
  {
    super(x, y, 300, 40);
    def = new Input(this, 250, 15);
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
    text("Define number", middleX() - 130, middleY() + 8);
    
    drawIO();
  }
  
  public String toText()
  {
    if(def.getOutput() == null) return "";
    return "\nint " + def.getOutput().getParent().toText() + "; \n" + nextIns.toText();
  }
}
