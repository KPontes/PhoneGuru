/*global $*/

function funcao1()
{
alert("Eu sou um alert!");
document.write("Nova linha no doc")
}

function studycom() {
    var i, j;
    document.write("Starting Loop" + "<br />");
 
    for(i = 1; i <= 10; i++){
      for(j = 1; j <= 10; j++){
        document.write(Math.pow(j, i) + ", ");
      }
     document.write("<br />");
    }
}