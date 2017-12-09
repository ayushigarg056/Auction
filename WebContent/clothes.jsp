<%@page import="demoo.dao" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<link href="itemfurniture.css" rel="stylesheet">
<style>
.modal {
    display: none; 
    position: fixed;
    z-index: 1; 
    padding-top: 100px; 
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto; 
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.9);
}


.modal-content {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
    max-height: 270px;
}


#caption {
    margin: auto;
    display: block;
    width: 80%;
    max-width: 700px;
    text-align: center;
    color: #ccc;
    padding: 10px 0;
    height: 150px;
}

.modal-content, #caption {    
    -webkit-animation-name: zoom;
    -webkit-animation-duration: 0.6s;
    animation-name: zoom;
    animation-duration: 0.6s;
}

@-webkit-keyframes zoom {
    from {-webkit-transform: scale(0)} 
    to {-webkit-transform: scale(1)}
}

.close {
    position: absolute;
    top: 15px;
    right: 35px;
    color: #f1f1f1;
    font-size: 40px;
    font-weight: bold;
    transition: 0.3s;
}

.close:hover,
.close:focus {
    color: #bbb;
    text-decoration: none;
    cursor: pointer;
}

h2{
   border-bottom: 1px solid green;
   margin-left: 0px;
}

img{
  cursor: pointer;
}

img:hover{
  opacity:0.7;}

body{
    background:#f9f9f9 url() repeat left top; 

}
/*tr { border: none; }
td {
  border-right: solid  1px; 
  border-left: solid  1px;

}*/
</style>
</head>


<header id="top" style="background-color:rgb(36,39,42); height:100%; width:100%; padding-left:0px;">
    <nav role="navigation" style=" background:rgb(36,39,42); height:80px; position:fixed; width:100%;"> 
        <ul class="blocks" >
          <li><a href="home.html">Home</a></li>
          <li> <a href="" >Profile</a></li>
          <li><a href="addprod.html">Add Product</a></li>
          <li><a href="home.html#about">About us</a></li>
          <li><a href="feedback.html">Feedback</a></li>
        </ul>
    </nav>
        <h1 style="line-height:27px; padding-top:120px; color:#fff; text-decoration:none;">SALVATORE's AUCTION</h1>
</header>
<body>
<div style="padding-left: 0.5cm; padding-right: 0.5cm;">
<h2>CLOTHES</h2>
<div>
<script>
var product_name = [];
var product_des = [];
var product_minbid = [];
var product_bidtime = [];

var k=0;
</script>

<% int c=0;

try
{
	Connection cn=dao.mycon();
PreparedStatement ps = cn.prepareStatement("select * from clothes where bid_end_time >NOW()");
ResultSet rs=ps.executeQuery();

while(rs.next()){ 
	c++;
}
rs.first();

for(int i=0;i<c;){
	
			%>		<div><table  cellpadding="8">
			<tr><%
			for(int j=0;j<4&&j<(c-i);j++)
			{
				%>    <td  style="border-left: thick solid black; border-top: thick solid black; border-right: thick solid black;"><center><%=rs.getString(2) %></center></td>
				
		<script>
		product_name[k]    = '<%=rs.getString(2)%>';
		product_des[k]     = '<%=rs.getString(3)%>';
		product_minbid[k]  = '<%=rs.getInt(4)%>';
		product_bidtime[k] = '<%=rs.getString(5)%>';
		k=k+1;
		</script>
				
				<%
				rs.next();
			}
			%></tr><tr><%
			rs.absolute(i+1);
			for(int j=0;j<4&&j<(c-i);j++)
			{
			%><td  style="border-left: thick solid  black; border-right: thick solid black;" >
            <img id=<%="myImg"+(i+j+1)%> src=<%="clothes/"+rs.getInt(1)+".jpg"%> alt="hiii" width="300" height="200"></td><%
        	rs.next();
			}
			%></tr><%
			for(int j=0;j<4&&j<(c-i);j++)
			{
				%><td  style="border-left: thick solid  black; border-bottom: thick solid black; border-right: thick solid black;">
				<center><div id="countdowntimer"><span id="time" style="color:black;"><span></div></center>
				</td><%
			}
		i=i+4;
		%></table></div><br><br><%
}

%>
<!-- The Modal -->
<div id="myModal" class="modal">
  <img class="modal-content" id="img01">
  <div id="caption" class ="modal-content"></div>
  <form role="form" name="bid-form" method="post" action="bid.php" style="color:#000; position:absolute; left:30%; top:48%; font-size:18px; ">
            	  
	<table style="margin-left:20px;  color:rgb(245,245,245); width:100%;" cellpadding="10" >
		<tbody >
<tr><td class="cell"> Product Name</td><td class="cell" id="p_name"></td></tr>
<tr><td class="cell"> Product Description</td><td class="cell" id="descrip"></td></tr>
<tr><td class="cell"> Category</td><td class="cell" id="categ">Furniture</td></tr>
<tr><td class="cell"> Minimum Bid</td><td class="cell" id="minbid"></td></tr>
<tr><td class="cell"> Bid End Time</td><td class="cell" id="bidtime"> </td></tr>
<tr><td class="cell"> Enter Your Bid Amount ( In INR )</td><td class="cell"> <input type="number" id="bid" name="bid_amt" required placeholder="1000" >
 </td></tr>
 <p style="position:absolute; left:42%; width:18%;  top:95%; "><a class="btn btn-book " href="rooms.html" role="button" style=" border: 1px solid #ccc; border-radius: 4px;" onClick="return checkbid()"><b>BID </a></p>
 
	</tbody>
	</table>
  </form>

</div>
</div>

<script>

var modal = document.getElementById('myModal');

var img = [];
var i;
//var m=0;
for(i=0;i<parseInt(<%=c%>);i++)
	{
	img[i]=document.getElementById('myImg'+(i+1));
	}

var modalImg = document.getElementById("img01");
var p_name= document.getElementById("p_name");
var p_descrip= document.getElementById("descrip");
var p_min_bid= document.getElementById("minbid");
var p_bid_end= document.getElementById("bidtime");
var p_bid= document.getElementById("bid");
 
window.onclick = function() {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
<% rs.first(); 
 
%>
for( i = 0; i < <%=c%>; i++ ){ (function(i){
    img[i].onclick = function() {
    	 modal.style.display = "block";
    	    modalImg.src = this.src;   
			p_name.innerHTML    = product_name[i];
			p_descrip.innerHTML = product_des[i];
			p_min_bid.innerHTML = product_minbid[i];
			p_bid_end.innerHTML = product_bidtime[i];
			p_bid.value =parseInt(product_minbid[i])+100; 
    }
})(i)};
<%
}
catch(Exception e)
{
}

%>

function checkbid()
{
	var min_bid=parseInt(document.getElementById("minbid").innerHTML);
	var user_bid=parseInt(document.getElementById("bid").value);
	if(document.getElementById("bid").value == "")
		{
		alert("Oups you forgot somthing :p");
		document.getElementById("bid").value=min_bid+100;
		return false;
		}
	else if(min_bid>=user_bid)  
		{
		alert("More More More !!! \n Bid more dear ...");
		document.getElementById("bid").value=min_bid+100;
		return false;
		}
	return true;
}

</script>
</div>

<footer style="padding-left:0px;">
  <div style="position:absolute; width:100%; height:400px; background-color:rgb(51,48,54); margin-top:15px;">
      <div style="position:relative; float:left; width:300px; height:400px; overflow:hidden; margin:0 12px 0 54px;">
        <h3>About</h3>
        <p>We strive to deliver a level of service that exceeds the expectations of our customers. <br />
          <br />
          If you have any questions about our products or services, please do not hesitate to contact us. We have friendly, knowledgeable representatives available seven days a week to assist you.</p>
      </div>
      <div style="position:relative; float:left; width:240px; height:400px;overflow:hidden; margin:0 12px 0 12px;">
        <h3>Tweets</h3>
        <p><span>Tweet</span> <a href="#">@Awlele</a><br /></p>
        <p style="margin-top:12px"><span>Tweet</span> <a href="#">@Akki</a><br /></p>
      </div>
      <div style="position:relative; float:left; max-width:400px; height:400px; overflow:hidden;margin:0 12px 0 12px;">
        <h3>Mailing list</h3>
        <p>Subscribe to our mailing list for offers, news updates and more!</p>
        <br />
        <form action="subscribe.php" method="post" >
          <div >
            <label  for="exampleInputEmail2">Your email:</label>
            <input type="email" placeholder="akki@auberge.co.in" name="email" style=" border: 2px solid #fff; border-radius: 2px; margin:0 4px 6px 4px; ">
          </div>
          <button type="submit" class="btn " >subscribe</button>
        </form>
      </div>
      <div style="position:relative; float:left;max-width:600px; height:400px; overflow:auto;margin:0 12px 0 12px;">
        <h3>Reach Us</h3>
        <p>Lake Pichola<br />
          Udaipur, Rajasthan 313001<br />
          India<br />
          <br />
          Phone: (0294) 286-4752<br />
          Fax: (022) 227-24431<br />
          <br />
        </p>   
    </div>
  </div>
</footer>

</body>
</html>