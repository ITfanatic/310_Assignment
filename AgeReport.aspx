<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AgeReport.aspx.cs" Inherits="AgeReport" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Grants given by Age</h1>
    <div class="standardText">
        <p style="text-align: center">
            <asp:Label ID="Titletext" runat="server" Text="Titletext" Font-Size="Large"
                Font-Bold="True" Visible="False"></asp:Label>
        </p>
        <p style="text-align: center">
            &nbsp;
        </p>
        <center>
            <p>
                <asp:GridView ID="grdAgeReport" runat="server" DataSourceID="srcAgeReport" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" EmptyDataText="Sorry, there are no records with that age.">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
            </p>
        </center>
        <p>
            <asp:TextBox ID="txtReadAge" runat="server" Visible="False"></asp:TextBox>
        </p>

        <asp:SqlDataSource ID="srcAgeReport" runat="server"
            ConnectionString="<%$ ConnectionStrings:FinanceDBConnectionString1 %>"
            ProviderName="<%$ ConnectionStrings:FinanceDBConnectionString1.ProviderName %>"
            SelectCommand="
                        SELECT 
	                        sv.GrantType as [Type of Grants], 
	                        COUNT(sv.GrantType) as [Amount of Grants for Specified Age], 
	                        SUM(sv.GrantValue) as [Total Cost]
                        FROM
                            Student_vouchers sv
                        INNER JOIN 
                            Student_Registration_Form s
                        ON 
                            s.Student_ID=sv.student_ID 
                        WHERE
	                        CONVERT(int,ROUND(DATEDIFF(hour,s.DOB,GETDATE())/8766.0,0)) = @age
                        GROUP BY 
                            GrantType">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtReadAge" DefaultValue="%" Name="age"
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Label ID="lblExtraInfo" runat="server" Visible="False"></asp:Label>
    </div>

    <div id="loginFooter">
    </div>
</asp:Content>

