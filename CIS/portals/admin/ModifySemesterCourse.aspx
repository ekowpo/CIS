<%@ Page Title="" Language="C#" MasterPageFile="~/portals/admin/admin.Master" AutoEventWireup="true" CodeBehind="ModifySemesterCourse.aspx.cs" Inherits="CIS.portals.admin.ModifySemesterCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>Semester Course details</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <label>Semester</label>
                    <asp:DropDownList ID="ddlSemester" runat="server" CssClass="form-control" DataSourceID="edsSemester" DataTextField="name" DataValueField="semester_id" AutoPostBack="True"></asp:DropDownList>
                    <asp:EntityDataSource ID="edsSemester" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="semesters" EntityTypeFilter="" Select='it.[name]+" "+CAST(Year(it.[startDate]) AS System.String) as name , it.[semester_id]'>
                    </asp:EntityDataSource>
                </div>
                  <div class="form-group">
                    <label>Department</label>
                    <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control" DataSourceID="edsDepartment" DataTextField="name" DataValueField="departmentId" AutoPostBack="True"></asp:DropDownList>
                      <ef:EntityDataSource ID="edsDepartment" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="departments">
                      </ef:EntityDataSource>
                </div>
                  <div class="form-group">
                    <label>Course</label>
                    <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control" DataSourceID="edsCourse" DataTextField="code" DataValueField="course_id" AutoPostBack="True"></asp:DropDownList>
                      <ef:EntityDataSource ID="edsCourse" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="courses" Where="" AutoGenerateWhereClause="True" Include="">
                          <WhereParameters>
                              <asp:ControlParameter ControlID="ddlDepartment" Name="department" PropertyName="SelectedValue" Type="Int32" />
                          </WhereParameters>
                      </ef:EntityDataSource>
                </div>
                  <div class="form-group">
                    <label>Lecturer</label>
                    <asp:DropDownList ID="ddlLecture" runat="server" CssClass="form-control" DataSourceID="edsLecturer" DataTextField="name" DataValueField="id"></asp:DropDownList>
                      <ef:EntityDataSource ID="edsLecturer" runat="server" AutoGenerateWhereClause="True" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="lecturers" Include="" Where="" EntityTypeFilter="" Select="it.[id], it.[department], it.[user].[first_name]+' '+it.[user].[last_name] as name">
                          <WhereParameters>
                              <asp:ControlParameter ControlID="ddlDepartment" Name="department" PropertyName="SelectedValue" Type="Int32" />
                          </WhereParameters>
                      </ef:EntityDataSource>
                </div>
                  <div class="form-group">
                    <label>Lecture Hall</label>
                    <asp:DropDownList ID="ddlLectureHall" runat="server" CssClass="form-control" DataSourceID="edsLectureHall" DataTextField="room" DataValueField="id"></asp:DropDownList>
                      <ef:EntityDataSource ID="edsLectureHall" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="lecturehalls" EntityTypeFilter="" Select="it.[room_number]+&quot;(&quot;+it.[building]+&quot;)&quot; as room,it.[id]">
                      </ef:EntityDataSource>
                </div>
                <div class="form-group">
                    <label>Day of the Week</label>
                    <asp:DropDownList ID="ddlDay" runat="server" CssClass="form-control">
                        <asp:ListItem>Monday</asp:ListItem>
                        <asp:ListItem>Tuesday</asp:ListItem>
                        <asp:ListItem>Wednessday</asp:ListItem>
                        <asp:ListItem>Thursday</asp:ListItem>
                        <asp:ListItem>Friday</asp:ListItem>
                        <asp:ListItem>Saturday</asp:ListItem>
                        <asp:ListItem>Sunday</asp:ListItem>
                    </asp:DropDownList>
                   
                </div>
                <div class="form-group">
                    <label>Lecture Start Time</label>
                     <asp:TextBox ID="txtStartTime" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                </div>

                  <div class="form-group">
                    <label>Lecture End Time</label>
                     <asp:TextBox ID="txtEndTime" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                </div>
               <div style="padding:10px; margin:10px;grid-cell: ">
                      <asp:Button ID="btnSubmit" runat="server" Text="Save" Width="10em" CssClass="btn btn-primary pull-right" OnClick="btnSubmit_Click" /> <div class="pull-right" style="width:25px; height:auto; display:inline-block">&nbsp;</div>
                     <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="10em" CssClass="btn btn-danger pull-right" OnClick="btnCancel_Click" />
                       
           </div>
            </div>
        </div>
    </div>

</asp:Content>
