<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CIS.Default1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
       
      
    <div class="panel panel-primary" style="width:40%; margin:auto; margin-top:10%">
            <div class="panel-heading">
                <h3 style="text-align:center">Login</h3>
            </div>
            <div class="panel-body">
                <form id="form2" runat="server">
                    <div class="row">
                        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                     <div class="form-group">
                            <label for="txtUserName">Username:</label>
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="form-group">
                            <label for"txtPassword">Password:</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    </div>
            <div>
                <asp:Button ID="btn_login" runat="server" Text="Login" OnClick="btn_login_Click" CssClass="btn btn-primary pull-right" />
            </div>
        </form>
       </div>

            </div>
       
    </div>
</body>
</html>