<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EthnicityReport.aspx.cs" Inherits="EthnicityReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        h1 {
            font-family: 'Myriad Pro';
            font-size: x-large;
            color: #808080;
        }

        #loginFooter {
            position: absolute;
            top: 700px;
            width: 1000px;
            height: 5px;
            border-top: 1px solid #000000;
            background-color: #808080;
        }

        .reportField {
            margin-right: auto;
            margin-left: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Report by Ethnicity</h1>
    <div class="standardText">
        <asp:GridView ID="grdEthnicityReport" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="srcEthnicityReport" ForeColor="Black" GridLines="Horizontal" EmptyDataText="Sorry, there are no records matching that ethinicty." CssClass="reportField">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>

        <asp:SqlDataSource ID="srcEthnicityReport" runat="server"
            ConnectionString="<%$ ConnectionStrings:FinanceDBConnectionString1 %>"
            ProviderName="<%$ ConnectionStrings:FinanceDBConnectionString1.ProviderName %>"
            SelectCommand=" 
                        SELECT 
	                        sv.GrantType as [Type of Grants], 
	                        COUNT(sv.GrantType) as [Amount of Grants for Specified Ethnicity], 
	                        SUM(sv.GrantValue) as [Total Cost]
                        FROM 
                            Student_vouchers sv
                        INNER JOIN 
                            Student_Registration_Form s
                        ON 
                            s.Student_ID=sv.student_ID 
                        WHERE 
                            s.Main_Ethnicity=ISNULL(@ethnicity, s.Main_Ethnicity) OR s.Detailed_Ethnicity=ISNULL(@ethnicity, s.Detailed_Ethnicity)
                        GROUP BY 
							sv.GrantType">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtReadEthnicity" DefaultValue="%" Name="ethnicity"
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:TextBox ID="txtReadEthnicity" runat="server" Visible="False"></asp:TextBox>

        <p>
            <asp:Label ID="lblExtraInfo" runat="server" Text=""></asp:Label>
        </p>
    </div>
    <div id="loginFooter"></div>
</asp:Content>

