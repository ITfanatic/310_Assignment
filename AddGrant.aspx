<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddGrant.aspx.cs" Inherits="AddGrant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        h1 {
            font-family: 'Myriad Pro';
            font-size: x-large;
            color: #808080;
        }

        #AddStudentGrantField {
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
    <h1>Add Grant for Student</h1>

    <table id="AddStudentGrantField" class="standardText">
        <tr>
            <td>Enter ID of student to receive grant:</td>
            <td>
                <asp:TextBox ID="txtSearchID" runat="server" Style="text-align: center"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnGo" runat="server" Text="Go!" ValidationGroup="RequiredID" CssClass="standardButton" OnClick="btnGo_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: center;">
                <asp:RequiredFieldValidator ID="RequiredID" runat="server" Text="Please enter an existing student ID." Display="Dynamic" ControlToValidate="txtSearchID" ValidationGroup="RequiredID"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>

</asp:Content>

