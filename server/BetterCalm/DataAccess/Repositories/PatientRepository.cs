using DataAccessInterfaces;
using Domain;
using Domain.Exceptions;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace DataAccess.Repositories
{
	public class PatientRepository : IPatientRepository
	{
		private DbContext context;
		private DbSet<Patient> patients;

		public PatientRepository(DbContext context)
		{
			this.context = context;
			this.patients = context.Set<Patient>();
		}

		public void Add(Patient patient)
		{
			if (patient.Validate())
			{
				if (Exists(patient))
                {
					throw new AlreadyExistsException(patient.Email);
				}
				this.patients.Add(patient);
				this.context.SaveChanges();
			}
		}

		private bool Exists(Patient patient)
		{
			try
			{
				return Get(patient.Email) != null;
			}
			catch (NotFoundException)
			{
				return false;
			}
		}

		public Patient Get(string email)
		{
			Patient patient = this.patients.Include(x => x.AppointmentDiscount).FirstOrDefault(patient => patient.Email.Equals(email));
			if (patient == null)
			{
				throw new NotFoundException("Patient");
			}
			return patient;
		}

        public IEnumerable<Patient> GetAll()
        {
            if (this.patients.Count() <= 0)
            {
				throw new CollectionEmptyException("Patients");
            }
			return this.patients;
        }

		public IEnumerable<Patient> GetAllWithoutDiscount(int numberOfAppointments)
		{
            if (this.patients.Count() > 0)
            {
				return this.patients.Where(patient => (patient.AppointmentDiscount == null || patient.AppointmentDiscount.Discount == 0 ) && patient.AppointmentQuantity >= numberOfAppointments);
			}
            else
            {
				throw new CollectionEmptyException("Patients");
            }	
		}

		public void Update(Patient patient)
		{
			Patient original = Get(patient.Email);
			if (original == null)
			{
				throw new NotFoundException("Patient");
			}
			if (patient.Validate())
			{
				original.UpdateFromPatient(patient);
				this.patients.Update(original);
				this.context.SaveChanges();
			}
		}
	}
}
