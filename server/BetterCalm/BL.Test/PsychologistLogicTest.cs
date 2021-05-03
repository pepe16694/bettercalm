﻿using DataAccessInterfaces;
using Domain;
using Domain.Exceptions;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BL.Test
{
    [TestClass]
    public class PsychologistLogicTest
    {
        [TestMethod]
        public void GetAllOk()
        {
            List<Psychologist> expectedPsychologists = GetAllExpectedPsychologists();

            Mock<IPsychologistRepository> psychologistRepositoryMock = new Mock<IPsychologistRepository>(MockBehavior.Strict);
            psychologistRepositoryMock.Setup(m => m.GetAll()).Returns(expectedPsychologists);

            PsychologistLogic psychologistLogic = new PsychologistLogic(psychologistRepositoryMock.Object, It.IsAny<IIllnessRepository>());

            IEnumerable<Psychologist> obtainedPsychologists = psychologistLogic.GetAll();

            Assert.IsTrue(expectedPsychologists.SequenceEqual(obtainedPsychologists));
        }

        [TestMethod]
        [ExpectedException(typeof(CollectionEmptyException))]
        public void GetAllNoPsychologists()
        {
            Mock<IPsychologistRepository> psychologistRepositoryMock = new Mock<IPsychologistRepository>(MockBehavior.Strict);
            psychologistRepositoryMock.Setup(m => m.GetAll()).Throws(new CollectionEmptyException("Psychologists"));
            PsychologistLogic psychologistLogic = new PsychologistLogic(psychologistRepositoryMock.Object, It.IsAny<IIllnessRepository>());
            IEnumerable<Psychologist> obtainedPsychologists = psychologistLogic.GetAll();
            Assert.IsNull(obtainedPsychologists);
        }

        private List<Psychologist> GetAllExpectedPsychologists()
        {
            Psychologist firstPsychologist = new Psychologist()
            {
                Id = 1,
                FirstName = "Juan",
                LastName = "Sartori",
                Address = "Calle 1234",
                Format = Format.OnSite,
                CreatedDate = DateTime.Today.AddMonths(-3)
            };

            Psychologist secondPsychologist = new Psychologist()
            {
                Id = 2,
                FirstName = "Hannibal",
                LastName = "Lecter",
                Address = "14th Street",
                Format = Format.Remote,
                CreatedDate = DateTime.Today.AddMonths(-3)
            };
            List<Psychologist> expectedPsychologists = new List<Psychologist>() { firstPsychologist, secondPsychologist };
            return expectedPsychologists;
        }

        [TestMethod]
        public void GetOk()
        {
            Psychologist expectedPsychologist = new Psychologist()
            {
                Id = 1,
                FirstName = "Juan",
                LastName = "Sartori",
                Address = "Calle 1234",
                Format = Format.OnSite,
                CreatedDate = DateTime.Today.AddMonths(-3)
            };

            Mock<IPsychologistRepository> psychologistRepositoryMock = new Mock<IPsychologistRepository>(MockBehavior.Strict);
            psychologistRepositoryMock.Setup(m => m.Get(expectedPsychologist.Id)).Returns(expectedPsychologist);

            PsychologistLogic psychologistLogic = new PsychologistLogic(psychologistRepositoryMock.Object, It.IsAny<IIllnessRepository>());

            Psychologist obtainedPsychologist = psychologistLogic.Get(expectedPsychologist.Id);

            Assert.AreEqual(expectedPsychologist, obtainedPsychologist);
        }

        [TestMethod]
        [ExpectedException(typeof(NotFoundException))]
        public void GetNotFound()
        {
            Psychologist expectedPsychologist = new Psychologist()
            {
                Id = 1,
                FirstName = "Juan",
                LastName = "Sartori",
                Address = "Calle 1234",
                Format = Format.OnSite,
                CreatedDate = DateTime.Today.AddMonths(-3)
            };

            Mock<IPsychologistRepository> psychologistRepositoryMock = new Mock<IPsychologistRepository>(MockBehavior.Strict);
            psychologistRepositoryMock.Setup(m => m.Get(expectedPsychologist.Id)).Throws(new NotFoundException(expectedPsychologist.Id.ToString()));

            PsychologistLogic psychologistLogic = new PsychologistLogic(psychologistRepositoryMock.Object, It.IsAny<IIllnessRepository>());

            Psychologist obtainedPsychologist = psychologistLogic.Get(expectedPsychologist.Id);

            Assert.IsNull(obtainedPsychologist);
        }

        [TestMethod]
        public void AddOk()
        {
            Illness stress = new Illness { Id = 1, Name = "Stress" };
            Illness depression = new Illness { Id = 2, Name = "Depression" };
            Psychologist expectedPsychologist = new Psychologist()
            {
                Id = 1,
                FirstName = "Juan",
                LastName = "Sartori",
                Address = "Calle 1234",
                Format = Format.OnSite,
                Illnesses = new List<Illness>(){ stress, depression },
                CreatedDate = DateTime.Today.AddMonths(-3)
            };

            Mock<IPsychologistRepository> psychologistRepositoryMock = new Mock<IPsychologistRepository>(MockBehavior.Strict);
            psychologistRepositoryMock.Setup(m => m.Add(expectedPsychologist));
            psychologistRepositoryMock.Setup(m => m.Get(expectedPsychologist.Id)).Returns(expectedPsychologist);

            Mock<IIllnessRepository> illnessRepositoryMock = new Mock<IIllnessRepository>(MockBehavior.Strict);
            illnessRepositoryMock.Setup(m => m.Get(stress.Id)).Returns(stress);
            illnessRepositoryMock.Setup(m => m.Get(depression.Id)).Returns(depression);

            PsychologistLogic psychologistLogic = new PsychologistLogic(psychologistRepositoryMock.Object, illnessRepositoryMock.Object);
            psychologistLogic.Add(expectedPsychologist);

            Psychologist obtainedPsychologist = psychologistLogic.Get(expectedPsychologist.Id);

            Assert.AreEqual(expectedPsychologist, obtainedPsychologist);
        }

        [TestMethod]
        public void AddWithNoIllnessesOk()
        {
            Illness stress = new Illness { Id = 1, Name = "Stress" };
            Illness depression = new Illness { Id = 2, Name = "Depression" };
            Psychologist expectedPsychologist = new Psychologist()
            {
                Id = 1,
                FirstName = "Juan",
                LastName = "Sartori",
                Address = "Calle 1234",
                Format = Format.OnSite,
                CreatedDate = DateTime.Today.AddMonths(-3)
            };

            Mock<IPsychologistRepository> psychologistRepositoryMock = new Mock<IPsychologistRepository>(MockBehavior.Strict);
            psychologistRepositoryMock.Setup(m => m.Add(expectedPsychologist));
            psychologistRepositoryMock.Setup(m => m.Get(expectedPsychologist.Id)).Returns(expectedPsychologist);

            Mock<IIllnessRepository> illnessRepositoryMock = new Mock<IIllnessRepository>(MockBehavior.Strict);
            illnessRepositoryMock.Setup(m => m.Get(stress.Id)).Returns(stress);
            illnessRepositoryMock.Setup(m => m.Get(depression.Id)).Returns(depression);

            PsychologistLogic psychologistLogic = new PsychologistLogic(psychologistRepositoryMock.Object, illnessRepositoryMock.Object);
            psychologistLogic.Add(expectedPsychologist);

            Psychologist obtainedPsychologist = psychologistLogic.Get(expectedPsychologist.Id);

            Assert.AreEqual(expectedPsychologist, obtainedPsychologist);
        }

        [TestMethod]
        [ExpectedException(typeof(AlreadyExistsException))]
        public void AddAlreadyExists()
        {
            Illness stress = new Illness { Id = 1, Name = "Stress" };
            Illness depression = new Illness { Id = 2, Name = "Depression" };
            Psychologist expectedPsychologist = new Psychologist()
            {
                Id = 1,
                FirstName = "Juan",
                LastName = "Sartori",
                Address = "Calle 1234",
                Format = Format.OnSite,
                Illnesses = new List<Illness>() { stress, depression },
                CreatedDate = DateTime.Today.AddMonths(-3)
            };

            Mock<IPsychologistRepository> psychologistRepositoryMock = new Mock<IPsychologistRepository>(MockBehavior.Strict);
            psychologistRepositoryMock.Setup(m => m.Add(expectedPsychologist)).Throws(new AlreadyExistsException(expectedPsychologist.Id.ToString()));
            psychologistRepositoryMock.Setup(m => m.Get(expectedPsychologist.Id)).Returns(expectedPsychologist);

            Mock<IIllnessRepository> illnessRepositoryMock = new Mock<IIllnessRepository>(MockBehavior.Strict);
            illnessRepositoryMock.Setup(m => m.Get(stress.Id)).Returns(stress);
            illnessRepositoryMock.Setup(m => m.Get(depression.Id)).Returns(depression);

            PsychologistLogic psychologistLogic = new PsychologistLogic(psychologistRepositoryMock.Object, illnessRepositoryMock.Object);
            psychologistLogic.Add(expectedPsychologist);

            Psychologist obtainedPsychologist = psychologistLogic.Get(expectedPsychologist.Id);

            Assert.AreEqual(expectedPsychologist, obtainedPsychologist);
        }

        [TestMethod]
        [ExpectedException(typeof(NotFoundException))]
        public void AddWithNonExistingIllnessFails()
        {
            Illness stress = new Illness { Id = 1, Name = "Stress" };
            Psychologist expectedPsychologist = new Psychologist()
            {
                Id = 1,
                FirstName = "Juan",
                LastName = "Sartori",
                Address = "Calle 1234",
                Format = Format.OnSite,
                Illnesses = new List<Illness>() { stress },
                CreatedDate = DateTime.Today.AddMonths(-3)
            };

            Mock<IPsychologistRepository> psychologistRepositoryMock = new Mock<IPsychologistRepository>(MockBehavior.Strict);
            psychologistRepositoryMock.Setup(m => m.Add(expectedPsychologist));
            psychologistRepositoryMock.Setup(m => m.Get(expectedPsychologist.Id)).Returns(expectedPsychologist);

            Mock<IIllnessRepository> illnessRepositoryMock = new Mock<IIllnessRepository>(MockBehavior.Strict);
            illnessRepositoryMock.Setup(m => m.Get(stress.Id)).Throws(new NotFoundException(stress.Id.ToString()));

            PsychologistLogic psychologistLogic = new PsychologistLogic(psychologistRepositoryMock.Object, illnessRepositoryMock.Object);
            psychologistLogic.Add(expectedPsychologist);

            Psychologist obtainedPsychologist = psychologistLogic.Get(expectedPsychologist.Id);

            Assert.IsNull(obtainedPsychologist);
        }

        [TestMethod]
        [ExpectedException(typeof(ExceedingNumberOfIllnessesException))]
        public void AddWithMoreThanThreeIllnessesFails()
        {
            Illness stress = new Illness { Id = 1, Name = "Stress" };
            Illness depression = new Illness { Id = 2, Name = "Depression" };
            Illness anxiety = new Illness { Id = 2, Name = "Anxiety" };
            Illness rage = new Illness { Id = 2, Name = "Rage" };
            Psychologist expectedPsychologist = new Psychologist()
            {
                Id = 1,
                FirstName = "Juan",
                LastName = "Sartori",
                Address = "Calle 1234",
                Format = Format.OnSite,
                Illnesses = new List<Illness>() { stress, depression, anxiety, rage },
                CreatedDate = DateTime.Today.AddMonths(-3)
            };

            Mock<IPsychologistRepository> psychologistRepositoryMock = new Mock<IPsychologistRepository>(MockBehavior.Strict);
            psychologistRepositoryMock.Setup(m => m.Add(expectedPsychologist));
            psychologistRepositoryMock.Setup(m => m.Get(expectedPsychologist.Id)).Returns(expectedPsychologist);

            Mock<IIllnessRepository> illnessRepositoryMock = new Mock<IIllnessRepository>(MockBehavior.Strict);
            illnessRepositoryMock.Setup(m => m.Get(stress.Id)).Returns(stress);
            illnessRepositoryMock.Setup(m => m.Get(depression.Id)).Returns(depression);

            PsychologistLogic psychologistLogic = new PsychologistLogic(psychologistRepositoryMock.Object, illnessRepositoryMock.Object);
            psychologistLogic.Add(expectedPsychologist);

            Psychologist obtainedPsychologist = psychologistLogic.Get(expectedPsychologist.Id);

            Assert.IsNull(obtainedPsychologist);
        }

        [TestMethod]
        public void UpdateOk()
        {
            Illness stress = new Illness { Id = 1, Name = "Stress" };
            Illness depression = new Illness { Id = 2, Name = "Depression" };
            Psychologist originalPsychologist = new Psychologist()
            {
                Id = 1,
                FirstName = "Juan",
                LastName = "Sartori",
                Address = "Calle 1234",
                Format = Format.OnSite,
                Illnesses = new List<Illness>() { stress, depression },
                CreatedDate = DateTime.Today.AddMonths(-3)
            };

            Psychologist newPsychologist = new Psychologist()
            {
                Id = 1,
                FirstName = "Orestes",
                LastName = "Fiandra",
                Address = "General Paz 1234",
                Format = Format.Remote,
                Illnesses = new List<Illness>() { stress },
                CreatedDate = DateTime.Today.AddMonths(-2)
            };

            Mock<IPsychologistRepository> psychologistRepositoryMock = new Mock<IPsychologistRepository>(MockBehavior.Strict);
            psychologistRepositoryMock.Setup(m => m.Update(It.IsAny<Psychologist>()));
            psychologistRepositoryMock.Setup(m => m.Get(originalPsychologist.Id)).Returns(newPsychologist);

            Mock<IIllnessRepository> illnessRepositoryMock = new Mock<IIllnessRepository>(MockBehavior.Strict);
            illnessRepositoryMock.Setup(m => m.Get(stress.Id)).Returns(stress);
            illnessRepositoryMock.Setup(m => m.Get(depression.Id)).Returns(depression);

            PsychologistLogic psychologistLogic = new PsychologistLogic(psychologistRepositoryMock.Object, illnessRepositoryMock.Object);
            psychologistLogic.Update(originalPsychologist);

            Psychologist obtainedPsychologist = psychologistLogic.Get(originalPsychologist.Id);

            Assert.AreEqual(newPsychologist, obtainedPsychologist);
        }

        [TestMethod]
        [ExpectedException(typeof(NotFoundException))]
        public void DeleteOk()
        {
            Psychologist psychologistToDelete = new Psychologist()
            {
                Id = 1,
                FirstName = "Juan",
                LastName = "Sartori",
                Address = "Calle 1234",
                Format = Format.OnSite,
                CreatedDate = DateTime.Today.AddMonths(-3)
            };

            Mock<IPsychologistRepository> psychologistRepositoryMock = new Mock<IPsychologistRepository>(MockBehavior.Strict);
            psychologistRepositoryMock.Setup(m => m.Delete(psychologistToDelete.Id));
            psychologistRepositoryMock.Setup(m => m.Get(psychologistToDelete.Id)).Returns(psychologistToDelete);

            PsychologistLogic psychologistLogic = new PsychologistLogic(psychologistRepositoryMock.Object, It.IsAny<IIllnessRepository>());
            psychologistLogic.Delete(psychologistToDelete.Id);

            psychologistRepositoryMock.Setup(m => m.Get(psychologistToDelete.Id)).Throws(new NotFoundException(psychologistToDelete.Id.ToString()));
            Psychologist obtainedPsychologist = psychologistLogic.Get(psychologistToDelete.Id);

            Assert.IsNull(obtainedPsychologist);
        }
    }
}
