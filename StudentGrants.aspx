<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StudentGrants.aspx.cs" Inherits="StudentGrants" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        h1 {
            font-family: 'Myriad Pro';
            font-size: x-large;
            color: #808080;
        }

        #AddGrantField {
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
            padding-left: .5em;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Add Grant For Student</h1>
    <div class="standardText">
        <table id="AddGrantField">
            <tr>
                <td>StudentID:</td>
                <td>
                    <asp:Label ID="StudentID" runat="server"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Type of Voucher:"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="VoucherType" runat="server" AutoPostBack="True"
                        OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="GrantDescriptionLbl" runat="server" Text="Grant Discription: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="GrantDescriptiontxt" runat="server" TextMode="multiline" Enabled="False"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblValue" runat="server" Text="Voucher Value:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="VoucherValue" runat="server" Width="110px" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblKoha" runat="server" Text="Koha Funds: "></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txbKuha" runat="server" Enabled="False"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="SubmitVoucher" runat="server" OnClick="SubmitVoucher_Click" CssClass="standardButton"
                        Text="Submit" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

