<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sitemap.aspx.cs" Inherits="Sitemap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        h1 {
            font-family: 'Myriad Pro';
            font-size: x-large;
            color: #808080;
        }

        #SitemapField {
            margin-left: 300px;
            margin-right: 300px;
            border: 1px solid lightgrey;
            border-radius: 5px;
            padding: 100px;
            padding-top: -25px;
            background-color: #fffafa;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SiteMapDataSource runat="server" ID="navigation" />
    <h1>Sitemap</h1>

    <div id="SitemapField">
        <asp:TreeView ID="navTree" runat="server" DataSourceID="navigation" ForeColor="#808080" Font-Size="Larger" ExpandDepth="FullyExpand" />
    </div>
</asp:Content>

