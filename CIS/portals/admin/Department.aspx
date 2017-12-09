<%@ Page Title="" Language="C#" MasterPageFile="~/portals/admin/admin.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="CIS.portals.admin.Department" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="container">
            <div class="panel">
                <div class="panel-heading"> 
                    <h3> Department</h3>

                </div>
                <div class="panel-body">
                    <div class="row">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary pull-right" Width="10em" OnClick="btnAdd_Click" />
                    </div>
                    <div class="row">
                        <ef:EntityDataSource ID="EntityDataSource1"  runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="departments" EnableDelete="True"></ef:EntityDataSource>
                        <asp:GridView ID="gdvDept" runat="server" Width="100%" AllowPaging="True" EmptyDataText="Record is empty" AutoGenerateColumns="False" DataKeyNames="departmentId" DataSourceID="EntityDataSource1" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="gdvDept_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="departmentId" HeaderText="ID" ReadOnly="True" SortExpression="departmentId" Visible="False" />
                                <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                                <asp:TemplateField HeaderText="Code" SortExpression="code">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("code") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("code") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Do you want to delete this department?')" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
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
                    </div>
                </div>

            </div>

        </div>

</asp:Content>
