﻿using BLInterfaces;
using DataAccessInterfaces;
using Domain;

namespace BL
{
	public class AppointmentLogic : IAppointmentLogic
	{
		public AppointmentLogic(IPsychologistRepository psychologistRepository, IIllnessRepository illnessRepository, IPatientRepository patientRepository)
		{

		}

		public Appointment CreateAppointment(Patient patient, Illness illness)
		{
			throw new System.NotImplementedException();
		}
	}
}
