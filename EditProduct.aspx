
<%@ Page Title="Edit Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProduct.aspx.cs" Inherits="Admin.EditProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="header">
        <h1>Edit Product</h1>
        <a href="ProductManager.aspx" class="btn">Back to Product Manager</a>
    </div>
    <div class="container">
        <div class="content">
            <asp:Panel ID="pnlEditProduct" runat="server" CssClass="form-container">
                <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
                <asp:HiddenField ID="hfProductId" runat="server" />
                
                <div class="form-group">
                    <asp:Label ID="lblName" runat="server" Text="Product Name:" AssociatedControlID="txtName" />
                    <asp:TextBox ID="txtName" runat="server" CssClass="input" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblDescription" runat="server" Text="Description:" AssociatedControlID="txtDescription" />
                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="5" CssClass="input" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblPrice" runat="server" Text="Price:" AssociatedControlID="txtPrice" />
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="input" />
                </div>

                <div class="form-group">
                    <asp:Label ID="lblStock" runat="server" Text="Stock:" AssociatedControlID="txtStock" />
                    <asp:TextBox ID="txtStock" runat="server" CssClass="input" />
                </div>

                <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn" OnClick="btnSave_Click" />
            </asp:Panel>
        </div>
    </div>

    <style>
        .form-container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group .input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }

        .btn {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            text-decoration: none;
            border-radius: 3px;
            text-align: center;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #45a049;
        }

        .message {
            color: red;
            margin-bottom: 15px;
        }
    </style>
</asp:Content>

