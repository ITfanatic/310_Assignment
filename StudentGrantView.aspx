<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StudentGrantView.aspx.cs" Inherits="StudentGrantView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        h1 {
            font-family: 'Myriad Pro';
            font-size: x-large;
            color: #808080;
        }

        #ViewGrantField {
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>View Grant</h1>
    <div id="ViewGrantField" class="standardText">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
            AutoGenerateColumns="False" DataKeyNames="student_ID,Refno"
            DataSourceID="SqlDataSource1"
            EmptyDataText="There are no data records to display." BackColor="White"
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4"
            ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server"
                            OnClientClick="return confirm('Are you sure you want to delete this record?');"
                            CommandName="Delete">Delete Grant</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:BoundField DataField="student_ID" HeaderText="student_ID"
                    SortExpression="student_ID" />
                <asp:BoundField DataField="GrantType" HeaderText="GrantType"
                    SortExpression="GrantType" />
                <asp:BoundField DataField="GrantDescription" HeaderText="GrantDescription"
                    SortExpression="GrantDescription" />
                <asp:BoundField DataField="GrantValue" HeaderText="GrantValue"
                    SortExpression="GrantValue" />
                <asp:BoundField DataField="DateOfIssue" HeaderText="DateOfIssue"
                    SortExpression="DateOfIssue" />
                <asp:BoundField DataField="KuhaFunds" HeaderText="KuhaFunds"
                    SortExpression="KuhaFunds" />
                <asp:BoundField DataField="Refno" HeaderText="Refno" InsertVisible="False"
                    ReadOnly="True" SortExpression="Refno" />
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

        <br/>

        <asp:Button ID="btnGrant" runat="server" OnClick="btnGrant_Click"
            Text="Add Grant" CssClass="standardButton" />



        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:FinanceDBConnectionString1 %>"
            DeleteCommand="Delete FROM [Student_vouchers] WHERE ([student_ID] = @student_ID) and RefNo=@RefNo"
            ProviderName="<%$ ConnectionStrings:FinanceDBConnectionString1.ProviderName %>"
            SelectCommand="SELECT * FROM [Student_vouchers] WHERE ([student_ID] = @student_ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txbResult" DefaultValue="%" Name="student_ID"
                    PropertyName="Text" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="student_ID" />
                <asp:Parameter Name="RefNo" />
            </DeleteParameters>
        </asp:SqlDataSource>


        <asp:TextBox ID="txbResult" runat="server" Visible="False"></asp:TextBox>
    </div>
</asp:Content>

