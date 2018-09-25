<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="pageModel.aspx.cs" Inherits="pageModel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/StandardColours.css" rel="stylesheet" />
    <link href="../CSS/standard.css" rel="stylesheet" />
    <link href="../CSS/buttonSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="content colour-foreground">
            <div class="page-center-standard">
                <h1 class="page-title">Title</h1>
                <h2 class="page-subtitle">Subtitle / Purpose</h2>
                <div class="title-divider"></div>
                <section class="page-column left">
                    <p>Content goes here</p>
                </section>
                <section class="page-column right">
                    <p>Content goes here</p>
                    <button class="button-raised proceed-button">Continue</button>
                </section>
            </div>
        </div>
    </div>
</asp:Content>