function Main()
{
  try
  {
   
    preparation();
    
    // Создаем пять ордеров
    newOrder ("Red Ben", 2, "7/12/2014");
    newOrder ("Black Ben", 3, "7/11/2014");  
    newOrder ("Green Ben", 4, "7/10/2014");  
    newOrder ("White Ben", 5, "7/9/2014");  
    newOrder ("Snow Ben", 6, "7/8/2014");  
   
    // Вносим изменения во все пять ордеров
    editOrder("Red Ben", 2, "Rick Sent");
    editOrder("Black Ben", 3, "Dick Sent");
    editOrder("Green Ben", 4, "Rick Went");
    editOrder("White Ben", 5, "Dick Went");
    editOrder("Snow Ben", 6, "Rick Cent");
    
    // Удаляем все пять ордеров
    deliteOrder ("Rick Sent", "7/12/2014");
    deliteOrder ("Dick Sent", "7/11/2014");
    deliteOrder ("Rick Went", "7/10/2014");
    deliteOrder ("Dick Went", "7/9/2014");
    deliteOrder ("Rick Cent", "7/8/2014");
   
    cleanup ();
  }
  catch(exception)
  {
    Log.Error("Exception", exception.description);
  }
}







  function preparation() // Запуск приложения
  {
    TestedApps.Orders.Run();
  }

 
  function newOrder (name, quantity, data)   // Создание нового ордера
  { 
    var  orders;    
    var  mainForm;   
    var  orderForm;
    var  groupBox;   
    var  numericUpDown;
    var  upDownEdit;
    var  button; 
    var  textBox;
    var  textBox2;   
    
    orders = Aliases.Orders;
    mainForm = orders.MainForm;
    mainForm.MainMenu.Click("Orders|New order...");
    orderForm = orders.OrderForm;
    groupBox = orderForm.Group;
    groupBox.ProductNames.ClickItem("FamilyAlbum");
    numericUpDown = groupBox.Quantity;
    upDownEdit = numericUpDown.UpDownEdit;
    upDownEdit.Click(15, 8);
    upDownEdit.wText = "";
    numericUpDown.wValue = quantity;
    dateTimePicker = groupBox.Date;
    dateTimePicker.wDate = data;
    textBox = groupBox.Customer;
    textBox.Click(20, 11);
    textBox.wText = name;
    textBox2 = groupBox.Street;
    textBox2.Click(76, 9);
    textBox2.wText = "Street";
    textBox2 = groupBox.City;
    textBox2.Click(16, 10);
    textBox2.wText = "City";
    textBox2 = groupBox.State;
    textBox2.Click(42, 10);
    textBox2.wText = "State";
    textBox2 = groupBox.Zip;
    textBox2.Click(41, 12);
    textBox2.wText = "Zip";
    groupBox.MasterCard.ClickButton();
    textBox2 = groupBox.CardNo;
    textBox2.Click(43, 13);
    textBox2.wText = "1111111111111111";
    groupBox.ExpDate.wDate = "4/11/2015";
    button = orderForm.ButtonOK;
    button.ClickButton();
    aqObject.CompareProperty(Aliases.Orders.MainForm.OrdersView.wSelectedItems, cmpEqual, name, false);
    Delay(100);
  }
  
  
  function editOrder(name, quantity, newName)    // Редактирование ордера
  {
    var  listView;   
    var  orders;    
    var  mainForm;  
    var  orderForm;
    var  button; 
    var  groupBox;
    var  textBox;
       
      
    
    orders = Aliases.Orders;
    mainForm = orders.MainForm;
    orderForm = orders.OrderForm;
    button = orderForm.ButtonOK;  
    groupBox = orderForm.Group;
    textBox = groupBox.Customer;
    
    listView = mainForm.OrdersView;
    listView.ClickItem(name, quantity);
    mainForm.MainMenu.Click("Orders|Edit order...");
    textBox.Click(72, 16);
    textBox.Drag(72, 16, -72, -14);
    textBox.wText = newName;
    button.ClickButton();
    aqObject.CompareProperty(Aliases.Orders.MainForm.OrdersView.wSelectedItems, cmpEqual, newName, false);
  }
  
  
  function deliteOrder (newName, data) // Удаления ордера
  {
    var  orders;
    var  listView;
  
    orders = Aliases.Orders;
    listView = orders.MainForm.OrdersView;
    listView.ClickItemR(newName, data);
    listView.PopupMenu.Click("Delete order");
    orders.dlgConfirmation.btnYes.ClickButton();
    Delay (100);
 }
  




  function cleanup() // Закритие приложения
  {
    var  orders;
    orders = Aliases.Orders;
    orders.MainForm.Close();
    orders.dlgConfirmation.btnNo.ClickButton();
  }

   function newOrder5 ()     // Отдельная функция, создающая 5 ордеров. 
                                                 
   {
    newOrder ("Red Ben", 2, "7/12/2014");
    newOrder ("Black Ben", 3, "7/11/2014");  
    newOrder ("Green Ben", 4, "7/10/2014");  
    newOrder ("White Ben", 5, "7/9/2014");  
    newOrder ("Snow Ben", 6, "7/8/2014");  
   
   }
   
   function editOrder5() //  Отдельная функция, корректирующая 5 ордеров.
   {
    editOrder("Red Ben", 2, "Rick Sent");
    editOrder("Black Ben", 3, "Dick Sent");
    editOrder("Green Ben", 4, "Rick Went");
    editOrder("White Ben", 5, "Dick Went");
    editOrder("Snow Ben", 6, "Rick Cent");
   }
   
   
   function deliteOrder5 () // Отдельная функция, удаляющая 5 ордеров.
   {
    deliteOrder ("Rick Sent", "7/12/2014");
    deliteOrder ("Dick Sent", "7/11/2014");
    deliteOrder ("Rick Went", "7/10/2014");
    deliteOrder ("Dick Went", "7/9/2014");
    deliteOrder ("Rick Cent", "7/8/2014");
   }
  
