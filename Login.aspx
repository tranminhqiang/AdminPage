<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Admin.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2 class="login-title">Admin Login</h2>
    <div class="login-form">
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="false" CssClass="error-message"></asp:Label>
        <asp:TextBox ID="txtUsername" runat="server" CssClass="input" Placeholder="Username" />
        <asp:TextBox ID="txtPassword" runat="server" CssClass="input" TextMode="Password" Placeholder="Password" />
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn" />
    </div>
    <style>

    body {
        font-family: 'Arial', sans-serif;
        background-color: #f1f1f1;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-image: linear-gradient(45deg, #4CAF50, #388E3C);
    }

    .login-title {
        text-align: center;
        color: white;
        font-size: 36px;
        margin-bottom: 20px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
    }

    .login-form {
        width: 350px;
        padding: 30px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        text-align: center;
        animation: slideIn 0.5s ease-in-out;
    }

  
    .error-message {
        color: red;
        font-size: 14px;
        margin-bottom: 15px;
    }

    .input {
        width: 100%;
        padding: 12px;
        margin: 15px 0;
        border-radius: 8px;
        border: 1px solid #ddd;
        font-size: 16px;
        outline: none;
        transition: all 0.3s ease;
    }

    .input:focus {
        border-color: #4CAF50;
        box-shadow: 0 0 8px rgba(76, 175, 80, 0.6);
    }


    .btn {
        width: 100%;
        padding: 12px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-size: 16px;
        transition: all 0.3s ease;
    }

    .btn:hover {
        background-color: #388E3C;
        transform: translateY(-3px);
    }

    .btn:active {
        transform: translateY(1px);
    }

    @keyframes slideIn {
        0% {
            transform: translateY(-50px);
            opacity: 0;
        }
        100% {
            transform: translateY(0);
            opacity: 1;
        }
    }
</style>
</asp:Content>


