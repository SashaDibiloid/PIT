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

namespace KP
{
    /// <summary>
    /// Логика взаимодействия для Authorization.xaml
    /// </summary>
    public partial class Authorization : Window
    {
        public Authorization()
        {
            InitializeComponent();
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Manager ManagerWindow = new Manager();
            Administrator AdministratorWindow = new Administrator();

            string login = Login.Text.ToLower();
            string password = Password.Password;

            if (login == "manager" && password == "managermanager")
            {
                this.Close();
                ManagerWindow.Show();
            }
            else if (login == "admin" && password == "adminadmin")
            {
                this.Close();
                AdministratorWindow.Show();
            }
            else
            {
                MessageBox.Show("Повторите попытку позже");
            }
        }

    }
}
