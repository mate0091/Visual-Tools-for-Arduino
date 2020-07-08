public class Output extends Connection
{
  protected ArrayList<Input> inputs;
  
  public Output(Block parent, int xoffset, int yoffset)
  {
    super(parent, xoffset, yoffset);
    this.inputs = new ArrayList<Input>();
    this.y = this.parent.getY() + 40;
  }
  
  public void draw()
  { 
    super.draw();
    
    stroke(255, 0, 0);
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
  
  public void addInput(Input in)
  {
    if(!inputs.contains(in)) this.inputs.add(in);
  }
  
  public ArrayList<Input> getInputs()
  {
    return inputs;
  }
  
  public void drawLines()
  {
    if(inputs.size() > 0)
    {
      stroke(0);
      fill(0);
      
      for(Input in : inputs)
      {
        if(in != null) line((2 * x + w) / 2, (2 * y + h) / 2, (2 * in.getX() + in.getWidth()) / 2, (2 * in.getY() + in.getHeight()) / 2);
      }
    }
  }
  
  public String toText()
  {
    String text = "";
    
    if(inputs.size() > 0)
    {
      for(Input i : inputs)
      {
        if(i != null) text += i.parent.toText();
      }
    }
    
    return text;
  }
  
  public void removeInputs()
  {
    inputs.clear();
  }
}
