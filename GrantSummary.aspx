<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GrantSummary.aspx.cs" Inherits="GrantSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        h1 {
            padding-top: 20px;
            font-family: 'Myriad Pro';
            font-size: x-large;
            color: #808080;
        }

        #studentOptionsFields {
            position: absolute;
            margin-top: 50px;
            margin-left: 100px;
            width: 800px;
            border: 2px solid #d3d3d3;
        }

        #reportsFields {
            position: absolute;
            margin-top: 150px;
            margin-left: 100px;
            width: 800px;
            border: 2px solid #d3d3d3;
        }

        td {
            padding-top: .5em;
            padding-bottom: .5em;
            text-align: right;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <table id="studentOptionsFields" class="standardText">
        <tr>
            <td style="text-align: right;">Search a Student by Name or StudentID:</td>
            <td style="text-align: left; width: 350px;">
                <asp:Button ID="btnSearchStudent" runat="server"
                    OnClick="btnSearchStudent_Click" Text="Search Student" CssClass="standardButton" />
            </td>
        </tr>
        <tr>
            <td style="text-align: right;">Add a new Student:</td>
            <td style="text-align: left;">
                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click"
                    Text="Add Student" CssClass="standardButton" Width="125px" />
            </td>
        </tr>
    </table>


    <table id="reportsFields" class="standardText">
        <tr>
            <td class="standardHeader" colspan="4" style="text-align: center;">Reports</td>
        </tr>

        <tr>
            <td>Weekly Summary:<br />
            </td>
            <td>
                <asp:DropDownList ID="ddlMonth" runat="server"
                    Height="22px" Width="167px">
                    <asp:ListItem>Please select the month</asp:ListItem>
                    <asp:ListItem Value="1">January</asp:ListItem>
                    <asp:ListItem Value="2">February</asp:ListItem>
                    <asp:ListItem Value="3">March</asp:ListItem>
                    <asp:ListItem Value="4">April</asp:ListItem>
                    <asp:ListItem Value="5">May</asp:ListItem>
                    <asp:ListItem Value="6">June</asp:ListItem>
                    <asp:ListItem Value="7">July</asp:ListItem>
                    <asp:ListItem Value="8">August</asp:ListItem>
                    <asp:ListItem Value="9">September</asp:ListItem>
                    <asp:ListItem Value="10">October</asp:ListItem>
                    <asp:ListItem Value="11">November</asp:ListItem>
                    <asp:ListItem Value="12">December</asp:ListItem>
                </asp:DropDownList>
                <br />
            </td>
            <td>
                <asp:DropDownList ID="ddlweeklyYear" runat="server"
                    Height="22px" Width="167px">
                    <asp:ListItem>Please select the year</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                </asp:DropDownList>
                <br />
            </td>
            <td>
                <asp:DropDownList ID="ddlVoucher" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                    Width="167px" Style="height: 22px" Height="23px">
                    <asp:ListItem>Please select voucher</asp:ListItem>
                    <asp:ListItem Value="PetrolVouchers">Petrol Voucher</asp:ListItem>
                    <asp:ListItem Value="FoodVouchers">Food  Voucher</asp:ListItem>
                    <asp:ListItem Value="TrainTickets">Train  Tickets</asp:ListItem>
                    <asp:ListItem Value="Hardship">Hardship </asp:ListItem>
                    <asp:ListItem>Advice</asp:ListItem>
                </asp:DropDownList>
                <br />
            </td>
        </tr>

        <tr>
            <td>Monthly Grant Summary:</td>
            <td>
                <asp:DropDownList ID="ddlGrantMonth" runat="server"
                    Width="167px"
                    Height="22px">
                    <asp:ListItem>Please select the month</asp:ListItem>
                    <asp:ListItem Value="1">January</asp:ListItem>
                    <asp:ListItem Value="2">February</asp:ListItem>
                    <asp:ListItem Value="3">March</asp:ListItem>
                    <asp:ListItem Value="4">April</asp:ListItem>
                    <asp:ListItem Value="5">May</asp:ListItem>
                    <asp:ListItem Value="6">June</asp:ListItem>
                    <asp:ListItem Value="7">July</asp:ListItem>
                    <asp:ListItem Value="8">August</asp:ListItem>
                    <asp:ListItem Value="9">September</asp:ListItem>
                    <asp:ListItem Value="10">October</asp:ListItem>
                    <asp:ListItem Value="11">November</asp:ListItem>
                    <asp:ListItem Value="12">December</asp:ListItem>
                </asp:DropDownList>
                <br />
            </td>
            <td>
                <asp:DropDownList ID="ddlyear" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlyear_SelectedIndexChanged" Height="22px"
                    Width="167px">
                    <asp:ListItem>Please select the year</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                </asp:DropDownList>
                <br />
            </td>
        </tr>

        <tr>
            <td>Monthly Campus-Grant Summary:<br />
            </td>
            <td>
                <asp:DropDownList ID="DDMonthCampus" runat="server"
                    Width="167px"
                    Height="22px">
                    <asp:ListItem>Please select the month</asp:ListItem>
                    <asp:ListItem Value="1">January</asp:ListItem>
                    <asp:ListItem Value="2">Febrauary</asp:ListItem>
                    <asp:ListItem Value="3">March</asp:ListItem>
                    <asp:ListItem Value="4">April</asp:ListItem>
                    <asp:ListItem Value="5">May</asp:ListItem>
                    <asp:ListItem Value="6">June</asp:ListItem>
                    <asp:ListItem Value="7">July</asp:ListItem>
                    <asp:ListItem Value="8">August</asp:ListItem>
                    <asp:ListItem Value="9">September</asp:ListItem>
                    <asp:ListItem Value="10">October</asp:ListItem>
                    <asp:ListItem Value="11">November</asp:ListItem>
                    <asp:ListItem Value="12">December</asp:ListItem>
                </asp:DropDownList>
                <br />
            </td>
            <td>
                <asp:DropDownList ID="DDYearCampus" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="DDYearCampus_SelectedIndexChanged" Height="22px"
                    Width="167px">
                    <asp:ListItem>Please select the year</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td>Monthly Campus Summary:</td>
            <td>
                <asp:DropDownList ID="DDcampusmonth" runat="server"
                    Width="167px"
                    Height="22px">
                    <asp:ListItem>Please select the month</asp:ListItem>
                    <asp:ListItem Value="1">January</asp:ListItem>
                    <asp:ListItem Value="2">Febrauary</asp:ListItem>
                    <asp:ListItem Value="3">March</asp:ListItem>
                    <asp:ListItem Value="4">April</asp:ListItem>
                    <asp:ListItem Value="5">May</asp:ListItem>
                    <asp:ListItem Value="6">June</asp:ListItem>
                    <asp:ListItem Value="7">July</asp:ListItem>
                    <asp:ListItem Value="8">August</asp:ListItem>
                    <asp:ListItem Value="9">September</asp:ListItem>
                    <asp:ListItem Value="10">October</asp:ListItem>
                    <asp:ListItem Value="11">November</asp:ListItem>
                    <asp:ListItem Value="12">December</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:DropDownList ID="DDcampusyear" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="DDcampusyear_SelectedIndexChanged" Height="22px"
                    Width="167px">
                    <asp:ListItem>Please select the year</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Monthly Faculty Grant Summary:</td>
            <td>
                <asp:DropDownList ID="ddlmonthfacultybygrantmonth" runat="server"
                    Width="167px"
                    Height="22px">
                    <asp:ListItem>Please select the month</asp:ListItem>
                    <asp:ListItem Value="1">January</asp:ListItem>
                    <asp:ListItem Value="2">February</asp:ListItem>
                    <asp:ListItem Value="3">March</asp:ListItem>
                    <asp:ListItem Value="4">April</asp:ListItem>
                    <asp:ListItem Value="5">May</asp:ListItem>
                    <asp:ListItem Value="6">June</asp:ListItem>
                    <asp:ListItem Value="7">July</asp:ListItem>
                    <asp:ListItem Value="8">August</asp:ListItem>
                    <asp:ListItem Value="9">September</asp:ListItem>
                    <asp:ListItem Value="10">October</asp:ListItem>
                    <asp:ListItem Value="11">November</asp:ListItem>
                    <asp:ListItem Value="12">December</asp:ListItem>
                </asp:DropDownList>
            </td>

            <td>
                <asp:DropDownList ID="ddlYearfacultybygrantYear" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlYearfacultybygrant_SelectedIndexChanged" Height="22px"
                    Width="167px">
                    <asp:ListItem>Please select the year</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Monthly
                    Faculty Summary:</td>
            <td>
                <asp:DropDownList ID="ddlFacultyMonth" runat="server"
                    Width="167px"
                    Height="22px">
                    <asp:ListItem>Please select the month</asp:ListItem>
                    <asp:ListItem Value="1">January</asp:ListItem>
                    <asp:ListItem Value="2">February</asp:ListItem>
                    <asp:ListItem Value="3">March</asp:ListItem>
                    <asp:ListItem Value="4">April</asp:ListItem>
                    <asp:ListItem Value="5">May</asp:ListItem>
                    <asp:ListItem Value="6">June</asp:ListItem>
                    <asp:ListItem Value="7">July</asp:ListItem>
                    <asp:ListItem Value="8">August</asp:ListItem>
                    <asp:ListItem Value="9">September</asp:ListItem>
                    <asp:ListItem Value="10">October</asp:ListItem>
                    <asp:ListItem Value="11">November</asp:ListItem>
                    <asp:ListItem Value="12">December</asp:ListItem>
                </asp:DropDownList>
            </td>

            <td>
                <asp:DropDownList ID="ddlfacultyyear" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlfacultyyear_SelectedIndexChanged" Height="22px"
                    Width="167px">
                    <asp:ListItem>Please select the year</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                </asp:DropDownList>
            </td>

        </tr>

        <tr>
            <td>Year-to-date Summary:</td>
            <td>
                <asp:DropDownList ID="ddlYeartodateyear" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlYeartodateyear_SelectedIndexChanged" Height="22px"
                    Width="167px">
                    <asp:ListItem>Please select the year</asp:ListItem>
                    <asp:ListItem>2010</asp:ListItem>
                    <asp:ListItem>2011</asp:ListItem>
                    <asp:ListItem>2012</asp:ListItem>
                    <asp:ListItem>2013</asp:ListItem>
                    <asp:ListItem>2014</asp:ListItem>
                    <asp:ListItem>2015</asp:ListItem>
                    <asp:ListItem>2016</asp:ListItem>
                    <asp:ListItem>2017</asp:ListItem>
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Total grants by age:</td>
            <td>
                <asp:TextBox ID="txtAgeReport" runat="server" Width="162px" ValidationGroup="ageReport"></asp:TextBox>
            </td>
            <td style="text-align: left;" colspan="2">
                <asp:Button ID="btnAgeReport" runat="server" Text="Report!" CssClass="standardButton" Width="100px" OnClick="btnAgeReport_Click" ValidationGroup="ageReport" />
                <asp:RequiredFieldValidator ID="ageRequired" runat="server" ControlToValidate="txtAgeReport" Text="Please enter an age" CssClass="standardText" ForeColor="red" ValidationGroup="ageReport"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Total grants by ethnicity:</td>
            <td>
                <asp:TextBox ID="txtEthnicity" runat="server" Width="162px" ValidationGroup="ethnicityReport"></asp:TextBox>
            </td>
            <td style="text-align: left;" colspan="2">
                <asp:Button ID="btnEthnicity" runat="server" Text="Report!" CssClass="standardButton" Width="100px" ValidationGroup="ethnicityReport" OnClick="btnEthnicity_Click"/>
                <asp:RequiredFieldValidator ID="ethnicityRequired" runat="server" ControlToValidate="txtEthnicity" Text="Please enter an ethnicity" CssClass="standardText" ForeColor="red" ValidationGroup="ethnicityReport"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Grants by Selected Date:</td>
            <td colspan="5">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White"
                    BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman"
                    Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth"
                    OnSelectionChanged="Calendar1_SelectionChanged"
                    Style="height: 173px; width: 255px; text-align: left" TitleFormat="Month"
                    Width="228px">
                    <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana"
                        Font-Size="8pt" ForeColor="#333333" Width="1%" />
                    <TodayDayStyle BackColor="#CCCC99" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <DayStyle Width="14%" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt"
                        ForeColor="#333333" Height="10pt" />
                    <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt"
                        ForeColor="White" Height="14pt" />
                </asp:Calendar>
            </td>
        </tr>
    </table>
</asp:Content>

