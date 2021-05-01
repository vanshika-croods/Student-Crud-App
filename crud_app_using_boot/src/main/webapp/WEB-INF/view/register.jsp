<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" type="text/css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</head>
<body>
		<div>
		<select class="js-data-example-ajax" name="">
		<option value=""> search value</option>
		</select>
		</div>
	    
</body>
<script>
	$(document).ready(function(){
		$(".js-data-example-ajax").select2({
	        placeholder: "Search contactNumber",
	        allowClear: 1,
	        ajax: {
	            url: "/find/select/json",
	            dataType: "json",
	            type: "GET",
	            delay: 250,
	            data: function(e) {
	                return {
	                    contactname: e.term,
	                    page: e.page
	                }
	            },
	            processResults: function(e, t) {
	                return t.page = t.page || 1, {
	                    results: e.items,
	                    pagination: {
	                        more: 30 * t.page < e.total_count
	                    }
	                }
	            },
	            cache: !0
	        },
	        escapeMarkup: function(markup) {
	            return markup;
	        },
	        minimumInputLength: 1,
	        templateResult: function(e) {
	            if (e.loading) return e.student_name;
	            return e.student_name
	        },
	        templateSelection: function(data, container) {
	           
	            return data.student_name;
	        }
	    });	
	});
</script>
</html>