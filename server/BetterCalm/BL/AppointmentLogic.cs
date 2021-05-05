﻿using BL.Utils;
using BLInterfaces;
using DataAccessInterfaces;
using Domain;
using Domain.Exceptions;
using System;
using System.Collections.Generic;

namespace BL
{
    public class AppointmentLogic : IAppointmentLogic
	{
		private const int LimitOfAppointmentsPerDay = 5;
		private const string BetterCalmUrl = "http://bettercalm.com.uy/meeting_id/";

		private readonly IPsychologistRepository psychologistRepository;
		private readonly IIllnessRepository illnessRepository;
		private readonly IPatientRepository patientRepository;

		public AppointmentLogic(IPsychologistRepository psychologistRepository, IIllnessRepository illnessRepository, IPatientRepository patientRepository)
		{
			this.psychologistRepository = psychologistRepository;
			this.illnessRepository = illnessRepository;
			this.patientRepository = patientRepository;
		}

		public Appointment CreateAppointment(Patient patient, Illness illness)
		{
			Illness obtainedIllness = this.illnessRepository.Get(illness.Id);
			Patient obtainedPatient = GetPatient(patient);
			Psychologist candidate = GetCandidate(obtainedIllness);

			Appointment appointment = new Appointment()
			{
				Address = CalculateAddress(candidate),
				Date = DateCalculator.CalculateAppointmentDate(candidate, LimitOfAppointmentsPerDay),
				Illness = obtainedIllness,
				Patient = obtainedPatient,
				Psychologist = candidate
			};

			Schedule scheduleDay = candidate.GetLast();
			
			if (scheduleDay != null && scheduleDay.GetScheduleDate() == appointment.Date.Date)
				scheduleDay.Appointments.Add(appointment);
			else
				candidate.ScheduleDays.Add(
					new Schedule()
					{
						Appointments = new List<Appointment>()
						{
							appointment
						},
						Date = appointment.GetDate(),
						Psychologist = candidate
					});

			this.psychologistRepository.Update(candidate);
			return appointment;

		}

		private Patient GetPatient(Patient patient)
		{
			try
			{
				patient = this.patientRepository.Get(patient.EMail);
			}
			catch (NotFoundException) 
			{
				this.patientRepository.Add(patient);
			}
			return patient;
		}

		private Psychologist GetCandidate(Illness illness)
		{
			Psychologist candidate = null;
			DateTime until = DateTime.Now;
			while (candidate == null)
			{
				until = DateCalculator.CalculateUntilDate(until);
				candidate = this.psychologistRepository.Get(illness, until, LimitOfAppointmentsPerDay);
			}
			return candidate;
		}		

		private string CalculateAddress(Psychologist candidate)
		{
			if (candidate.Format == Format.OnSite)
				return candidate.Address;
			return string.Concat(BetterCalmUrl, Guid.NewGuid().ToString());
		}
	}
}
