<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchStudent.aspx.cs" Inherits="SearchStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        h1 {
            font-family: 'Myriad Pro';
            font-size: x-large;
            color: #808080;
        }

        #SearchStudentField {
            margin-left: auto;
            margin-right: auto;
            border: 1px solid lightgrey;
            border-radius: 5px;
            padding: 50px;
            background-color: #fffafa;
        }

        td {
            padding-top: .5em;
            padding-bottom: .5em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Search Students</h1>

    <table id="SearchStudentField" class="standardText">
        <tr>
            <td>Enter the Student ID or First Name:</td>
            <td>
                <asp:TextBox ID="txtSearchID" runat="server" Style="text-align: center"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Label1" runat="server" Text="(Case Sensitive)"
                    Style="text-align: left"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text="Please try again"
                    Visible="False"></asp:Label>
            </td>
            <td style="text-align: right;">
                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click"
                    Text="Search" CssClass="standardButton" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: right;">
                <asp:Button ID="btnAdd" runat="server" Text="Add Student"
                    OnClick="btnAdd_Click" CssClass="standardButton" />
            </td>
        </tr>
    </table>
</asp:Content>

