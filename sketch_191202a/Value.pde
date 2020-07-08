public class Value extends Block
{
  String txt;
  String tempTxt;
  
  boolean enteringTxt = false;
  
  private ValueOutput value;
  
  public Value(int x, int y)
  {
    super(x, y, 150, 40);
    value = new ValueOutput(this, 0, 15);
    addOutput(value);
    
    txt = "";
    tempTxt = "";
  }
  
  void draw()
  {
    super.draw();
    
    fill(0);
    
    if(enteringTxt)
    {
      text(tempTxt, (2 * x + w) / 2 - 50 , (2 * y + h) / 2 + 7);
    }
    
    else
    {
      text(txt, (2 * x + w) / 2 - 50, (2 * y + h) / 2 + 7);
    }
  }
  
  void keyPressed()
  {
    if(selected)
    {
      if(key != CODED)
      {
        if(key == ENTER)
        {
          //clear string
          txt = tempTxt;
          tempTxt = "";
          enteringTxt = false;
          value.setValue(txt);
        }
        
        else
        {
          tempTxt += key;
          enteringTxt = true;
        }
      }
    }
  }
  
  public String toText()
  {
    return value.toText();
  }
}
