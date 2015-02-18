<jsp:include page="templates/header.jsp"/>

<!-- Main content div -->
<div class="container">
	Welcome ${tdmin.firstname} &nbsp; ${tdmin.lastname}
	
	<style unselectable="on">
#wrap {
width:1000px;
height:900px;
padding:0;
position:relative;
left:0px;
top:0px;
overflow:hidden;
}
#frame {
width:1000px;
height:900px;
position:relative;
left:0px;
top:0px;
}
#frame {
-ms-zoom:0.7;
}
</style>
<div id="wrap" unselectable="on">
    <iframe id="frame" src="webcals://sharing.calendar.live.com/calendar/private/497e820e-220f-4958-9699-37d3a52dfaf9/5dd5e475-371a-408d-9b5f-40767f276217/cid-aa54bcae8e99db41/calendar.ics"></iframe>
</div>
</div>


<jsp:include page="templates/footer.jsp"/>