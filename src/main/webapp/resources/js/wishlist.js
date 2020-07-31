console.log("■■■■■■■■■■■■■■■■■■■■■■■■wishlist Module ...")

var wishService= (function(){
	
	function add(register, callback, error){
		console.log("■■■■■■■■■■■■■■■■■■■■■■■■add wish.........");
		
		$.ajax({
			type : 'post',
			url : '/wishlist/register',
			data : JSON.stringify(register),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
		})
		
		
	}	
	return {add:add};
})();