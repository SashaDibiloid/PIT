﻿using System;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace KP.Manager_Folder
{
    /// <summary>
    /// Логика взаимодействия для Manager_Orders_Page.xaml
    /// </summary>
    public partial class Manager_Orders_Page : Page
    {
        public Manager_Orders_Page()
        {
            InitializeComponent();
            DGrid_Clients.ItemsSource = PITEntities.GetContext().Order.ToList();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("ТЫ НЕ ИМЕЕШЬ ПРАВА ДОН прав");
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("ТЫ НЕ ИМЕЕШЬ ПРАВА ДОН  прав");
        }
    }
}
