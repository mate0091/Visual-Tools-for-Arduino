public class RootBlock extends Block
{
  protected Output out;
  
  public RootBlock()
  {
    super(400, 30, 70, 70);
    
    out = new Output(this, 20, 50);
    super.addOutput(out);
  }
  
  public void draw()
  {
    super.draw();
    fill(0);
    text("Root", (2 * x + w) / 2 - 30, (2 * y + h) / 2 - 10);
  }
  
  public String toText()
  {
    if(out.getInputs().size() == 0) return "";
    return out.toText();
  }
}
