using Admin.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;

namespace Admin
{
    /// <summary>
    /// Summary description for ProductSearchHandler
    /// </summary>
    public class ProductSearchHandler : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string query = context.Request.QueryString["query"];
            if (!string.IsNullOrEmpty(query))
            {
                // Escape input để tránh SQL Injection
                string escapedQuery = query.Replace("'", "''");

                // Thay đổi câu lệnh SQL để tìm sản phẩm theo tên chứa ký tự nhập vào
                string sqlQuery = $"SELECT product_id, name FROM Product WHERE name LIKE '%{escapedQuery}%' COLLATE SQL_Latin1_General_CP1_CI_AS";

                DataTable products = Admin.DatabaseHelper.GetData(sqlQuery);

                // Convert DataTable to JSON
                var productList = new List<object>();
                foreach (DataRow row in products.Rows)
                {
                    productList.Add(new
                    {
                        product_id = row["product_id"],
                        name = row["name"]
                    });
                }

                JavaScriptSerializer jsSerializer = new JavaScriptSerializer();
                string json = jsSerializer.Serialize(productList);

                context.Response.ContentType = "application/json";
                context.Response.Write(json);
            }
            else
            {
                context.Response.StatusCode = 400; // Bad Request
                context.Response.Write("Invalid query.");
            }
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
}