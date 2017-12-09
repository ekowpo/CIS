<%@ Page Title="" Language="C#" MasterPageFile="~/portals/admin/admin.Master" AutoEventWireup="true" CodeBehind="modifysemester.aspx.cs" Inherits="concordia_sis.portals.admin.modifysemester" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3> Semester Details</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <label> Semester Type </label>
                        <asp:DropDownList ID="ddlTypes" runat="server" CssClass="form-control" AutoPostBack="True">
                            <asp:ListItem>Fall</asp:ListItem>
                            <asp:ListItem>Summer 1</asp:ListItem>
                            <asp:ListItem>Summer 2</asp:ListItem>
                            <asp:ListItem>Winter</asp:ListItem>
                        </asp:DropDownList>

                    </div>
                    <div class="form-group">

                        <label>Start Date</label>
                        <asp:TextBox ID="txtStateDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="form-group">

                        <label>End Date</label>
                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div class="form-group">

                        <label>DNE</label>
                        <asp:TextBox ID="txtDNE" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    </div>
                    <div style="padding:10px; margin:10px;grid-cell: ">
                      <asp:Button ID="btnSubmit" runat="server" Text="Save" Width="10em" CssClass="btn btn-primary pull-right" OnClick="btnSubmit_Click" /> <div class="pull-right" style="width:25px; height:auto; display:inline-block">&nbsp;</div>
                     <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="10em" CssClass="btn btn-danger pull-right" OnClick="btnCancel_Click" />
                       
                     </div>
                </div>
        </div>
    </div>
</asp:Content>
