using System;
using System.Data;
using System.Data.SqlClient;

namespace Admin
{
    public partial class ProductManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchQuery = txtSearch.Text.Trim();
            LoadProducts(searchQuery);
        }

        private void LoadProducts(string searchQuery = "")
        {
            string connectionString = "Data Source=DESKTOP-MIBNCOT;Initial Catalog=FlowerShop;Integrated Security=True";
            string query = "SELECT product_id, name, description, price, stock, image FROM Product WHERE name LIKE @searchQuery COLLATE SQL_Latin1_General_CP1_CI_AS;";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.SelectCommand.Parameters.AddWithValue("@searchQuery", "%" + searchQuery + "%");
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptProducts.DataSource = dt;
                rptProducts.DataBind();
            }
        }

        protected void rptProducts_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteProduct")
            {
                int productId = Convert.ToInt32(e.CommandArgument);
                DeleteProduct(productId);
                LoadProducts(); // Reload the product list after deletion
            }
        }

        private void DeleteProduct(int productId)
        {
            string connectionString = "Data Source=DESKTOP-MIBNCOT;Initial Catalog=FlowerShop;Integrated Security=True";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Delete dependent records from Order_Item
                string deleteOrderItemsQuery = "DELETE FROM Order_Item WHERE product_id = @productId";
                using (SqlCommand cmd = new SqlCommand(deleteOrderItemsQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@productId", productId);
                    cmd.ExecuteNonQuery();
                }

                // Delete the product itself
                string deleteProductQuery = "DELETE FROM Product WHERE product_id = @productId";
                using (SqlCommand cmd = new SqlCommand(deleteProductQuery, conn))
                {
                    cmd.Parameters.AddWithValue("@productId", productId);
                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}
