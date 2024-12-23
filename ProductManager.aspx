<%@ Page Title="Product Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductManager.aspx.cs" Inherits="Admin.ProductManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="header">
        <h1>Product Management</h1>
        <a href="#" class="logout" onclick="confirmLogout()">Log out</a>
    </div>
    <div class="container">
        <div class="sidebar">
            <ul class="menu">
                <li><a href="Dashboard.aspx">Dashboard</a></li>
                <li><a href="CategoryManager.aspx">Categories</a></li>
                <li><a href="ProductManager.aspx" class="active">Products</a></li>
                <li><a href="OrderManager.aspx">Orders</a></li>
                <li><a href="SalesReport.aspx" >Sales Report</a></li>
            </ul>
        </div>
        <div class="content">
            <div class="search-bar">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="input" Placeholder="Search product..." />
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn" />
            </div>
            <table class="product-table">
    <thead>
        <tr>
            <th>Image</th>
            <th>Product Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Stock</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
        <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
            <ItemTemplate>
                <tr>
                    <td>
                        <img src='<%# Eval("image") %>' alt="Product Image" style="width: 100px; height: 100px;align-items:center" />
                    </td>
                    <td><%# Eval("name") %></td>
                    <td><%# Eval("description") %></td>
                    <td><%# Eval("price") %></td>
                    <td><%# Eval("stock") %></td>
                    <td>
                        <a href="EditProduct.aspx?id=<%# Eval("product_id") %>">Edit</a>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </tbody>
</table>

        </div>
    </div>

    <script>
        function confirmLogout() {
            if (confirm("Are you sure you want to log out?")) {
                window.location.href = "Login.aspx";
            }
        }
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #4CAF50;
            color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            margin: 0;
        }

        .header .logout {
            color: white;
            text-decoration: underline;
            font-size: 14px;
            cursor: pointer;
        }

        .container {
            display: flex;
        }

        .sidebar {
            width: 200px;
            background-color: #333;
            color: white;
            min-height: 100vh;
            padding: 20px 0;
        }

        .sidebar .menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .sidebar .menu li {
            margin: 10px 0;
        }

        .sidebar .menu a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 10px 20px;
        }

        .sidebar .menu a:hover, .sidebar .menu a.active {
            background-color: #4CAF50;
        }

        .content {
            flex: 1;
            padding: 20px;
        }

        .search-bar {
            margin-bottom: 20px;
            display: flex;
            gap: 10px;
        }

        .product-table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .product-table th, .product-table td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .product-table th {
            background-color: #4CAF50;
            color: white;
        }

        .product-table td a {
            color: #4CAF50;
            text-decoration: none;
        }

        .product-table td a:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>
