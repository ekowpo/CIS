<%@ Page Title="" Language="C#" MasterPageFile="~/portals/student/student.Master" AutoEventWireup="true" CodeBehind="Transcript.aspx.cs" Inherits="CIS.portals.student.Transcript" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="80%">
            <LocalReport ReportPath="portals\CommonRdlc\transcript.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="EntityDataSource1" Name="rptDetails" />
                    <rsweb:ReportDataSource DataSourceId="edsGPAS" Name="rptgrades" />
                    <rsweb:ReportDataSource DataSourceId="EntityDataSource2" Name="CGPA" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:EntityDataSource ID="edsTrans" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="finaltrans" Include="" Where="it.student_id = @id">
            <WhereParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="edsGPAS" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="reportdatas" Where="it.student_id = @id">
            <WhereParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="reportdemogs" Where="it.student_id = @id" EntityTypeFilter="" Select="">
            <WhereParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=csisEntities" DefaultContainerName="csisEntities" EnableFlattening="False" EntitySetName="gpas" EntityTypeFilter="" Select="it.[student_id], it.[semester_id], it.[gpa1] as gpa" Where="it.student_id = @id">
            <WhereParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </WhereParameters>
        </asp:EntityDataSource>
</div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>
