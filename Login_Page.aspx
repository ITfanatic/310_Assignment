<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login_Page.aspx.cs" Inherits="Login_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1 {
            font-family: "Myriad Pro";
        }

        td {
            padding-top: .5em;
            padding-bottom: .5em;
        }

        #loginField {
            position: absolute;
            margin-top: 150px;
            margin-left: 375px;
            border: 1px solid #d3d3d3;
            border-radius: 5px;
            padding: 30px;
            background-color: #fffafa;
        }

        #loginFooter {
            position: absolute;
            top: 700px;
            width: 1000px;
            height: 5px;
            border-top: 1px solid #000000;
            background-color: #808080;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="loginField">
        <table>
            <tr>
                <td><span class="style1">Login ID:</span></td>

                <td>
                    <asp:TextBox ID="txbLogin" runat="server" Width="104px"></asp:TextBox></td>
            </tr>

            <tr>
                <td><span class="style1">Password:</span></td>

                <td>
                    <asp:TextBox ID="txbPassword" runat="server" TextMode="Password" Width="104px"></asp:TextBox></td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnLogin" runat="server" CssClass="standardButton" OnClick="Button1_Click" Text="Login" Width="200px"/></td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"
                        Style="font-family: 'Myriad Pro'"></asp:Label></td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <asp:HyperLink ID="hlPWD" runat="server" NavigateUrl="~/Forgotpasword.aspx" Font-Names="Myriad Pro">Forgot Password</asp:HyperLink></td>
            </tr>
        </table>
    </div>
    <div id="loginFooter">
    </div>
</asp:Content>

