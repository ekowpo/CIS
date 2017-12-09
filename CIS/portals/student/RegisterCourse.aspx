<%@ Page Title="" Language="C#" MasterPageFile="~/portals/student/student.Master" AutoEventWireup="true" CodeBehind="RegisterCourse.aspx.cs" Inherits="CIS.portals.student.RegisterCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
        
        
                function hide(elementID) {
                    if (elementID === "selectedCourse") {
                        document.getElementById('search').style.display = "block";
                        document.getElementById('selectedCourse').style.display = "none";
                    }
                       
                    if (elementID === "continue") {
                        document.getElementById('search').style.display = "none";
                        document.getElementById('selectedCourse').style.display = "block";
                    }
                        
                }
    </script>
    <div class="container" id="search">
        <div class="panel panel-default">
            <div class="panel-heading">Search</div>
            <div class="panel-body">

                <div class="form-group">
                    <label>Semester :</label>
                    <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control" DataSourceID="edsSemester" DataTextField="name" DataValueField="semester_id"></asp:DropDownList>

                    <asp:EntityDataSource ID="edsSemester" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="semesters" Where="" Select='it.[name]+" "+CAST(Year(it.[startDate]) AS System.String) as name , it.[semester_id]'>
                    </asp:EntityDataSource>
                    <asp:TextBox ID="txtDateNow" runat="server" Visible="False"></asp:TextBox>

                </div>

                <div class="form-group-sm">
                    <label>Department :</label>
                    <asp:DropDownList ID="ddlDepartment" runat="server"  CssClass="dropdown form-control " DataSourceID="edsDepartment" DataTextField="name" DataValueField="departmentId"></asp:DropDownList>

                    <asp:EntityDataSource ID="edsDepartment" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="departments">
                    </asp:EntityDataSource>

                </div>

                <div class="row">
                    
                    <asp:Button ID="btnSearch" runat="server" Text="Search"  CssClass="btn btn-primary pull-right" OnClick="btnSearch_Click"/>
                </div>

               <div class="clearfix"></div>
                <div class="panel panel-default">
                    <div class="panel-body">
                         <div class="row">
                    <asp:Button ID="btnContinue" runat="server" Text="Continue"  CssClass="btn-success pull-right" OnClick="btnContinue_Click"/></div>
                        <asp:EntityDataSource ID="edsSemesterCourse" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="semestercourses" Include="course, lecturehall,lecturer1" Where="it.semester_id =@semester and it.course.department=@department" EntityTypeFilter="" Select="">
                            <WhereParameters>
                                <asp:ControlParameter ControlID="ddlSemester" Name="semester" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="ddlDepartment" Name="department" PropertyName="SelectedValue" Type="Int32" />
                            </WhereParameters>
                         </asp:EntityDataSource>
                    <asp:GridView ID="gdvSemesterCourse" EmptyDataText="Record is empty" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="id" DataSourceID="edsSemesterCourse" ForeColor="Black" GridLines="Vertical" Width="100%" OnSelectedIndexChanged="gdvSemesterCourse_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="False" />
                        <asp:BoundField DataField="course.description" HeaderText="Course" SortExpression="course_id" />
                        <asp:BoundField DataField="semester_id" HeaderText="semester_id" SortExpression="semester_id" Visible="False" />
                        <asp:BoundField DataField="day" HeaderText="Day" SortExpression="day" />
                        <asp:BoundField DataField="start_time" HeaderText="Start Time" SortExpression="start_time" />
                        <asp:BoundField DataField="end_time" HeaderText="End Time" SortExpression="end_time" />
                        <asp:BoundField DataField="lecturehall.room_number" HeaderText="Lecture Hall" SortExpression="lecture_hall" />
                        <asp:CommandField ButtonType="Button" SelectText="Enroll" ShowSelectButton="True">
                        <ControlStyle CssClass="btn btn-success" />
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
                    </div>

                </div>

            </div>
        </div>
        </div>
        <div class="container" id="selectedCourse">

        <div class="panel panel-default" >

            <div class="panel-heading">
                Selected Course(s)
            </div>
            <div class="panel-body">
                <asp:GridView ID="gdvselectedCourse" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataKeyNames="id" ForeColor="Black" GridLines="Vertical" Width="100%" OnSelectedIndexChanged="gdvselectedCourse_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" Visible="False" />
                        <asp:BoundField DataField="course.description" HeaderText="Course" SortExpression="course_id" />
                        <asp:BoundField DataField="semester_id" HeaderText="semester_id" SortExpression="semester_id" Visible="False" />
                        <asp:BoundField DataField="day" HeaderText="Day" SortExpression="day" />
                        <asp:BoundField DataField="start_time" HeaderText="Start Time" SortExpression="start_time" />
                        <asp:BoundField DataField="end_time" HeaderText="End Time" SortExpression="end_time" />
                        <asp:BoundField DataField="lecturehall.room_number" HeaderText="Lecture Hall" SortExpression="lecture_hall" />
                        
                        <asp:CommandField DeleteText="Remove" SelectText="Remove" ShowSelectButton="True">
                        <ControlStyle CssClass="btn btn-danger" Width="100%" />
                        </asp:CommandField>
                        
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
                <br />
            </div>
            <div class="form-group">
                <asp:Button ID="btnEnroll" runat="server" Text="Enroll into Course(s)" CssClass="btn btn-success form-control" OnClick="btnEnroll_Click" />
            </div>
        </div>

    </div>


</asp:Content>
