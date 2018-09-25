<%@ Page Title="Fasthosts | Register" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../CSS/StandardColours.css" rel="stylesheet" />
    <link href="../CSS/standard.css" rel="stylesheet" />
    <link href="../CSS/buttonSheet.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body">
        <div class="content colour-foreground">
            <div class="page-center-standard">
                <h1 class="page-title">Register</h1>
                <h2 class="page-subtitle">Please fill in all boxes below</h2>
                <div class="title-divider"></div>
                <div class="page-column left">
                        <div class="form-container">
                            <!-- This is where the users first name is entered -->
                            <div class="input-field">
                                <div class="input-field-label">
                                    <label id="firstNameLabel" runat="server" class="input-label text">First Name</label>
                                </div>
                                <div class="input-field-input">
                                    <input runat="server" onchange="firstNameBox_Change" id="firstNameBox" class="input-box colour-foreground text" type="text" />
                                </div>
                            </div>

                            <!-- This is where the users second name is entered -->
                            <div class="input-field">
                                <div class="input-field-label">
                                    <label class="input-label text">Last Name</label>
                                </div>
                                <div class="input-field-input">
                                    <input runat="server" id="lastNameBox" class="input-box colour-foreground text" type="text" />
                                </div>
                            </div>

                            <!-- This is where the users username is entered -->
                            <div class="input-field">
                                <div class="input-field-label text">
                                    <label class="input-label">Username</label>
                                </div>
                                <div class="input-field-input">
                                    <input runat="server" id="usernameBox" class="input-box colour-foreground text" type="text" />
                                </div>
                            </div>

                            <!-- This is where the users Email adress is entered -->
                            <div class="input-field">
                                <div class="input-field-label">
                                    <label class="input-label text">Email</label>
                                </div>
                                <div class="input-field-input">
                                    <input runat="server" id="emailBox" class="input-box colour-foreground text" type="email" />
                                </div>
                            </div>

                            <!-- This is where the users password is entered -->
                            <div class="input-field">
                                <div class="input-field-label text">
                                    <label class="input-label">Password</label>
                                </div>
                                <div class="input-field-input">
                                    <input runat="server" id="passwordBox" class="input-box colour-foreground text" type="password" />
                                </div>
                            </div>
                        
                            <!-- This is where the users password is entered again -->
                            <div class="input-field">
                                <div class="input-field-label">
                                    <label class="input-label text">Confirm Password</label>
                                </div>
                                <div class="input-field-input">
                                    <input runat="server" id="conPasswordBox" class="input-box colour-foreground text" type="password" />
                                </div>
                            </div>  
                            </div>
                </div>
                <div class="page-column right">
                    <div class="tld-info">
                        <p>
                            Register for an account now and gain access to a site wide dark theme.
                        </p>
                    </div>
                        <!-- The validators are contained here, but their error messages shown through the validationSummary in the form of a red box -->
                        <asp:ValidationSummary id="valSum" DisplayMode="BulletList" 
                            EnableClientScript="true" 
                            HeaderText="<i class='material-icons'>error</i> Some Information is missing" 
                            runat="server" CssClass="validator validaton-box" ShowMessageBox="False" />

                        <asp:RequiredFieldValidator ID="firstNameValidator" SetFocusOnError="true" ErrorMessage="Please enter your First Name" runat="server" ControlToValidate="firstNameBox" Display="None"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="lastNameValidator" runat="server" ErrorMessage="Please enter your Last Name" ControlToValidate="lastNameBox" Display="None"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="usernameValidator" runat="server" ErrorMessage="Please enter a Username" ControlToValidate="usernameBox" Display="None"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="emailValidator" SetFocusOnError="true" ErrorMessage="Please enter your Email" runat="server" ControlToValidate="emailBox" Display="None"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="ReqPasswordValidator" SetFocusOnError="true" ErrorMessage="Please enter a Password" runat="server" ControlToValidate="passwordBox" Display="None"></asp:RequiredFieldValidator>
                    <asp:RequiredFieldValidator ID="ReqConfPasswordValidator" SetFocusOnError="true" ErrorMessage="Please enter your password again" runat="server" ControlToValidate="conPasswordBox" Display="None"></asp:RequiredFieldValidator>
                        <asp:comparevalidator ID="confPasswordValdiator" runat="server" errormessage="Please ensure that the password is the same twice" ControlToCompare="passwordBox" ControlToValidate="conPasswordBox" Display="None"></asp:comparevalidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is not formed correctly" ControlToValidate="emailBox" Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:Button runat="server" ID="registerButton" CssClass="button-raised proceed-button" Text="Register" OnClick="registerButton_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>