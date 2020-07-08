public class WhileBlock extends Block
{
  Input ifCond;
  Output thenAction;
  Input prevIns;
  Output nextIns;
  
  public WhileBlock(int x, int y)
  {
    super(x, y, 170, 40);
    
    ifCond = new Input(this, 70, 15);
    thenAction = new Output(this, 150, 15);
    prevIns = new Input(this, 5, 5);
    nextIns = new Output(this, 5, 25);
    addInput(ifCond);
    addOutput(thenAction);
    addInput(prevIns);
    addOutput(nextIns);
  }
  
  public void draw()
  {
    drawBox();
    fill(0);
    text("While", middleX() - 65, middleY() + 8);
    text("do", middleX() + 25, middleY() + 8);
    
    drawIO();
  }
  
  public String toText()
  {
    if(ifCond.getOutput() == null || thenAction.getInputs().size() == 0) return "";
    
    return "\nwhile(" + ifCond.getOutput().getParent().toText() + ")\n{\n" + thenAction.toText() + "}\n" + nextIns.toText();
  }
}
