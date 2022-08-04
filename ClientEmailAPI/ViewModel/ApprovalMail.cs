using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClientEmailAPI.ViewModel
{ 
    public class ApprovalMail
    {
        public string To { get; set; }
        public string recipientName { get; set; }
        public decimal ApprovingAmount { get; set; }
        public string approvingName { get; set; }
    }
}
