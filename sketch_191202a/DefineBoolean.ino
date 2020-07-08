public class DefineBooleanBlock extends Block
{
  Input def, prevIns;
  Output nextIns;
  
  public DefineBooleanBlock(int x, int y)
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
    text("Define boolean", middleX() - 130, middleY() + 8);
    
    drawIO();
  }
  
  public String toText()
  {
    if(def.getOutput() == null) return "";
    return "\nbool " + def.getOutput().getParent().toText() + "; \n" + nextIns.toText();
  }
}
