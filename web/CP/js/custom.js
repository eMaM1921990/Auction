/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Transaction(){
    var transactionva=document.getElementById("transaction").value;
    var userid=document.getElementById("userid").value;
    if(transactionva===''){
        document.getElementById("val").style.color='red';
    }else{
        document.getElementById("val").style.color='black';
        $.get('../../ConfirmTransaction',{transaction:transactionva,userid:userid},function(reponseText){
           window.open('Payment.jsp','_self');
        });
    }
}

