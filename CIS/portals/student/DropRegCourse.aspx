<%@ Page Title="" Language="C#" MasterPageFile="~/portals/student/student.Master" AutoEventWireup="true" CodeBehind="DropRegCourse.aspx.cs" Inherits="CIS.portals.student.DropRegCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
      <div class="container">
       <div class="panel panel-body">
           <div class="panel panel-danger">
               <div class="panel-heading">
                   <h3> Drop Registered Course(s)</h3>

               </div>
               <div class="panel-body">
                   <div class="row">
                       <div class="form-group">
                           <label>Semester</label>
                           <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control" DataSourceID="edsSemester" DataTextField="name" DataValueField="semester_id" AutoPostBack="True"></asp:DropDownList>
                           <asp:EntityDataSource ID="edsSemester" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="semesters" EntityTypeFilter="" Select='it.[name]+" "+CAST(Year(it.[startDate]) AS System.String) as name , it.[semester_id]'>
                    </asp:EntityDataSource>
                    <asp:TextBox ID="txtDateNow" runat="server" Visible="False"></asp:TextBox>
                       </div>
                       <div class="clearfix"></div>
                       <div>
                           <asp:GridView ID="gdvRegCourses" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="student_id,semesterCourse_id" DataSourceID="edsRegCourse" ForeColor="Black" GridLines="Vertical" Width="90%" OnSelectedIndexChanged="gdvRegCourses_SelectedIndexChanged">
                               <AlternatingRowStyle BackColor="#CCCCCC" />
                               <Columns>
                                   <asp:BoundField DataField="student_id" HeaderText="student_id" ReadOnly="True" SortExpression="student_id" Visible="False" />
                                   <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" Visible="False" />
                                   <asp:BoundField DataField="semesterCourse_id" HeaderText="semesterCourse_id" ReadOnly="True" SortExpression="semesterCourse_id" Visible="False" />
                                   <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" Visible="False" />
                                   <asp:BoundField DataField="semestercourse.course.code" HeaderText="Code" SortExpression="semestercourse" />
                                   <asp:BoundField DataField="semestercourse.course.description" HeaderText="Course" SortExpression="semestercourse" />
                                   <asp:CommandField SelectText="Drop" ShowSelectButton="True">
                                   <ControlStyle CssClass="btn btn-danger" />
                                   </asp:CommandField>
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
                           <asp:EntityDataSource ID="edsRegCourse" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="courseregistrations" EntityTypeFilter="" Include="semestercourse.course" Select="" Where="it.semestercourse.semester_id=@semesterId and it.student_id = @studentId">
                               <WhereParameters>
                                   <asp:ControlParameter ControlID="ddlSemester" Name="semesterId" PropertyName="SelectedValue" Type="Int32" />
                                   <asp:Parameter Name="studentId" Type="Int32" />
                               </WhereParameters>
                           </asp:EntityDataSource>
                       </div>
                   </div>
               </div>
           </div>
       </div>

   </div>
</asp:Content>
