using ClientEmailAPI.Data.IRepository;
using ClientEmailAPI.Data.Models;
using System;
using ClientEmailAPI.Data.Contracts;
using ClientEmailAPI.Data.Helpers; 
using ClientEmailAPI.Data.Repository;

namespace ClientEmailAPI.Data
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly ClientDbContext DbContext = new ClientDbContext();

        private IRepositoryProvider RepositoryProvider { get; }

        public UnitOfWork(IRepositoryProvider repositoryProvider)
        {
            repositoryProvider.DbContext = DbContext;
            RepositoryProvider = repositoryProvider;
        }

        #region Repository definition 
        public IMobileRepository IMobile { get { return GetEntityRepository<IMobileRepository>(); } }

        public IWebRepository IWeb { get { return GetEntityRepository<IWebRepository>(); } }

        #endregion

        public void Commit()
        {
            DbContext.SaveChangesAsync();
        }

        private IRepository<T> GetStandardRepository<T>() where T : class
        {
            return RepositoryProvider.GetRepositoryForEntityType<T>();
        }

        private T GetEntityRepository<T>() where T : class
        {
            return RepositoryProvider.GetRepository<T>();
        }

        #region IDisposable

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (DbContext != null)
                {
                    DbContext.Dispose();
                }
            }
        }

        #endregion
    }
}

