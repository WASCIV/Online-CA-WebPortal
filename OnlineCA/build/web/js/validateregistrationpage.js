var url = 'ValidateCaptcha?code=';
var captchaOK = 2; // 2 - not yet checked, 1 - correct, 0 - failed
var http = getHTTPObject(); // We create the HTTP Object 

function validate()
{
    if(document.frm.utype.selectedIndex==0)
    {
        alert("Please Select  Category");
        document.frm.utype.focus();
        return false;
    }
    if(document.frm.name.value=="")
    {
        alert("Please enter Name");
        document.frm.name.focus();
        return false;
    }
    if(document.frm.fname.value=="")
    {
        alert("Please enter Your Father Name");
        document.frm.fname.focus();
        return false;
    }
    if(document.frm.adrs.value=="")
    {
        alert("Please enter Adress");
        document.frm.adrs.focus();
        return false;
    }
    if(document.frm.dob.value=="")
    {
        alert("Please enter Date of Birth");
        document.frm.dob.focus();
        return false;
    }



    var phoneno = /^\d{10}$/;  
    if(!document.frm.mob.value.match(phoneno))
    {
          
        alert("Not a valid mob Number");
        document.frm.mob.value="";
        document.frm.mob.focus();
        return false;  
    }  
       
    


    if (echeck(document.frm.email.value)==false){
        document.frm.email.value="";
        document.frm.email.focus();
        return false
    }

    if(document.frm.login.value=="")
    {
        alert("Please enter User login");
        document.frm.usrlogin.focus();
        return false;
    }
    if(document.frm.code.value=='')
    {
        alert('Please enter the string from the displayed image');
        document.frm.code.value='';
        document.frm.code.focus(); 
        return false;
    }
    if(document.frm.pswd.value=="")
    {
        alert("Please enter Password");
        document.frm.pswd.focus();
        return false;
    }
    if(document.frm.rpswd.value=="")
    {
        alert("Please Retype Password");
        document.frm.rpswd.focus();
        return false;
    }
    if(document.frm.rpswd.value!=document.frm.pswd.value)
    {
        alert("Password do not match");
        document.frm.pswd.value="";
        document.frm.rpswd.value="";
        document.frm.pswd.focus();
        return false;
    }
   
   
             
    return true;
}

function checkcode(thecode)
{ 
    http.open("POST", url + escape(thecode), true); 
    http.onreadystatechange = handleHttpResponse; 
    http.send(null); 
}

function getHTTPObject()
{
    try

    {
        req = new XMLHttpRequest();
    } catch (err1) { 
        try {
            req = new ActiveXObject("Msxml12.XMLHTTP"); 
        } catch (err2) { 
            try {
                req = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (err3) {
                req = false;
            }
        } 
    } 
    return req;
}


function handleHttpResponse() 
{
    if (http.readyState == 4) 
    {
        captchaOK = http.responseText;
        if(captchaOK == 1)
        { 
            alert('The entered code was not correct. Please try again');
            document.frm.code.value='';
            document.frm.code.focus();
            return false;
        }
        return true;
    } 
   
}
function echeck(str) {

    var at="@"
    var dot="."
    var lat=str.indexOf(at)
    var lstr=str.length
    var ldot=str.indexOf(dot)

    if (str.indexOf(at)==-1){
        alert("Invalid E-mail ID")
        return false
    }

    if (str.indexOf(at)==-1 || str.indexOf(at)==0 || str.indexOf(at)==lstr){
        alert("Invalid E-mail ID")
        return false
    }

    if (str.indexOf(dot)==-1 || str.indexOf(dot)==0 || str.indexOf(dot)==lstr){
        alert("Invalid E-mail ID")
        return false
    }

    if (str.indexOf(at,(lat+1))!=-1){
        alert("Invalid E-mail ID")
        return false
    }

    if (str.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
        alert("Invalid E-mail ID")
        return false
    }

    if (str.indexOf(dot,(lat+2))==-1){
        alert("Invalid E-mail ID")
        return false
    }

    if (str.indexOf(" ")!=-1){
        alert("Invalid E-mail ID")
        return false
    }

    return true
}
//function validateCaptcha()
//{
//    var xmlHttpRequest= null;
//    //For non micrsosft browser
//    if(window.XMLHttpRequest)
//    {
//        xmlHttpRequest=new XMLHttpRequest();
//
//    }
//    //For mircrosoft browser
//    else
//    {
//        xmlHttpRequest=new ActiveXObject("Microsoft.XMLHTTP");
//    }
//    //return xmlHttpReq;
//
//    // var xmlHttpRequest= getXmlHttpRequest();
//    if(xmlHttpRequest==null)
//    {
//        
//        alert("your browser does not support ajax");
//    }
//    var cptnumber= document.getElementById("cptnumber");
//    // alert(cptnumber);
//    if(cptnumber.value=="")
//    {
//        alert("Please enter string shown in the image !");
//        //document.getElementById("msgAreaCaptcha").innerHTML="<font color='red'>Please enter the string shown in the image !</font>";
//        // document.getElementById("submit").disabled = true;
//        return false;
//    }
//    // var utype=document.getElementById("utype");
//    //alert(utype.value);
//    // alert(usrlogin.value);
//    var url="ValidateCaptcha?cptnumber="+encodeURIComponent(cptnumber.value);
//    //alert(url);
//    xmlHttpRequest.onreadystatechange=procesRequest(xmlHttpRequest);
//    xmlHttpRequest.open("POST", url, true);
//    xmlHttpRequest.send(null);
//
//}
//
//function procesRequest(xmlHttpRequest)
//{
//
//    return function(){
//        if(xmlHttpRequest.readyState==1){
//
//
//            document.getElementById("msgAreaCaptcha").innerHTML="<img src='images/loading.gif' width='16' height='16' />";
//        }
//        if(xmlHttpRequest.readyState==4)
//        {
//            if(xmlHttpRequest.status==200)
//            {
//                var responsTxt=xmlHttpRequest.responseText;
//                if(responsTxt=="1")
//                {
//                    document.getElementById("msgAreaCaptcha").innerHTML="<font color='red'>Not Available !</font>";
//                    document.getElementById("submit").disabled = true;
//                }
//                else{
//                    document.getElementById("msgAreaCaptcha").innerHTML="<font color='green'>Available !</font>";
//                    document.getElementById("submit").disabled = false;
//                }
//
//            }
//        }
//
//    };
//}