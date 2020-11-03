<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Amount.aspx.cs" Inherits="FingerprintATM.Amount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Login and Register</title>
	
	<link rel="stylesheet" href="asset/css/style.css" type="text/css" media="all" />
	
	<link href="asset/css/font-awesome.min.css" rel="stylesheet"/>
</head>
<body>
    <div class="main-bg">
		<!-- title -->
		<h1>Enter Amount Now</h1>
		<!-- //title -->
		<div class="sub-main-w3">
			<%--<div class="image-style">

			</div>--%>
			<!-- vertical tabs -->
			<div class="vertical-tab">
				<div id="section1" class="section-w3ls">
                    <input type="radio" name="sections" id="option1" checked>
					<label for="option1" class="icon-left-w3pvt"><span class="fa fa-user-circle" aria-hidden="true"></span>Amount to Widthdraw</label>					
					<article>
						<form id="form1" runat="server">
							<h3 class="legend" id="Bankname" runat="server"></h3>
							<div class="input">
								<span class="fa fa-envelope-o" aria-hidden="true"></span>
                               <input type="text" id="amount" runat="server" placeholder="Amount"  required />
							</div>			
                            <asp:Button ID="Button1" CssClass="btn submit" runat="server" Text="Select" OnClick="Button1_Click" />				
							<%--<button type="submit" class="btn submit">Select</button>--%>
						</form>
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
</body>
</html>
