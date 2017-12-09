<%@ Page Title="" Language="C#" MasterPageFile="~/portals/admin/admin.Master" AutoEventWireup="true" CodeBehind="Programs.aspx.cs" Inherits="CIS.portals.admin.Programs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container">
            <div class="panel">
                <div class="panel-heading"> 
                    <h3> Programs</h3>

                </div>
                <div class="panel-body">
                    <div class="row">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary pull-right" Width="10em" OnClick="btnAdd_Click" />
                    </div>
                    <div class="row">
                        <label>Department &nbsp; </label>
                        <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="dropdown" Width="60%" AutoPostBack="True" DataSourceID="edsDept" DataTextField="name" DataValueField="departmentId"></asp:DropDownList>
                        <ef:EntityDataSource ID="edsDept" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="departments">
                        </ef:EntityDataSource>
                    </div>
                    <div class="row">
                        <asp:EntityDataSource ID="edsPrograms" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableDelete="True" EnableFlattening="False" EntitySetName="programs" Include="department1" Where="" EntityTypeFilter="" Select="">
                            <WhereParameters>
                                <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="0" Name="Department" PropertyName="SelectedValue" Type="Int32" />
                            </WhereParameters>
                        </asp:EntityDataSource>
                    </div>
                    <div class="row">

                        

                        <asp:GridView ID="gdvPrograms" EmptyDataText="Record is empty" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="edsPrograms" ForeColor="Black" GridLines="Vertical" Width="100%" OnSelectedIndexChanged="gdvPrograms_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="False" />
                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                                <asp:BoundField DataField="requiredCredit" HeaderText="Credit Required" SortExpression="requiredCredit" />
                                <asp:BoundField DataField="termFees" HeaderText="Per Team Fees" SortExpression="termFees" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Do you want to delete this Program?')" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
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
