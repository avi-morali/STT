using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace STT.Models
{
    public class DBConnection
    {
        private SqlConnection connection = null;


        public DBConnection()
        {
            string connectionString = "Server=.\\SQLExpress;AttachDbFilename=D:\\לימודים\\הנדסת תוכנה\\שנה ג\\סמסטר ה\\הנדסת תוכנה\\STT\\Code\\JceDB.mdf;Database=JceDB; Trusted_Connection=Yes;";
            //string connectionString = "Server=.\\SQLExpress;AttachDbFilename=..//..//..//JceDB.mdf;Database=JceDB; Trusted_Connection=Yes;";
            
            //try
            //{
                connection = new SqlConnection(connectionString);
                connection.Open();
            /*}
            catch (Exception ex)
            {
                if (connection != null)
                {
                    connection.Dispose();
                }
            }*/
        }

        public SqlDataReader queryExexute(string sql)
        {
            SqlCommand sqlline = new SqlCommand(sql, connection);
            return sqlline.ExecuteReader();
        }
    }
}