var flag =1;



$('#new').on("click",alertDisplay);

function alertDisplay(){

	if(flag ==1 ){
		$('#new').attr({
		type :'submit',
		value:'add'

		});
		flag = 2;
	}else{
	document.getElementById("mainForm").submit();
	flag = 1;
	}
}
function checkDate(){
    var idate = document.getElementById("date"),
        if(isFutureDate(idate.value)){
            return true;
        } else {
			Alert("Enter valid date");
            return false;
        }
    
}

function isFutureDate(idate) {
   var today = new Date().getTime(),
      idate = idate.split("/");
   idate = new Date(idate[2], idate[0] - 1, idate[1]).getTime();
   return (today - idate) < 0 ? true : false;
}

$(document).ready(function(e) {

        $('#c').click(function(){
				$('#new').attr({
				type:'button',
				value:'new'

				});

			});
    });

function show(toBlock){
setDisplay(toBlock,'block');
}

function hide(toNone){
setDisplay(toNone,'none');
}
function setDisplay(target,str){
document.getElementById(target).style.display=str;
}

function getAppointments(){
var s = document.getElementById('searchStr').value;
 alert(s);
 $.ajax({
        type: 'POST',
        url: '/cgi-bin/search.pl',
        dataType: 'json',
        data: {'searchValue':s},
        success: function(data){

	        $('#bod').empty();
					if(data.length==0){
						$('#noVal').append('<h3>No Result Found</h3>');
					}
					else{
						$('#noVal').empty();
					}
					for(var key in data){
						$('#bod').append('<tr>');
						$('#bod').append('<td><h4>'+data[key].date+'</h4></td>'
						+'<td><h4>'+data[key].time+'</h4></td>'+'<td><h4>'+data[key].desc+'</h4></td>');
						$('#bod').append('</tr>');
					}
				},
        error: function(){
            alert("Handle Errors here");
        },
        complete: function() {
        }
    });
}
