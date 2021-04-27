﻿using BLInterfaces;
using Microsoft.AspNetCore.Mvc;
using Model;
using System.Collections.Generic;
using System.Linq;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace WebAPI.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class ContentsController : ControllerBase
	{
		private readonly IContentLogic contentLogic;

		public ContentsController(IContentLogic contentPlayerLogic)
		{
			this.contentLogic = contentPlayerLogic;
		}

		[HttpGet]
		public IActionResult Get()
		{
			IEnumerable<ContentBasicInfo> contents =
				this.contentLogic.GetContents().
				Select(content => new ContentBasicInfo(content));

			return Ok(contents);
		}
	}
}
