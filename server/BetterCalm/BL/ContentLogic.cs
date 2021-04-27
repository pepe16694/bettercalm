﻿using BLInterfaces;
using DataAccessInterfaces;
using Domain;
using System.Collections.Generic;

namespace BL
{
	public class ContentLogic : IContentLogic
	{
		private readonly IContentRepository contentRepository;

		public ContentLogic(IContentRepository contentRepository)
		{
			this.contentRepository = contentRepository;
		}

		public IEnumerable<Content> GetContents()
		{
			return this.contentRepository.GetAll();
		}

        public IEnumerable<Content> GetContents(Playlist playlist)
        {
            throw new System.NotImplementedException();
        }
    }
}
