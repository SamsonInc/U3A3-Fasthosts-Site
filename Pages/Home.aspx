<%@ Page Title="Fasthosts | Home" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="_Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cover">
        <video id="coverVideo" src="../Content/video/background_1.mp4" loop autoplay />
    </div>
    <div class="advertisement-container">
        <img src="../Content/img/logo-cloudnx.png" />
        <h2>Next generation cloud platform</h2>
        <asp:Button runat="server" CausesValidation="false" ID="cloudNXRedirectbutton" CssClass="button-raised" Text="Find out more" OnClick="cloudNX_Click" />
    </div>
    <div class="content-home colour-foreground">
        <div id="container">
            <div class="slideshow-container">
                <div class="promo-item item-1">
                    <div class="head">
                        <img class="promo-logo" src="../Content/img/promo/product-promo-logo-cluster.png" />
                    </div>
                    <div class="promo-item-desc">
                        <p>Secure reliable Cluster web hosting with smart SSD storage and intelligent load balancing.</p>
                    </div>
                    <div class="foot">
                        <div style="color: #0099FF;">
                            <p style="font-size: 16px; font-weight: lighter">From</p>
                        </div>
                        <div class="promo-item-price">
                            <p style="font-size: 64px;">£2.50</p>
                        </div>
                        <div>
                            <p style="font-size: 18px; font-weight: lighter">Per Month</p>
                        </div>
                    </div>
                </div>
                <div class="promo-item item-2">
                    <div class="head">
                        <img class="promo-logo" src="../Content/img/promo/product-promo-logo-cloudnx.png" />
                    </div>
                    <div class="promo-item-desc">
                        <p>A flexible, powerful, next generation cloud platform that scales on demand.</p>
                    </div>
                    <div class="foot">
                        <div style="color: #0099FF;">
                            <p style="font-size: 16px; font-weight: lighter">From</p>
                        </div>
                        <div class="promo-item-price">
                            <p style="font-size: 64px;">£15</p>
                        </div>
                        <div>
                            <p style="font-size: 18px; font-weight: lighter">Per Month</p>
                        </div>
                    </div>
                </div>
                <div class="promo-item item-5">
                    <div class="head">
                        <img class="promo-logo" src="../Content/img/promo/product-promo-logo-email-exchange.png" />
                    </div>
                    <div class="promo-item-desc">
                        <p>Business class email with full syncronisation across all devices and 15GB mailboxes</p>
                    </div>
                    <div class="foot">
                        <div style="color: #0099FF;">
                            <p style="font-size: 16px; font-weight: lighter">From</p>
                        </div>
                        <div class="promo-item-price">
                            <p style="font-size: 64px;">£2.99</p>
                        </div>
                        <div>
                            <p style="font-size: 18px; font-weight: lighter">Per Month</p>
                        </div>
                    </div>
                </div>
                <div class="promo-item item-6">
                    <div class="head">
                        <img class="promo-logo" src="../Content/img/promo/product-promo-logo-email-o365.png" />
                    </div>
                    <div class="promo-item-desc">
                        <p>Everything your business needs, on all of your devices. Includes Outlook and the full suite of Office applications</p>
                    </div>
                    <div class="foot">
                        <div style="color: #0099FF;">
                            <p style="font-size: 16px; font-weight: lighter">From</p>
                        </div>
                        <div class="promo-item-price">
                            <p style="font-size: 64px;">£7.99</p>
                        </div>
                        <div>
                            <p style="font-size: 18px; font-weight: lighter">Per Month</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-inner">
                <div class="tld-info">
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nisi tellus, varius et dui in, gravida blandit dui. Proin quis gravida libero, eget aliquet ante. Suspendisse ut convallis est. Fusce lectus metus, commodo ac augue a, hendrerit semper odio. Morbi id lectus ut tortor posuere tempus. Morbi eu porttitor turpis. Donec convallis neque id urna laoreet faucibus. Maecenas in efficitur odio, varius ultricies erat. Fusce purus tortor, malesuada at elit vel, dapibus consequat orci. Donec fringilla nisl pretium lectus laoreet, quis laoreet orci ornare. Nam non lectus ut sem lobortis pulvinar et at elit. Proin eget ligula nec sem vestibulum faucibus nec a nunc. Phasellus at odio laoreet, viverra nisi a, rutrum leo.
                    </p>
                </div>
                <div class="choose">
                    <h2 style="font-family: 'Segoe UI'; font-size: 36px; color: white; text-align: center;">Why Choose Fasthosts?</h2>
                    <br />
                    <div class="title-divider"></div>
                    <p style="font-family: 'Segoe UI'; font-size: 20px; color: white; text-align: center; width: 50%; margin: auto;">Since 1999, Fasthosts has been designing new ways to give customers everything they need to manage and control their online space. Innovation drives everything we do, ensuring we offer the latest internet technology across our range of services.</p>
                    <br />
                </div>
                <div class="tld-info">
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nisi tellus, varius et dui in, gravida blandit dui. Proin quis gravida libero, eget aliquet ante. Suspendisse ut convallis est. Fusce lectus metus, commodo ac augue a, hendrerit semper odio. Morbi id lectus ut tortor posuere tempus. Morbi eu porttitor turpis. Donec convallis neque id urna laoreet faucibus. Maecenas in efficitur odio, varius ultricies erat. Fusce purus tortor, malesuada at elit vel, dapibus consequat orci. Donec fringilla nisl pretium lectus laoreet, quis laoreet orci ornare. Nam non lectus ut sem lobortis pulvinar et at elit. Proin eget ligula nec sem vestibulum faucibus nec a nunc. Phasellus at odio laoreet, viverra nisi a, rutrum leo.
                    </p>
                </div>
                <div class="tld-info">
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nisi tellus, varius et dui in, gravida blandit dui. Proin quis gravida libero, eget aliquet ante. Suspendisse ut convallis est. Fusce lectus metus, commodo ac augue a, hendrerit semper odio. Morbi id lectus ut tortor posuere tempus. Morbi eu porttitor turpis. Donec convallis neque id urna laoreet faucibus. Maecenas in efficitur odio, varius ultricies erat. Fusce purus tortor, malesuada at elit vel, dapibus consequat orci. Donec fringilla nisl pretium lectus laoreet, quis laoreet orci ornare. Nam non lectus ut sem lobortis pulvinar et at elit. Proin eget ligula nec sem vestibulum faucibus nec a nunc. Phasellus at odio laoreet, viverra nisi a, rutrum leo.
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>