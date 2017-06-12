<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
    
    <!-- Beginning of head -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <title>Title</title>
        
        <!-- Bootstrap and jQuery-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.1/themes/base/jquery-ui.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="http://www.google.com/jsapi" type="text/javascript"></script>
        <script type="text/javascript" >
               google.load("jquery", "1.6.3");
               google.load("jqueryui", "1.8.16");
               $(init);
        </script>
        
        <!--Framework CSS -->
        <link rel="stylesheet" type="text/css" href="css/main.css">
        
        <!-- Font style -->
        <link href="https://fonts.googleapis.com/css?family=Pacifico|Ranga|Lobster+Two" rel="stylesheet">
        
    <!--java script-->
         <script>
        $(init);
         var count = 0;
         function init() {
            var diagram = [];
            var canvas = $(".canvas");
            var tools = $(".tools");
            $(".tool").draggable({
                helper: "clone"
            });
            canvas.droppable({
                drop: function(event, ui) {
                    var node = {
                        _id: (new Date).getTime(),
                        position: ui.helper.position()
                    };
                    node.position.left -= canvas.position().left;
                   
                  //textbox
                    if(ui.helper.hasClass("isExist")){
                        node.type = "isExist";            
                    } else if(ui.helper.hasClass("set_Text")){
                        node.type = "set_Text";
                    } else if(ui.helper.hasClass("get_Text")){
                        node.type = "get_Text";
                    } else if(ui.helper.hasClass("clear_Text")){
                        node.type = "clear_Text";
                    } 
                    //button
                    else if(ui.helper.hasClass("buttonisExist")){
                        node.type = "buttonisExist";
                    } else if(ui.helper.hasClass("click")){
                        node.type = "click";
                    } 

                    //CheckboxContent:
                    else if(ui.helper.hasClass("checkItem_UsingValue")){
                        node.type = "checkItem_UsingValue";
                    } else if(ui.helper.hasClass("checkItem_UsingIndex")){
                        node.type = "checkItem_UsingIndex";
                    }          
                    else if(ui.helper.hasClass("selectAll")){
                        node.type = "selectAll";
                    } else if(ui.helper.hasClass("DeselectAll")){
                        node.type = "DeselectAll";
                    }  else if(ui.helper.hasClass("getSelectedItems")){
                        node.type = "getSelectedItems";
                    } else if(ui.helper.hasClass("getFirstSelectedItem")){
                        node.type = "getFirstSelectedItem";
                    }          
                    else if(ui.helper.hasClass("getAllItems")){
                        node.type = "getAllItems";
                    } else if(ui.helper.hasClass("isSelected")){
                        node.type = "isSelected";
                    } 
                    
                    //Radiobutton
                    else if(ui.helper.hasClass("SelectItem")){
                        node.type = "SelectItem";
                    }          
                    else if(ui.helper.hasClass("getSelectedItem")){
                        node.type = "getSelectedItem";
                    } else if(ui.helper.hasClass("radio_getAllItems")){
                        node.type = "radio_getAllItems";
                    } 
                    
                    
                     //TableContent:
                    else if(ui.helper.hasClass("ClickOnaLinkInsideTable")){
                        node.type = "ClickOnaLinkInsideTable";
                    } else if(ui.helper.hasClass("getRowNumberUsingText")){
                        node.type = "getRowNumberUsingText";
                    } else if(ui.helper.hasClass("getTextOnACell")){
                        node.type = "getTextOnACell";
                    } else if(ui.helper.hasClass("getWebElementOnACell")){
                        node.type = "getWebElementOnACell";
                    } else if(ui.helper.hasClass("getWebElementUsingText")){
                        node.type = "getWebElementUsingText";
                    } else if(ui.helper.hasClass("getTotalNumberOfRows")){
                        node.type = "getTotalNumberOfRows";
                    } else if(ui.helper.hasClass("getTotalNumberOfColumns")){
                        node.type = "getTotalNumberOfColumns";
                    } 

                    //Date Picker
                    else if(ui.helper.hasClass("selectDate")){
                        node.type = "selectDate";
                    } 

                    //DropdownListboxContent:
                    else if(ui.helper.hasClass("selectOptionUsingText")){
                        node.type = "selectOptionUsingText";
                    } else if(ui.helper.hasClass("selectOptionUsingIndex")){
                        node.type = "selectOptionUsingIndex";
                    } else if(ui.helper.hasClass("List_getAllItems")){
                        node.type = "List_getAllItems";
                    } else if(ui.helper.hasClass("List_getSelectedItems")){
                        node.type = "List_getSelectedItems";
                    } 

                    //MultipleSelection:
                    else if(ui.helper.hasClass("MultipleSelection")){
                        node.type = "MultipleSelection";
                    }

                    //screenshot
                    else if(ui.helper.hasClass("TakeScreenshot")){
                        node.type = "TakeScreenshot";
                    } 

                    //Alert
                    else if(ui.helper.hasClass("Accept")){
                        node.type = "Accept";
                    } else if(ui.helper.hasClass("Dismiss")){
                        node.type = "Dismiss";
                    } 

                    //ReportContent:    
                    else if(ui.helper.hasClass("ReportPass")){
                        node.type = "ReportPass";
                    } else if(ui.helper.hasClass("ReportFail")){
                        node.type = "ReportFail";
                    } 

                     //BrowserContent:
                    else if(ui.helper.hasClass("getTitle")){
                        node.type = "getTitle";
                    } else if(ui.helper.hasClass("Open")){
                        node.type = "Open";
                      
                    } else if(ui.helper.hasClass("QuitBrowser")){
                        node.type = "QuitBrowser";
                    } else if(ui.helper.hasClass("CloseBrowser")){
                        node.type = "CloseBrowser";
                    } else if(ui.helper.hasClass("isTitleMatch")){
                        node.type = "isTitleMatch";
                    } 

                    
                    else {
                        return;
                    }
                    diagram.push(node);
                    renderDiagram(diagram);
                }
            });
            
           
            }
            function renderDiagram(diagram) {
                canvas.empty();
                for(var d in diagram) {
                    var node = diagram[d];
                    var html = count;
                    if(node.type === "isExist") {
                        html += "<p style='font-size:16px' class='Textbox'>isExist <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 

                    //textbox

                    else if(node.type === "set_Text") {
                        html += "<p style='font-size:16px' class='Textbox'>set_Text <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input><input type='text' id='isExistsss' class ='isExistsss' placeholder='text here'> </input></p>";
                        
                    } else if(node.type === "get_Text") {
                        html += "<p style='font-size:16px' class='Textbox'>get_Text <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } else if(node.type === "clear_Text") {
                        html += "<p style='font-size:16px' class='Textbox'>clear_Text <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 

                    //button

                    else if(node.type === "click") {
                        html += "<p style='font-size:16px' class='Button'>click <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    }

                    //CheckboxContent:

                    else if(node.type === "checkItem_UsingValue") {
                        html += "<p style='font-size:16px' class='Checkbox'>checkItem_UsingValue<input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input><input type='text' id='isExistsss' class ='isExistsss' placeholder='text here'> </input></p>";
                        
                    } else if(node.type === "checkItem_UsingIndex") {
                        html += "<p style='font-size:16px' class='Checkbox'>checkItem_UsingIndex<input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } else if(node.type === "selectAll") {
                        html += "<p style='font-size:16px' class='Checkbox'>selectAll <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 
                    else if(node.type === "DeselectAll") {
                        html += "<p style='font-size:16px' class='Checkbox'>DeselectAll <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input><input type='text' id='isExistsss' class ='isExistsss' placeholder='text here'> </input></p>";
                        
                    } else if(node.type === "getSelectedItems") {
                        html += "<p style='font-size:16px' class='Checkbox'>getSelectedItems<input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } else if(node.type === "getFirstSelectedItem") {
                        html += "<p style='font-size:16px' class='Checkbox'>getFirstSelectedItem<input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 

                    else if(node.type === "getAllItems") {
                        html += "<p style='font-size:16px' class='Checkbox'>getAllItems<input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input><input type='text' id='isExistsss' class ='isExistsss' placeholder='text here'> </input></p>";
                        
                    } else if(node.type === "isSelected") {
                        html += "<p style='font-size:16px' class='Checkbox'>isSelected<input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 


                    //Radiobutton
                    else if(node.type === "SelectItem") {
                        html += "<p style='font-size:16px' class='Radiobutton'>SelectItem <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 
                    else if(node.type === "getSelectedItem") {
                        html += "<p style='font-size:16px' class='Radiobutton'>getSelectedItem <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input><input type='text' id='isExistsss' class ='isExistsss' placeholder='text here'> </input></p>";
                        
                    } else if(node.type === "radio_getAllItems") {
                        html += "<p style='font-size:16px' class='Radiobutton'>getAllItems <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 

                    //Table
                    else if(node.type === "ClickOnaLinkInsideTable") {
                        html += "<p style='font-size:16px' class='Table'>ClickOnaLinkInsideTable <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 
                    else if(node.type === "getRowNumberUsingText") {
                        html += "<p style='font-size:16px' class='Table'>getRowNumberUsingText <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input><input type='text' id='isExistsss' class ='isExistsss' placeholder='text here'> </input></p>";
                        
                    } else if(node.type === "getTextOnACell") {
                        html += "<p style='font-size:16px' class='Table'>getTextOnACell <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } else if(node.type === "getWebElementOnACell") {
                        html += "<p style='font-size:16px' class='Table'>getWebElementOnACell <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } else if(node.type === "getWebElementUsingText") {
                        html += "<p style='font-size:16px' class='Table'>getWebElementUsingText <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input><input type='text' id='isExistsss' class ='isExistsss' placeholder='text here'> </input></p>";
                        
                    } else if(node.type === "getTotalNumberOfRows") {
                        html += "<p style='font-size:16px' class='Table'>getTotalNumberOfRows <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } else if(node.type === "getTotalNumberOfColumns") {
                        html += "<p style='font-size:16px' class='Table'>getTotalNumberOfColumns <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 

                    //DatePicker
                    else if(node.type === "selectDate") {
                        html += "<p style='font-size:16px' class='DatePicker'>selectDate <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 

                    //DropdownListbox
                     else if(node.type === "selectOptionUsingText") {
                        html += "<p style='font-size:16px' class='DropdownListbox'>selectOptionUsingText <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 
                    else if(node.type === "selectOptionUsingIndex") {
                        html += "<p style='font-size:16px' class='DropdownListbox'>selectOptionUsingIndex    <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input><input type='text' id='isExistsss' class ='isExistsss' placeholder='text here'> </input></p>";
                        
                    } else if(node.type === "List_getAllItems") {
                        html += "<p style='font-size:16px' class='DropdownListbox'>getAllItems <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } else if(node.type === "List_getSelectedItems") {
                        html += "<p style='font-size:16px' class='DropdownListbox'>getSelectedItems <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 


                    //MultipleSelection: 

                    else if(node.type === "MultipleSelection") {
                        html += "<p style='font-size:16px' class='Listbox'>MultipleSelection <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input><input type='text' id='isExistsss' class ='isExistsss' placeholder='text here'> </input></p>";
                        
                    } 

                    //:Screenshot
                    else if(node.type === "TakeScreenshot") {
                        html += "<p style='font-size:16px' class='Screenshot'>TakeScreenshot  <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        

                    //Alert
                    } else if(node.type === "Accept") {
                        html += "<p style='font-size:16px' class='Alert'>Accept <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 
                     else if(node.type === "Dismiss") {
                        html += "<p style='font-size:16px' class='Alert'>Dismiss <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 

                    //Browser
                    else if(node.type === "getTitle") {
                        html += "<p style='font-size:16px' class='Browser'>getTitle <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input><input type='text' id='isExistsss' class ='isExistsss' placeholder='text here'> </input></p>";
                        
                    } else if(node.type === "Open") {
                        html += "<p style='font-size:16px' class='Browser'>Open <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                        
                    } else if(node.type === "QuitBrowser") {
                        html += "<p style='font-size:16px' class='Browser'>QuitBrowser <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        //var cmpname=Packages.FunctionLibrary.Test();
                       
                        
                    } else if(node.type === "CloseBrowser") {
                        html += "<p style='font-size:16px' class='Browser'>CloseBrowser <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input><input type='text' id='isExistsss' class ='isExistsss' placeholder='text here'> </input></p>";
                        
                    } else if(node.type === "isTitleMatch") {
                        html += "<p style='font-size:16px' class='Browser'>isTitleMatch <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 

                    //Report
                    else if(node.type === "ReportPass") {
                        html += "<p style='font-size:16px' class='Report'>ReportPass <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 
                    else if(node.type === "ReportFail") {
                        html += "<p style='font-size:16px' class='Report'>ReportFail <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>";
                        
                    } 

                    var dom = $(html).css({
                      
                        "top": node.position.top,
                        "left": node.position.left
                    })/*.draggable({
                        stop: function(event, ui) {
                            console.log(ui);
                            var id = ui.helper.attr("id");
                            for(var i in diagram) {
                                if(diagram[i]._id == id) {
                                    diagram[i].position.top = ui.position.top;
                                    diagram[i].position.left = ui.position.left;
                                }
                            }
                        }
                    }).attr("id", node._id);
                    canvas.append(dom);*/
                    canvas.append(dom);
                    count++;
                   // var empObj = new Packages.FunctionLibrary.Test();
                    //var ename = empObj.testing("hi");
                }
            }
            
        
         
         /*function addRow1(tableID) {

            var table = document.getElementById(tableID);

            var rowCount = table.rows.length;
            var row = table.insertRow(rowCount);

            var colCount = table.rows[0].cells.length;
            //document.getElementById('ObjectNameInStoreHouse').innerHTML = $("#objectname").val();   
            for(var i=0; i<colCount; i++) {

                var newcell = row.insertCell(i);

                newcell.innerHTML = table.rows[0].cells[i].innerHTML;
                //alert(newcell.innerHTML);
              
                switch(newcell.childNodes[0].type) {
                    case "text":
                            newcell.childNodes[0].value = $("#objectname").val();
                            break;
                    case "checkbox":
                            newcell.childNodes[0].checked = false;
                            break;
                    case "select-one":
                            newcell.childNodes[0].selectedIndex = 0;
                            break;
                }
            }
        }*/

         function addRow(tableID) {
            var textvalue= $("#objectname").val();
             $('#dataTable tbody').append("<tr class='child'><td style='text-align: center; vertical-align: middle;'><INPUT type='checkbox' name='chk'/></td> <td> &nbsp;&nbsp;<label name='ObjectNameInStoreHouse' style='color:blue;'>" +textvalue +"</label></td></tr>");
         }

        function deleteRow(tableID) {
            try {
            var table = document.getElementById(tableID);
            var rowCount = table.rows.length;

            for(var i=0; i<rowCount; i++) {
                var row = table.rows[i];
                var chkbox = row.cells[0].childNodes[0];
                if(null != chkbox && true == chkbox.checked) {
                    if(rowCount <= 1) {
                        alert("Cannot delete all the rows.");
                        break;
                    }
                    table.deleteRow(i);
                    rowCount--;
                    i--;
                }


            }
            }catch(e) {
                alert(e);
            }
        }

         function FunctionToShowList(){
                document.getElementByClassName("select").classList.toggle("show");
                $(document).on('click', 'a', function(e){ 
                e.preventDefault(); 
                var url = $(this).attr('href'); 
                window.open("www.google.co.in", '_blank');
            });
         }
         
         function filterFunction() {
            var input, filter, ul, li, a, i;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            div = document.getElementById("myDropdown");
            a = div.getElementsByTagName("a");
            for (i = 0; i < a.length; i++) {
                if (a[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
                    a[i].style.display = "";
                } else {
                    a[i].style.display = "none";
                }
            }
         }
             
            function foo(){
                alert(foo.count);
                foo.count++;
            }
        
            function displayblocks(div){
                
                 d1 = document.getElementById("TextboxContent");
                 d1.style.display = "none";
                
                 d2 = document.getElementById("ButtonContent");
                 d2.style.display = "none";
                
                 d3 = document.getElementById("CheckboxContent");
                 d3.style.display = "none";
                
                 d4 = document.getElementById("RadiobuttonContent");
                 d4.style.display = "none";
                
                 d5 = document.getElementById("TableContent");
                 d5.style.display = "none";
                
                 d6 = document.getElementById("DatePickerContent");
                 d6.style.display = "none";
                
                 d7 = document.getElementById("DropdownListboxContent");
                 d7.style.display = "none";
                
                 d8 = document.getElementById("ListboxContent");
                 d8.style.display = "none";
                
                 d9 = document.getElementById("ScreenshotContent");
                 d9.style.display = "none";
                
                 d10 = document.getElementById("AlertContent");
                 d10.style.display = "none";
                
                 d11 = document.getElementById("BrowserContent");
                 d11.style.display = "none";
                
                 d12 = document.getElementById("ReportContent");
                 d12.style.display = "none";
                
                 main = document.getElementById(div);
                 main.style.display = "block";
            }  
         
           

    </script><!--End of java script-->
    
    <!--css Styling-->
    <style>
        
        hr{
            border-width: 5px;
            border-top: 1px solid #ccc;
        }
         .Textbox{
            border: 2px solid white;
            border-radius: 5px;
            padding: 3px;
            white-space: nowrap;
            z-index: 2;
            border-color: green;
            color:green;
            
        }
        
        .Button{
            border: 2px solid white;
            border-radius: 5px;
            padding: 3px;
            white-space: nowrap;
            z-index: 2;
            border-color: DeepPink ;
            color:DeepPink ;
            
        }
        
        .Checkbox{
            border: 2px solid white;
            border-radius: 5px;
            padding: 3px;
            white-space: nowrap;
            z-index: 2;
            border-color: IndianRed;
            color:IndianRed;
            
        }
        
        .Radiobutton{
            border: 2px solid white;
            border-radius: 5px;
            padding: 3px;
            white-space: nowrap;
            z-index: 2;
            border-color: Blue;
            color:Blue;
            
        }
        
            
        .Table{
            border: 2px solid white;
            border-radius: 5px;
            padding: 3px;
            white-space: nowrap;
            z-index: 2;
            border-color: DarkMagenta;
            color:DarkMagenta;
            
        }
        
        .DatePicker{
            border: 2px solid white;
            border-radius: 5px;
            padding: 3px;
            white-space: nowrap;
            z-index: 2;
            border-color: Crimson;
            color:Crimson;
            
        }
        
        
        .DropdownListbox{
            border: 2px solid white;
            border-radius: 5px;
            padding: 3px;
            white-space: nowrap;
            z-index: 2;
            border-color: BlueViolet;
            color:BlueViolet;
            
        }
        
        .Listbox{
            border: 2px solid white;
            border-radius: 5px;
            padding: 3px;
            white-space: nowrap;
            z-index: 2;
            border-color: Orange;
            color:Orange;
            
        }
        
            
        .Screenshot{
            border: 2px solid white;
            border-radius: 5px;
            padding: 3px;
            white-space: nowrap;
            z-index: 2;
            border-color: Teal;
            color:Teal;
            
        }
        
        .Alert{
            border: 2px solid white;
            border-radius: 5px;
            padding: 3px;
            white-space: nowrap;
            z-index: 2;
            border-color: DarkSlateGrey;
            color:DarkSlateGrey;
            
        }
        
        .Browser{
            border: 2px solid white;
            border-radius: 5px;
            padding: 3px;
            white-space: nowrap;
            z-index: 2;
            border-color: Brown;
            color:Brown;
            
        }
        
        .Report{
            border: 2px solid white;
            border-radius: 5px;
            padding: 3px;
            white-space: nowrap;
            z-index: 2;
            border-color: Chocolate;
            color:Chocolate;
            
        }
        
        
        .tool {
            border: 2px solid white;
            border-radius: 5px;
            padding: 3px;
            white-space: nowrap;
            z-index: 2;
            color: white;
            font-size: 16px;
           
        }
        
        .tools {
            border: 2px solid black;
            padding: 5px;
            z-index: 2;
        }
        .scrollenabled {
            overflow-x: scroll; 
            overflow-y: scroll  ;
           
        }
        
        *{
           font-family: 'Lobster Two', cursive;
            font-size: 20px;
        }
        
        
        #background {
        width: 100%; 
        height: 100%; 
        position: fixed; 
        left: 0px; 
        top: 0px; 
        z-index: -1; /* Ensure div tag stays behind content; -999 might work, too. */
        }

        .stretch {
            width:100%;
            height:100%;
        }
     
        .dropbtn {
            background-color: #4CAF50;
            color: white;
            padding: 16px;
            font-size: 16px;
            border: none;
            cursor: pointer;
        }

        .dropbtn:hover, .dropbtn:focus {
            background-color: #3e8e41;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            overflow: auto;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown a:hover {background-color: #f1f1f1}

        .show{display:block;}
        
        #TextboxContent, #ButtonContent, #CheckboxContent,#RadiobuttonContent,
        #TableContent,#DatePickerContent,#DropdownListboxContent,
        #ListboxContent,#ScreenshotContent,#AlertContent,
        #BrowserContent,#ReportContent {
            display:none;}
       
        
    </style> <!--End of css Styling-->
        </head><!-- End of head-->
    
<!-- Beginning of Body -->
<body scroll="no" style="overflow: none;background-color:Lavender" >
      
 <!-- Background image -->
    <div id="background" >
    <!--<img src="https://i0.wallpaperscraft.com/image/mesh_points_background_silver_18524_300x168.jpg" class="stretch" alt="" />-->
      
        <!--container-->
        <div class="container-fluid"
         style="position: absolute;bottom: 0px;top: 0px;left: 0px;right: 0px;">
            
            <!-- Navbar -->
            <nav class="navbar navbar-inverse">
              <div class="container-fluid">
                <div class="navbar-header">
                  <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="#"><img src="dnd.png"></a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar"><font weight=bold;>
                  <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#" onclick="FunctionToShowList()">About</a></li>
                    <li><a href="#">Projects</a></li>
                    <li><a href="#">Contact</a></li>
                    </ul></font>
                  <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                  </ul>
                </div>
              </div>
            </nav><!-- End Navbar -->
            
            
            <!--row-->
            <div class="row"
             style="height: 85%;position: relative;">
                <!--First column -->
                <div id="firstcol" class="col-lg-4 "
                 style="position: absolute;left: 0px; top: 0px;bottom: 0px;">
                    <ul class="nav nav-tabs" style="font-weight: bold;">
                        
                        <li class="nav-item">
                            <a href="#home"  style="color:black" class="nav-link active" role="tab" data-toggle="tab">WebElement</a>
                        </li>

                        <li class="nav-item">
                            <a href="#profile"  style="color:black" class="nav-link" role="tab" data-toggle="tab">Operators</a>
                        </li>

                        <li class="nav-item">
                            <a href="#about"  style="color:black" class="nav-link" role="tab" data-toggle="tab">Conditions</a>
                        </li>
                    </ul>
                    <br>
                    <!-- Tab content -->
                    <div class="tab-content" >
                          <!-- WebElement Tab-->
                        <div role="tabpanel" class="tab-pane fade in active" id="home" >                            
                            <div class="row" style="font-weight: bold;">
                                <div class="col-lg-6">
                                    
                                    &nbsp;&nbsp;<a href="#TextboxContent" style="color:green" onclick="displayblocks('TextboxContent')">Textbox</a> <br>
                                    &nbsp;&nbsp;<a href="#ButtonContent" style="color:DeepPink" onclick="displayblocks('ButtonContent')">Button</a> <br>
                                    &nbsp;&nbsp;<a href="#CheckboxContent" style="color:IndianRed" onclick="displayblocks('CheckboxContent')">Checkbox</a> <br>
                                    &nbsp;&nbsp;<a href="#RadiobuttonContent" style="color:Blue" onclick="displayblocks('RadiobuttonContent')">Radio Button</a> <br>
                                    &nbsp;&nbsp;&nbsp;<a href="#TableContent" style="color:DarkMagenta" onclick="displayblocks('TableContent')">Table</a> <br>
                                    &nbsp;&nbsp;&nbsp;<a href="#DatepickerContent" style="color:Crimson" onclick="displayblocks('DatePickerContent')">Datepicker</a> <br>
                                    
                                </div>
                                <div class="col-lg-6">
                              
                                    &nbsp;&nbsp;&nbsp;<a href="#DropdownListboxContent" style="color:BlueViolet" onclick="displayblocks('DropdownListboxContent')">Dropdown Listbox</a> <br>
                                    &nbsp;&nbsp;&nbsp;<a href="#ListboxContent" style="color:Orange" onclick="displayblocks('ListboxContent')">Listbox Multiple selection</a> <br>
                                    &nbsp;&nbsp; <a href="#ScreenshotContent" style="color:Teal" onclick="displayblocks('ScreenshotContent')">Screenshot</a> <br>
                                    &nbsp;&nbsp;&nbsp;<a href="#AlertContent" style="color:DarkSlateGrey " onclick="displayblocks('AlertContent')">Alert</a> <br>
                                    &nbsp;&nbsp;&nbsp;<a href="#BrowserContent" style="color:Brown" onclick="displayblocks('BrowserContent')">Browser</a> <br>
                                    &nbsp;&nbsp;&nbsp;<a href="#ReportContent" style="color:Chocolate" onclick="displayblocks('ReportContent')">Report</a> <br>  
                                   
                                </div>
                             </div>
                            
                                                               
                            <hr>                                   
                        
                            
                        <!--DivContent --> 
                        <div id="DivContent">                                     
                          
                            <!-- Elements for Text box-->
                            <div id="TextboxContent" class="row">
                               <div class="row" style="font-weight: bold;">
                                   <div class="col-lg-2"></div>
                                   <div class="col-lg-4">
                                       <center>
                                    <span class="tool isExist">
                                        <a href="#" class="Textbox">isExist</a> <br></span><br>
                                    <span class="tool get_Text">      
                                        <a href = "#" class="Textbox">getText</a> <br></span><br>
                                           </center>
                                   </div>
                                   <div class="col-lg-4">
                                       <center>
                                    <span class="tool set_Text">      
                                        <a href = "#" class="Textbox">setText</a> <br></span><br>
                                    <span class="tool clear_Text">      
                                        <a href = "#" class="Textbox">clearText</a> <br></span>
                                       </center>
                                   </div>
                                   <div class="col-lg-2 ">
                                   </div>
                                </div>
                            </div><!-- End of Elements for Text box-->
                            
                             <!-- Elements for Button-->
                            <div id="ButtonContent" class="row">
                                    <div class="row" style="font-weight: bold;">
                                       <div class="col-lg-2"></div>
                                       <div class="col-lg-4">
                                            <span class="tool buttonisExist">
                                                <a href="#" class="Button">isExist</a> <br></span><br>
                                       </div>
                                       <div class="col-lg-4">
                                            <span class="tool click">
                                                <a href="#" class="Button">click</a> <br></span><br>
                                       </div>
                                       <div class="col-lg-2"></div>
                                    </div>
                            </div><!-- End of Elements for Button-->
                            
                            <!-- Elements for CheckboxContent-->
                            <div id="CheckboxContent" class="row">
                                <div class="row" style="font-weight: bold;">
                                    <div class="col-lg-1"></div>
                                   <div class="col-lg-5">
                                        <span class="tool isExist">
                                            <a href="#" class="Checkbox">isExist</a> <br></span><br>
                                       <span class="tool checkItem_UsingValue">
                                            <a href="#" class="Checkbox">checkItem_UsingValue</a> <br></span><br>
                                       <span class="tool checkItem_UsingIndex">
                                            <a href="#" class="Checkbox">checkItem_UsingIndex</a> <br></span><br>
                                       <span class="tool selectAll">
                                            <a href="#" class="Checkbox">selectAll</a> <br></span><br>
                                       <span class="tool DeselectAll">
                                            <a href="#" class="Checkbox">DeselectAll</a> <br></span><br>
                                   </div>
                                   <div class="col-lg-6">
                                        <span class="tool getSelectedItems">
                                            <a href="#" class="Checkbox">getSelectedItems</a> <br></span><br>
                                       <span class="tool getFirstSelectedItem">
                                            <a href="#" class="Checkbox">getFirstSelectedItem</a> <br></span><br>
                                       <span class="tool getAllItems">
                                            <a href="#" class="Checkbox">getAllItems</a> <br></span><br>
                                       <span class="tool isSelected">
                                            <a href="#" class="Checkbox">isSelected</a> <br></span><br>
                                   </div>
                                  
                                </div>
                            </div><!-- End of Elements for CheckboxContent-->
                     
                            <!-- Elements for RadiobuttonContent-->
                            <div id="RadiobuttonContent" class="row">
                                <div class="row" style="font-weight: bold;">
                                   <div class="col-lg-2"></div>
                                   <div class="col-lg-4">
                                        <span class="tool isExist">
                                            <a href="#" class="Radiobutton">isExist</a> <br></span><br>
                                        <span class="tool SelectItem">
                                            <a href="#" class="Radiobutton">SelectItem</a> <br></span><br>
                                   </div>
                                   <div class="col-lg-4">
                                        <span class="tool getSelectedItem">
                                            <a href="#" class="Radiobutton">getSelectedItem</a> <br></span><br>
                                        <span class="tool radio_getAllItems">
                                            <a href="#" class="Radiobutton">getAllItems</a> <br></span><br>  
                                   </div>
                                   <div class="col-lg-2"></div>
                                </div>
                            </div><!-- End of Elements for RadiobuttonContent-->
                            
                            <!-- Elements for TableContent-->
                            <div id="TableContent" class="row">
                                <div class="row" style="font-weight: bold;">
                             
                                   <div class="col-lg-5">
                                        <span class="tool isExist">
                                            <a href="#" class="Table">isExist</a> <br></span><br>
                                       <span class="tool ClickOnaLinkInsideTable">
                                            <a href="#" class="Table">ClickOnaLinkInsideTable</a> <br></span><br>
                                       <span class="tool getRowNumberUsingText">
                                            <a href="#" class="Table">getRowNumberUsingText</a> <br></span><br>
                                       <span class="tool getTextOnACell">
                                            <a href="#" class="Table">getTextOnACell</a> <br></span><br>
                                   </div>
                                   <div class="col-lg-7" style="left:20px">
                                        <span class="tool getWebElementOnACell">
                                            <a href="#" class="Table">getWebElementOnACell</a> <br></span><br>
                                       <span class="tool getWebElementUsingText">
                                            <a href="#" class="Table">getWebElementUsingText</a> <br></span><br>
                                       <span class="tool getTotalNumberOfRows">
                                            <a href="#" class="Table">getTotalNumberOfRows</a> <br></span><br>
                                       <span class="tool getTotalNumberOfColumns">
                                            <a href="#" class="Table">getTotalNumberOfColumns</a> <br></span><br>
                                   </div>
                                 
                                </div>
                            </div><!-- End of Elements for TableContent-->
                            
                               <!-- Elements for DatePickerContent-->
                            <div id="DatePickerContent" class="row">
                                <div class="row" style="font-weight: bold;">
                                   <div class="col-lg-2"></div>
                                   <div class="col-lg-4">
                                        <span class="tool isExist">
                                            <a href="#" class="DatePicker">isExist</a> <br></span><br>
                                   </div>
                                   <div class="col-lg-4">
                                        <span class="tool selectDate">
                                            <a href="#" class="DatePicker">selectDate</a> <br></span><br>
                                   </div>
                                   <div class="col-lg-2"></div>
                                </div>
                            </div><!-- End of Elements for DatePickerContent-->
                            
                               <!-- Elements for DropdownListboxContent-->
                            <div id="DropdownListboxContent" class="row">
                                <div class="row" style="font-weight: bold;">
                                   <div class="col-lg-1"></div>
                                   <div class="col-lg-5">
                                        <span class="tool isExist">
                                            <a href="#" class="DropdownListbox">isExist</a> <br></span><br>
                                        <span class="tool selectOptionUsingText">
                                            <a href="#" class="DropdownListbox">selectOptionUsingText</a> <br></span><br>
                                        <span class="tool selectOptionUsingIndex">
                                            <a href="#" class="DropdownListbox">selectOptionUsingIndex</a> <br></span><br>
                                   </div>
                                   <div class="col-lg-4">
                                        <span class="tool List_getAllItems">
                                            <a href="#" class="DropdownListbox">getAllItems</a> <br></span><br>
                                        <span class="tool List_getSelectedItems">
                                            <a href="#" class="DropdownListbox">getSelectedItems</a> <br></span><br>
                                   </div>
                                   <div class="col-lg-2"></div>
                                </div>
                            </div><!-- End of Elements for DropdownListboxContent-->
                            
                              <!-- Elements for ListboxContent-->
                            <div id="ListboxContent" class="row">
                                <div class="row" style="font-weight: bold;">
                                    <span class="tool MultipleSelection">
                                       <center>
                                       <a href="#" class="Listbox">MultipleSelection</a> <br></span><br></center>
                                    </span>
                                </div>
                                 
                              
                            </div><!-- End of Elements for ListboxContent-->
                            
                             <!-- Elements for ScreenshotContent-->
                            <div id="ScreenshotContent" class="row">
                               <div class="row" style="font-weight: bold;">
                               <span class="tool TakeScreenshot">
                                   <center><a href="#" class="Screenshot">TakeScreenshot</a> <br></span><br></center>
                                </span>
                                </div>
                            </div><!-- End of Elements for ScreenshotContent-->
                            
                             <!-- Elements for AlertContent-->
                            <div id="AlertContent" class="row">
                                <div class="row" style="font-weight: bold;">
                                   <div class="col-lg-2"></div>
                                   <div class="col-lg-4">
                                        <span class="tool Accept">
                                            <a href="#" class="Alert">Accept</a> <br></span><br>
                                   </div>
                                   <div class="col-lg-4">
                                        <span class="tool Dismiss">
                                            <a href="#" class="Alert">Dismiss</a> <br></span><br>
                                   </div>
                                   <div class="col-lg-2"></div>
                                </div>
                            </div><!-- End of Elements for AlertContent-->
                            
                             <!-- Elements for BrowserContent-->
                            <div id="BrowserContent" class="row">
                                <div class="row" style="font-weight: bold;">
                                   <div class="col-lg-2"></div>
                                   <div class="col-lg-4">
                                        <span class="tool isExist">
                                            <a href="#" class="Browser">isExist</a> <br></span><br>
                                       <span class="tool getTitle">
                                            <a href="#" class="Browser">getTitle</a> <br></span><br>
                                       <span class="tool Open">
                                            <a href="#" class="Browser">Open</a> <br></span><br>
                                   </div>
                                   <div class="col-lg-4">
                                        <span class="tool QuitBrowser">
                                            <a href="#" class="Browser">QuitBrowser</a> <br></span><br>
                                       <span class="tool CloseBrowser">
                                            <a href="#" class="Browser">CloseBrowser</a> <br></span><br>
                                       <span class="tool isTitleMatch">
                                            <a href="#" class="Browser">isTitleMatch</a> <br></span><br>
                                   </div>
                                   <div class="col-lg-2"></div>
                                </div>
                            </div><!-- End of Elements for BrowserContent-->
                            
                            <!-- Elements for ReportContent-->
                            <div id="ReportContent" class="row">
                                <div class="row" style="font-weight: bold;">
                                   <div class="col-lg-2"></div>
                                   <div class="col-lg-4">
                                        <span class="tool ReportPass">
                                            <a href="#" class="Report">ReportPass</a> <br></span><br>
                                   </div>
                                   <div class="col-lg-4">
                                        <span class="tool ReportFail">
                                            <a href="#" class="Report">ReportFail</a> <br></span><br>
                                   </div>
                                   <div class="col-lg-2"></div>
                                </div>
                            </div><!-- End of Elements for ReportContent-->
                            
                        </div><!--End of DivContent --> 
                            
                        </div><!--End of WebElement Tab--> 
                        
                            <!-- Operators Tab-->
                            <div role="tabpanel" class="tab-pane fade" id="profile">2</div>
                            <!--End of Operators Tab--> 
                            
                            <!-- Conditions Tab-->
                            <div role="tabpanel" class="tab-pane fade" id="about">3</div>
                            <!--End of Conditions Tab--> 
                        
                        
                    </div><!--End of Tab content -->           
                </div><!--End of First column -->
               
                <!--Second column-->
                <div class="col-lg-4 canvas scrollenabled"
                     style="border:solid; border-color:lightgray;background-color:white; position: absolute;right: 450px;bottom: 0px;top: 0px;">
                      	
                    

				<form method="post" action=send>   
   				  <input type="submit" id="btn1" name="btn1">run
   				  </form>
                     
                     
                                                      
                    <br>
                    
                </div><!--End of Second column-->
            
                <!--Third column-->
                <div class="col-lg-4"
                 style="position: absolute;right:0px;bottom:0px;top: 0px;">


                <TABLE class="table" id="ObjectTable" width="350px" border="0">
                <TBODY>
                    <TR>
                        <!-- <TD><INPUT type="checkbox" name="chk"/> </TD>-->

                        <TD>
                        Name your Object
                        </TD>
                         <TD><INPUT type="text" id="objectname" /></TD>
                    </TR>
                    <TR> 
                        <TD> 
                        Select a Locator:
                        </TD>
                        <TD>
                            <SELECT name="country">
                                <OPTION value="ID">ID</OPTION>
                                <OPTION value="Name">Name</OPTION>
                                <OPTION value="Class">Class</OPTION>
                                <OPTION value="XPath">XPath</OPTION>
                                 <OPTION value="TagName">TagName</OPTION>
                                <OPTION value="CssSelector">Css Selector</OPTION>
                            </SELECT>
                        </TD>
                    </TR>
                    <TR>
                        <TD> 
                         Enter the value:   
                        </TD>
                        <TD><INPUT type="text" name=""/></TD>
                    </TR>
                 </TBODY>
                </TABLE>
                <center>
                    <!--  <button type="button" class="btn btn-success" value="Add Row" onclick="addRow()">-->
                        Add Object to the Object Storehouse
                    </button> 
                 </center>
                 <hr>
               <!-- <button type="button" class="btn btn-danger" onclick="deleteRow('dataTable')">
                     Remove Object
                     </button>-->
                <INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable')" />
                
                <br>
                    <TABLE id="dataTable" width="350px" border="1">
                        <tbody>
                        
                      </tbody>
                    </TABLE>

                </div><!--End of Third column-->
            
            </div><!-- End of row-->
        </div><!--End of container-->
        
    </div><!-- End of Background image -->
    
</body><!-- End of Body -->
    
   
</html>