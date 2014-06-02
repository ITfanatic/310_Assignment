<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Forgotpasword.aspx.cs" Inherits="Forgotpasword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        h1 {
            padding-top: 25px;
            font-family: 'Myriad Pro';
            font-size: x-large;
            color: #808080;
        }

        #ForgotPasswordField {
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
    <h1>Retrieve Forgotten Password</h1>

    <table id="ForgotPasswordField" class="standardText">
        <tr>
            <td>Enter your user name:</td>
            <td>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            </td>
            <td style="text-align: left">
                <asp:Button ID="btnQuestion" runat="server" Text="Ask My Secret Question" CssClass="standardButton" ValidationGroup="RequiredQuestion" OnClick="btnQuestion_Click" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="RequiredQuestion" runat="server" ControlToValidate="txtUserName" Text="Please enter a user name." Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="text-align: left;" colspan="3">
                <asp:Label ID="lblQuestion" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td style="text-align: left;">
                <asp:Label ID="lblAnswer" runat="server" Text="Enter your answer:" Visible="False"></asp:Label>
            </td>
            <td style="text-align: center;">
                <asp:TextBox ID="txtAnswer" runat="server" Visible="False"></asp:TextBox>
            </td>
            <td style="text-align: left;">
                <asp:Button ID="btnAnswer" Visible="False" runat="server" Text="Answer Question" CssClass="standardButton" ValidationGroup="RequiredAnswer" OnClick="btnAnswer_Click" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Text="Please enter an answer" ValidationGroup="RequiredAnswer" ControlToValidate="txtAnswer" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
</asp:Content>

