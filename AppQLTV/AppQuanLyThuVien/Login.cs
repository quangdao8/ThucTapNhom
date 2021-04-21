using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using AppQuanLyThuVien.KetNoi;

namespace AppQuanLyThuVien
{
    public partial class Login : Form
    {
        DataBaseThuVien dt = new DataBaseThuVien();
       
        public Login()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            DialogResult thongbao;
            thongbao = MessageBox.Show("Bạn muốn thoát?", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
            if(thongbao == DialogResult.OK)
            {
                Application.Exit();
            }
            else
            {
                this.Show();
            }
        }
        private void KiemTraDangNhap()
        {
            if(txb_TenDangNhap.Text.Length == 0 & txb_MatKhau.Text.Length == 0)
            {
                MessageBox.Show("Bạn chưa nhập đủ thông tin !!!");
            }
            else
            {
                try
                {
                    if(cbx_LoaiUser.Text == "Quản Trị Viên")
                    {
                        
                        SqlConnection connect = new SqlConnection(ConnectionString.str);
                        connect.Open();
                        string tr = "SELECT * FROM Account WHERE Users = '" + txb_TenDangNhap.Text + "' and  pass = '" + txb_MatKhau.Text + "'";
                        var cmd = new SqlCommand(tr, connect);
                        SqlDataReader dt = cmd.ExecuteReader();
                        if (dt.Read() == true)
                        {
                            MessageBox.Show("Chào mừng Quản Trị Viên");
                            QuanLy ql = new QuanLy();
                            this.Hide();
                            ql.ShowDialog();
                            this.Show();

                        }
                        else
                        {
                            MessageBox.Show("Đăng nhập thất bại");
                        }
                        connect.Close();

                    }
                    else if(cbx_LoaiUser.Text == "Thủ Thư")
                    {
                        SqlConnection connect = new SqlConnection(ConnectionString.str);
                        connect.Open();
                        string tr = "SELECT * FROM Account WHERE Users = '" + txb_TenDangNhap.Text + "' and  pass = '" + txb_MatKhau.Text + "'";
                        var cmd = new SqlCommand(tr, connect);
                        SqlDataReader dt = cmd.ExecuteReader();
                        if (dt.Read() == true)
                        {
                            MessageBox.Show("Đăng nhập thành công");
                            Menu me = new Menu();
                            this.Hide();
                            me.ShowDialog();

                        }
                        else
                        {
                            MessageBox.Show("Đăng nhập thất bại");
                        }
                        connect.Close();
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Lỗi kết nối : " + ex.Message);
                }
            }
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {

            KiemTraDangNhap();
            if (cbox_NhoMatKhau.Checked)
            {
                //Properties.Settings.Default.Users = txb_TenDangNhap.Text;
            }
           
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
          
        }

        private void Login_Load(object sender, EventArgs e)
        {

        }
    }
}
