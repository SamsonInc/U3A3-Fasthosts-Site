<%@ Page Title="Fasthosts | Top Level Domains" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="TLDs.aspx.cs" Inherits="pageModel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/StandardColours.css" rel="stylesheet" />
    <link href="../CSS/standard.css" rel="stylesheet" />
    <link href="../CSS/buttonSheet.css" rel="stylesheet" />
    <link href="../CSS/DBStyling.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="content colour-foreground">
            <div class="page-center-standard">
                <h1 class="page-title">Browse Top Level Domains</h1>
                <div class="title-divider"></div>
                <div class="page-column left">
                    <div class="gridview-search-container">
                        <asp:TextBox runat="server" id="tldSearchBox" OnTextChanged="tldSearch_textChanged" CssClass="tldSearchBox colour-foreground text" placeholder="Search TLDs"></asp:TextBox>
                    </div>
                    <div class="gridview-container">
                        <asp:GridView ID="GridView1" runat="server" DataSourceID="TestingTldDBTable" 
                        AutoGenerateColumns="False" CssClass="GridView" OnRowCreated="GridView1_RowCreated">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox CssClass="checkbox-accent" ID="interestCtrl" runat="server"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="TLDName" HeaderText="TLD" SortExpression="TLDName" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:BoundField DataField="Pricing" DataFormatString="{0:c}" HeaderText="Pricing" SortExpression="Pricing" />
                        </Columns>
                    </asp:GridView>
                    </div>
                    <asp:SqlDataSource ID="TestingTldDBTable" runat="server" ConnectionString="<%$ ConnectionStrings:FasthostsConnectionString %>" SelectCommand="SELECT [TLDName], [Description], [Pricing] FROM [TLD]"></asp:SqlDataSource>
                </div>
                <div class="page-column right">
                    <div class="tld-info colour-foreground">
                        <p runat="server" id="tldInfo">Login or Register to select which TLDs you are interested in so we can alert you when they become available.</p>
                    </div>
                    <asp:Button ID="tldContinue" runat="server" Text="Continue" CssClass="button-raised proceed-button" OnClick="tldContinue_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>