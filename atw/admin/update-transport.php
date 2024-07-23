<?php
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['alogin'])==0)
	{	
header('location:index.php');
}
else{
$tid=intval($_GET['tid']);	
if(isset($_POST['submit']))
{
$tname=$_POST['transname'];
$ttype=$_POST['transtype'];	
// $plocation=$_POST['packagelocation'];
// $pprice=$_POST['packageprice'];	
$tfeatures=$_POST['transfeatures'];
$tdetails=$_POST['transdetails'];	
$timage=$_FILES["transimage"]["name"];
$sql="update TblTransportasi set TransName=:tname,TransType=:ttype,TransFetures=:tfeatures,TransDetails=:tdetails where TransId=:tid";
$query = $dbh->prepare($sql);
$query->bindParam(':tname',$tname,PDO::PARAM_STR);
$query->bindParam(':ttype',$ttype,PDO::PARAM_STR);
// $query->bindParam(':plocation',$plocation,PDO::PARAM_STR);
// $query->bindParam(':pprice',$pprice,PDO::PARAM_STR);
$query->bindParam(':tfeatures',$tfeatures,PDO::PARAM_STR);
$query->bindParam(':tdetails',$tdetails,PDO::PARAM_STR);
$query->bindParam(':tid',$tid,PDO::PARAM_STR);
$query->execute();
$msg="Transportasi Updated Successfully";
}

	?>
<!DOCTYPE HTML>
<html>
<head>
<title>ATW | Admin Transportasi Creation</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Pooled Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="css/morris.css" type="text/css"/>
<link href="css/font-awesome.css" rel="stylesheet"> 
<script src="js/jquery-2.1.4.min.js"></script>
<link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'/>
<link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
  <style>
		.errorWrap {
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #dd3d36;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
.succWrap{
    padding: 10px;
    margin: 0 0 20px 0;
    background: #fff;
    border-left: 4px solid #5cb85c;
    -webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
    box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
		</style>

</head> 
<body>
   <div class="page-container">
   <!--/content-inner-->
<div class="left-content">
	   <div class="mother-grid-inner">
              <!--header start here-->
<?php include('includes/header.php');?>
							
				     <div class="clearfix"> </div>	
				</div>
<!--heder end here-->
	<ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="dashboard.php">Home</a><i class="fa fa-angle-right"></i>Update Transportasi </li>
            </ol>
		<!--grid-->
 	<div class="grid-form">
 
<!---->
  <div class="grid-form1">
  	       <h3>Update Transportasi</h3>
  	        	  <?php if($error){?><div class="errorWrap"><strong>ERROR</strong>:<?php echo htmlentities($error); ?> </div><?php } 
				else if($msg){?><div class="succWrap"><strong>SUCCESS</strong>:<?php echo htmlentities($msg); ?> </div><?php }?>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						
<?php 
$tid=intval($_GET['tid']);
$sql = "SELECT * from TblTransportasi where TransId=:tid";
$query = $dbh -> prepare($sql);
$query -> bindParam(':tid', $tid, PDO::PARAM_STR);
$query->execute();
$results=$query->fetchAll(PDO::FETCH_OBJ);
$cnt=1;
if($query->rowCount() > 0)
{
foreach($results as $result)
{	?>

							<form class="form-horizontal" name="trans" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">Nama Transportasi</label>
									<div class="col-sm-8">
										<input type="text" class="form-control1" name="transname" id="transname" placeholder="Create Transportasi" value="<?php echo htmlentities($result->TransName);?>" required>
									</div>
								</div>
<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">Tipe Transportasi</label>
									<div class="col-sm-8">
										<input type="text" class="form-control1" name="transtype" id="transtype" placeholder=" Tipe Transportasi" value="<?php echo htmlentities($result->TransType);?>" required>
									</div>
								</div>

<!-- <div class="form-group"> -->
									<!-- <label for="focusedinput" class="col-sm-2 control-label">Lokasi Paket</label> -->
									<!-- <div class="col-sm-8"> -->
										<!-- <input type="text" class="form-control1" name="packagelocation" id="packagelocation" placeholder=" Package Location" value="<?php echo htmlentities($result->PackageLocation);?>" required> -->
									<!-- </div> -->
								<!-- </div> -->

<!-- <div class="form-group"> -->
									<!-- <label for="focusedinput" class="col-sm-2 control-label">Harga Paket (IDR)</label> -->
									<!-- <div class="col-sm-8"> -->
										<!-- <input type="text" class="form-control1" name="packageprice" id="packageprice" placeholder=" Package Price is IDR" value="<?php echo htmlentities($result->PackagePrice);?>" required> -->
									<!-- </div> -->
								<!-- </div> -->

<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">Fasilitas</label>
									<div class="col-sm-8">
										<input type="text" class="form-control1" name="transfeatures" id="transfeatures" placeholder="Fasilitas" value="<?php echo htmlentities($result->TransFetures);?>" required>
									</div>
								</div>		


<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">Detail Transportasi</label>
									<div class="col-sm-8">
										<textarea class="form-control" rows="5" cols="50" name="transdetails" id="transdetails" placeholder="Trans Details" required><?php echo htmlentities($result->TransDetails);?></textarea> 
									</div>
								</div>															
<div class="form-group">
<label for="focusedinput" class="col-sm-2 control-label">Gambar</label>
<div class="col-sm-8">
<img src="pacakgeimages/<?php echo htmlentities($result->TransImage);?>" width="200">&nbsp;&nbsp;&nbsp;<a href="change-image-trs.php?imgid=<?php echo htmlentities($result->TransId);?>">Change Image</a>
</div>
</div>

<div class="form-group">
									<label for="focusedinput" class="col-sm-2 control-label">Last Updation Date</label>
									<div class="col-sm-8">
<?php echo htmlentities($result->UpdationDate);?>
									</div>
								</div>		
								<?php }} ?>

								<div class="row">
			<div class="col-sm-8 col-sm-offset-2">
				<button type="submit" name="submit" class="btn-primary btn">Update</button>
			</div>
		</div>
						
					
						
						
						
					</div>
					
					</form>

     
      

      
      <div class="panel-footer">
		
	 </div>
    </form>
  </div>
 	</div>
 	<!--//grid-->

<!-- script-for sticky-nav -->
		<script>
		$(document).ready(function() {
			 var navoffeset=$(".header-main").offset().top;
			 $(window).scroll(function(){
				var scrollpos=$(window).scrollTop(); 
				if(scrollpos >=navoffeset){
					$(".header-main").addClass("fixed");
				}else{
					$(".header-main").removeClass("fixed");
				}
			 });
			 
		});
		</script>
		<!-- /script-for sticky-nav -->
<!--inner block start here-->
<div class="inner-block">

</div>
<!--inner block end here-->
<!--copy rights start here-->
<?php include('includes/footer.php');?>
<!--COPY rights end here-->
</div>
</div>
  <!--//content-inner-->
		<!--/sidebar-menu-->
					<?php include('includes/sidebarmenu.php');?>
							  <div class="clearfix"></div>		
							</div>
							<script>
							var toggle = true;
										
							$(".sidebar-icon").click(function() {                
							  if (toggle)
							  {
								$(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
								$("#menu span").css({"position":"absolute"});
							  }
							  else
							  {
								$(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
								setTimeout(function() {
								  $("#menu span").css({"position":"relative"});
								}, 400);
							  }
											
											toggle = !toggle;
										});
							</script>
<!--js -->
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
   <script src="js/bootstrap.min.js"></script>
   <!-- /Bootstrap Core JavaScript -->	   

</body>
</html>
<?php } ?>