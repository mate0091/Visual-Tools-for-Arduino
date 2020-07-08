public class SetupBlock extends Block
{
  protected Output o;
  
  public SetupBlock()
  {
    super(30, 30, 70, 70);
    
    o = new Output(this, 20, 50);
    addOutput(o);
  }
  
  public void draw()
  {
    super.draw();
    fill(0);
    text("Setup", (2 * x + w) / 2 - 30, (2 * y + h) / 2 - 10);
  }
  
  public String toText()
  {
    if(o.getInputs().size() == 0) return "";
    return "void setup() {" + o.toText() + "} ";
  }
}
