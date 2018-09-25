<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="account.aspx.cs" Inherits="pageModel" %>

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
                <h1 runat="server" id="PageTitle" class="page-title">Account</h1>
                <h2 class="page-subtitle"></h2>
                <div class="title-divider"></div>
                <section class="page-column left">
                    <div class="gridview-container">
                        <asp:GridView ID="GridView1" runat="server" CssClass="GridView" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" DataSourceID="InterestsDataSource">
                            <Columns>
                                <asp:BoundField DataField="TLDName" HeaderText="TLD" SortExpression="TLDName" />
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button runat="server" OnClick="btn_deleteInterest_Click" ID="btn_deleteInterest" CssClass="button-inline" Text="Delete" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="InterestsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FasthostsConnectionString %>" SelectCommand="SELECT [TLDName], [Description] FROM [TLD] WHERE EXISTS (SELECT * FROM Interests WHERE TldID = TLD.TldID AND UserID = @userID)">
                            <SelectParameters>
                                <asp:SessionParameter Name="userID" SessionField="loggedInUserID" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </section>
                <section class="page-column right">
                    <div class="tld-info colour-foreground">
                        <p runat="server" id="account_Username">Username: </p>
                        <p runat="server" id="account_RealName">Name: </p>
                        <p runat="server" id="account_Email">Email: </p>
                    </div>
                    <div class="tld-info colour-foreground">
                        <asp:CheckBox runat="server" ID="account_darkThemeToggle" CssClass="text check" AutoPostBack="true" Text="Enable Dark Theme" OnCheckedChanged="account_darkThemeToggle_CheckedChanged" />
                    </div>
                    <div class="tld-info">
                        <p>Change Password</p>
                        <div class="input-field">
                            <div class="input-field-label">
                                <label class="input-label text">Old Password</label>
                            </div>
                            <div class="input-field-input">
                                <input runat="server" id="oldPassword" class="input-box colour-foreground" type="password" />
                            </div>
                        </div>
                        <div class="input-field">
                            <div class="input-field-label">
                                <label class="input-label text">New Password</label>
                            </div>
                            <div class="input-field-input">
                                <input runat="server" id="newPassword" class="input-box colour-foreground" type="password" />
                            </div>
                        </div>
                        <div class="input-field">
                            <div class="input-field-label">
                                <label class="input-label text">Confirm New Password</label>
                            </div>
                            <div class="input-field-input">
                                <input runat="server" id="confNewPassword" class="input-box colour-foreground" type="password" />
                            </div>
                            <asp:Button runat="server" ID="changePasswordButton" CssClass="button-raised" Text="Change Password" />
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>