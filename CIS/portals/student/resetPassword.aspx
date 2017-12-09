<%@ Page Title="" Language="C#" MasterPageFile="~/portals/student/student.Master" AutoEventWireup="true" CodeBehind="resetPassword.aspx.cs" Inherits="concordia_sis.portals.student.resetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

            <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3> Reset Password</h3>
                    </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label for="txtNew">Current Password</label><asp:RequiredFieldValidator ID="rfvOldPassword" runat="server" ControlToValidate="txtOld" ErrorMessage="Old Password Required" ForeColor="Red">Required</asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="txtOld" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <label for="txtOld">New Password</label><asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ControlToValidate="txtNew" ErrorMessage="New Password Required" ForeColor="Red">Required</asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="txtNew" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>

                    </div>
                    <div class="form-group">
                        <label for="txtConfirm">Confirm Password</label>&nbsp;<asp:CompareValidator ID="cvPassword" runat="server" ControlToCompare="txtNew" ControlToValidate="txtConfirm" ErrorMessage="CompareValidator" ForeColor="Red">Not A Match</asp:CompareValidator>
                        <asp:TextBox ID="txtConfirm" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>

                    </div>
                                <div style="padding:10px; margin:10px;grid-cell: ">
                      <asp:Button ID="btnSubmit" runat="server" Text="Save" Width="10em" CssClass="btn btn-primary pull-right" OnClick="btnSubmit_Click" /> <div class="pull-right" style="width:25px; height:auto; display:inline-block">&nbsp;</div>
                     <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="10em" CssClass="btn btn-danger pull-right" OnClick="btnCancel_Click" />
                       
                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                    </asp:ScriptManager>
                       
           </div>

                </div>

            </div>
    </div>

</asp:Content>
