<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="WeeklySummary.aspx.cs" Inherits="PetrolMonthlySummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="standardText">
        <p style="text-align: center">
            <asp:Label ID="Titletext" runat="server" Text="Titletext" Font-Size="Large"
                Font-Bold="True" ForeColor="#993300" Visible="False"></asp:Label>
        </p>
        <p style="text-align: center">
            &nbsp;
        </p>
        <center>
            <p>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="srcWeeklySummaryReport"
                    EmptyDataText="Sorry, No data to display..!!" ForeColor="Black"
                    GridLines="Horizontal"
                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None"
                    BorderWidth="1px" Font-Names="Myriad Pro">
                    <Columns>
                        <asp:BoundField DataField="GrantType" HeaderText="GrantType"
                            SortExpression="GrantType" />
                        <asp:BoundField DataField="month_name" HeaderText="month_name" ReadOnly="True"
                            SortExpression="month_name" />
                        <asp:BoundField DataField="weeknumber" HeaderText="weeknumber" ReadOnly="True"
                            SortExpression="weeknumber" />
                        <asp:BoundField DataField="NoofStudents" HeaderText="NoofStudents"
                            ReadOnly="True" SortExpression="NoofStudents" />
                        <asp:BoundField DataField="NoofGrants" HeaderText="NoofGrants" ReadOnly="True"
                            SortExpression="NoofGrants" />
                        <asp:BoundField DataField="Amount" HeaderText="Amount" ReadOnly="True"
                            SortExpression="Amount" />
                        <asp:BoundField DataField="KohafundsAmount" HeaderText="KohafundsAmount"
                            ReadOnly="True" SortExpression="KohafundsAmount" />
                        <asp:BoundField DataField="TotalGrantAmount" HeaderText="TotalGrantAmount"
                            ReadOnly="True" SortExpression="TotalGrantAmount" />
                    </Columns>
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
        <p style="text-align: center">
            <asp:Label ID="lblAllMsg" runat="server"></asp:Label>
        </p>
        <p style="text-align: center">
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
            &nbsp;
        </p>
        <p style="text-align: center">
            <asp:Label ID="lblMsgfunds" runat="server"></asp:Label>
        </p>
        <p style="text-align: center">
            <asp:Label ID="lblMsgKohafunds" runat="server"></asp:Label>
        </p>
        <p>
            <asp:TextBox ID="txbReadVoucher" runat="server" Visible="False"></asp:TextBox>
            <asp:TextBox ID="txbReadWeeklyYear" runat="server" Visible="False"></asp:TextBox>
            <asp:TextBox ID="txbReadMonth" runat="server" Visible="False"></asp:TextBox>
        </p>

        <asp:SqlDataSource ID="srcWeeklySummaryReport" runat="server"
            ConnectionString="<%$ ConnectionStrings:FinanceDBConnectionString1 %>"
            ProviderName="<%$ ConnectionStrings:FinanceDBConnectionString1.ProviderName %>"
            SelectCommand="
            SELECT 
                GrantType,
                DATENAME(MONTH,DateOfIssue) as month_name,
                datediff(week,CONVERT(char, DateOfIssue - (DAY(DateOfIssue) - 1),101),DateOfIssue)+1 as weeknumber,
                count(distinct student_ID) as NoofStudents,
                count(student_ID) as NoofGrants,
                SUM(grantvalue) as Amount,
                SUM(isnull(KuhaFunds,0)) as KohafundsAmount,
                (SUM(grantvalue)+SUM(isnull(KuhaFunds,0))) as TotalGrantAmount
            FROM 
                Student_vouchers
            WHERE 
                Year(DateOfIssue)=@Year  and month(DateOfIssue)=@monthnumber and GrantType=@Voucher 
            GROUP BY 
                GrantType,DATENAME(MONTH,DateOfIssue),
                datediff(week,CONVERT(char, DateOfIssue - (DAY(DateOfIssue) - 1),101),DateOfIssue)+1
            ORDER BY 
                datediff(week,CONVERT(char, DateOfIssue - (DAY(DateOfIssue) - 1),101),DateOfIssue)+1">

            <SelectParameters>
                <asp:ControlParameter ControlID="txbReadWeeklyYear" DefaultValue="%"
                    Name="Year" PropertyName="Text" />
                <asp:ControlParameter ControlID="txbReadMonth" DefaultValue="%" Name="monthnumber"
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="txbReadVoucher" DefaultValue="%"
                    Name="Voucher" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p>
            &nbsp;
        </p>
    </div>
</asp:Content>

