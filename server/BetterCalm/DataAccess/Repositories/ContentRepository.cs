﻿using DataAccessInterfaces;
using Domain;
using Domain.Exceptions;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace DataAccess.Repositories
{
	public class ContentRepository : IContentRepository
	{
		private DbContext context;
		private DbSet<Content> contents;

		public ContentRepository(DbContext context)
		{
			this.context = context;
			this.contents = context.Set<Content>();
		}

		public Content Get(int id)
		{
			Content content = this.contents.FirstOrDefault(cont => cont.Id == id);
			if (content == null)
				throw new NotFoundException(id.ToString());
			return content;
		}

		public IEnumerable<Content> GetAll()
		{
			return this.contents;
		}

        public IEnumerable<Content> GetAll(Playlist playlist)
        {
			return this.contents.Where(content => content.PlayLists.Contains(playlist));
        }

        public IEnumerable<Content> GetAll(Category category)
        {
            throw new System.NotImplementedException();
        }
    }
}
