<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FingerprintATM.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Login and Register</title>
	
	<link rel="stylesheet" href="asset/css/style.css" type="text/css" media="all" />
	
	<link href="asset/css/font-awesome.min.css" rel="stylesheet">
	
    <script src="asset/js/jquery-1.8.2.js"></script>
    <script src="asset/js/mfs100-9.0.2.6.js"></script>
    <script>
        var quality = 60; //(1 to 100) (recommanded minimum 55)
        var timeout = 10; // seconds (minimum=10(recommanded), maximum=60, unlimited=0 )        function Verify() {
            try {
                try {

                    document.getElementById('txtIsoTemplate').value = "";

                    var res = CaptureFinger(quality, timeout);
                    if (res.httpStaus) {
                        if (res.data.ErrorCode == "0") {
                            document.getElementById('txtIsoTemplate').value = res.data.IsoTemplate;
                        }
                    }
                    else {
                        alert(res.err);
                    }

                    var isotemplate = document.getElementById('txtIsoTemplate').value;

                    var rows = document.getElementsByTagName("table")[0].rows;
                    var cc = 0;
                    for (var i = 1; i < rows.length; i++) {
                        var last = rows[rows.length - 1];

                        var isotemplate1 = rows[i].cells[0].innerHTML;

                        var res = VerifyFinger(isotemplate1, isotemplate);

                        if (res.httpStaus) {
                            if (res.data.Status) {
                                cc++;
                                alert("Finger matched");
                                window.location.href = "SelectBank.aspx?ID="+rows[i].cells[1].innerHTML;

                                break;
                            }
                            else {
                                if (res.data.ErrorCode != "0") {
                                    alert(res.data.ErrorDescription);
                                }
                                else {

                                    // alert("Finger not matched");
                                }
                            }
                        }
                        else {
                            alert(res.err);
                        }
                    }

                    if (cc == 0) {
                        alert("Finger not matched");
                    }
                }
                catch (e) {
                    alert(e);
                }
            }

            catch (e) {
                alert(e);
            }
            return false;

        }
    </script>
</head>
<body>
   
    <div>
    <div class="main-bg">
		<!-- title -->
		<h1>Global ATM</h1>
		<!-- //title -->
		<div class="sub-main-w3">
			<%--<div class="image-style">

			</div>--%>
			<!-- vertical tabs -->
			<div class="vertical-tab">
				<div id="section1" class="section-w3ls">
					<input type="radio" name="sections" id="option1" checked>
					<label for="option1" class="icon-left-w3pvt"><span class="fa fa-user-circle" aria-hidden="true"></span>Login</label>
					<article>
						<form id="form1" runat="server">
							<h3 class="legend">Login Here</h3>
							<div class="input">
								<span class="fa fa-envelope-o" aria-hidden="true"></span>
								<input type="email" placeholder="Enter Your ID" name="email" required />
							</div>
							<div class="input" style="display:none" >
								<span class="fa fa-key" aria-hidden="true"></span>
								<input type="text" id="txtIsoTemplate" required />
							</div>
							<button type="submit" class="btn submit" onclick="Verify(); return false;">Login</button>
                            <asp:GridView ID="GridView1" runat="server" Style="display: none"></asp:GridView>
							
						</form>
					</article>
				</div>
               
				<div id="section2" class="section-w3ls">
                    
					<input type="radio" name="sections" id="option2"/>
					<label for="option2" class="icon-left-w3pvt"><span class="fa fa-pencil-square" aria-hidden="true"></span> <a href="Register.aspx">Register</a></label> 
					<article>
						 
					</article>
                       
				</div>
                
			</div>
			<!-- //vertical tabs -->
			<div class="clear"></div>
		</div>
		<!-- copyright -->
		<div class="copyright">
			
		</div>
		<!-- //copyright -->
	</div>

    </div>
   
</body>
</html>
