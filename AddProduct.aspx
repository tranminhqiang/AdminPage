<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Admin.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content">
        <h2>Add Product</h2>
        <asp:TextBox ID="txtName" runat="server" Placeholder="Product Name" CssClass="input" />
        <asp:TextBox ID="txtDescription" runat="server" Placeholder="Description" CssClass="input" />
        <asp:TextBox ID="txtPrice" runat="server" Placeholder="Price" CssClass="input" />
        <asp:TextBox ID="txtStock" runat="server" Placeholder="Stock" CssClass="input" />
        
        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="input">
            <asp:ListItem Text="Select Category" Value="" />
        </asp:DropDownList>

        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn" />
        <asp:Label ID="lblMessage" runat="server" CssClass="message" Visible="false"></asp:Label>
    </div>
</asp:Content>
