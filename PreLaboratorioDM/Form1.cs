using static System.Runtime.InteropServices.JavaScript.JSType;

namespace PreLaboratorioDM
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        string usuario, contraseña;

        private void button1_Click(object sender, EventArgs e)
        {
            usuario = textBox1.Text;
            contraseña = textBox2.Text;

            Form2 v1 = new Form2();
            if (textBox1.Text == usuario & textBox2.Text == contraseña)
            {
                this.Hide();
                v1.Show();

            }

        }
    }
}
