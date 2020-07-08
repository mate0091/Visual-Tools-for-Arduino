public class LoopBlock extends Block
{
  protected Output out;
  
  public LoopBlock()
  {
    super(200, 30, 70, 70);
    
    out = new Output(this, 20, 50);
    super.addOutput(out);
  }
  
  public void draw()
  {
    super.draw();
    fill(0);
    text("Loop", (2 * x + w) / 2 - 30, (2 * y + h) / 2 - 10);
  }
  
  public String toText()
  {
    if(out.getInputs().size() == 0) return "";
    return "\nvoid loop {" + out.toText() + "\n}\n";
  }
}
