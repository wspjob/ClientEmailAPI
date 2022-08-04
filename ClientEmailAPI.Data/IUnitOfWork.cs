using ClientEmailAPI.Data.IRepository;
using System;
using System.Collections.Generic;
using System.Text;
 
using ClientEmailAPI.Data;
 
using ClientEmailAPI.Data.Repository;
namespace ClientEmailAPI.Data
{
    public interface IUnitOfWork
    {
        void Commit();
        IMobileRepository IMobile { get; }
        IWebRepository IWeb { get; }
          
    }
}
