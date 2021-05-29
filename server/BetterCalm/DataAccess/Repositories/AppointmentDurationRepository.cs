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

        public AppointmentDuration Get(int id)
        {
            AppointmentDuration duration =  this.durations.FirstOrDefault(duration => duration.Id == id);
            if (duration == null)
                throw new NotFoundException(id.ToString());
            return duration;
        }

        public IEnumerable<AppointmentDuration> GetAll(){
            if (this.durations.Count() <= 0)
                throw new CollectionEmptyException("Appointment Durations");
            else
                return this.durations.Select(duration => new AppointmentDuration()
                {
                    Id = duration.Id,
                    Duration = duration.Duration,
                });
       }
    }
}
