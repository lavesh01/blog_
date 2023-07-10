var todo_uri = site_url + 'todo/';
$(function() {

			

			$("#todo_list").click(function (argument) {
				if ($('.todos_a').length > 0) { return false;}
				var adata = ajax_call_no_alert('todo',"" );
				var todos = adata.todos;
				$('#todo-container').html('');
				$.each(todos, function(key,value) {
				  add_new_todo_li(value.id,value.name, value.created_at);
				});
				resetLog();
				$('#nothing').css('display','none');
				$('input[name=todo-input]').val('');
				new_todo_add();
				counttodo();
			})

			$('#todo-from').click(function(e) {
				e.preventDefault();
				var todoval = $('input[name=todo-input]').val();
				if (todoval == '') {
					alert('isi dulu lah tolo >:(');
					$('input[name=todo-input]').focus();
					return false;
				}

				$.ajax({
					'type': "POST",
					data: {todo: todoval},
					url: todo_uri+'insert',
					dataType: "json",
					beforeSend: function(e) {
						$('#log').html('inserting..')
					},
					error: function(error) {
						$('#log').html('something wrong');
					},
					success: function(response) {
						response = response.todos;
						resetLog();
						$('#nothing').css('display','none');
						$('input[name=todo-input]').val('');
						add_new_todo_li(response.id,response.name, response.created_at, "prepend");
						

						$('[data-toggle=tooltip]').tooltip();
						 new_todo_add() ;
						 counttodo();
					}
				});
			});

			

			

		});
var resetLog = function() {
	$('#log').html('');

}
var checkifempty = function() {
	$.get(todo_uri+'countTodos', function(response){
		response = $.parseJSON(response);
		if (response[0] == undefined) {
			$('#nothing').css('display','block');
		}
	})
}
function new_todo_add() {
	$('[data-toggle=tooltip]').tooltip();


	var update = function(id,name){
	$.ajax({
		type:"POST",
		url:todo_uri+'update',
		data:{id:id,todo:name},
		dataType:'json',
		beforeSend: function(e){
			$("#log").html("updating..");
		},
		error : function(error){
			$("#log").html("something wrong");
		},
		success :function(response){
			resetLog();
			$("#todo-container a[data-id='"+ response.id +"'] span").html(response.name);
			setTimeout(function(e){
				swal.close();
				counttodo();
			}),300;
		}
	});
	// swal("Ajax request finished!");
	} 	

	$('.done-btn').click(function(e) {
		var id = $(this).attr('data-id');
		if(typeof id == undefined){
			alert("something wrong!!");
			return false;
		}

		$.ajax({
			type :"POST",
			url : todo_uri+'done',
			data:{id:id},
			beforeSend: function(e){
				$("a[data-id='"+ id +"']").css('background-color','rgba(120, 174, 223,0.2)');
				$("#log").html("loading..");
			},
			error : function(error){
				$('#log').html('something wrong');
			},
			success : function(response){
				$("a[data-id='"+ id +"']").fadeOut(300);
				setTimeout(function(){
					$("a[data-id='"+ id +"']").remove();
				},500);
				resetLog();
				counttodo();
				//checkifempty();
			}
		});
	})

$('.edit-btn').click(function(e) {
		var id = $(this).attr('data-id');
		if(typeof id == undefined){
			alert("something wrong!!");
			return false;
		}

		$.ajax({
			type: 'POST',
			url: todo_uri+'edit',
			data: {id:id},
			dataType: 'json',
			beforeSend: function(e){
				$("#log").html("loading..");
			},
			error : function(error){
				$('#log').html('something wrong');
			},
			success : function(response){
				resetLog();
				counttodo();
				swal({
				  title: "Edit",
				  text: "What will you do then?",
				  type: "input",
				  showCancelButton: true,
				  closeOnConfirm: false,
				  showLoaderOnConfirm: true,
				  animation: "slide-from-top",
				  inputValue: response.name,
				  inputPlaceholder: "Do something"
				},
				function(inputValue){
					if (inputValue === "" || inputValue === false) {
					    return false;
					}
					update(id,inputValue);
				});
			}
		});
});
}

function add_new_todo_li(id,name, creeatedtime, type="append")
{
	var new_li = '<a class="dropdown-item d-flex todos_a" href="#" data-id='+ id +'>'+
'<div class="wd-90p"><div class="d-flex"><h5 class="mb-1">'+ name +'</h5><small class="text-muted ms-auto text-end">' +
                                                         "<button data-toggle=\"tooltip\" data-title=\"Done\" class=\"done-btn  btn-outline-danger\" data-id="+ id +"><i class=\"fe fe-x-circle btn-icon-wrapper\"></i></button>"+
                                                        '</small></div> </div></a>';
 if (type=="prepend") {
 	$('#todo-container').before(new_li);
 } 
 else{
 	$('#todo-container').before(new_li);
 }                          
    counttodo();
}	



function counttodo(argument) {
	if ($('.todos_a').length > 5 ) { return false;}
	$("#counttodo").text($('.todos_a').length);
}