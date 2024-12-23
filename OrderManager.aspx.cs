using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class OrderManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders(); // Tải danh sách đơn hàng khi trang được tải lần đầu
            }
        }

        protected void btnSearchOrder_Click(object sender, EventArgs e)
        {
            string searchQuery = txtSearchOrder.Text.Trim();

            if (!string.IsNullOrEmpty(searchQuery))
            {
                // Tìm kiếm đơn hàng dựa trên ID
                var orders = GetOrdersBySearchQuery(searchQuery);
                rptOrders.DataSource = orders;
                rptOrders.DataBind();
            }
            else
            {
                // Nếu không nhập gì, tải lại toàn bộ danh sách đơn hàng
                LoadOrders();
            }
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = sender as DropDownList;
            if (ddl == null) return;  // Kiểm tra nếu sender không phải DropDownList

            RepeaterItem item = ddl.NamingContainer as RepeaterItem;
            if (item == null) return;  // Kiểm tra nếu NamingContainer không phải RepeaterItem

            Label lblOrderId = (Label)item.FindControl("lblOrderId");
            if (lblOrderId == null) return;  // Kiểm tra nếu không tìm thấy Label

            int orderId = Convert.ToInt32(lblOrderId.Text);  // Lấy order_id từ Label
            string newStatus = ddl.SelectedValue;  // Lấy giá trị mới từ DropDownList
        }

        private void LoadOrders()
        {
            // Lấy tất cả đơn hàng từ cơ sở dữ liệu
            var orders = GetAllOrders();
            rptOrders.DataSource = orders;
            rptOrders.DataBind();
        }

        private List<Order> GetOrdersBySearchQuery(string searchQuery)
        {
            // Thực hiện truy vấn SQL để lấy đơn hàng theo searchQuery
            List<Order> orders = new List<Order>();
            string connectionString = "Data Source=DESKTOP-MIBNCOT;Initial Catalog=FlowerShop;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT o.order_id, c.first_name + ' ' + c.last_name AS customer_name, o.order_date, o.total_price, o.status FROM [Order] o JOIN Customer c ON o.customer_id = c.customer_id WHERE o.order_id LIKE @searchQuery";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@searchQuery", "%" + searchQuery + "%");

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    orders.Add(new Order
                    {
                        order_id = reader.GetInt32(0),
                        customer_name = reader.GetString(1),
                        order_date = reader.GetDateTime(2),
                        total_price = reader.GetDecimal(3),
                        status = reader.GetString(4)
                    });
                }
            }
            return orders;
        }

        private List<Order> GetAllOrders()
        {
            // Thực hiện truy vấn SQL để lấy tất cả đơn hàng
            List<Order> orders = new List<Order>();
            string connectionString = "Data Source=DESKTOP-MIBNCOT;Initial Catalog=FlowerShop;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT o.order_id, c.first_name + ' ' + c.last_name AS customer_name, o.order_date, o.total_price, o.status FROM [Order] o JOIN Customer c ON o.customer_id = c.customer_id";
                SqlCommand cmd = new SqlCommand(query, conn);

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    orders.Add(new Order
                    {
                        order_id = reader.GetInt32(0),
                        customer_name = reader.GetString(1),
                        order_date = reader.GetDateTime(2),
                        total_price = reader.GetDecimal(3),
                        status = reader.GetString(4)
                    });
                }
            }
            return orders;
        }

        private void UpdateOrderStatus(int orderId, string newStatus)
        {
            // Cập nhật trạng thái đơn hàng trong cơ sở dữ liệu
            string connectionString = "Data Source=DESKTOP-MIBNCOT;Initial Catalog=FlowerShop;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "UPDATE [Order] SET status = @status WHERE order_id = @order_id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@status", newStatus);
                cmd.Parameters.AddWithValue("@order_id", orderId);
                cmd.ExecuteNonQuery();
            }
        }
    }

    // Lớp Order để lưu thông tin đơn hàng
    public class Order
    {
        public int order_id { get; set; }
        public string customer_name { get; set; }
        public DateTime order_date { get; set; }
        public decimal total_price { get; set; }
        public string status { get; set; }
    }
}
