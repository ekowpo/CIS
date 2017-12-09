<%@ Page Title="" Language="C#" MasterPageFile="~/portals/admin/admin.Master" AutoEventWireup="true" CodeBehind="ModifyUser.aspx.cs" Inherits="CIS.portals.admin.ModifyUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <script>
        
        function hide(elementID) {
            if(elementID==="dept")
                document.getElementById('dept').style.display = "none";
            if(elementID==="student")
                document.getElementById('student').style.display = "none";
        }
        function show(elementID) {
            if (elementID === "dept")
                document.getElementById('dept').style.display = "block";
            if (elementID === "student")
                document.getElementById('student').style.display = "block";
            
        }
        $(function () {
            hide('dept');
            hide('student');
            document.getElementById('ContentPlaceHolder1_ddlRole').addEventListener("change", function () {
                if (document.getElementById('ContentPlaceHolder1_ddlRole').value === "1") {
                    //document.getElementById('ContentPlaceHolder1_dept').h = true;
                    //document.getElementById('dept').style.display = "none";
                    hide('dept');
                    hide('student');
                }
                else if (document.getElementById('ContentPlaceHolder1_ddlRole').value === "2") {
                    show('dept');
                    show('student');
                }
                else {
                    show('dept');
                    hide('student');
                    // document.getElementById('dept').style.display = "block";
                    // document.getElementById('ContentPlaceHolder1_ddlDept').disabled = false;
                }
            });
        });
     
    </script>
   
  <h3>User Details</h3>
  <div class="panel panel-default">
    <div class="panel-heading">Personal details</div>
    <div class="panel-body"> 
        <div class="form-group">
                <label>First Name</label>
                <asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox>
           
            </div>
            <div class="form-group">
                <label>Last Name</label>
                <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Date of Birth</label>
                <asp:TextBox ID="txtDOB" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
           
            </div>
            <div class="form-group">
                <label>Email</label>
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
           
            </div>
            <div class="form-group">
                <label>Telephone</label>
                <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server" TextMode="Phone"></asp:TextBox>
           
            </div>
            <div class="form-group">
                <label>Address</label>
                <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox>
           
            </div>

    </div>
  </div>
    
    <div class="panel panel-default">
        <div class="panel-heading">Acces Details</div>
        <div class="panel panel-body">
            <div class="form-group">
                <label>UserName</label><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox>
           
            </div>
            <div class="form-group">
                <label>Password</label>
                <asp:TextBox ID="txtPassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
           
            </div>
                        
            <div class="form-group">
                <label>Confirm Password</label><asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConform" ErrorMessage="Not a match" ForeColor="Red"></asp:CompareValidator>
&nbsp;<asp:TextBox ID="txtConform" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
           
            </div>
                    
            <div class="form-group">
                <label>Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Activated">Activated</asp:ListItem>
                    <asp:ListItem Value="Locked">Locked</asp:ListItem>
                    <asp:ListItem Value="Deactivated">Deactivated</asp:ListItem>
                    <asp:ListItem Value="FirstTime">First time</asp:ListItem>
                </asp:DropDownList>
        
          
            </div>
            <div class="form-group">
                <label>Role</label>
            
                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control" DataSourceID="edsRole" DataTextField="name" DataValueField="role_id" ></asp:DropDownList>    
                <ef:EntityDataSource ID="edsRole" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="roles">
                </ef:EntityDataSource>
                         
            </div>
            <div class="form-group" id="dept">
                <label>Department</label>
                <asp:DropDownList ID="ddlDept" runat="server" CssClass="form-control" DataSourceID="edsDepartment" DataTextField="name" DataValueField="departmentId" AutoPostBack="True"></asp:DropDownList>   
                <ef:EntityDataSource ID="edsDepartment" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="departments">
                </ef:EntityDataSource>
           </div>
    
        </div>
        </div>
        <div class="panel panel-default" id="student">
            <div class="panel-heading">Student Details</div>
            <div class="panel-body">
              
            <div class="form-group">
                <label>Program</label>
                <asp:DropDownList ID="ddlProgram" runat="server" CssClass="form-control" DataSourceID="edsProgram" DataTextField="Name" DataValueField="id">
                  </asp:DropDownList>
          
                <ef:EntityDataSource ID="edsProgram" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="programs" AutoGenerateWhereClause="True" EntityTypeFilter="" Select="" Where="">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="ddlDept" Name="Department" PropertyName="SelectedValue" Type="Int32" />
                    </WhereParameters>
                </ef:EntityDataSource>
          
            </div>
                <div class="form-group">
                <label>Start Date</label>
                <asp:TextBox ID="txtStartDate" CssClass="form-control" runat="server" Rows="1" TextMode="Date" ></asp:TextBox>
           
            </div>
                <div class="form-group">
                <label>Expected Completion Date </label>
                <asp:TextBox ID="txtCompletionDate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
           
            </div>
             <div class="form-group" >
                <label>Status</label>
                <asp:DropDownList ID="ddlStudentStatus" runat="server" CssClass="form-control">
                    <asp:ListItem Value="In-Progress">In-Progress</asp:ListItem>
                    <asp:ListItem Value="Leave">Leave of Absence</asp:ListItem>
                    <asp:ListItem Value="Completed">Completed</asp:ListItem>
                </asp:DropDownList>
        
          
            </div>
            </div>
            </div>
            <div class="row">
                 <div style="padding:10px; margin:10px;grid-cell:10px">
                      <asp:Button ID="btnSubmit" runat="server" Text="Save" Width="10em" CssClass="btn btn-primary pull-right" OnClick="btnSubmit_Click" /> <div class="pull-right" style="width:25px; height:auto; display:inline-block">&nbsp;</div>
                     <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="10em" CssClass="btn btn-danger pull-right" OnClick="btnCancel_Click" />
                       
           </div>
            
        </div>
        <div class="row">&nbsp;</div>
        
    </div>
   
    </asp:Content>
