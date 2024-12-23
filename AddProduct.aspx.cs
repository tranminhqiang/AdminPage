using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        private void LoadCategories()
        {
            string query = "SELECT category_id, name FROM Category";
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-MIBNCOT;Initial Catalog=FlowerShop;Integrated Security=True"))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        ddlCategory.Items.Add(new ListItem(reader["name"].ToString(), reader["category_id"].ToString()));
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string description = txtDescription.Text.Trim();
            string priceText = txtPrice.Text.Trim();
            string stockText = txtStock.Text.Trim();
            string categoryId = ddlCategory.SelectedValue;

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(priceText) || string.IsNullOrEmpty(stockText) || string.IsNullOrEmpty(categoryId))
            {
                lblMessage.Text = "Please fill in all fields.";
                lblMessage.CssClass = "error";
                lblMessage.Visible = true;
                return;
            }

            if (!decimal.TryParse(priceText, out decimal price) || !int.TryParse(stockText, out int stock))
            {
                lblMessage.Text = "Invalid price or stock.";
                lblMessage.CssClass = "error";
                lblMessage.Visible = true;
                return;
            }

            string query = "INSERT INTO Product (name, description, price, stock, category_id) VALUES (@Name, @Description, @Price, @Stock, @CategoryId)";
            using (SqlConnection connection = new SqlConnection("Data Source=DESKTOP-MIBNCOT;Initial Catalog=FlowerShop;Integrated Security=True"))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Description", description);
                    command.Parameters.AddWithValue("@Price", price);
                    command.Parameters.AddWithValue("@Stock", stock);
                    command.Parameters.AddWithValue("@CategoryId", categoryId);

                    int rowsAffected = command.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Product added successfully.";
                        lblMessage.CssClass = "success";
                        lblMessage.Visible = true;
                        ClearForm();
                    }
                    else
                    {
                        lblMessage.Text = "Error adding product.";
                        lblMessage.CssClass = "error";
                        lblMessage.Visible = true;
                    }
                }
            }
        }

        private void ClearForm()
        {
            txtName.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtStock.Text = string.Empty;
            ddlCategory.SelectedIndex = 0;
        }
    }
}
