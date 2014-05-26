<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddStudent.aspx.cs" Inherits="AddStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        h1 {
            font-family: 'Myriad Pro';
            font-size: x-large;
            color: #808080;
        }

        #AddStudentField {
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
            text-align: left;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Add Student</h1>

    <table id="AddStudentField" class="standardText">
        <tr>
            <td>Student ID:</td>
            <td>
                <asp:TextBox ID="txbID" runat="server" Width="156px"></asp:TextBox>
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label></td>
        </tr>
        <tr>
            <td>First Name:</td>
            <td>
                <asp:TextBox ID="txbFname" runat="server" Width="156px"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label></td>

        </tr>
        <tr>
            <td>Last Name:</td>
            <td>
                <asp:TextBox ID="txbLname" runat="server" Width="155px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Gender:</td>
            <td>
                <asp:DropDownList ID="ddlGender" runat="server" Width="60px">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label></td>
        </tr>
        <tr>
            <td>Date Of Birth:</td>
            <td>
                <asp:TextBox ID="txbDOB" runat="server" Width="157px"></asp:TextBox>
                <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                (yyyy-mm-dd)</td>
        </tr>
        <tr>
            <td>Address:</td>
            <td>
                <asp:TextBox ID="txbAddress" runat="server" Height="80px" TextMode="MultiLine"
                    Width="156px"></asp:TextBox></td>

        </tr>
        <tr>
            <td>Accomodation Type:</td>
            <td>
                <asp:DropDownList ID="ddlAccomodition" runat="server"
                    Width="154px">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Hostel/Boarding</asp:ListItem>
                    <asp:ListItem>Flat</asp:ListItem>
                    <asp:ListItem>Rental</asp:ListItem>
                    <asp:ListItem>Own Home</asp:ListItem>
                    <asp:ListItem>Living at Home</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>Mobile Number:</td>
            <td>
                <asp:TextBox ID="txbMobile" runat="server" Width="158px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Landline Number:</td>
            <td>
                <asp:TextBox ID="txbPhone" runat="server" Width="158px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Email ID:</td>
            <td>
                <asp:TextBox ID="txbEmail" runat="server" Width="159px"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Method Of Contact:</td>
            <td>
                <asp:DropDownList ID="ddlContact" runat="server" Width="156px">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Telephone</asp:ListItem>
                    <asp:ListItem>Mobile</asp:ListItem>
                    <asp:ListItem>Letter</asp:ListItem>
                    <asp:ListItem>Email</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>Student Status:</td>
            <td>
                <asp:DropDownList ID="ddlStatus" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>NZ Citizen</asp:ListItem>
                    <asp:ListItem>NZ Residency</asp:ListItem>
                    <asp:ListItem>International Student</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td>Ethnicity:</td>
            <td>
                <asp:DropDownList ID="ddlEthnicity" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Value="Pakeha">NZ European / Pakeha</asp:ListItem>
                    <asp:ListItem Value="Maori">NZ Maori</asp:ListItem>
                    <asp:ListItem Value="Pacific">Pacific Island (Please specify)</asp:ListItem>
                    <asp:ListItem Value="Asian">Asian (Please specify)</asp:ListItem>
                    <asp:ListItem Value="Other">Other (Please specify)</asp:ListItem>
                </asp:DropDownList>
                <% if (txbEthnicity.Visible)
                   { %>
                <asp:TextBox ID="txbEthnicity" runat="server"></asp:TextBox>
                <% } %>
            </td>
        </tr>

        <tr>
            <td>Campus:</td>
            <td>
                <asp:DropDownList ID="ddlCampus" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Auckland</asp:ListItem>
                    <asp:ListItem>Wellington</asp:ListItem>
                    <asp:ListItem>Christchurch</asp:ListItem>
                    <asp:ListItem>Hamilton</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Faculty:</td>
            <td>
                <asp:DropDownList ID="ddlFaculty" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlFaculty_SelectedIndexChanged">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*"></asp:Label></td>
        </tr>
        <tr>
            <td>Please select Courses or Programmes:</td>
            <td>
                <asp:DropDownList ID="ddlMaori" runat="server" Visible="False">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlTrades" runat="server" Visible="False">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlIndustries" runat="server"
                    OnSelectedIndexChanged="ddlIndustries_SelectedIndexChanged" Visible="False">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlBusiness" runat="server" Visible="False">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlArts" runat="server"
                    OnSelectedIndexChanged="ddlArts_SelectedIndexChanged" Visible="False">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlHealth" runat="server" Visible="False">
                    <asp:ListItem></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <asp:Button ID="ButtonAddStudent" runat="server"
                    OnClick="ButtonAddStudent_Click" CssClass="standardButton"
                    Text="Add Student" /></td>
        </tr>
    </table>
</asp:Content>

