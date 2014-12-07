function Main()
{
  try
  {
    
    ChangeText("knock-knock");
  
  // В качестве переменной функции ChangeText используется произвольный текст (например, "knock-knock"), который будет введен в блокнот
  }
  catch(exception)
  {
    Log.Error("Exception", exception.description);
  }
}



function ChangeText(text)
{
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("C:\\Documents and Settings\\Tester\\Desktop\\DOC.txt", "Text Documents (*.txt)");
  Aliases.notepad.wndNotepad.Edit.Keys("^a[Del]");
  Aliases.notepad.wndNotepad.Edit.Keys(text);
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save");
  Aliases.notepad.wndNotepad.Close();
  Delay (100);
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("C:\\Documents and Settings\\Tester\\Desktop\\DOC.txt", "Text Documents (*.txt)");
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, text, false);
  Aliases.notepad.wndNotepad.Close();
}
