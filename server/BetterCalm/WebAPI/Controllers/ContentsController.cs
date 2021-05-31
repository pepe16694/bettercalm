﻿using BLInterfaces;
using Domain;
using Microsoft.AspNetCore.Mvc;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using WebAPI.Filters;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebAPI.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ContentsController : ControllerBase
	{
		private readonly IContentLogic contentLogic;

		public ContentsController(IContentLogic contentLogic)
		{
			this.contentLogic = contentLogic;
		}

		[HttpGet]
		public IActionResult Get()
		{
			IEnumerable<ContentBasicInfo> contents =
				this.contentLogic.GetContents().
				Select(content => new ContentBasicInfo(content));

			return Ok(contents);
		}

		[HttpGet("{id}")]
		public IActionResult Get(int id)
		{
			Content content = this.contentLogic.GetContent(id);
			return Ok(new ContentBasicInfo(content));
		}


		[HttpGet("contentType/{contentType}")]
		public IActionResult Get(string contentType)
		{
			IEnumerable<ContentBasicInfo> contents =
				this.contentLogic.GetContents(contentType).
				Select(content => new ContentBasicInfo(content));

			return Ok(contents);
		}

		[HttpPost]
		[AuthorizationFilter("Administrator")]
		public IActionResult Post([FromBody] ContentModel contentModel)
		{
			this.contentLogic.CreateContent(contentModel.ToEntity());
			return Ok();
		}

		[HttpDelete("{id}")]
		[AuthorizationFilter("Administrator")]
		public IActionResult Delete(int id)
		{
			this.contentLogic.DeleteContent(id);
			return Ok();
		}

		[HttpPatch]
		public IActionResult Patch([FromBody] ContentModel contentModel)
		{
			this.contentLogic.UpdateContent(contentModel.ToEntity());
			return Ok();
		}
	}
}
