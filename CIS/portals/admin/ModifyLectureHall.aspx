<%@ Page Title="" Language="C#" MasterPageFile="~/portals/admin/admin.Master" AutoEventWireup="true" CodeBehind="ModifyLectureHall.aspx.cs" Inherits="CIS.portals.admin.ModifyLectureHall" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

    <div class="panel panel-default"> 
        <div class="panel-heading">
            <h3>Lecture Hall Details</h3>

        </div>
        <div class="panel-body">
            <div class="form-group">
                <label>Building</label>
                <asp:TextBox ID="txtBuilding" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group">
                <label>Room Number</label>
                <asp:TextBox ID="txtRoom" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Seats</label>
                <asp:TextBox ID="txtSeats" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
             
           <div style="padding:10px; margin:10px;grid-cell: ">
                      <asp:Button ID="btnSubmit" runat="server" Text="Save" Width="10em" CssClass="btn btn-primary pull-right" OnClick="btnSubmit_Click" /> <div class="pull-right" style="width:25px; height:auto; display:inline-block">&nbsp;</div>
                     <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="10em" CssClass="btn btn-danger pull-right" OnClick="btnCancel_Click" />
                       
           </div>
        </div>
    </div>
</div>

</asp:Content>
