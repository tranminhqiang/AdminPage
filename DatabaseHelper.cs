using System;
using System.Data;
using System.Data.SqlClient;

namespace Admin
{
    public static class DatabaseHelper
    {
        // Connection string to your database
        private static readonly string connectionString = "Data Source=DESKTOP-MIBNCOT;Initial Catalog=FlowerShop;Integrated Security=True";

        // Method to execute a query and return a DataTable
        public static DataTable GetData(string query)
        {
            DataTable dataTable = new DataTable();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        conn.Open();
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            adapter.Fill(dataTable);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error fetching data: " + ex.Message);
            }

            return dataTable;
        }

        public static object GetScalar(string query)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                return cmd.ExecuteScalar();
            }
        }
        public static int ExecuteQuery(string query)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                return cmd.ExecuteNonQuery();  // Executes the query and returns the number of affected rows
            }
        }

        // Method to execute a non-query command (INSERT, UPDATE, DELETE)
        public static void ExecuteCommand(string query)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        
    }
}
