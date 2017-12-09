<%@ Page Title="" Language="C#" MasterPageFile="~/portals/admin/admin.Master" AutoEventWireup="true" CodeBehind="SemesterCourse.aspx.cs" Inherits="CIS.portals.admin.SemesterCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3> Semester Course</h3>
        </div>
        
        <div class="panel-body">
            <div class="row">
                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary pull-right" Width="10em" OnClick="btnAdd_Click" />
            </div>
            <div class="row">
                <label>Semester &nbsp; </label>
                        <asp:DropDownList ID="ddlSemester" runat="server" CssClass="dropdown" Width="60%" AutoPostBack="True" DataSourceID="edsSemester" DataTextField="name" DataValueField="semester_id"></asp:DropDownList>
                       
                <asp:EntityDataSource ID="edsSemester" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="semesters" EntityTypeFilter="" Select='it.[name]+" "+CAST(Year(it.[startDate]) AS System.String) as name , it.[semester_id]'>
                    </asp:EntityDataSource>
                       
            </div>
            <div class="row">
                <asp:GridView ID="gdvSemesterCourse" EmptyDataText="Record is empty" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="edsSemesterCourse" ForeColor="Black" GridLines="Vertical" Width="100%" OnSelectedIndexChanged="gdvSemesterCourse_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="False" />
                        <asp:BoundField DataField="course.description" HeaderText="Course" SortExpression="course_id" />
                        <asp:BoundField DataField="semester_id" HeaderText="semester_id" SortExpression="semester_id" Visible="False" />
                        <asp:BoundField DataField="day" HeaderText="Day" SortExpression="day" />
                        <asp:BoundField DataField="start_time" HeaderText="Start Time" SortExpression="start_time" />
                        <asp:BoundField DataField="end_time" HeaderText="End Time" SortExpression="end_time" />
                        <asp:BoundField DataField="lecturehall.room_number" HeaderText="Lecture Hall" SortExpression="lecture_hall" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="Gray" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:EntityDataSource ID="edsSemesterCourse" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableDelete="True" EnableFlattening="False" EntitySetName="semestercourses" Include="course,lecturehall,lecturer1" Where="">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="ddlSemester" Name="semester_id" PropertyName="SelectedValue" Type="Int32" />
                    </WhereParameters>
                </asp:EntityDataSource>
            </div>
        </div>
    </div>

</div>

</asp:Content>
