<%@ Page Title="Sales Report" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalesReport.aspx.cs" Inherits="Admin.SalesReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="header">
        <h1>Sales Report</h1>
        <a href="#" class="logout" onclick="confirmLogout()">Log out</a>
    </div>
    <div class="container">
        <div class="sidebar">
            <ul class="menu">
                <li><a href="Dashboard.aspx">Dashboard</a></li>
                <li><a href="CategoryManager.aspx">Categories</a></li>
                <li><a href="ProductManager.aspx">Products</a></li>
                <li><a href="OrderManager.aspx">Orders</a></li>
                <li><a href="SalesReport.aspx" class="active">Sales Report</a></li>
            </ul>
        </div>
        <div class="content">
            <div class="filter-bar">
                <asp:DropDownList ID="ddlYear" runat="server" CssClass="dropdown"></asp:DropDownList>
                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="dropdown"></asp:DropDownList>
                <asp:Button ID="btnFilter" runat="server" Text="Filter" OnClick="btnFilter_Click" CssClass="btn" />

            </div>
            <div class="sales-report">
                <h2>Monthly Sales Report</h2>
                <p id="lblTotalRevenue" runat="server"></p>
                <p id="lblTotalItemsSold" runat="server"></p>
                <p id="lblBestSellingProduct" runat="server"></p>
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

        .filter-bar {
            margin-bottom: 20px;
            display: flex;
            gap: 10px;
        }

        .sales-report {
            margin-top: 20px;
            padding: 15px;
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        .sales-report h2 {
            margin-top: 0;
            color: #4CAF50;
        }

        .sales-report p {
            margin: 5px 0;
            font-size: 16px;
        }

        .dropdown {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .btn {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #45a049;
        }
    </style>
</asp:Content>
