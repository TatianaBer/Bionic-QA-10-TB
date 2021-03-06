function Main()
{
  try
  {
    Preconditions();
    ChangeText("knock-knock");
  
  // В качестве переменной функции ChangeText используется произвольный текст (например, "knock-knock"), который будет введен в блокнот
  }
  catch(exception)
  {
    Log.Error("Exception", exception.description);
  }
  Postconditions();
}



function ChangeText(text)
{
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("C:\\Documents and Settings\\Tester\\Desktop\\Test.txt", "Text Documents (*.txt)");     //указан адрес файла созданого в Preconditions
  Aliases.notepad.wndNotepad.Edit.Keys("^a[Del]");
  Aliases.notepad.wndNotepad.Edit.Keys(text);
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save");
  Aliases.notepad.wndNotepad.Close();
  Delay (100);
  TestedApps.notepad.Run();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("C:\\Documents and Settings\\Tester\\Desktop\\Test.txt", "Text Documents (*.txt)");   //указан адрес файла созданого в Precondition
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, text, false);
  Aliases.notepad.wndNotepad.Close();
  Delay(500); 
}


function Preconditions()
{
  var  notepad;
  var  wndNotepad;
  var  dlgSaveAs;
  TestedApps.notepad.Run();
  notepad = Aliases.notepad;
  wndNotepad = notepad.wndNotepad;
  wndNotepad.MainMenu.Click("File|New");
  wndNotepad.Edit.Keys("![ReleaseLast]Done");
  wndNotepad.MainMenu.Click("File|Save As...");
  dlgSaveAs = notepad.dlgSaveAs;
  dlgSaveAs.SaveFile("C:\\Documents and Settings\\Tester\\Desktop\\Test.txt", "Text Documents (*.txt)");   //адрес создаваемого файла
  wndNotepad.Close();
  Delay(500);
}

   


function Postconditions()
{
  var  explorer;
  var  folderView;
  

  NameMapping.Sys.Keys("[Hold][Win]m[Release]");
 
  explorer = Aliases.Explorer;
  Delay(500);
  folderView = explorer.wndProgman.SHELLDLL_DefView.FolderView;
  folderView.ClickItem("Test", 0);
  folderView.Keys("![Del]");
  explorer.dlgConfirmFileDelete.btnYes.ClickButton();
  
}




