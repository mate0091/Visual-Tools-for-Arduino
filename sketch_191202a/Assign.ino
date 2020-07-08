public class AssignBlock extends Block
{
  Input var, value, prevIns;
  Output nextIns;
  
  public AssignBlock(int x, int y)
  {
    super(x, y, 150, 40);
    var = new Input(this, 100, 15);
    value = new Input(this, 130, 15);
    prevIns = new Input(this, 5, 5);
    nextIns = new Output(this, 5, 25);
    addInput(prevIns);
    addInput(var);
    addInput(value);
    addOutput(nextIns);
  }
  
   public void draw()
  {
    drawBox();
    fill(0);
    text("Assign ", middleX() - 50, middleY() + 8);
    
    drawIO();
  }
  
  public String toText()
  {
    if(var.getOutput() == null || value.getOutput() == null) return "";
    return var.getOutput().getParent().toText() + " = " + value.getOutput().getParent().toText() + ";\n" + nextIns.toText();
  }
}
