public class ValueOutput extends Output
{
  String value;
  
  public ValueOutput(Block parent, int xoffset, int yoffset)
  {
    super(parent, xoffset, yoffset);
  }
  
  public void setValue(String value)
  {
    this.value = value;
  }
  
  public String toText()
  {
    return value;
  }
}
