public class Block implements ITextProducer
{
  ArrayList<Input> inputs;
  ArrayList<Output> outputs;
  
  protected int x, y, w, h;
  protected boolean selected;
  protected int xoffset, yoffset;
  
  protected color col;
  
  protected boolean isDragging = false;
  
  protected Block selectedBlock;
  
  protected Output draggingOutput;
  
  protected boolean isDeleted = false;
  
  public Block(int x, int y, int w, int h)
  {
    this.inputs = new ArrayList<Input>();
    this.outputs = new ArrayList<Output>();
    this.selected = false;
    
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    this.xoffset = 0;
    this.yoffset = 0;
    
    this.col = color(255);
  }
  
  public void addInput(Input in)
  {
    this.inputs.add(in);
  }
  
  public void addOutput(Output out)
  {
    this.outputs.add(out);
  }
  
  public void setColor(int col)
  {
    this.col = col;
  }
  
  public String toText()
  {
    return "";
  }
  
  public void select()
  {
    if(hasOutputs())
    {
      if(selectedOutput() != null)
      {
        draggingOutput = selectedOutput();
        selected = false;
        isDragging = true;
      }
      
      else
      {
        selected = true;
        xoffset = mouseX - x;
        yoffset = mouseY - y;
      }
    }
  }
  
  public void deselect()
  {
    selected = false;
  }
  
  public boolean getIsSelected()
  {
    return this.selected;
  }
  
  public boolean isMouseOver()
  {
    //if is inside an input or output, draw a line and 
    if(mouseX > this.x && mouseX < this.x + this.w && mouseY > this.y && mouseY < this.y + this.h) return true;
    return false;
  }
  
  public void draw()
  {
    drawBox();
    
    drawIO();
  }
  
  protected void drawBox()
  {
    if (this.selected) stroke(0);
    else if(this.isMouseOver()) stroke(125);
    else stroke(255);
    
    fill(this.col);
    
    rect(x, y, w, h);
  }
  
  protected void drawIO()
  {
    if(hasInputs())
    for(Input i : inputs) i.draw();
    
    if(hasOutputs())
    for(Output o : outputs) o.draw();
  }
  
  public void release()
  {
    if(isDragging)
    {
      Input i = selectedBlock.selectedInput();
      
      if(i != null)
      {
        draggingOutput.addInput(i);
        i.setOutput(draggingOutput);
      }
      
      isDragging = false;
    }
  }
  
  public void drag()
  {
    if(selected)
    {
      x = mouseX - xoffset;
      y = mouseY - yoffset;
    }
  }
  
  public Output selectedOutput()
  {
    for(Output o : outputs)
    {
      if(o.insideArea()) return o;
    }
    
    return null;
  }
  
  public Input selectedInput()
  {    
    for(Input i : inputs)
    {
      if(i.insideArea()) return i;
    }
    
    return null;
  }
  
  public void keyPressed(){}
  
  int getX() {return this.x;}
  int getY() {return this.y;}
  
  ArrayList<Input> getInputs()
  {
    return inputs;
  }
  
  ArrayList<Output> getOutputs()
  {
    return outputs;
  }
  
  boolean hasInputs()
  {
    return !inputs.isEmpty();
  }
  
  boolean hasOutputs()
  {
    return !outputs.isEmpty();
  }
  
  public void setSelectedBlock(Block b)
  {
    this.selectedBlock = b;
  }
  
  public void delete()
  {
    Input in = selectedInput();
    Output out = selectedOutput();
    
    if(in != null)
    {
      print("Got here");
    }
    
    else if(out != null)
    {
      out.removeInputs();
    }
    
    else
    {
      isDeleted = true;
    }
  }
  
  public boolean getIsDeleted()
  {
    return isDeleted;
  }
  
  protected int middleX()
  {
    return (2 * x + w) / 2;
  }
  
  protected int middleY()
  {
    return (2 * y + h) / 2;
  }
}
