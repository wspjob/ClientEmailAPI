using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using MailKit.Net.Smtp;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using MimeKit;
 

using ClientEmailAPI.Data;
using ClientEmailAPI.Data.Models;
  
using ClientEmailAPI.ViewModel;

namespace ClientEmailAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EmailSetupController : ControllerBase
    {
        ClientDbContext db = new ClientDbContext();
       
        private readonly IUnitOfWork UnitOfWork;
      

        public EmailSetupController(IUnitOfWork _unitOfWork) { this.UnitOfWork = _unitOfWork; }




        [HttpPost]
        [Route("SendLoginMail")]
        public bool SendLoginMail(SendLoginMail sendLoginMail)
        {
            try
            {
                var response = new requeryResponse();
                string subject = "LOGIN";
                var emailsetupcredentials = db.TblWebEmail.ToList().FirstOrDefault();
                //  var mailHelper = new MailHelper2()  ;
                var status = new returnObj();
                if (!string.IsNullOrEmpty(emailsetupcredentials.Password) && !string.IsNullOrEmpty(emailsetupcredentials.Username))
                {

                    string body;
                    string name = sendLoginMail.recipientName;
                    string todayDate = DateTime.Now.ToShortDateString();
                    string currentTime = DateTime.Now.TimeOfDay.ToString();
                    bool ssl = Convert.ToBoolean(emailsetupcredentials.Ssl);
                    using (var client = new SmtpClient())
                    {
                        client.CheckCertificateRevocation = false;
                        client.Connect(emailsetupcredentials.Host, (int)emailsetupcredentials.Port, ssl);
                        //client.Connect(mailHelper._host, mailHelper._port, mailHelper._ssl);
                        client.Authenticate(emailsetupcredentials.Username, emailsetupcredentials.Password);
                        using (var sr = new StreamReader(@"./wwwroot/assets/EmailFiles/LogIn.txt"))
                        {
                            body = sr.ReadToEnd();
                        }
                        body = body.Replace("{0}", name);
                        body = body.Replace("{1}", todayDate.ToString());
                        body = body.Replace("{2}", currentTime);
                        var bodyBuilder = new BodyBuilder
                        {
                            HtmlBody = body//string.Format("{0}", body)

                        };
                        var msg = new MimeMessage
                        {

                            Body = bodyBuilder.ToMessageBody()//new TextPart(TextFormat.Plain) { Text = body }
                        };
                        msg.From.Add(new MailboxAddress(emailsetupcredentials.Fullname, emailsetupcredentials.Username));
                        msg.To.Add(new MailboxAddress(sendLoginMail.To, sendLoginMail.To));
                        msg.Subject = subject;


                        client.Send(msg);
                        //client.Disconnect(true);
                        if (client.IsConnected == true)
                        {
                            return true;
                        }
                        else { return false; }

                    }

                }
                return false;
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }



 

    }
}
