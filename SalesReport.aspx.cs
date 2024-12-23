using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class SalesReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadYearsAndMonths();
                LoadSalesReport(DateTime.Now.Year, DateTime.Now.Month);
            }
        }


        private void LoadYearsAndMonths()
        {
            // Load năm
            int currentYear = DateTime.Now.Year;
            for (int i = currentYear - 5; i <= currentYear; i++)
            {
                ddlYear.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
            ddlYear.SelectedValue = currentYear.ToString();

            // Load tháng
            for (int i = 1; i <= 12; i++)
            {
                ddlMonth.Items.Add(new ListItem(i.ToString("D2"), i.ToString()));
            }
            ddlMonth.SelectedValue = DateTime.Now.Month.ToString();
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            int selectedYear = int.Parse(ddlYear.SelectedValue);
            int selectedMonth = int.Parse(ddlMonth.SelectedValue);
            LoadSalesReport(selectedYear, selectedMonth);
        }

        private void LoadSalesReport(int year, int month)
        {
            string connectionString = "Data Source=DESKTOP-MIBNCOT;Initial Catalog=FlowerShop;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("GetCompletedSalesReport", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Year", year);
                    cmd.Parameters.AddWithValue("@Month", month);

                    conn.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    // Đọc tổng doanh thu và số lượng sản phẩm bán ra
                    if (reader.Read())
                    {
                        lblTotalRevenue.InnerText = "Total Revenue: " + reader["TotalRevenue"].ToString();
                        lblTotalItemsSold.InnerText = "Total Items Sold: " + reader["TotalItemsSold"].ToString();
                    }

                    // Đọc sản phẩm bán chạy nhất
                    if (reader.NextResult() && reader.Read())
                    {
                        lblBestSellingProduct.InnerText = "Best Selling Product: " + reader["BestSellingProduct"].ToString() +
                                                     " (" + reader["TotalSold"].ToString() + " sold)";
                    }
                    conn.Close();
                }
            }
        }
    }
}
