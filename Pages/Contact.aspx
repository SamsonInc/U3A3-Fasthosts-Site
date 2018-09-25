<%@ Page Title="Fasthosts | Contact Us" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="pageModel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/standard.css" rel="stylesheet" />
    <link href="../CSS/buttonSheet.css" rel="stylesheet" />
    <script src="/Scripts/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="/Scripts/jquery.validate.js" type="text/javascript"></script>
    <script src="/Scripts/ContactForm.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" ClientIDMode="AutoID">
    <div class="body">
        <div class="content colour-foreground">
            <div class="page-center-standard">
                <h1 class="page-title">Contact Us</h1>
                <h2 class="page-subtitle">We'll get back to you as soon as possible</h2>
                <div class="title-divider"></div>
                <section class="page-column left">
                    <div class="form-container">
                        <div class="input-field">
                            <div class="input-field-label">
                                <label class="input-label text">Name<span title="NameIndicator" id="NameIndicator" class="dot"/></label>
                            </div>
                            <div class="input-field-input">
                                <input name="name" id="name" oninput="validateName();" class="input-box text colour-foreground" type="text" />
                            </div>
                        </div>
                        <div class="input-field">
                            <div class="input-field-label">
                                <label class="input-label text">Email<span title="EmailIndicator" id="EmailIndicator" class="dot"/></label>
                            </div>
                            <div class="input-field-input">
                                <input name="email" id="email" class="input-box text colour-foreground" oninput="validate();" type="email">
                            </div>
                        </div>
                        <div class="input-field">
                            <div class="input-field-label">
                                <label class="input-label text">Message<span title="MessageIndicator" id="MessageIndicator" class="dot"/></label>
                            </div>
                            <div class="input-field-input">
                                <textarea name="message" id="message" rows="10" onchange="checkMessage();" class="input-box text colour-foreground"></textarea>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="page-column right">
                    <div class="tld-info">
                        <p class="text">Enter your information and a message, We'll get back to you as soon as we can</p>
                    </div>
                    <button class="button-raised proceed-button" onclick="validate()"id="submit">Submit</button>
                    <input class="button-raised proceed-button" onclick="resetFields()" type="button" value="Clear"/>
                </section>
            </div>
        </div>
    </div>
</asp:Content>