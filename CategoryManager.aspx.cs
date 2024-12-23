using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class CategoryManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
                LoadProducts();
            }
        }

        private void LoadCategories()
        {
            string query = "SELECT category_id, name FROM Category";
            DataTable categories = DatabaseHelper.GetData(query);
            rptCategories.DataSource = categories;
            rptCategories.DataBind();
        }

        private void LoadProducts()
        {
            string categoryId = Request.QueryString["categoryId"];
            if (!string.IsNullOrEmpty(categoryId))
            {
                string query = $"SELECT * FROM Product WHERE category_id = {categoryId}";
                DataTable products = DatabaseHelper.GetData(query);
                rptProducts.DataSource = products;
                rptProducts.DataBind();
            }
            else
            {
                rptProducts.DataSource = null;
                rptProducts.DataBind();
            }
        }

        


        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblErrorMessage.Visible = true; // Ensure the label is visible for debugging
            if (e.CommandName == "Delete")
            {
                int productId = Convert.ToInt32(e.CommandArgument);

                // Kiểm tra xem sản phẩm có bị tham chiếu trong bảng Order_Item không
                string checkOrderItemQuery = $"SELECT COUNT(*) FROM Order_Item WHERE product_id = {productId}";
                int orderItemCount = Convert.ToInt32(DatabaseHelper.GetScalar(checkOrderItemQuery));

                // Kiểm tra xem sản phẩm có bị tham chiếu trong bảng Cart không
                string checkCartQuery = $"SELECT COUNT(*) FROM Cart WHERE product_id = {productId}";
                int cartCount = Convert.ToInt32(DatabaseHelper.GetScalar(checkCartQuery));

                if (orderItemCount > 0)
                {
                    // Hiển thị thông báo lỗi nếu có bản ghi tham chiếu trong bảng Order_Item
                    lblErrorMessage.Text = "Cannot delete this product because it is referenced in order items.";
                    lblErrorMessage.ForeColor = System.Drawing.Color.Red;
                }
                else if (cartCount > 0)
                {
                    // Hiển thị thông báo lỗi nếu có bản ghi tham chiếu trong bảng Cart
                    lblErrorMessage.Text = "Cannot delete this product because it is referenced in the cart.";
                    lblErrorMessage.ForeColor = System.Drawing.Color.Red;
                }
                else
                {
                    // Xóa sản phẩm nếu không có tham chiếu trong các bảng Order_Item và Cart
                    string deleteQuery = $"DELETE FROM Product WHERE product_id = {productId}";
                    DatabaseHelper.ExecuteQuery(deleteQuery);

                    // Thông báo thành công
                    lblErrorMessage.Text = "Product deleted successfully.";
                    lblErrorMessage.ForeColor = System.Drawing.Color.Green;
                }

                lblErrorMessage.Visible = true;

                // Reload products after deletion
                LoadProducts();
            }
        }
    }
}
