public class IfBlock extends Block
{
  Input ifCond;
  Output thenAction, elseAction;
  Input prevIns;
  Output nextIns;
  
  public IfBlock(int x, int y)
  {
    super(x, y, 170, 40);
    
    ifCond = new Input(this, 40, 15);
    thenAction = new Output(this, 100, 15);
    elseAction = new Output(this, 150, 15);
    prevIns = new Input(this, 5, 5);
    nextIns = new Output(this, 5, 25);
    addInput(ifCond);
    addOutput(thenAction);
    addOutput(elseAction);
    addInput(prevIns);
    addOutput(nextIns);
  }
  
  public void draw()
  {
    drawBox();
    fill(0);
    text("If", middleX() - 65, middleY() + 8);
    text("then", middleX() - 25, middleY() + 8);
    text("else ", middleX() + 30, middleY() + 8);
    
    drawIO();
  }
  
  public String toText()
  {
    if(ifCond.getOutput() == null || thenAction.getInputs().size() == 0) return "";
    
    String txt = "\nif(" + ifCond.getOutput().getParent().toText() + ")\n{\n" + thenAction.toText() + "}\n";
    
    if(elseAction.getInputs().size() == 0) return txt + nextIns.toText();
    
    return txt + "\nelse{\n" + elseAction.toText() + "}\n" + nextIns.toText();
  }
}
