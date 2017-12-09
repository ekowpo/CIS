<%@ Page Title="" Language="C#" MasterPageFile="~/portals/admin/admin.Master" AutoEventWireup="true" CodeBehind="Lecturehall.aspx.cs" Inherits="CIS.portals.admin.Lecturehall" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
        <div class="container">
            <div class="panel">
                <div class="panel-heading"> 
                    <h3>Lecture Halls</h3>

                </div>
                <div class="panel-body">
                    <div class="row">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary pull-right" Width="10em" OnClick="btnAdd_Click" />
                    </div>
                    <div class="row">
                        <ef:EntityDataSource ID="edsLectureHalls" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="lecturehalls" EnableDelete="True"></ef:EntityDataSource>
                        <asp:GridView ID="gdvLectureHall" EmptyDataText="Record is empty" runat="server" Width="100%" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="edsLectureHalls" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="gdvLectureHall_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="False" />
                                <asp:BoundField DataField="building" HeaderText="Building" SortExpression="building" />
                                <asp:BoundField DataField="room_number" HeaderText="Room Number" SortExpression="room_number" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Do you want to delete this lecture hall?')" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
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
