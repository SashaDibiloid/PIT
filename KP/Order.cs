//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KP
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        public int Order_ID { get; set; }
        public int Client_ID { get; set; }
        public int Product_ID { get; set; }
        public int Employee_ID { get; set; }
        public string Product__Name { get; set; }
        public System.DateTime Data { get; set; }
        public decimal Sum { get; set; }
    
        public virtual Client Client { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual Product Product { get; set; }
    }
}
