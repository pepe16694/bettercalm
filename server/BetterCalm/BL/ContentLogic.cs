﻿using BLInterfaces;
using DataAccessInterfaces;
using Domain;
using System.Collections.Generic;

namespace BL
{
	public class ContentLogic : IContentLogic
	{
		private readonly IContentRepository contentRepository;

		public ContentLogic(IContentRepository contentRepository, IPlaylistRepository playlistRepository, ICategoryRepository categoryRepository)
		{
			this.contentRepository = contentRepository;
		}

		public void CreateContent(Content content)
		{
			throw new System.NotImplementedException();
		}

		public Content GetContent(int id)
		{
			return this.contentRepository.Get(id);
		}

		public IEnumerable<Content> GetContents()
		{
			return this.contentRepository.GetAll();
		}

        public IEnumerable<Content> GetContents(Playlist playlist)
        {
			return this.contentRepository.GetAll(playlist);
        }
    }
}
