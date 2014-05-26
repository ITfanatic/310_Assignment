<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        h1 {
            font-family: 'Myriad Pro';
            font-size: x-large;
            color: #808080;
        }

        #userField {
            position: absolute;
            margin-top: 50px;
            margin-left: 100px;
            border: 1px solid #d3d3d3;
            border-radius: 5px;
            padding-bottom: 700px;
            padding-right: 800px;
            background-color: #fffafa;
        }

        #addUserFields {
            position: absolute;
            margin-top: 100px;
            margin-left: 200px;
            border: 2px solid #d3d3d3;
            padding: 5px;
        }

        #changePasswordFields {
            position: absolute;
            margin-top: 400px;
            margin-left: 200px;
            border: 2px solid #d3d3d3;
            padding: 5px;
            min-width: 390px;
        }

        .field {
            padding-left: 10px;
        }

        td {
            padding-top: .5em;
            padding-bottom: .5em;
            text-align: left;
        }

        .tableHead {
            font-family: 'Myriad Pro';
            font-size: large;
            color: #808080;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>User Administration</h1>

    <div id="userField">
        <div class="addUserField">
            <table id="addUserFields">
                <tr>
                    <td colspan="2" class="tableHead" style="text-align: center;">
                        <asp:Label ID="lblAddUser" runat="server" Text="Add User"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="standardText">Enter Login ID for new user:</td>
                    <td class="field">
                        <asp:TextBox ID="txtNewUserName" runat="server" BorderStyle="Groove" ControlToValidate="txtNewUserName" ValidationGroup="CreateUser">
                        </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtNewUserName" Display="Dynamic" Text="* ID Required" ValidationGroup="CreateUser"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="standardText">Enter password for new user:</td>
                    <td class="field">
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" BorderStyle="Groove" ValidationGroup="CreateUser"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPassword" Display="Dynamic" Text="* Password Required" ValidationGroup="CreateUser"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="standardText">Re-enter password for new user:</td>
                    <td class="field">
                        <asp:TextBox ID="txtPasswordCheck" TextMode="Password" runat="server" BorderStyle="Groove" ValidationGroup="CreateUser"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPasswordCheck" Display="Dynamic" Text="* Password Re-entry Required" ValidationGroup="CreateUser"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="standardText">Make User Administrator:</td>
                    <td class="field">
                        <asp:RadioButton ID="radYes" runat="server" CssClass="standardText" GroupName="adminRadios" Text="Yes"></asp:RadioButton>
                        <asp:RadioButton ID="radNo" runat="server" CssClass="standardText" GroupName="adminRadios" Text="No"></asp:RadioButton>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <asp:Button ID="btnCreateNewUser" CssClass="standardButton" runat="server" Width="300px" Text="Create User" OnClick="btnCreateNewUser_Click" ValidationGroup="CreateUser" /></td>
                </tr>
            </table>
        </div>

        <div class="changePasswordField">
            <table id="changePasswordFields">
                <tr>
                    <td colspan="2" class="tableHead" style="text-align: center;">Change Your Password</td>
                </tr>
                <tr>
                    <td class="standardText">Enter current password:</td>
                    <td class="field">
                        <asp:TextBox ID="txtCurrentPassword" TextMode="Password" runat="server" BorderStyle="Groove" ValidationGroup="ChangePassword"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCurrentPassword" Display="Dynamic" Text="*Current Password Required" ValidationGroup="ChangePassword"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="standardText">Enter new password:</td>
                    <td class="field">
                        <asp:TextBox ID="txtNewPassword" TextMode="Password" runat="server" BorderStyle="Groove" ValidationGroup="ChangePassword"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtNewPassword" Display="Dynamic" Text="* Password Required" ValidationGroup="ChangePassword"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td class="standardText">Re-enter new password:</td>
                    <td class="field">
                        <asp:TextBox ID="txtNewPasswordCheck" TextMode="Password" runat="server" BorderStyle="Groove" ValidationGroup="ChangePassword"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtNewPasswordCheck" Display="Dynamic" Text="* Password Re-entry Required" ValidationGroup="ChangePassword"></asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td colspan="2" style="text-align: center;">
                        <asp:Button ID="btnChangePassword" CssClass="standardButton" runat="server" Width="300px" Text="Change Password" OnClick="btnChangePassword_Click" ValidationGroup="ChangePassword" /></td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

