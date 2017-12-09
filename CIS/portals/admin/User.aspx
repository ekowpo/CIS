<%@ Page Title="" Language="C#" MasterPageFile="~/portals/admin/admin.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="CIS.portals.admin.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

        <div class="panel panel-default">
            <div class="panel-heading"><h3>Users</h3>
                </div>
            <div class="panel-body">
                <div class="row">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary pull-right" Width="10em" OnClick="btnAdd_Click" />
                    </div>
                <div class="row">
                    <label>Role &nbsp;</label>
                <asp:DropDownList ID="ddlRole" runat="server" DataSourceID="edsRole" DataTextField="name" DataValueField="role_id" Width="60%" AutoPostBack="True"></asp:DropDownList>
                    <ef:EntityDataSource ID="edsRole" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="roles" Include="">
                    </ef:EntityDataSource>
                </div>
                <div class="row">
                  
                    <asp:GridView ID="gdvUser" EmptyDataText="Record is empty" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="user_id" DataSourceID="edsUsers" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="gdvUser_SelectedIndexChanged" Width="100%">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="user_id" HeaderText="user_id" ReadOnly="True" SortExpression="user_id" />
                            <asp:BoundField DataField="user.first_name" HeaderText="First Name" SortExpression="user" />
                            <asp:BoundField DataField="user.last_name" HeaderText="Last Name" SortExpression="user" />
                            <asp:BoundField DataField="user.DOB" HeaderText="DOB" SortExpression="user" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="user.phone" HeaderText="Phone" SortExpression="user" />
                            <asp:BoundField DataField="user.email" HeaderText="Email" SortExpression="user" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:EntityDataSource ID="edsUsers" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="logins" Where="" Include="user" EntityTypeFilter="" Select="">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="ddlRole" Name="role_id" PropertyName="SelectedValue" Type="Int32" />
                        </WhereParameters>
                    </asp:EntityDataSource>
                </div>
            </div>
        </div>
     </div>

</asp:Content>
