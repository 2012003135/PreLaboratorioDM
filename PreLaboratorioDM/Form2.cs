using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PreLaboratorioDM
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void textBox7_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            dataGridView1.Rows.Add(textBox1.Text, textBox2.Text, textBox3.Text, textBox4.Text, textBox5.Text, textBox6.Text, textBox7.Text, textBox8.Text, textBox9.Text, textBox10.Text, textBox11.Text);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            DataGridViewRow Datos = dataGridView1.SelectedRows[0];
            Datos.Cells[0].Value = textBox1.Text;
            Datos.Cells[1].Value = textBox2.Text;
            Datos.Cells[2].Value = textBox3.Text;
            Datos.Cells[3].Value = textBox4.Text;
            Datos.Cells[4].Value = textBox5.Text;
            Datos.Cells[5].Value = textBox6.Text;
            Datos.Cells[6].Value = textBox7.Text;
            Datos.Cells[7].Value = textBox8.Text;
            Datos.Cells[8].Value = textBox9.Text;
            Datos.Cells[9].Value = textBox10.Text;
            Datos.Cells[10].Value = textBox11.Text;
        
        }

        private void button3_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                DialogResult confirm = MessageBox.Show("Quieres Eliminar esta Fila", "Eliminar", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                if (confirm == DialogResult.Yes)
                {
                    dataGridView1.Rows.RemoveAt(dataGridView1.SelectedRows[0].Index);
                }
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Form3 v1 = new Form3();
            this.Hide();
            v1.Show();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            dataGridView1.MultiSelect = false;
        }
    }
}
