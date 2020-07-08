public class Input extends Connection
{
  protected Output out;
  
  public Input(Block parent, int xoffset, int yoffset)
  {
    super(parent, xoffset, yoffset);
  }
  
  public void draw()
  {
    super.draw();
    
    stroke(0, 0, 255);
    fill(0, 0, 255);
    rect(x, y, w, h);
  }
  
  public void setOutput(Output out)
  {
    this.out = out;
  }
  
  public Output getOutput()
  {
    return out;
  }
  
  public void removeOutput()
  {
    out = null;
  }
  
  public String toText()
  {
    return "";
  }
}
