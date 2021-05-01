﻿using BLInterfaces;
using DataAccessInterfaces;
using Domain;
using Domain.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;

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
				Date = CalculateAppointmentDate(candidate),
				Illness = illness,
				Patient = obtainedPatient,
				Psychologist = candidate
			};

			Schedule scheduleDay = candidate.GetLast();

			if (scheduleDay != null && scheduleDay.Date.Date == appointment.Date)
				scheduleDay.Appointments.Append(appointment);
			else
				candidate.ScheduleDays.Append(
					new Schedule()
					{
						Appointments = new List<Appointment>()
						{
							appointment
						},
						Date = appointment.Date,
						Psychologist = candidate
					});

			this.psychologistRepository.Update(candidate);
			return appointment;

		}

		private DateTime CalculateAppointmentDate(Psychologist candidate)
		{
			DateTime date = DateTime.Now;

			Schedule last = candidate.GetLast();
			if (last != null)
			{
				if (last.Date.Date <= DateTime.Now.Date)
				{
					return SetNextWorkDay(date);
				}
				if (last.Appointments.Count() < LimitOfAppointmentsPerDay)
					return last.Date;
			}

			return SetNextWorkDay(date.AddDays(1));
		}

		private DateTime SetNextWorkDay(DateTime date)
		{
			if (date.DayOfWeek == DayOfWeek.Friday)
				date.AddDays(3);
			else if (date.DayOfWeek == DayOfWeek.Saturday)
				date.AddDays(2);
			else if (date.DayOfWeek == DayOfWeek.Sunday)
				date.AddDays(1);
			return date;
		}

		private string CalculateAddress(Psychologist candidate)
		{
			if (candidate.Format == Format.OnSite)
				return candidate.Address;
			return string.Concat(BetterCalmUrl, Guid.NewGuid().ToString());
		}

		private Psychologist GetCandidate(Illness illness)
		{
			Psychologist candidate = null;
			DateTime until = DateTime.Now;
			while (candidate == null)
			{
				until = GetUntilDate(until);
				candidate = this.psychologistRepository.Get(illness, until, LimitOfAppointmentsPerDay);
			}
			return candidate;
		}

		private Patient GetPatient(Patient patient)
		{
			Patient obtainedPatient;
			try
			{
				obtainedPatient = this.patientRepository.Get(patient.EMail);
			}
			catch (NotFoundException)
			{
				obtainedPatient = patient;
			}
			return obtainedPatient;
		}

		private DateTime GetUntilDate(DateTime since)
		{
			int daysUntilFriday = (DayOfWeek.Friday - since.DayOfWeek + 7) % 7;
			since.AddDays(daysUntilFriday);
			return since.Date;
		}
	}
}
