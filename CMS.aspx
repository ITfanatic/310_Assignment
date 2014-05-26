<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CMS.aspx.cs" Inherits="CMS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        h1 {
            font-family: 'Myriad Pro';
            font-size: x-large;
            color: #808080;
        }

        .cmsContainer {
            margin-left: auto;
            margin-right: auto;
        }

        .facultyGrantAlignment {
            vertical-align: text-top;
        }

        .grantsCMS {
            margin-top: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>Content Management</h1>
    <asp:ScriptManager ID="scriptManager" runat="server" EnablePartialRendering="True" />
    <table class="cmsContainer">
        <tr>
            <td class="facultyGrantAlignment">
                <asp:GridView ID="faculties" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="facultiesDataSource" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Outset" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Font-Names="Myriad Pro" AutoGenerateEditButton="True">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="FacultyName" HeaderText="FacultyName" SortExpression="FacultyName" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>

                <asp:SqlDataSource ID="facultiesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceDBConnectionString1 %>"
                    SelectCommand="SELECT * FROM [FacultiesCMS]"
                    UpdateCommand="UPDATE [FacultiesCMS] SET [FacultyName]=@FacultyName WHERE [Id]=@Id">

                    <UpdateParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                        <asp:Parameter Name="FacultyName" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:GridView ID="grants" runat="server" CssClass="grantsCMS" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="grantsDataSource" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Outset" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" Font-Names="Myriad Pro" AutoGenerateEditButton="True">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="GrantName" HeaderText="GrantName" SortExpression="GrantName" />
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>

                <asp:SqlDataSource ID="grantsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceDBConnectionString1 %>"
                    SelectCommand="SELECT * FROM [GrantsCMS]"
                    UpdateCommand="UPDATE [GrantsCMS] SET [GrantName]=@GrantName WHERE [Id]=@Id">

                    <UpdateParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                        <asp:Parameter Name="GrantName" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>

            <td>
                <%//using Ajax here so when a course is updated the page stays at its current location rather than scrolling to the top%>
                <asp:UpdatePanel UpdateMode="Conditional" ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="courses" runat="server" AutoGenerateEditButton="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="Outset" BorderWidth="1px" CellPadding="4" DataKeyNames="Id" DataSourceID="coursesDataSource" Font-Names="Myriad Pro" AutoGenerateColumns="False" ForeColor="Black" GridLines="Horizontal">
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="CourseName" HeaderText="CourseName" SortExpression="CourseName" />
                                <asp:BoundField DataField="FacultyId" HeaderText="FacultyId" SortExpression="FacultyId" />
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="Black" HorizontalAlign="Right" BackColor="White" />
                            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#242121" />
                        </asp:GridView>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <asp:SqlDataSource ID="coursesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FinanceDBConnectionString1 %>"
                    SelectCommand="SELECT * FROM [CoursesCMS]"
                    UpdateCommand="UPDATE [CoursesCMS] SET [CourseName]=@CourseName,[FacultyId]=@FacultyId WHERE [Id]=@Id">

                    <UpdateParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                        <asp:Parameter Name="CourseName" Type="String" />
                        <asp:Parameter Name="FacultyId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>

</asp:Content>

