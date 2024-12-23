<%@ Page Title="Order Management" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderManager.aspx.cs" Inherits="Admin.OrderManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="header">
        <h1>Order Management</h1>
        <a href="#" class="logout" onclick="confirmLogout()">Log out</a>
    </div>
    <div class="container">
        <div class="sidebar">
            <ul class="menu">
                <li><a href="Dashboard.aspx">Dashboard</a></li>
                <li><a href="CategoryManager.aspx">Categories</a></li>
                <li><a href="ProductManager.aspx">Products</a></li>
                <li><a href="OrderManager.aspx" class="active">Orders</a></li>
            </ul>
        </div>
        <div class="content">
            <div class="search-bar">
                <asp:TextBox ID="txtSearchOrder" runat="server" CssClass="input" Placeholder="Search order by ID..." />
                <asp:Button ID="btnSearchOrder" runat="server" Text="Search" OnClick="btnSearchOrder_Click" CssClass="btn" />
            </div>
            <table class="order-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer Name</th>
                        <th>Order Date</th>
                        <th>Total Price</th>
                        <th>Status</th>
                        
                    </tr>
                </thead>
                <tbody>
                   <asp:Repeater ID="rptOrders" runat="server">
    <ItemTemplate>
        <tr>
            <td><%# Eval("order_id") %></td>
            <td><%# Eval("customer_name") %></td>
            <td><%# Eval("order_date", "{0:yyyy-MM-dd HH:mm:ss}") %></td>
            <td><%# Eval("total_price", "{0:C}") %></td>
            <td>
                <asp:DropDownList ID="ddlStatus" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
                    <asp:ListItem Text="Pending" Value="Pending" />
                    <asp:ListItem Text="Completed" Value="Completed" />
                    <asp:ListItem Text="Refund" Value="Refund" />
                </asp:DropDownList>
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

    .order-table {
        width: 100%;
        border-collapse: collapse;
        background-color: white;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .order-table th, .order-table td {
        padding: 15px;
        border: 1px solid #ddd;
        text-align: left;
    }

    .order-table th {
        background-color: #4CAF50;
        color: white;
    }

    .order-table td a {
        color: #4CAF50;
        text-decoration: none;
    }

    .order-table td a:hover {
        text-decoration: underline;
    }
</style>
</asp:Content>
