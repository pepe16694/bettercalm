using DataAccessInterfaces;
using Domain;
using Domain.Exceptions;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;
using System;

namespace BL.Test
{
    [TestClass]
	public class AppointmentLogicTest
	{
		[TestMethod]
		public void CreateAppointment_PatientExistsFormatOnSite_AppointmentCreated()
		{
			Patient patient = new Patient()
			{
				BirthDate = new DateTime(1993, 11, 15),
				Email = "patient@gmail.com",
				FirstName = "Patient",
				LastName = "Perez",
				Id = 1,
				Phone = "091569874"
			};

			Illness illness = new Illness()
			{
				Id = 1,
				Name = "Depresion"
			};

			Psychologist psychologist = new Psychologist()
			{
				Id = 1,
				FirstName = "Juan",
				LastName = "Sartori",
				Address = "Calle 1234",
				Format = Format.OnSite,
				CreatedDate = DateTime.Today.AddMonths(-3),
				Rate = new PsychologistRate() { Id = 1, HourlyRate = 1000 }
			};

			AppointmentDuration appointmentDuration = new AppointmentDuration(){
				Id = 1,
				Duration = new TimeSpan(1, 0, 0)
			};

			Appointment newAppointment = new Appointment()
			{
				Illness = illness,
				Patient = patient,
				Duration = appointmentDuration
			};


			Mock<IPatientRepository> mockPatient = new Mock<IPatientRepository>(MockBehavior.Strict);
			mockPatient.Setup(m => m.Get(patient.Email)).Returns(patient);

			Mock<IIllnessRepository> mockIllness = new Mock<IIllnessRepository>(MockBehavior.Strict);
			mockIllness.Setup(m => m.Get(illness.Id)).Returns(illness);

			Mock<IPsychologistRepository> mockPsychologist = new Mock<IPsychologistRepository>(MockBehavior.Strict);
			mockPsychologist.Setup(m => m.Get(illness, It.IsAny<DateTime>(), 5)).Returns(psychologist);
			mockPsychologist.Setup(m => m.Update(psychologist));

			Mock<IAppointmentDurationRepository> mockDuration = new Mock<IAppointmentDurationRepository>(MockBehavior.Strict);
			mockDuration.Setup(m => m.Get(appointmentDuration.Duration)).Returns(appointmentDuration);

			AppointmentLogic appointmentLogic = new AppointmentLogic(mockPsychologist.Object, mockIllness.Object, mockPatient.Object, mockDuration.Object);
			Appointment appointment = appointmentLogic.CreateAppointment(newAppointment);

			mockIllness.VerifyAll();
			mockPatient.VerifyAll();
			mockPsychologist.VerifyAll();

			Assert.IsTrue(appointment.Address.Equals(psychologist.Address) &&
				appointment.Psychologist.Equals(psychologist));
		}

		[TestMethod]
		public void CreateAppointment_PatientExistsFormatRemote_AppointmentCreated()
		{
			Patient patient = new Patient()
			{
				BirthDate = new DateTime(1993, 11, 15),
				Email = "patient@gmail.com",
				FirstName = "Patient",
				LastName = "Perez",
				Id = 1,
				Phone = "091569874"
			};

			Illness illness = new Illness()
			{
				Id = 1,
				Name = "Depresion"
			};

			Psychologist psychologist = new Psychologist()
			{
				Id = 1,
				FirstName = "Juan",
				LastName = "Sartori",
				Address = "Calle 1234",
				Format = Format.Remote,
				CreatedDate = DateTime.Today.AddMonths(-3),
				Rate = new PsychologistRate() { Id = 1, HourlyRate = 1000 }
			};

			AppointmentDuration appointmentDuration = new AppointmentDuration(){
				Id = 1,
				Duration = new TimeSpan(1, 0, 0)
			};

			Appointment newAppointment = new Appointment()
			{
				Illness = illness,
				Patient = patient,
				Duration = appointmentDuration
			};


			Mock<IPatientRepository> mockPatient = new Mock<IPatientRepository>(MockBehavior.Strict);
			mockPatient.Setup(m => m.Get(patient.Email)).Returns(patient);

			Mock<IIllnessRepository> mockIllness = new Mock<IIllnessRepository>(MockBehavior.Strict);
			mockIllness.Setup(m => m.Get(illness.Id)).Returns(illness);

			Mock<IPsychologistRepository> mockPsychologist = new Mock<IPsychologistRepository>(MockBehavior.Strict);
			mockPsychologist.Setup(m => m.Get(illness, It.IsAny<DateTime>(), 5)).Returns(psychologist);
			mockPsychologist.Setup(m => m.Update(psychologist));

			Mock<IAppointmentDurationRepository> mockDuration = new Mock<IAppointmentDurationRepository>(MockBehavior.Strict);
			mockDuration.Setup(m => m.Get(appointmentDuration.Duration)).Returns(appointmentDuration);

			AppointmentLogic appointmentLogic = new AppointmentLogic(mockPsychologist.Object, mockIllness.Object, mockPatient.Object, mockDuration.Object);
			Appointment appointment = appointmentLogic.CreateAppointment(newAppointment);

			mockIllness.VerifyAll();
			mockPatient.VerifyAll();
			mockPsychologist.VerifyAll();

			Assert.IsTrue(!appointment.Address.Equals(psychologist.Address) &&
				appointment.Psychologist.Equals(psychologist));
		}

		[TestMethod]
		public void CreateAppointment_NewPatient_AppointmentCreated()
		{
			Patient patient = new Patient()
			{
				BirthDate = new DateTime(1993, 11, 15),
				Email = "patient@gmail.com",
				FirstName = "Patient",
				LastName = "Perez",
				Id = 1,
				Phone = "091569874"
			};

			Illness illness = new Illness()
			{
				Id = 1,
				Name = "Depresion"
			};

			Psychologist psychologist = new Psychologist()
			{
				Id = 1,
				FirstName = "Juan",
				LastName = "Sartori",
				Address = "Calle 1234",
				Format = Format.Remote,
				CreatedDate = DateTime.Today.AddMonths(-3),
				Rate = new PsychologistRate() { Id = 1, HourlyRate = 1000 }
			};

			AppointmentDuration appointmentDuration = new AppointmentDuration(){
				Id = 1,
				Duration = new TimeSpan(1, 0, 0)
			};

			Appointment newAppointment = new Appointment()
			{
				Illness = illness,
				Patient = patient,
				Duration = appointmentDuration
			};


			Mock<IPatientRepository> mockPatient = new Mock<IPatientRepository>(MockBehavior.Strict);
			mockPatient.Setup(m => m.Get(patient.Email)).Throws(new NotFoundException(patient.Email));
			mockPatient.Setup(m => m.Add(patient));

			Mock<IIllnessRepository> mockIllness = new Mock<IIllnessRepository>(MockBehavior.Strict);
			mockIllness.Setup(m => m.Get(illness.Id)).Returns(illness);

			Mock<IPsychologistRepository> mockPsychologist = new Mock<IPsychologistRepository>(MockBehavior.Strict);
			mockPsychologist.Setup(m => m.Get(illness, It.IsAny<DateTime>(), 5)).Returns(psychologist);
			mockPsychologist.Setup(m => m.Update(psychologist));

			Mock<IAppointmentDurationRepository> mockDuration = new Mock<IAppointmentDurationRepository>(MockBehavior.Strict);
			mockDuration.Setup(m => m.Get(appointmentDuration.Duration)).Returns(appointmentDuration);

			AppointmentLogic appointmentLogic = new AppointmentLogic(mockPsychologist.Object, mockIllness.Object, mockPatient.Object, mockDuration.Object);
			Appointment appointment = appointmentLogic.CreateAppointment(newAppointment);

			mockIllness.VerifyAll();
			mockPatient.VerifyAll();
			mockPsychologist.VerifyAll();

			Assert.IsTrue(!appointment.Address.Equals(psychologist.Address) &&
				appointment.Psychologist.Equals(psychologist));
		}

		[TestMethod]
		[ExpectedException(typeof(NotFoundException))]
		public void CreateAppointment_IllnessNotFound_ExceptionThrown()
		{
			Patient patient = new Patient()
			{
				BirthDate = new DateTime(1993, 11, 15),
				Email = "patient@gmail.com",
				FirstName = "Patient",
				LastName = "Perez",
				Id = 1,
				Phone = "091569874"
			};

			Illness illness = new Illness()
			{
				Id = 1,
				Name = "Depresion"
			};

			Psychologist psychologist = new Psychologist()
			{
				Id = 1,
				FirstName = "Juan",
				LastName = "Sartori",
				Address = "Calle 1234",
				Format = Format.Remote,
				CreatedDate = DateTime.Today.AddMonths(-3),
				Rate = new PsychologistRate() { Id = 1, HourlyRate = 1000 }
			};

			AppointmentDuration appointmentDuration = new AppointmentDuration(){
				Id = 1,
				Duration = new TimeSpan(1, 0, 0)
			};

			Appointment newAppointment = new Appointment()
			{
				Illness = illness,
				Patient = patient,
				Duration = appointmentDuration
			};

			Mock<IPatientRepository> mockPatient = new Mock<IPatientRepository>(MockBehavior.Strict);
			mockPatient.Setup(m => m.Get(patient.Email)).Returns(patient);

			Mock<IIllnessRepository> mockIllness = new Mock<IIllnessRepository>(MockBehavior.Strict);
			mockIllness.Setup(m => m.Get(illness.Id)).Throws(new NotFoundException(illness.Id.ToString()));

			Mock<IPsychologistRepository> mockPsychologist = new Mock<IPsychologistRepository>(MockBehavior.Strict);
			mockPsychologist.Setup(m => m.Get(illness, It.IsAny<DateTime>(), 5)).Returns(psychologist);
			mockPsychologist.Setup(m => m.Update(psychologist));

			Mock<IAppointmentDurationRepository> mockDuration = new Mock<IAppointmentDurationRepository>(MockBehavior.Strict);
			mockDuration.Setup(m => m.Get(appointmentDuration.Duration)).Returns(appointmentDuration);

			AppointmentLogic appointmentLogic = new AppointmentLogic(mockPsychologist.Object, mockIllness.Object, mockPatient.Object, mockDuration.Object);
			Appointment appointment = appointmentLogic.CreateAppointment(newAppointment);

			mockIllness.VerifyAll();
			mockPatient.VerifyAll();
			mockPsychologist.VerifyAll();

			Assert.IsNull(appointment);
		}

		[TestMethod]
		[ExpectedException(typeof(CollectionEmptyException))]
		public void CreateAppointment_NoPsychologistsExist_ExceptionThrown()
		{
			Patient patient = new Patient()
			{
				BirthDate = new DateTime(1993, 11, 15),
				Email = "patient@gmail.com",
				FirstName = "Patient",
				LastName = "Perez",
				Id = 1,
				Phone = "091569874"
			};

			Illness illness = new Illness()
			{
				Id = 1,
				Name = "Depresion"
			};

			Psychologist psychologist = new Psychologist()
			{
				Id = 1,
				FirstName = "Juan",
				LastName = "Sartori",
				Address = "Calle 1234",
				Format = Format.Remote,
				CreatedDate = DateTime.Today.AddMonths(-3),
				Rate = new PsychologistRate() { Id = 1, HourlyRate = 1000 }
			};

			AppointmentDuration appointmentDuration = new AppointmentDuration(){
				Id = 1,
				Duration = new TimeSpan(1, 0, 0)
			};

			Appointment newAppointment = new Appointment()
			{
				Illness = illness,
				Patient = patient,
				Duration = appointmentDuration
			};


			Mock<IPatientRepository> mockPatient = new Mock<IPatientRepository>(MockBehavior.Strict);
			mockPatient.Setup(m => m.Get(patient.Email)).Returns(patient);
			mockPatient.Setup(m => m.Add(patient));

			Mock<IIllnessRepository> mockIllness = new Mock<IIllnessRepository>(MockBehavior.Strict);
			mockIllness.Setup(m => m.Get(illness.Id)).Returns(illness);

			Mock<IPsychologistRepository> mockPsychologist = new Mock<IPsychologistRepository>(MockBehavior.Strict);
			mockPsychologist.Setup(m => m.Get(illness, It.IsAny<DateTime>(), 5)).Throws(new CollectionEmptyException("Psychologists"));
			mockPsychologist.Setup(m => m.Update(psychologist));

			Mock<IAppointmentDurationRepository> mockDuration = new Mock<IAppointmentDurationRepository>(MockBehavior.Strict);
			mockDuration.Setup(m => m.Get(appointmentDuration.Duration)).Returns(appointmentDuration);

			AppointmentLogic appointmentLogic = new AppointmentLogic(mockPsychologist.Object, mockIllness.Object, mockPatient.Object, mockDuration.Object);
			Appointment appointment = appointmentLogic.CreateAppointment(newAppointment);

			mockIllness.VerifyAll();
			mockPatient.VerifyAll();
			mockPsychologist.VerifyAll();

			Assert.IsNull(appointment);
		}

		[TestMethod]
		[ExpectedException(typeof(CollectionEmptyException))]
		public void CreateAppointment_NoIllnessesExist_ExceptionThrown()
		{
			Patient patient = new Patient()
			{
				BirthDate = new DateTime(1993, 11, 15),
				Email = "patient@gmail.com",
				FirstName = "Patient",
				LastName = "Perez",
				Id = 1,
				Phone = "091569874"
			};

			Illness illness = new Illness()
			{
				Id = 1,
				Name = "Depresion"
			};

			Psychologist psychologist = new Psychologist()
			{
				Id = 1,
				FirstName = "Juan",
				LastName = "Sartori",
				Address = "Calle 1234",
				Format = Format.Remote,
				CreatedDate = DateTime.Today.AddMonths(-3),
				Rate = new PsychologistRate() { Id = 1, HourlyRate = 1000 }
			};

			AppointmentDuration appointmentDuration = new AppointmentDuration(){
				Id = 1,
				Duration = new TimeSpan(1, 0, 0)
			};

			Appointment newAppointment = new Appointment()
			{
				Illness = illness,
				Patient = patient,
				Duration = appointmentDuration
			};

			Mock<IPatientRepository> mockPatient = new Mock<IPatientRepository>(MockBehavior.Strict);
			mockPatient.Setup(m => m.Get(patient.Email)).Returns(patient);

			Mock<IIllnessRepository> mockIllness = new Mock<IIllnessRepository>(MockBehavior.Strict);
			mockIllness.Setup(m => m.Get(illness.Id)).Throws(new CollectionEmptyException("Illnesses"));

			Mock<IPsychologistRepository> mockPsychologist = new Mock<IPsychologistRepository>(MockBehavior.Strict);
			mockPsychologist.Setup(m => m.Get(illness, It.IsAny<DateTime>(), 5)).Throws(new CollectionEmptyException("Illnesses"));
			mockPsychologist.Setup(m => m.Update(psychologist));

			Mock<IAppointmentDurationRepository> mockDuration = new Mock<IAppointmentDurationRepository>(MockBehavior.Strict);
			mockDuration.Setup(m => m.Get(appointmentDuration.Duration)).Returns(appointmentDuration);

			AppointmentLogic appointmentLogic = new AppointmentLogic(mockPsychologist.Object, mockIllness.Object, mockPatient.Object, mockDuration.Object);
			Appointment appointment = appointmentLogic.CreateAppointment(newAppointment);

			mockIllness.VerifyAll();
			mockPatient.VerifyAll();
			mockPsychologist.VerifyAll();

			Assert.IsNull(appointment);
		}

		[TestMethod]
		[ExpectedException(typeof(InvalidInputException))]
		public void CreateAppointment_NoPatientBirthDate_ExceptionThrown()
		{
			Patient patient = new Patient()
			{
				Email = "patient@gmail.com",
				FirstName = "Patient",
				LastName = "Perez",
				Id = 1,
				Phone = "091569874"
			};

			Illness illness = new Illness()
			{
				Id = 1,
				Name = "Depresion"
			};

			Psychologist psychologist = new Psychologist()
			{
				Id = 1,
				FirstName = "Juan",
				LastName = "Sartori",
				Address = "Calle 1234",
				Format = Format.Remote,
				CreatedDate = DateTime.Today.AddMonths(-3),
				Rate = new PsychologistRate() { Id = 1, HourlyRate = 1000 }
			};

			AppointmentDuration appointmentDuration = new AppointmentDuration(){
				Id = 1,
				Duration = new TimeSpan(1, 0, 0)
			};

			Appointment newAppointment = new Appointment()
			{
				Illness = illness,
				Patient = patient,
				Duration = appointmentDuration
			};

			Mock<IPatientRepository> mockPatient = new Mock<IPatientRepository>(MockBehavior.Strict);
			mockPatient.Setup(m => m.Get(patient.Email)).Throws(new NotFoundException(patient.Email));
			mockPatient.Setup(m => m.Add(patient)).Throws(new InvalidInputException("BirthDate is required"));

			Mock<IIllnessRepository> mockIllness = new Mock<IIllnessRepository>(MockBehavior.Strict);
			mockIllness.Setup(m => m.Get(illness.Id)).Returns(illness);

			Mock<IPsychologistRepository> mockPsychologist = new Mock<IPsychologistRepository>(MockBehavior.Strict);
			mockPsychologist.Setup(m => m.Get(illness, It.IsAny<DateTime>(), 5)).Returns(psychologist);
			mockPsychologist.Setup(m => m.Update(psychologist));

			Mock<IAppointmentDurationRepository> mockDuration = new Mock<IAppointmentDurationRepository>(MockBehavior.Strict);
			mockDuration.Setup(m => m.Get(appointmentDuration.Duration)).Returns(appointmentDuration);

			AppointmentLogic appointmentLogic = new AppointmentLogic(mockPsychologist.Object, mockIllness.Object, mockPatient.Object, mockDuration.Object);
			Appointment appointment = appointmentLogic.CreateAppointment(newAppointment);

			mockIllness.VerifyAll();
			mockPatient.VerifyAll();
			mockPsychologist.VerifyAll();

			Assert.IsNull(appointment);
		}

		[TestMethod]
		[ExpectedException(typeof(InvalidInputException))]
		public void CreateAppointment_NoPatientEMail_ExceptionThrown()
		{
			Patient patient = new Patient()
			{
				BirthDate = new DateTime(1993, 11, 15),
				FirstName = "Patient",
				LastName = "Perez",
				Id = 1,
				Phone = "091569874"
			};

			Illness illness = new Illness()
			{
				Id = 1,
				Name = "Depresion"
			};

			Psychologist psychologist = new Psychologist()
			{
				Id = 1,
				FirstName = "Juan",
				LastName = "Sartori",
				Address = "Calle 1234",
				Format = Format.Remote,
				CreatedDate = DateTime.Today.AddMonths(-3),
				Rate = new PsychologistRate() { Id = 1, HourlyRate = 1000 }
			};

			AppointmentDuration appointmentDuration = new AppointmentDuration(){
				Id = 1,
				Duration = new TimeSpan(1, 0, 0)
			};

			Appointment newAppointment = new Appointment()
			{
				Illness = illness,
				Patient = patient,
				Duration = appointmentDuration
			};

			Mock<IPatientRepository> mockPatient = new Mock<IPatientRepository>(MockBehavior.Strict);
			mockPatient.Setup(m => m.Get(patient.Email)).Throws(new NotFoundException(patient.Email));
			mockPatient.Setup(m => m.Add(patient)).Throws(new InvalidInputException("EMail is required"));

			Mock<IIllnessRepository> mockIllness = new Mock<IIllnessRepository>(MockBehavior.Strict);
			mockIllness.Setup(m => m.Get(illness.Id)).Returns(illness);

			Mock<IPsychologistRepository> mockPsychologist = new Mock<IPsychologistRepository>(MockBehavior.Strict);
			mockPsychologist.Setup(m => m.Get(illness, It.IsAny<DateTime>(), 5)).Returns(psychologist);
			mockPsychologist.Setup(m => m.Update(psychologist));

			Mock<IAppointmentDurationRepository> mockDuration = new Mock<IAppointmentDurationRepository>(MockBehavior.Strict);
			mockDuration.Setup(m => m.Get(appointmentDuration.Duration)).Returns(appointmentDuration);

			AppointmentLogic appointmentLogic = new AppointmentLogic(mockPsychologist.Object, mockIllness.Object, mockPatient.Object, mockDuration.Object);
			Appointment appointment = appointmentLogic.CreateAppointment(newAppointment);

			mockIllness.VerifyAll();
			mockPatient.VerifyAll();
			mockPsychologist.VerifyAll();

			Assert.IsNull(appointment);
		}

		[TestMethod]
		[ExpectedException(typeof(InvalidInputException))]
		public void CreateAppointment_NoPatientFirstName_ExceptionThrown()
		{
			Patient patient = new Patient()
			{
				BirthDate = new DateTime(1993, 11, 15),
				Email = "patient@gmail.com",
				LastName = "Perez",
				Id = 1,
				Phone = "091569874"
			};

			Illness illness = new Illness()
			{
				Id = 1,
				Name = "Depresion"
			};

			Psychologist psychologist = new Psychologist()
			{
				Id = 1,
				FirstName = "Juan",
				LastName = "Sartori",
				Address = "Calle 1234",
				Format = Format.Remote,
				CreatedDate = DateTime.Today.AddMonths(-3),
				Rate = new PsychologistRate() { Id = 1, HourlyRate = 1000 }
			};

			AppointmentDuration appointmentDuration = new AppointmentDuration(){
				Id = 1,
				Duration = new TimeSpan(1, 0, 0)
			};

			Appointment newAppointment = new Appointment()
			{
				Illness = illness,
				Patient = patient,
				Duration = appointmentDuration
			};

			Mock<IPatientRepository> mockPatient = new Mock<IPatientRepository>(MockBehavior.Strict);
			mockPatient.Setup(m => m.Get(patient.Email)).Throws(new NotFoundException(patient.Email));
			mockPatient.Setup(m => m.Add(patient)).Throws(new InvalidInputException("FirstName is required"));

			Mock<IIllnessRepository> mockIllness = new Mock<IIllnessRepository>(MockBehavior.Strict);
			mockIllness.Setup(m => m.Get(illness.Id)).Returns(illness);

			Mock<IPsychologistRepository> mockPsychologist = new Mock<IPsychologistRepository>(MockBehavior.Strict);
			mockPsychologist.Setup(m => m.Get(illness, It.IsAny<DateTime>(), 5)).Returns(psychologist);
			mockPsychologist.Setup(m => m.Update(psychologist));

			Mock<IAppointmentDurationRepository> mockDuration = new Mock<IAppointmentDurationRepository>(MockBehavior.Strict);
			mockDuration.Setup(m => m.Get(appointmentDuration.Duration)).Returns(appointmentDuration);

			AppointmentLogic appointmentLogic = new AppointmentLogic(mockPsychologist.Object, mockIllness.Object, mockPatient.Object, mockDuration.Object);
			Appointment appointment = appointmentLogic.CreateAppointment(newAppointment);

			mockIllness.VerifyAll();
			mockPatient.VerifyAll();
			mockPsychologist.VerifyAll();

			Assert.IsNull(appointment);
		}

		[TestMethod]
		[ExpectedException(typeof(InvalidInputException))]
		public void CreateAppointment_NoPatientLastName_ExceptionThrown()
		{
			Patient patient = new Patient()
			{
				BirthDate = new DateTime(1993, 11, 15),
				Email = "patient@gmail.com",
				FirstName = "Patient",
				Id = 1,
				Phone = "091569874"
			};

			Illness illness = new Illness()
			{
				Id = 1,
				Name = "Depresion"
			};

			Psychologist psychologist = new Psychologist()
			{
				Id = 1,
				FirstName = "Juan",
				LastName = "Sartori",
				Address = "Calle 1234",
				Format = Format.Remote,
				CreatedDate = DateTime.Today.AddMonths(-3),
				Rate = new PsychologistRate() { Id = 1, HourlyRate = 1000 }
			};

			AppointmentDuration appointmentDuration = new AppointmentDuration(){
				Id = 1,
				Duration = new TimeSpan(1, 0, 0)
			};

			Appointment newAppointment = new Appointment()
			{
				Illness = illness,
				Patient = patient,
				Duration = appointmentDuration
			};

			Mock<IPatientRepository> mockPatient = new Mock<IPatientRepository>(MockBehavior.Strict);
			mockPatient.Setup(m => m.Get(patient.Email)).Throws(new NotFoundException(patient.Email));
			mockPatient.Setup(m => m.Add(patient)).Throws(new InvalidInputException("LastName is required"));

			Mock<IIllnessRepository> mockIllness = new Mock<IIllnessRepository>(MockBehavior.Strict);
			mockIllness.Setup(m => m.Get(illness.Id)).Returns(illness);

			Mock<IPsychologistRepository> mockPsychologist = new Mock<IPsychologistRepository>(MockBehavior.Strict);
			mockPsychologist.Setup(m => m.Get(illness, It.IsAny<DateTime>(), 5)).Returns(psychologist);
			mockPsychologist.Setup(m => m.Update(psychologist));

			Mock<IAppointmentDurationRepository> mockDuration = new Mock<IAppointmentDurationRepository>(MockBehavior.Strict);
			mockDuration.Setup(m => m.Get(appointmentDuration.Duration)).Returns(appointmentDuration);

			AppointmentLogic appointmentLogic = new AppointmentLogic(mockPsychologist.Object, mockIllness.Object, mockPatient.Object, mockDuration.Object);
			Appointment appointment = appointmentLogic.CreateAppointment(newAppointment);

			mockIllness.VerifyAll();
			mockPatient.VerifyAll();
			mockPsychologist.VerifyAll();

			Assert.IsNull(appointment);
		}

		[TestMethod]
		[ExpectedException(typeof(InvalidInputException))]
		public void CreateAppointment_NoPatientPhone_ExceptionThrown()
		{
			Patient patient = new Patient()
			{
				BirthDate = new DateTime(1993, 11, 15),
				Email = "patient@gmail.com",
				FirstName = "Patient",
				LastName = "Perez",
				Id = 1
			};

			Illness illness = new Illness()
			{
				Id = 1,
				Name = "Depresion"
			};

			Psychologist psychologist = new Psychologist()
			{
				Id = 1,
				FirstName = "Juan",
				LastName = "Sartori",
				Address = "Calle 1234",
				Format = Format.Remote,
				CreatedDate = DateTime.Today.AddMonths(-3),
				Rate = new PsychologistRate() { Id = 1, HourlyRate = 1000 }
			};

			AppointmentDuration appointmentDuration = new AppointmentDuration(){
				Id = 1,
				Duration = new TimeSpan(1, 0, 0)
			};

			Appointment newAppointment = new Appointment()
			{
				Illness = illness,
				Patient = patient,
				Duration = appointmentDuration
			};

			Mock<IPatientRepository> mockPatient = new Mock<IPatientRepository>(MockBehavior.Strict);
			mockPatient.Setup(m => m.Get(patient.Email)).Throws(new NotFoundException(patient.Email));
			mockPatient.Setup(m => m.Add(patient)).Throws(new InvalidInputException("Phone is required"));

			Mock<IIllnessRepository> mockIllness = new Mock<IIllnessRepository>(MockBehavior.Strict);
			mockIllness.Setup(m => m.Get(illness.Id)).Returns(illness);

			Mock<IPsychologistRepository> mockPsychologist = new Mock<IPsychologistRepository>(MockBehavior.Strict);
			mockPsychologist.Setup(m => m.Get(illness, It.IsAny<DateTime>(), 5)).Returns(psychologist);
			mockPsychologist.Setup(m => m.Update(psychologist));

			Mock<IAppointmentDurationRepository> mockDuration = new Mock<IAppointmentDurationRepository>(MockBehavior.Strict);
			mockDuration.Setup(m => m.Get(appointmentDuration.Duration)).Returns(appointmentDuration);

			AppointmentLogic appointmentLogic = new AppointmentLogic(mockPsychologist.Object, mockIllness.Object, mockPatient.Object, mockDuration.Object);
			Appointment appointment = appointmentLogic.CreateAppointment(newAppointment);

			mockIllness.VerifyAll();
			mockPatient.VerifyAll();
			mockPsychologist.VerifyAll();

			Assert.IsNull(appointment);
		}

		[TestMethod]
		[ExpectedException(typeof(NotFoundException))]
		public void CreateAppointment_InvalidDuration_ExceptionThrown()
		{
			Patient patient = new Patient()
			{
				BirthDate = new DateTime(1993, 11, 15),
				Email = "patient@gmail.com",
				FirstName = "Patient",
				LastName = "Perez",
				Id = 1,
				Phone = "091569874"
			};


			Illness illness = new Illness()
			{
				Id = 1,
				Name = "Depresion"
			};

			Psychologist psychologist = new Psychologist()
			{
				Id = 1,
				FirstName = "Juan",
				LastName = "Sartori",
				Address = "Calle 1234",
				Format = Format.Remote,
				CreatedDate = DateTime.Today.AddMonths(-3),
				Rate = new PsychologistRate() { Id = 1, HourlyRate = 1000 }
			};

			AppointmentDuration appointmentDuration = new AppointmentDuration(){
				Id = 1,
				Duration = new TimeSpan(1, 0, 0)
			};

			Appointment newAppointment = new Appointment()
			{
				Illness = illness,
				Patient = patient,
				Duration = appointmentDuration
			};

			Mock<IPatientRepository> mockPatient = new Mock<IPatientRepository>(MockBehavior.Strict);
			mockPatient.Setup(m => m.Get(patient.Email)).Returns(patient);

			Mock<IIllnessRepository> mockIllness = new Mock<IIllnessRepository>(MockBehavior.Strict);
			mockIllness.Setup(m => m.Get(illness.Id)).Returns(illness);

			Mock<IPsychologistRepository> mockPsychologist = new Mock<IPsychologistRepository>(MockBehavior.Strict);
			mockPsychologist.Setup(m => m.Get(illness, It.IsAny<DateTime>(), 5)).Returns(psychologist);
			mockPsychologist.Setup(m => m.Update(psychologist));

			Mock<IAppointmentDurationRepository> mockDuration = new Mock<IAppointmentDurationRepository>(MockBehavior.Strict);
			mockDuration.Setup(m => m.Get(appointmentDuration.Duration)).Throws(new NotFoundException(appointmentDuration.Duration.ToString()));

			AppointmentLogic appointmentLogic = new AppointmentLogic(mockPsychologist.Object, mockIllness.Object, mockPatient.Object, mockDuration.Object);
			Appointment appointment = appointmentLogic.CreateAppointment(newAppointment);

			mockIllness.VerifyAll();
			mockPatient.VerifyAll();
			mockPsychologist.VerifyAll();

			Assert.IsNull(appointment);
		}

		[TestMethod]
		[ExpectedException(typeof(NotFoundException))]
		public void CreateAppointment_NoDuration_ExceptionThrown()
		{
			Patient patient = new Patient()
			{
				BirthDate = new DateTime(1993, 11, 15),
				Email = "patient@gmail.com",
				FirstName = "Patient",
				LastName = "Perez",
				Id = 1,
				Phone = "091569874"
			};


			Illness illness = new Illness()
			{
				Id = 1,
				Name = "Depresion"
			};

			Psychologist psychologist = new Psychologist()
			{
				Id = 1,
				FirstName = "Juan",
				LastName = "Sartori",
				Address = "Calle 1234",
				Format = Format.Remote,
				CreatedDate = DateTime.Today.AddMonths(-3),
				Rate = new PsychologistRate() { Id = 1, HourlyRate = 1000 }
			};

			AppointmentDuration appointmentDuration = new AppointmentDuration()
			{
				Id = 1,
				Duration = TimeSpan.Zero
			};

			Appointment newAppointment = new Appointment()
			{
				Illness = illness,
				Patient = patient,
				Duration = appointmentDuration
			};

			Mock<IPatientRepository> mockPatient = new Mock<IPatientRepository>(MockBehavior.Strict);
			mockPatient.Setup(m => m.Get(patient.Email)).Returns(patient);

			Mock<IIllnessRepository> mockIllness = new Mock<IIllnessRepository>(MockBehavior.Strict);
			mockIllness.Setup(m => m.Get(illness.Id)).Returns(illness);

			Mock<IPsychologistRepository> mockPsychologist = new Mock<IPsychologistRepository>(MockBehavior.Strict);
			mockPsychologist.Setup(m => m.Get(illness, It.IsAny<DateTime>(), 5)).Returns(psychologist);
			mockPsychologist.Setup(m => m.Update(psychologist));

			Mock<IAppointmentDurationRepository> mockDuration = new Mock<IAppointmentDurationRepository>(MockBehavior.Strict);
			mockDuration.Setup(m => m.Get(It.IsAny<TimeSpan>())).Throws(new NotFoundException("Appointment Duration"));

			AppointmentLogic appointmentLogic = new AppointmentLogic(mockPsychologist.Object, mockIllness.Object, mockPatient.Object, mockDuration.Object);
			Appointment appointment = appointmentLogic.CreateAppointment(newAppointment);

			mockIllness.VerifyAll();
			mockPatient.VerifyAll();
			mockPsychologist.VerifyAll();

			Assert.IsNull(appointment);
		}

		[TestMethod]
		public void CreateAppointment_PatientExistsFormatOnSiteDiscountFiftyPercent_CreatedAndDiscountAppliedAndDiscountRemovedFromPatientAndQuantityReset()
		{
			Patient patient = new Patient()
			{
				BirthDate = new DateTime(1993, 11, 15),
				Email = "patient@gmail.com",
				FirstName = "Patient",
				LastName = "Perez",
				Id = 1,
				Phone = "091569874",
				AppointmentDiscount = new AppointmentDiscount() { Id = 1, Discount = 50 },
				AppointmentQuantity = 3
			};

			Illness illness = new Illness()
			{
				Id = 1,
				Name = "Depresion"
			};

			Psychologist psychologist = new Psychologist()
			{
				Id = 1,
				FirstName = "Juan",
				LastName = "Sartori",
				Address = "Calle 1234",
				Format = Format.OnSite,
				CreatedDate = DateTime.Today.AddMonths(-3),
				Rate = new PsychologistRate() { Id = 1, HourlyRate = 1000 }
			};

			AppointmentDuration appointmentDuration = new AppointmentDuration()
			{
				Id = 1,
				Duration = new TimeSpan(4, 0, 0)
			};


			Appointment newAppointment = new Appointment()
			{
				Illness = illness,
				Patient = patient,
				Duration = appointmentDuration
			};

			Mock<IPatientRepository> mockPatient = new Mock<IPatientRepository>(MockBehavior.Strict);
			mockPatient.Setup(m => m.Get(patient.Email)).Returns(patient);

			Mock<IIllnessRepository> mockIllness = new Mock<IIllnessRepository>(MockBehavior.Strict);
			mockIllness.Setup(m => m.Get(illness.Id)).Returns(illness);

			Mock<IPsychologistRepository> mockPsychologist = new Mock<IPsychologistRepository>(MockBehavior.Strict);
			mockPsychologist.Setup(m => m.Get(illness, It.IsAny<DateTime>(), 5)).Returns(psychologist);
			mockPsychologist.Setup(m => m.Update(psychologist));

			Mock<IAppointmentDurationRepository> mockDuration = new Mock<IAppointmentDurationRepository>(MockBehavior.Strict);
			mockDuration.Setup(m => m.Get(appointmentDuration.Duration)).Returns(appointmentDuration);

			AppointmentLogic appointmentLogic = new AppointmentLogic(mockPsychologist.Object, mockIllness.Object, mockPatient.Object, mockDuration.Object);
			Appointment appointment = appointmentLogic.CreateAppointment(newAppointment);

			mockIllness.VerifyAll();
			mockPatient.VerifyAll();
			mockPsychologist.VerifyAll();

			Assert.IsTrue(appointment.TotalCost == 2000 && appointment.Patient.AppointmentQuantity == 0);
		}

		[TestMethod]
		public void CreateAppointment_PatientExistsFormatOnSiteNoDiscount_CreatedAndQuantityIncreasedForPatient()
		{
			Patient patient = new Patient()
			{
				BirthDate = new DateTime(1993, 11, 15),
				Email = "patient@gmail.com",
				FirstName = "Patient",
				LastName = "Perez",
				Id = 1,
				Phone = "091569874",
				AppointmentQuantity = 3
			};

			Illness illness = new Illness()
			{
				Id = 1,
				Name = "Depresion"
			};

			Psychologist psychologist = new Psychologist()
			{
				Id = 1,
				FirstName = "Juan",
				LastName = "Sartori",
				Address = "Calle 1234",
				Format = Format.OnSite,
				CreatedDate = DateTime.Today.AddMonths(-3),
				Rate = new PsychologistRate() { Id = 1, HourlyRate = 1000 }
			};

			AppointmentDuration appointmentDuration = new AppointmentDuration()
			{
				Id = 1,
				Duration = new TimeSpan(4, 0, 0)
			};


			Appointment newAppointment = new Appointment()
			{
				Illness = illness,
				Patient = patient,
				Duration = appointmentDuration
			};

			Mock<IPatientRepository> mockPatient = new Mock<IPatientRepository>(MockBehavior.Strict);
			mockPatient.Setup(m => m.Get(patient.Email)).Returns(patient);

			Mock<IIllnessRepository> mockIllness = new Mock<IIllnessRepository>(MockBehavior.Strict);
			mockIllness.Setup(m => m.Get(illness.Id)).Returns(illness);

			Mock<IPsychologistRepository> mockPsychologist = new Mock<IPsychologistRepository>(MockBehavior.Strict);
			mockPsychologist.Setup(m => m.Get(illness, It.IsAny<DateTime>(), 5)).Returns(psychologist);
			mockPsychologist.Setup(m => m.Update(psychologist));

			Mock<IAppointmentDurationRepository> mockDuration = new Mock<IAppointmentDurationRepository>(MockBehavior.Strict);
			mockDuration.Setup(m => m.Get(appointmentDuration.Duration)).Returns(appointmentDuration);

			AppointmentLogic appointmentLogic = new AppointmentLogic(mockPsychologist.Object, mockIllness.Object, mockPatient.Object, mockDuration.Object);
			Appointment appointment = appointmentLogic.CreateAppointment(newAppointment);

			mockIllness.VerifyAll();
			mockPatient.VerifyAll();
			mockPsychologist.VerifyAll();

			Assert.IsTrue(appointment.TotalCost == 4000 && appointment.Patient.AppointmentQuantity == 4);
		}
	}
}
