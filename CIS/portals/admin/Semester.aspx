<%@ Page Title="" Language="C#" MasterPageFile="~/portals/admin/admin.Master" AutoEventWireup="true" CodeBehind="Semester.aspx.cs" Inherits="concordia_sis.admin.Semester" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
            <h3> Semesters</h3>

        <div>

            <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary pull-right" Text="Add" Width="142px" OnClick="btnAdd_Click" />

        </div>
        <div>
            <asp:GridView ID="gvSemester" EmptyDataText="Record is empty" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="semester_id" DataSourceID="EntityDataSource1" ForeColor="Black" GridLines="Vertical" Width="100%" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="gvSemester_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="semester_id" HeaderText="semester_id" ReadOnly="True" SortExpression="semester_id" Visible="False" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                    <asp:BoundField DataField="startDate" DataFormatString="{0:d}" HeaderText="Start Date" SortExpression="startDate" />
                    <asp:BoundField DataField="endDate" DataFormatString="{0:d}" HeaderText="End DAte" SortExpression="endDate" />
                    <asp:BoundField DataField="DNE" DataFormatString="{0:d}" HeaderText="DNE" SortExpression="DNE" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1"  OnClientClick="return confirm('Do you want to delete this department?')" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
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

            <ef:entitydatasource ID="EntityDataSource1" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableDelete="True" EnableFlattening="False" EntitySetName="semesters">
            </ef:entitydatasource>

            <br />

        </div>


    </div>
</asp:Content>
