using ClientEmailAPI.Data.IRepository;
using ClientEmailAPI.Data.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ClientEmailAPI.Data.Repository;

namespace ClientEmailAPI.Data.Repository
{
    public class WebRepository   : EFRepository<TblWebEmail>, IWebRepository
    { 
        private readonly ClientDbContext Db;
        public WebRepository(ClientDbContext context) : base(context)
        {
            Db = context;

        }



    }
}
