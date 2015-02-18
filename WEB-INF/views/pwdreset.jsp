<jsp:include page="templates/header.jsp"/>

<!-- Main content div -->
<div class="container">
	<form action="../tdmin/pwdreset" class="form-horizontal" method="post">
		  <input type="hidden" name="id" value="${tdmin.id}">
		  <div class="form-group">
		    <label class="col-xs-4 control-label">Password </label>
		    <div class="col-md-5">
		      <input type="password" class="form-control" id="password" name="pwd" placeholder="Password" required>
		    </div>
		  </div>
		  <div class="form-group">
		    <label class="col-xs-4 control-label">Confirm Password</label>
		    <div class="col-md-5">
		      <input type="password" class="form-control" id="rpassword" name="password" placeholder="Confirm Password">
		      <p id="pCheckPasswordMatch"></p>
		    </div>		    
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-4 col-sm-10">
		       <button  type="submit" class="btn btn-success btn-xs" id="btn-submit">	Submit	</button>
			   <button type="button" class="btn btn-danger btn-xs btn-cnl" id="reset-cnl">	Cancel	</button>
		    </div>
		  </div>	
	 </form>
</div>
<script type="text/javascript">
function checkPasswordMatch() {
    var password = $("#password").val();
    var confirmPassword = $("#rpassword").val();

    if (password != confirmPassword)
        $("#pCheckPasswordMatch").html("Passwords do not match!");
    else
        $("#pCheckPasswordMatch").html("Passwords match.");
}

$(document).ready(function(){
	$("#rpassword").keyup(checkPasswordMatch);
	$(function(){
		$('#reset-cnl').click(function(){
			$('a#dashboard')[0].click();
		});
	});
});

</script>

<jsp:include page="templates/footer.jsp"/>