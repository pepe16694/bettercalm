﻿using DataAccessInterfaces;
using Domain;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;

namespace DataAccess.Repositories
{
    public class IllnessRepository : IIllnessRepository
    {
        private DbContext context;
        private DbSet<Illness> illnesses;

        public IllnessRepository(DbContext context)
        {
            this.context = context;
            this.illnesses = context.Set<Illness>();
        }

        public Illness Get(int id)
        {
            throw new System.NotImplementedException();
        }

        public IEnumerable<Illness> GetAll()
        {
            return this.illnesses;
        }
    }
}
