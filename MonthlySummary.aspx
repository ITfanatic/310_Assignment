<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MonthlySummary.aspx.cs" Inherits="MonthlySummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p style="text-align: center">
        <asp:Label ID="TitleTXT" runat="server" CssClass="standardText" Font-Size="Large" Text=""></asp:Label>
    </p>
    <p>
        <br />
    </p>
    <center>
        <p>
            <asp:GridView ID="grdMonthlySummary" runat="server"
                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px"
                CellPadding="4" DataSourceID="srcMonthlySummary" ForeColor="Black"
                GridLines="Horizontal" AllowSorting="True">
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </p>
    </center>
    <asp:SqlDataSource ID="srcMonthlySummary" runat="server"
        ConnectionString="<%$ ConnectionStrings:FinanceDBConnectionString1 %>"
        SelectCommand="
                    SELECT 
	                    GrantType as [Type of Grant],
                        COUNT(GrantType) as [Amount of Grants],
	                    SUM(GrantValue) AS [Total Grant Value]
                    FROM 
	                    Student_vouchers 
                    WHERE 
	                    MONTH(DateOfIssue) = @Month
                    GROUP BY
	                    GrantType">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtMonth" DefaultValue="%" Name="Month"
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <p style="text-align: center">
        <asp:Label ID="TotalSum" runat="server" Text="Label"></asp:Label>
    </p>
    <p style="text-align: center">
        <asp:Label ID="TotalGrants" runat="server" Text="Label"></asp:Label>
    </p>
    <p style="text-align: center">
        <asp:Label ID="Totalstudents" runat="server" Text="Label"></asp:Label>
    </p>
    <p style="text-align: center">
        <asp:TextBox ID="txtMonth" runat="server" Visible="False"></asp:TextBox>
    </p>
</asp:Content>

