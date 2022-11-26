using QLQUANCF.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QLQUANCF
{
    public partial class fAdmin : Form
    {
        public fAdmin()
        {
            InitializeComponent();
            // LoadAccountList();
            //dtgvAccount.DataSource = DataProvider.Instance.ExecuteQuery("EXEC USP_GetAccountByUserName @userName", new object[] { "'' OR 1=1--" });// sử dụng STORED PROC sẽ không bị lỗi SQL injection
            dtgvAccount.DataSource = DataProvider.Instance.ExecuteQuery("SELECT * FROM dbo.Account WHERE UserName= N'' OR 1=1--");//sử dụng select bình thường sẽ bị SQL injection
        }

        private void tcAdmin_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void account_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void panel4_Paint(object sender, PaintEventArgs e)
        {

        }

        private void fAdmin_Load(object sender, EventArgs e)
        {

        }

        private void dataGridView3_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void label12_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {

        }

        /*
        void LoadAccountList()
        {
            //string connectionSTR = "Data Source=.\\SQLEXPRESS;Initial Catalog=QuanLyQuanCafe;Integrated Security=True";

            //string query = "SELECT DisplayName as [Tên Hiển Thị] FROM dbo.Account";

            //string query = "EXEC USP_GetAccountByUserName @userName=N'K9'";

            //sau khi truyền parameter c1
            //string query = "EXEC USP_GetAccountByUserName @userName";
            //c2
            string query = "EXEC USP_GetAccountByUserName @userName ";

            //DataProvider provider = new DataProvider();

            //truyền parameter vào là "K9"c1
            //dtgvAccount.DataSource = provider.ExecuteQuery(query,"K9");
            //c2
            //dtgvAccount.DataSource = provider.ExecuteQuery(query,new object[] { "staff"} );

            dtgvAccount.DataSource = DataProvider.Instance.ExecuteQuery(query, new object[] { "staff" });

        }

        void LoadFoodList()
        {
            string query = "select * from food";
            dtgvFood.DataSource = DataProvider.Instance.ExecuteQuery(query);
        }
        */

        private void dtgvAccount_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
