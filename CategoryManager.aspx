<%@ Page Title="Category Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CategoryManager.aspx.cs" Inherits="Admin.CategoryManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="header">
        <h1>Category Management</h1>
        <a href="#" class="logout" onclick="confirmLogout()">Log out</a>
    </div>

    <div class="container">
        <div class="sidebar">
            <ul class="menu">
                <li><a href="Dashboard.aspx">Dashboard</a></li>
                <li><a href="CategoryManager.aspx" class="active">Categories</a></li>
                <li><a href="ProductManager.aspx">Products</a></li>
                <li><a href="OrderManager.aspx">Orders</a></li>
            </ul>
        </div>

        <div class="content">
            <div class="category-list">
                <h2>Categories</h2>
                <div class="category-items">
                    <asp:Repeater ID="rptCategories" runat="server">
                        <ItemTemplate>
                            <div class="category-item">
                                <a href="CategoryManager.aspx?categoryId=<%# Eval("category_id") %>" class="category-link">
                                    <%# Eval("name") %>
                                </a>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <div class="product-list">
                <h2>Products in Selected Category</h2>
                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>

                <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
                    <ItemTemplate>
                        <div class="product-item">
                            <table class="product-table">
                                <tr>
                                     <td>
     <img src='<%# Eval("image") %>' alt="Product Image" style="width: 100px; height: 100px;align-items:center" />
 </td>
                                    <td><%# Eval("name") %></td>
                                    <td><%# Eval("description") %></td>
                                    <td><%# Eval("price", "{0:C}") %></td>
                                    <td><%# Eval("stock") %></td>
                                    <td>
                                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("product_id") %>' CssClass="delete-link">Delete</asp:LinkButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

               
            </div>
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

        .category-list {
            margin-bottom: 20px;
        }

        .category-items {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
        }

        .category-item {
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: calc(33.33% - 10px);
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .category-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
        }

        .category-link {
            text-decoration: none;
            color: #333;
            font-weight: bold;
            font-size: 18px;
        }

        .category-link:hover {
            color: #4CAF50;
        }

        .product-list {
            margin-top: 20px;
        }

        .product-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .product-table td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .product-table th {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
        }

        .product-table td a {
            color: #4CAF50;
            text-decoration: none;
        }

        .product-table td a:hover {
            text-decoration: underline;
        }

        .product-item {
            margin-bottom: 15px;
        }

        .edit-link {
            color: #4CAF50;
        }

        .delete-link {
            color: red;
        }

        .delete-link:hover {
            text-decoration: underline;
        }

        .btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #45a049;
        }
    </style>
</asp:Content>
