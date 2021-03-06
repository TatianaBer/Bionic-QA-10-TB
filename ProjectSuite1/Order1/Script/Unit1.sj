function Main()
{
  try
  {
   
    preparation();
    
    // Создаем пять ордеров
    
    NewOrders();
    
 
    // Вносим изменения во все пять ордеров
    
    EditOrders();

    
    // Удаляем все ордера
    deliteAllOrders ();
   
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

 
//  function newOrder (name, quantity, data)   // Создание нового ордера
//  { 
//    var  orders;    
//    var  mainForm;   
//    var  orderForm;
//    var  groupBox;   
//    var  numericUpDown;
//    var  upDownEdit;
//    var  button; 
//    var  textBox;
//    var  textBox2;   
//    
//    orders = Aliases.Orders;
//    mainForm = orders.MainForm;
//    mainForm.MainMenu.Click("Orders|New order...");
//    orderForm = orders.OrderForm;
//    groupBox = orderForm.Group;
//    groupBox.ProductNames.ClickItem("FamilyAlbum");
//    numericUpDown = groupBox.Quantity;
//    upDownEdit = numericUpDown.UpDownEdit;
//    upDownEdit.Click(15, 8);
//    upDownEdit.wText = "";
//    numericUpDown.wValue = quantity;
//    dateTimePicker = groupBox.Date;
//    dateTimePicker.wDate = data;
//    textBox = groupBox.Customer;
//    textBox.Click(20, 11);
//    textBox.wText = name;
//    textBox2 = groupBox.Street;
//    textBox2.Click(76, 9);
//    textBox2.wText = "Street";
//    textBox2 = groupBox.City;
//    textBox2.Click(16, 10);
//    textBox2.wText = "City";
//    textBox2 = groupBox.State;
//    textBox2.Click(42, 10);
//    textBox2.wText = "State";
//    textBox2 = groupBox.Zip;
//    textBox2.Click(41, 12);
//    textBox2.wText = "Zip";
//    groupBox.MasterCard.ClickButton();
//    textBox2 = groupBox.CardNo;
//    textBox2.Click(43, 13);
//    textBox2.wText = "1111111111111111";
//    groupBox.ExpDate.wDate = "4/11/2015";
//    button = orderForm.ButtonOK;
//    button.ClickButton();
//    aqObject.CompareProperty(Aliases.Orders.MainForm.OrdersView.wSelectedItems, cmpEqual, name, false);
//    Delay(100);
//  }
//  
//  
//  function editOrder(name, quantity, newName)    // Редактирование ордера
//  {
//    var  listView;   
//    var  orders;    
//    var  mainForm;  
//    var  orderForm;
//    var  button; 
//    var  groupBox;
//    var  textBox;
//       
//      
//    
//    orders = Aliases.Orders;
//    mainForm = orders.MainForm;
//    orderForm = orders.OrderForm;
//    button = orderForm.ButtonOK;  
//    groupBox = orderForm.Group;
//    textBox = groupBox.Customer;
//    
//    listView = mainForm.OrdersView;
//    listView.ClickItem(name, quantity);
//    mainForm.MainMenu.Click("Orders|Edit order...");
//    textBox.Click(72, 16);
//    textBox.Drag(72, 16, -72, -14);
//    textBox.wText = newName;
//    button.ClickButton();
//    aqObject.CompareProperty(Aliases.Orders.MainForm.OrdersView.wSelectedItems, cmpEqual, newName, false);
//  }
//  
  
  function deliteOrder () // Удаления ордера
  {
    var  orders;
    var  listView;
  
    orders = Aliases.Orders;
    listView = orders.MainForm.OrdersView;
    listView.ClickItemR(0);
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

//   function newOrder5 ()     // Отдельная функция, создающая 5 ордеров. 
//                                                 
//   {
//    newOrder ("Red Ben", 2, "7/12/2014");
//    newOrder ("Black Ben", 3, "7/11/2014");  
//    newOrder ("Green Ben", 4, "7/10/2014");  
//    newOrder ("White Ben", 5, "7/9/2014");  
//    newOrder ("Snow Ben", 6, "7/8/2014");  
//   
//   }
//   
//   function editOrder5() //  Отдельная функция, корректирующая 5 ордеров.
//   {
//    editOrder("Red Ben", 2, "Rick Sent");
//    editOrder("Black Ben", 3, "Dick Sent");
//    editOrder("Green Ben", 4, "Rick Went");
//    editOrder("White Ben", 5, "Dick Went");
//    editOrder("Snow Ben", 6, "Rick Cent");
//   }
//   
   
   function deliteAllOrders () // Отдельная функция, удаляющая все ордера.
   {
    while(Aliases.Orders.MainForm.OrdersView.ItemCount!=0)
    deliteOrder ();
    
   }
   


  function NewOrders()
{

  var mainForm = Aliases.Orders.MainForm;
  var orderForm = Aliases.Orders.OrderForm;
  var filePath = Files.FileNameByName("DOC.txt");
  var driver = DDT.CSVDriver(filePath);
  var k = Project.Variables.RecordCounter;
  
  while (!driver.EOF())
  {
    mainForm.MainMenu.click("Orders|New order...");
    
    Aliases.Orders.OrderForm.Group.ProductNames.ClickItem(driver.Value(0));
    Aliases.Orders.OrderForm.Group.Quantity.wValue = driver.Value(1); 
    Aliases.Orders.OrderForm.Group.Discount.wText = driver.Value(3);

    Aliases.Orders.OrderForm.Group.Date.wDate = driver.Value(4);
    Aliases.Orders.OrderForm.Group.Customer.wText = driver.Value(5);
    Aliases.Orders.OrderForm.Group.Street.wText = driver.Value(6);
    Aliases.Orders.OrderForm.Group.State.wText =  driver.Value(7);
    Aliases.Orders.OrderForm.Group.City.wText = driver.Value(8);
    Aliases.Orders.OrderForm.Group.Zip.wText = driver.Value(9);

    
    Aliases.Orders.OrderForm.Group.MasterCard.Click();
       
    
    Aliases.Orders.OrderForm.Group.CardNo.wText = driver.Value(10);
    Aliases.Orders.OrderForm.Group.ExpDate.wDate = driver.Value(11);
    orderForm.ButtonOK.ClickButton();
    driver.Next();

  }
  Log.Message(k)
  driver = DDT.CSVDriver(filePath);
  

  for (i=0;i<k;i++)
  {  
    mainForm.OrdersView.SelectItem(i);
    Delay(1000);
    if(mainForm.OrdersView.FocusedItem.Text.OleValue != driver.Value(5))
      Log.Error("The property value does not equal the baseline value.");
    else
      Log.Message("OK");
    driver.Next();        
  }
  Log.Message(k);
}



function EditOrders()
{

  var mainForm = Aliases.Orders.MainForm; 
  var orderForm = Aliases.Orders.OrderForm; 
  var filePath = Files.FileNameByName("Doc2.txt");
  var driver = DDT.CSVDriver(filePath);
  var k = Aliases.Orders.MainForm.OrdersView.itemCount; 
  var i = 0;


  for (i=0;i<k;i++) 
  {
    Log.Message("Ok");
    mainForm.OrdersView.SelectItem(i);
    mainForm.MainMenu.Click("Orders|Edit order...");
    Aliases.Orders.OrderForm.Group.Customer.wText = driver.Value(0);
    orderForm.ButtonOK.ClickButton();
    driver.Next();            
  } 
  driver = DDT.CSVDriver(filePath);
  

  for (i=0;i<k;i++)
  {  
    mainForm.OrdersView.SelectItem(i);
    Delay(1000);
    if(mainForm.OrdersView.FocusedItem.Text.OleValue != driver.Value(0))
      Log.Error("The property value does not equal the baseline value.");
    else
      Log.Message("OK");
    driver.Next();        
  }
         
}