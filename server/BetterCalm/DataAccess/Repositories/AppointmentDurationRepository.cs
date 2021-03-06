using DataAccessInterfaces;
using Domain;
using Domain.Exceptions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace DataAccess.Repositories
{
    public class AppointmentDurationRepository : IAppointmentDurationRepository
    {
        private DbContext context;
        private DbSet<AppointmentDuration> durations;

        public AppointmentDurationRepository(DbContext context)
        {
            this.context = context;
            this.durations = context.Set<AppointmentDuration>();
        }

        public AppointmentDuration Get(TimeSpan duration)
        {
            AppointmentDuration appointmentDuration =  this.durations.FirstOrDefault(stored => stored.Duration == duration);
            if (appointmentDuration == null)
            {
                throw new NotFoundException("Appointment Duration");
            }
            return appointmentDuration;
        }

        public IEnumerable<AppointmentDuration> GetAll(){
            if (this.durations.Count() <= 0)
            {
                throw new CollectionEmptyException("Appointment Durations");
            }
            else
            {
                return this.durations;
            }
        }
    }
}
