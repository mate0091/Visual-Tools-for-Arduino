ArrayList<Block> blocks;

Block setup, loop, root;

Block currentSelected;

boolean insideObj = false;

PrintWriter outputFile;

void setup()
{
  blocks = new ArrayList<Block>();
  size(800, 600);
  textSize(16);
  
  setup = new SetupBlock();
  loop = new LoopBlock();
  root = new RootBlock();
  
  blocks.add(root);
  blocks.add(setup);
  blocks.add(loop);
}

void draw()
{
  background(220);
  
  if(blocks.size() != 0)
  {
    for(Block i : blocks)
    {
      i.draw();
      
      if(i.isMouseOver())
      {
        currentSelected = i;
      }
      
      else
      {
        i.setSelectedBlock(currentSelected);
      }
    }
  }
  
  if(blocks.size() != 0)
  {
    for(Block i : blocks)
    {
      for(Output o : i.getOutputs())
      {
        o.drawLines();
      }
    }
  }
}

void mousePressed()
{
  boolean flag = false;
  //deselect everything
  if(blocks.size() != 0)
  {
    for(Block i : blocks)
    {
      if(currentSelected != null)
      {
        if(i != currentSelected)
        {
          i.deselect();
        }
      }
    }
  }
  
  //check if inside either object
  
  if(blocks.size() != 0)
  {
    for(Block i : blocks)
    {
      if(i.isMouseOver())
      {
        i.select();
        insideObj = true;
        flag = true;
        currentSelected = i;
      }
      
      else
      {
        i.setSelectedBlock(currentSelected);
      }
    }
  }
  
  if(!flag) 
  {
    insideObj = false;
    
    if(currentSelected != null) currentSelected.deselect();
  }
}

void mouseReleased()
{
  if(blocks.size() != 0)
  {
    for(Block i : blocks)
    {
       i.release();
    }
  }
}

void mouseDragged()
{
  if(blocks.size() != 0)
  {
    for(Block i : blocks)
    {
      if(i.getIsSelected())
      {
        i.drag();
      }
    }
  }
}

void keyPressed()
{
  if(blocks.size() != 0)
  {
    if(key == DELETE)
    {
       if(currentSelected != null) 
       {
         currentSelected.delete();
         
         if(currentSelected.getIsDeleted())
         {
           blocks.remove(currentSelected);
         }
       }
    }
    
    else if(!insideObj)
    {
      if(key == 'n') blocks.add(new DefineNumberBlock(mouseX, mouseY));
      else if(key == 'v') blocks.add(new Value(mouseX, mouseY));
      else if(key == 'b') blocks.add(new DefineBooleanBlock(mouseX, mouseY));
      else if(key == 'a') blocks.add(new AssignBlock(mouseX, mouseY));
      else if(key == 'c') blocks.add(new CombinerBlock(mouseX, mouseY));
      else if(key == 'i' || key == 'o') blocks.add(new SetPinAsBlock(mouseX, mouseY, key));
      else if(key == 'h' || key == 'l') blocks.add(new SetPinToBlock(mouseX, mouseY, key));
      else if(key == 's') blocks.add(new InitSerialBlock(mouseX, mouseY));
      else if(key == 'p') blocks.add(new PrintBlock(mouseX, mouseY));
      else if(key == 'w') blocks.add(new WaitBlock(mouseX, mouseY));
      else if(key == 'u') blocks.add(new UnaryOpBlock(mouseX, mouseY));
      else if(key == 'r') blocks.add(new ReadBlock(mouseX, mouseY));
      else if(key == 'I') blocks.add(new IfBlock(mouseX, mouseY));
      else if(key == 'W') blocks.add(new WhileBlock(mouseX, mouseY));
      else if(key == 'g') 
      {
        outputFile = createWriter("sketch.ino");
        outputFile.print(root.toText() + setup.toText() + loop.toText());
        print(root.toText() + setup.toText() + loop.toText());
        outputFile.flush();
      }
    }
    
    else
    {
      for(Block i : blocks)
      {
        if(i.getIsSelected())
        {
          i.keyPressed();
        }
      }
    }
  }
}
