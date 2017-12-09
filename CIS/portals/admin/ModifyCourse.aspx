﻿<%@ Page Title="" Language="C#" MasterPageFile="~/portals/admin/admin.Master" AutoEventWireup="true" CodeBehind="ModifyCourse.aspx.cs" Inherits="CIS.portals.admin.ModifyCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container">

    <div class="panel panel-default"> 
        <div class="panel-heading">
            <h3>Course Details</h3>

        </div>
        <div class="panel-body">
            <div class="form-group">
                <label>Description</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group">
                <label>Code</label>
                <asp:TextBox ID="txtCode" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group">
                <label>Department</label>
                 <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control dropdown" DataSourceID="edsDepartment" DataTextField="name" DataValueField="departmentId"></asp:DropDownList>
                 <ef:EntityDataSource ID="edsDepartment" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="departments" Select="it.[departmentId], it.[name]">
                 </ef:EntityDataSource>
            </div>
             <div class="form-group">
                <label>Credit</label>
                <asp:TextBox ID="txtCredit" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
           <div style="padding:10px; margin:10px;grid-cell: ">
                      <asp:Button ID="btnSubmit" runat="server" Text="Save" Width="10em" CssClass="btn btn-primary pull-right" OnClick="btnSubmit_Click" /> <div class="pull-right" style="width:25px; height:auto; display:inline-block">&nbsp;</div>
                     <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="10em" CssClass="btn btn-danger pull-right" OnClick="btnCancel_Click" />
                       
           </div>
        </div>
    </div>
</div>
</asp:Content>
