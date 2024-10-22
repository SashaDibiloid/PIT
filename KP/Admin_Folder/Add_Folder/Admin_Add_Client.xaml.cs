using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace KP.Admin_Folder.Add_Folder
{
    /// <summary>
    /// Логика взаимодействия для Admin_Add_Client.xaml
    /// </summary>
    public partial class Admin_Add_Client : Window
    {
        private Client _currentClient = new Client();

        public Admin_Add_Client()
        {
            InitializeComponent();
            DataContext = _currentClient;

        }

        private void Button_Click(object sender, object e)
        {
            StringBuilder errors = new StringBuilder();

            if (string.IsNullOrWhiteSpace(_currentClient.Full_Name))
                errors.AppendLine("Укажите имя клиента");
            if (string.IsNullOrWhiteSpace(_currentClient.Email))
                errors.AppendLine("Укажите почту клиента");


            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            if (_currentClient.Client_ID == 0)
                PITEntities.GetContext().Client.Add(_currentClient);

            try
            {
                PITEntities.GetContext().SaveChanges();
                MessageBox.Show("Клиент добавлен");
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
