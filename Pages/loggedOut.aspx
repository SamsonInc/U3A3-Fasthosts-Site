<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="loggedOut.aspx.cs" Inherits="pageModel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/StandardColours.css" rel="stylesheet" />
    <link href="../CSS/standard.css" rel="stylesheet" />
    <link href="../CSS/buttonSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body white">
        <div class="content white">
            <div class="page-center-standard">
                <h1 class="page-title">Logged Out</h1>
                <h2 class="page-subtitle">You have been logged out due to inactivity</h2>
                <div class="title-divider"></div>
                <section class="page-column left">
                </section>
                <section class="page-column right">
                    <asp:button runat="server" ID="loggedOutContinue" text="Okay" CssClass="button-raised proceed-button" OnClick="loggedOutContinue_Click" />
                </section>
            </div>
        </div>
    </div>
</asp:Content>