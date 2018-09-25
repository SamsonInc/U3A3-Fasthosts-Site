<%@ Page Title="Fasthosts | Not so temp Page" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Temp.aspx.cs" Inherits="temp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/buttonSheet.css" rel="stylesheet" />
    <link href="../CSS/standard.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content white">
        <p>Test</p>
        <button class="button-raised spacer">Raised Button</button>
        <button class="button-raised spacer">Another button with lots of text</button>
        <div>
            <button class="button-inline-light spacer">Inline Button light</button>
        </div>
        <div>
            <button class="button-inline-dark spacer">Inline Button dark</button>
        </div>
    </div>
</asp:Content>
