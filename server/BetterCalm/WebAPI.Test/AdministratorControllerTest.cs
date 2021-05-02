﻿using BLInterfaces;
using Domain;
using Domain.Exceptions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Model;
using Moq;
using WebAPI.Controllers;

namespace WebAPI.Test
{
	[TestClass]
	public class AdministratorControllerTest
	{
		[TestMethod]
		public void PostOk()
		{
			AdministratorInputModel input = new AdministratorInputModel()
			{
				EMail = "test@test.com",
				Name = "test",
				Password = "test1234"
			};

			Mock<IUserLogic> userLogicMock = new Mock<IUserLogic>(MockBehavior.Strict);
			userLogicMock.Setup(m => m.CreateUser(It.IsAny<User>()));

			AdministratorsController controller = new AdministratorsController(userLogicMock.Object);

			IActionResult result = controller.Post(input);
			OkResult objectResult = result as OkResult;
			Assert.IsTrue(objectResult.StatusCode == 200);
		}

		[TestMethod]
		[ExpectedException(typeof(AlreadyExistsException))]
		public void PostAlreadyExists()
		{
			AdministratorInputModel input = new AdministratorInputModel()
			{
				EMail = "test@test.com",
				Name = "test",
				Password = "test1234"
			};

			Mock<IUserLogic> userLogicMock = new Mock<IUserLogic>(MockBehavior.Strict);
			userLogicMock.Setup(m => m.CreateUser(It.IsAny<User>())).Throws(new AlreadyExistsException(input.EMail));

			AdministratorsController controller = new AdministratorsController(userLogicMock.Object);

			IActionResult result = controller.Post(input);
			ObjectResult objectResult = result as ObjectResult;
			Assert.IsTrue(objectResult.StatusCode == 400);
		}

		[TestMethod]
		[ExpectedException(typeof(NotFoundException))]
		public void PostRoleNotFound()
		{
			AdministratorInputModel input = new AdministratorInputModel()
			{
				EMail = "test@test.com",
				Name = "test",
				Password = "test1234"
			};

			Mock<IUserLogic> userLogicMock = new Mock<IUserLogic>(MockBehavior.Strict);
			userLogicMock.Setup(m => m.CreateUser(It.IsAny<User>())).Throws(new NotFoundException("Patient"));

			AdministratorsController controller = new AdministratorsController(userLogicMock.Object);

			IActionResult result = controller.Post(input);
			ObjectResult objectResult = result as ObjectResult;
			Assert.IsTrue(objectResult.StatusCode == 400);
		}
	}
}