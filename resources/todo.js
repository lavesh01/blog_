var todo_uri = site_url + 'todo/';
$(function() {

			

			$("#todo_list").click(function (argument) {
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
			$("ul#todo-container li[data-id='"+ response.id +"'] span").html(response.name);
			setTimeout(function(e){
				swal.close();
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
				$("li[data-id='"+ id +"']").css('background-color','rgba(120, 174, 223,0.2)');
				$("#log").html("loading..");
			},
			error : function(error){
				$('#log').html('something wrong');
			},
			success : function(response){
				$("li[data-id='"+ id +"']").fadeOut(300);
				setTimeout(function(){
					$("li[data-id='"+ id +"']").remove();
				},500);
				resetLog();
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
	var new_li = "<li class='list-group-item' data-id="+ id +">"+
														"<div class=\"action\">"+
															
														"</div>"+
													
						'<div class="widget-content p-0"><div class="widget-content-wrapper"><div class="widget-content-left"><div class="widget-heading">'+
                                                           "<span data-id="+id +">"+ name +"</span>" +
                         '</div></div><div class="widget-content-right">' +
                          //"<button data-toggle=\"tooltip\" data-title=\"Edit\" class=\"edit-btn mb-1 mr-1 btn-icon btn-icon-only btn-pill btn btn-outline-danger\" data-id="+ id +"><i class=\"fa fa-edit btn-icon-wrapper\"></i></button>\r\n"+
						 "<button data-toggle=\"tooltip\" data-title=\"Done\" class=\"done-btn mb-1 mr-1 btn-icon btn-icon-only btn-pill btn btn-outline-danger\" data-id="+ id +"><i class=\"pe-7s-trash btn-icon-wrapper\"></i></button>"+

                           '</div></div></div>'+
                           "</li>";
 if (type=="prepend") {
 	$('#todo-container').prepend(new_li);
 } 
 else{
 	$('#todo-container').append(new_li);
 }                          
    
}	


