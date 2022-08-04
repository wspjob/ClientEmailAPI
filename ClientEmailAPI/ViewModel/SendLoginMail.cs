using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClientEmailAPI.ViewModel
{ 
    public class SendLoginMail
    {
        public string To { get; set; }
        public string recipientName { get; set; }
   
    }

    public class requeryResponse
    {
        public string responseCode { get; set; }
        public decimal? trnAmount { get; set; }
        public DateTime? valueDate { get; set; }
        public string webRequestStatus { get; set; }
        public DateTime? webRequestDate { get; set; }

    };

    public class returnObj
    {
        public string responseCode { get; set; }
        public string responseMessage { get; set; }
    };
}
