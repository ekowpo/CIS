<%@ Page Title="" Language="C#" MasterPageFile="~/portals/admin/admin.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="CIS.portals.admin.Course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
            <div class="panel">
                <div class="panel-heading"> 
                    <h3> Course</h3>

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
                        <ef:entitydatasource ID="edsCourse" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="courses" GroupBy="" EnableDelete="True" Include="department1" AutoGenerateWhereClause="True" Where="">
                            <WhereParameters>
                                <asp:ControlParameter ControlID="ddlDepartment" DefaultValue="" Name="department" PropertyName="SelectedValue" Type="Int32" />
                            </WhereParameters>
                        </ef:entitydatasource>
                        <asp:GridView ID="gdvCourse" EmptyDataText="Record is empty" runat="server" AutoGenerateColumns="False" DataSourceID="edsCourse" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" DataKeyNames="course_id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:CommandField ShowSelectButton="True" />
                                <asp:BoundField DataField="course_id" HeaderText="course_id" ReadOnly="True" SortExpression="course_id" Visible="False" />
                                <asp:BoundField DataField="code" HeaderText="Code" SortExpression="code" />
                                <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                                 <asp:BoundField DataField="credit" HeaderText="Credit" SortExpression="credit" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" OnClientClick="return confirm('Do you want to delete this course?')" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
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

