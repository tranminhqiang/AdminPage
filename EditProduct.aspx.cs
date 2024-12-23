using System;
using System.Data.SqlClient;

namespace Admin
{
    public partial class EditProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int productId;
                if (int.TryParse(Request.QueryString["id"], out productId))
                {
                    LoadProduct(productId);
                }
                else
                {
                    lblMessage.Text = "Invalid product ID.";
                }
            }
        }

        private void LoadProduct(int productId)
        {
            string connectionString = "Data Source=DESKTOP-MIBNCOT;Initial Catalog=FlowerShop;Integrated Security=True";
            string query = "SELECT * FROM Product WHERE product_id = @productId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@productId", productId);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    hfProductId.Value = productId.ToString();
                    txtName.Text = reader["name"].ToString();
                    txtDescription.Text = reader["description"].ToString();
                    txtPrice.Text = reader["price"].ToString();
                    txtStock.Text = reader["stock"].ToString();
                }
                else
                {
                    lblMessage.Text = "Product not found.";
                }
                conn.Close();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int productId = int.Parse(hfProductId.Value);
            string name = txtName.Text.Trim();
            string description = txtDescription.Text.Trim();
            decimal price = decimal.Parse(txtPrice.Text.Trim());
            int stock = int.Parse(txtStock.Text.Trim());

            string connectionString = "Data Source=DESKTOP-MIBNCOT;Initial Catalog=FlowerShop;Integrated Security=True";
            string query = "UPDATE Product SET name = @name, description = @description, price = @price, stock = @stock WHERE product_id = @productId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@description", description);
                cmd.Parameters.AddWithValue("@price", price);
                cmd.Parameters.AddWithValue("@stock", stock);
                cmd.Parameters.AddWithValue("@productId", productId);

                conn.Open();
                int rowsAffected = cmd.ExecuteNonQuery();
                conn.Close();

                if (rowsAffected > 0)
                {
                    Response.Redirect("ProductManager.aspx");
                }
                else
                {
                    lblMessage.Text = "Error updating product.";
                }
            }
        }
    }
}
