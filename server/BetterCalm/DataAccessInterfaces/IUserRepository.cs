﻿using Domain;

namespace DataAccessInterfaces
{
	public interface IUserRepository
	{
		User Get(string eMail);
		void Add(User user);
		void Update(User user);
		void Delete(User user);
	}
}
