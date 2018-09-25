<%@ Page Title="Fasthosts | Login" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="logIn.aspx.cs" Inherits="logIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/StandardColours.css" rel="stylesheet" />
    <link href="../CSS/standard.css" rel="stylesheet" />
    <link href="../CSS/buttonSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="content colour-foreground">
            <div class="page-center-standard">
                <h1 class="page-title">Log In</h1>
                <h2 class="page-subtitle">Please enter your Username and Password to Login</h2>
                <div class="title-divider"></div>
                <div class="page-column left">
                    <div class="form-container">
                        <!-- Username Input for logging in here -->
                        <div class="input-field">
                            <div class="input-field-label">
                                <label class="input-label text">Username</label>
                            </div>
                            <div class="input-field-input">
                                <input runat="server" id="loginUsernameBox" class="input-box text colour-foreground" type="text" />
                            </div>
                        </div>
                        <!-- Password Input for logging in here -->
                        <div class="input-field">
                            <div class="input-field-label">
                                <label class="input-label text">Password</label>
                            </div>
                            <div class="input-field-input">
                                <input runat="server" id="loginPasswordBox" class="input-box colour-foreground" type="password" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="page-column right">
                    <asp:ValidationSummary ID="ValidationSummary1" HeaderText="<i class='material-icons'>error</i> Some Information is missing" ShowMessageBox="false" CssClass="validator validaton-box" runat="server" />
                    <asp:RequiredFieldValidator ID="usernameBoxVal" runat="server" ErrorMessage="Please enter your Username" Display="None" ControlToValidate="loginUsernameBox"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="passwordBoxVal" runat="server" ErrorMessage="Please enter your Password" Display="None" ControlToValidate="loginPasswordBox"></asp:RequiredFieldValidator>
                    <asp:Button ID="loginbutton" CssClass="button-raised proceed-button" runat="server" Text="Login" OnClick="loginbutton_Click" />
                </div>
             </div>
        </div>
    </div>
</asp:Content>