using ClientEmailAPI.Data.IRepository;
using ClientEmailAPI.Data.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks; 
using Microsoft.EntityFrameworkCore.ChangeTracking; 
using System.Net; 
using System.Net.Http.Headers;
using ClientEmailAPI.Data.Repository;

namespace ClientEmailAPI.Data.Repository
{
    public class MobileRepository : EFRepository<TblMobileEmail>, IMobileRepository
    {
        private readonly ClientDbContext Db;
        public MobileRepository(ClientDbContext context) : base(context)
        {
            Db = context;

        }


    }
}
