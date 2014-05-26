<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchStudent.aspx.cs" Inherits="SearchStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head"  Runat="Server">
    <style type="text/css">
        .style2
        {
            text-align: center;
            
        }
        .style3
        {
            width: 311px;
            font-family: "Arno Pro Smbd SmText";
            text-align: center;
        }
        .style7
        {
            width: 311px;
            font-family: "Arno Pro Smbd SmText";
            height: 24px;
        }
        .style9
        {
            width: 112px;
            text-align: left;
        }
        .style10
        {
            width: 112px;
            height: 24px;
            text-align: left;
        }
        .style12
        {
            width: 311px;
            font-family: "Arno Pro Smbd SmText";
            text-align: right;
            height: 44px;
        }
        .style14
        {
            width: 112px;
            height: 44px;
            text-align: left;
        }
        .style15
        {
            width: 132px;
            height: 44px;
            text-align: center;
        }
        .style16
        {
            width: 132px;
            height: 24px;
            text-align: center;
        }
        .style17
        {
            width: 132px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="style2">
        <table align="center" style="width: 51%;">
            <tr>
                <td class="style12">
                    Enter the Student ID or First Name:</td>
                <td class="style15">
        <asp:TextBox ID="txtSearchID" runat="server" style="text-align: center"></asp:TextBox>
                </td>
                <td class="style14">
                    <asp:Label ID="Label1" runat="server" Text="(Case Sensitive)" 
                        style="text-align: left"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style7">
                </td>
                <td class="style16">
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text="Please try again" 
            Visible="False"></asp:Label>
                </td>
                <td class="style10">
                </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style17">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
            Text="Search" Width="88px" Font-Size="Small" 
                        style="font-family: 'Times New Roman', Times, serif" />
                </td>
                <td class="style9">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style17">
                    &nbsp;</td>
                <td class="style9">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td class="style17">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnAdd" runat="server" Text="Add Student" 
            onclick="btnAdd_Click" Width="88px" 
                        style="font-family: 'Times New Roman', Times, serif" />
                </td>
                <td class="style9">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </p>
   
</asp:Content>

