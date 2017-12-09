<%@ Page Title="" Language="C#" MasterPageFile="~/portals/admin/admin.Master" AutoEventWireup="true" CodeBehind="ModifyDepartment.aspx.cs" Inherits="CIS.portals.admin.ModifyDepartment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="panel panel-primary">
        <div class="panel-body">
            <h3>Department Details</h3>
        </div>
        <div class="panel-body"> 
            <div class="form-group">
                <label>Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
               <div class="form-group">
                <label>Code</label>
                <asp:TextBox ID="txtCode" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div style="padding:10px; margin:10px;grid-cell: ">
                      <asp:Button ID="btnSubmit" runat="server" Text="Save" Width="10em" CssClass="btn btn-primary pull-right" OnClick="btnSubmit_Click" /> <div class="pull-right" style="width:25px; height:auto; display:inline-block">&nbsp;</div>
                     <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="10em" CssClass="btn btn-danger pull-right" OnClick="btnCancel_Click" />
                       
           </div>
        </div>
    </div>
</div>
</asp:Content>
