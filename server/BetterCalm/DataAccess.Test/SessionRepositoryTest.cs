﻿using DataAccess.Context;
using DataAccess.Repositories;
using Domain;
using Domain.Exceptions;
using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Text;

namespace DataAccess.Test
{
	public class SessionRepositoryTest
	{
        private DbContext context;
        private DbConnection connection;

        public SessionRepositoryTest()
        {
            this.connection = new SqliteConnection("Filename=:memory:");
            this.context = new BetterCalmContext(
                new DbContextOptionsBuilder<BetterCalmContext>()
                .UseSqlite(connection)
                .Options);
        }

        [TestInitialize]
        public void Setup()
        {
            this.connection.Open();
            this.context.Database.EnsureCreated();
        }

        [TestCleanup]
        public void TestCleanup()
        {
            this.context.Database.EnsureDeleted();
        }

        [TestMethod]
        public void GetOk()
		{
            Session expectedSession = new Session()
            {
                Id = 1,
                EMail = "a@a.com",
                Token = "B75928B9 - 601A - 438C - 9B0F - C14E56A7BBD4"
            };

            this.context.Add(expectedSession);
            this.context.SaveChanges();

            SessionRepository repository = new SessionRepository(this.context);

            Session obtainedSession = repository.Get(expectedSession.EMail);

            Assert.AreEqual(expectedSession, obtainedSession);
		}

        [TestMethod]
        [ExpectedException(typeof(NotFoundException))]
        public void GetNotFound()
		{
            string expectedSessionEMail = "a@a.com";
            SessionRepository repository = new SessionRepository(this.context);

            Session obtainedSession = repository.Get(expectedSessionEMail);

            Assert.IsNull(obtainedSession);
        }
    }
}
