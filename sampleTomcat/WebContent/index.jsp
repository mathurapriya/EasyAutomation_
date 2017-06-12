<!DOCTYPE html>
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
         

         function statc(abcdcode){
                statc.abcd += abcdcode;
            }

            statc.abcd = "";
            
          function statccounter(abcdcode){
                return ++statc.cnt;
            }

            statc.cnt = 0;
            //localStorage.setItem("key","");

         function init() {
            var diagram = [];
            var canvas = $(".canvas");
            var tools = $(".tools");       
         	
            //Delete all Local storage
            localStorage.clear();
           
            //store commands from db to local and append to canvas
            
            
            //store Obj. storehouse from db to local and append to Ostorehouse
            
            
            
            if(localStorage.getItem("key")!== null){
            	//alert(localStorage.getItem("key"));
            	$(".canvas").append(localStorage.getItem("key"));
            }
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
                        html = "<p style='font-size:16px' class='Textbox'>isExist <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p> ";
                        var abcd1 = new statc(html);                   
                       // localStorage.setItem("key", statc.abcd);
                   
                        //alert(localStorage.getItem("key"));
                        $(".canvas").append(html);      

                    } else if(ui.helper.hasClass("set_Text")){
                        node.type = "set_Text";
                         html = "<p style='font-size:16px' class='Textbox'>set_Text <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input><input type='text' id='isExistsss' class ='isExistsss' placeholder='text here'> </input></p>";
                         var abcd1 = new statc(html);                       
                         //localStorage.setItem("key", statc.abcd);                     
                         $(".canvas").append(html);  
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

               
                    
                    else {
                        return;
                    }
                    //diagram.empty();
                    diagram.push(node);
                    //renderDiagram(diagram);
                    //renderDiagram(node);
                }
            });

        
           

            function removecmd(){
               // alert("hi");
                e.preventDefault();
                 $(this).parent('p').remove();
            }
            
            
            function renderDiagram(diagram) {
                //canvas.empty();
                for(var d in diagram) {
                    var node = diagram[d];
                    var html = count;
                    if(node.type === "isExist") {
                       $("#Workspace").append("<p style='font-size:16px' class='Textbox'>isExist <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input></p>");
                        
                    } 

                    //textbox

                    else if(node.type === "set_Text") {
                    	$("#Workspace").append("<p style='font-size:16px' class='Textbox'>set_Text <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input><input type='text' id='isExistsss' class ='isExistsss' placeholder='text here'> </input></p>");
                        
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
                        html += "<p style='font-size:16px' class='DropdownListbox'>selectOptionUsingIndex	 <input type='text' id='isExistsss' class ='isExistsss' placeholder='Enter a web element'> </input><input type='text' id='isExistsss' class ='isExistsss' placeholder='text here'> </input></p>";
                        
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
                }
            }
        }
 
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
            	return foo.countObj++;
            }

            foo.countObj = 0;
          
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
         
           /* function download(filename) {
                
                var text = getFullCommands();
                var pom = document.createElement('a');
                pom.setAttribute('href', 'data:text/plain;charset=utf-8,' +
           
                encodeURIComponent(text));
                pom.setAttribute('download', filename);
           
                pom.style.display = 'none';
                document.body.appendChild(pom);
           
                pom.click();
           
                document.body.removeChild(pom);
                  window.href = "file:///D:/M.%20Tech%20Dissertation/htmlcode/index.html";
              }*/
            
              function download() {
            	  alert("download");
                  //var text = document.getElementById("objectname").value;
                  var maintext = getFullCommands();
                  alert(maintext);
                  $.get('SenderServlet',{command:maintext}, function(responseText){
                	  $('#welcome').text(responseText);
                  });
                  //document.location.href = "http://localhost:8080/Mtech_Project/SenderServlet?var=" + maintext;
                  
              }
              function getFullCommands(){
                  var commands = "";
                  
                  //get all p tags
                  $("p").each(function(){
                      //alert($(this).innerHTML());
                      commands +=  $(this).text().trim(); 
                      $(this).children().each(function(){
                          commands += " " + $(this).val().trim();
                      });
                  });
                  commands +=  ";;"; 
                  return commands;

              }
            window.onbeforeunload = function() {
            	//alert("befor");
            	 statc.cnt = 0;
            	 $("p input").each(function(){
            		//alert( $(this).val());
	                localStorage.setItem("value" + statc.cnt++, $(this).val());
            	 });                   
            	
            }
            
            window.onload = function() {
            	 statc.cnt = 0;
            	 $("p").each(function(){
            		 $(this).children().each(function(){
            			 $(this).val(localStorage.getItem("value" + statc.cnt++));
            	 	});
            	 });
            }
            
            function save(){
            	localStorage.setItem("key", statc.abcd);  
            	statc.cnt = 0;
	           	 $("p input").each(function(){
	           		//alert( $(this).val());
		                localStorage.setItem("value" + statc.cnt++, $(this).val());
		                $.get('SaveCommandsServlet',{command:statc.abcd}, function(responseText){
		                	  $('#welcome').text(responseText);
		                  });
	           	 });  
            	location.reload();
            	
           }
           
           function clearAll(){      	   
        	    localStorage.removeItem("key");
	           	location.reload();
	           	//$(".canvas").append(localStorage.getItem("key"));
           }
			
          function addObject(){
        	  //alert("add object");
              //var text = document.getElementById("objectname").value;
              var Name = $("#objectname").val();
              alert(Name);
              var Selector = $("#objectType").val();
              var Value = $("#objectvalue").val();
              
              var Objectcode="<div class='panel panel-default'>" +
			   "<div class='panel-heading'>" +
			    "<h3 class='panel-title'>" +
		        "<a data-toggle='collapse' data-parent='#accordion' href='#collapse" + foo() + "'>" + singleobj[0] +
		        "</a>" +
			     "</h3>" +
			     "</div>" +
			   	 "<div id='collapse" + foo() + "' class='panel-collapse collapse'>" + 
			      "<div class='panel-body'>Type: " +  singleobj[1] + "<hr>" +  singleobj[2] + "<hr>" +
			      "<button id=Edit"+ foo() + " onclick='EditObject()'>Edit</button> <button id=Delete"+ foo() + " onclick='DeleteObject()'>Delete</button>"
		     	 "</div></div></div>";
				localStorage.setItem("Objects", localStorage.getItem("Objects")+Objectcode);
				
				
              $.get('AddServlet',{Name:Name, 
            	  Selector:Selector,
            	  Value:Value,
            	  Project:"test"
            	  }, function(responseText){
            	  populate(responseText);
              });
          }
            function populate(command){
            	//alert("populate object");
            	arr = command.split(";;");
            //	var first = "<div class='row'> <div class='col-lg-12'><div class='panel-group' id='accordion'>";
            	localStorage.setItem("Objects", " ");
            	//$("#OStorehouse").append(first);
            	for (var cnt = 0; cnt < arr.length; cnt++) {
            		singleobj = arr[cnt].split(" ");
            		var Objectcode="<div class='panel panel-default'>" +
								   "<div class='panel-heading'>" +
								    "<h3 class='panel-title'>" +
							        "<a data-toggle='collapse' data-parent='#accordion' href='#collapse" + cnt + "'>" + singleobj[0] +
							        "</a>" +
								     "</h3>" +
								     "</div>" +
								   	 "<div id='collapse" + cnt + "' class='panel-collapse collapse'>" + 
								      "<div class='panel-body'>Type: " +  singleobj[1] + "<hr>" +  singleobj[2] + "<hr>" +
								      "<button id=Edit"+ cnt + " onclick='EditObject()'>Edit</button> <button id=Delete"+ cnt + " onclick='DeleteObject()'>Delete</button>"
							     	 "</div></div></div>";
					localStorage.setItem("Objects", localStorage.getItem("Objects")+Objectcode);
            		//$("#OStorehouse").append(Objectcode);
            		
            	}
            	//localStorage.setItem("Objects", localStorage.getItem("Objects")+"</div></div></div>");
            	//$("#OStorehouse").append("</div></div></div>");
            	$("#accordion").append(localStorage.getItem("Objects"));
            }
          
            function EditObject(){
            	$(this).closest($(".panel-default")).remove();
            	//$(this).
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
                    <li style ="left:200px; top:7px"> 
                      <!--  <form method="post" action="send">   -->
							<button id="execute" onclick="download()">Execute</button>          
							<button id="save" onclick="save()">Save</button>  
							<button id="clearAll" onclick="clearAll()">ClearAll</button>             
                     	 <!--  </form></li>-->
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
	                             
                                </div>
                                 
                              
                            </div><!-- End of Elements for ListboxContent-->
                            
                             <!-- Elements for ScreenshotContent-->
                            <div id="ScreenshotContent" class="row">
                               <div class="row" style="font-weight: bold;">
                               <div><span class="tool TakeScreenshot">
                                   <center><a href="#" class="Screenshot">TakeScreenshot</a> <br></span><br></center>
                                   </div>
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
                 
                </div><!--End of Second column-->

                 <!--Third column-->
                <div class="col-lg-4"
                 style="position: absolute;right:0px;bottom:0px;top: 0px;">

                  <ul class="nav nav-tabs" style="font-weight: bold;">
                        
                        <li class="nav-item">
                            <a href="#AddObject"  style="color:black" class="nav-link active" role="tab" data-toggle="tab">Add Object to Storehouse</a>
                        </li>

                        <li class="nav-item">
                            <a href="#ObjectStorehouse"  style="color:black" class="nav-link" role="tab" data-toggle="tab">ObjectStorehouse</a>
                        </li>

                    </ul>
                    <br>

                 <!-- Tab content -->
                    <div class="tab-content" >
                     <!-- Add objects Tab-->
                        <div role="tabpanel" class="tab-pane fade in active" id="AddObject" >
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
                                        <SELECT name="country" id="objectType">
                                            <OPTION value="ID">ID</OPTION>
                                            <OPTION value="Name">Name</OPTION>
                                            <OPTION value="Class">Class</OPTION>
                                            <OPTION value="XPath">XPath</OPTION>
                                             <OPTION value="TagName">TagName</OPTION>
                                            <OPTION value="CssSelector">CssSelector</OPTION>
                                        </SELECT>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD> 
                                     Enter the value:   
                                    </TD>
                                    <TD><INPUT type="text" id="objectvalue"/></TD>
                                </TR>
                             </TBODY>
                            </TABLE>
                            <center>
                                <button type="button" class="btn btn-success" value="Add Row" onclick="addObject()">
                                    Add Object to the Object Storehouse
                                </button> 
                             </center>
                             <hr>
                           <!-- <button type="button" class="btn btn-danger" onclick="deleteRow('dataTable')">
                                 Remove Object
                                 </button>-->
                            <INPUT type="button" value="Delete Row" onclick="deleteRow('dataTable')" />
                            
                            <br>
                                <TABLE id="dataTable" class="scrollenabled" width="350px" border="1">
                                    <tbody>
                                    
                                  </tbody>
                                </TABLE>
                        </div><!-- End of Add objects Tab-->

                         <!-- Object Storhouse Tab-->
                        <div role="tabpanel" class="tab-pane fade" id="ObjectStorehouse">
                            <div id="OStorehouse"  style="overflow:scroll; height:500px;">
                            	<div class='row'>
                           	 		 <div class='col-lg-12'>
                             				<div class='panel-group' id='accordion'>
                             				
                            				</div>
                           			 </div>
                            	</div>
                            </div>
                        </div><!--End of Operators Tab--> 
                                                  
                    </div> <!-- End of Tab content -->

                </div><!--End of Third column-->
            
            </div><!-- End of row-->
        </div><!--End of container-->
        
    </div><!-- End of Background image -->
    
</body><!-- End of Body -->
    
   
</html>