using BLInterfaces;
using Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Model;
using Moq;
using System;
using System.Collections.Generic;
using WebAPI.Controllers;
using System.Linq;
using Domain.Exceptions;

namespace WebAPI.Test
{
    [TestClass]
	public class ContentsControllerTest
	{
		[TestMethod]
		public void Get_ContentsExist_Fetched()
		{
            List<Content> expectedContents = GetExpectedContents();

            Mock<IContentLogic> mock = new Mock<IContentLogic>(MockBehavior.Strict);
            mock.Setup(m => m.GetContents()).Returns(expectedContents);
            ContentsController controller = new ContentsController(mock.Object);

            IActionResult result = controller.Get();
            OkObjectResult objectResult = result as OkObjectResult;
            IEnumerable<ContentBasicInfo> obtainedContents = objectResult.Value as IEnumerable<ContentBasicInfo>;

            mock.VerifyAll();
            CollectionAssert.AreEqual(expectedContents.
                Select(content => new ContentBasicInfo(content)).
                ToList(),
                obtainedContents.ToList(),
                new ContentBasicInfoComparer());

		}

        private static List<Content> GetExpectedContents()
        {
            return new List<Content>()
            {
                new Content()
                {
                    ArtistName = "Bon Jovi",
                    Categories = new List<Category>(){
                        new Category()
                        {
                            Id = 1,
                            Name = "Rock"
                        }
                    },
                    Id = 1,
                    ContentLength = new TimeSpan(0, 2, 30),
                    Name = "It's My Life",
                    ImageUrl = "http://www.images.com/image.jpg",
                    ContentUrl = "http://www.audios.com/audio.mp3",
                    ContentType = new ContentType()
					{
                        Id = 1,
                        Name = "audio"
					}
                },
                new Content()
                {
                    ArtistName = "Celia Cruz",
                    Categories = new List<Category>(){
                        new Category()
                        {
                            Id = 2,
                            Name = "Tropical"
                        }
                    },
                    Id = 2,
                    ContentLength = new TimeSpan(0, 2, 30),
                    Name = "La vida es un carnaval",
                    ImageUrl = "http://www.images.com/image2.jpg",
                    ContentUrl = "http://www.audios.com/audio.mp3",
                    ContentType = new ContentType()
                    {
                        Id = 1,
                        Name = "audio"
                    }
                }
            };
        }

        [TestMethod]
        public void Get_ContentFound_Fetched()
        {
            Content expectedContent = new Content()
            {
                ArtistName = "Bon Jovi",
                Categories = new List<Category>(){
                        new Category()
                        {
                            Id = 1,
                            Name = "Rock"
                        }
                    },
                Id = 1,
                ContentLength = new TimeSpan(0, 2, 30),
                Name = "It's My Life",
                ImageUrl = "http://www.images.com/image.jpg",
                ContentUrl = "http://www.audios.com/audio.mp3",
                ContentType = new ContentType()
                {
                    Id = 1,
                    Name = "audio"
                }
            };

            Mock<IContentLogic> mock = new Mock<IContentLogic>(MockBehavior.Strict);
            mock.Setup(m => m.GetContent(expectedContent.Id)).Returns(expectedContent);
            ContentsController controller = new ContentsController(mock.Object);

            IActionResult result = controller.Get(expectedContent.Id);
            OkObjectResult objectResult = result as OkObjectResult;
            ContentModel obtainedContent = objectResult.Value as ContentModel;

            mock.VerifyAll();
            Assert.IsTrue((new ContentModelComparer()).
               Compare(new ContentModel(expectedContent), obtainedContent) == 0);
        }

        [TestMethod]
        [ExpectedException(typeof(NotFoundException))]
        public void Get_ContentNotFound_ExceptionThrown()
        {
            int toGetContentId = 1;

            Mock<IContentLogic> mock = new Mock<IContentLogic>(MockBehavior.Strict);
            mock.Setup(m => m.GetContent(toGetContentId)).Throws(new NotFoundException(toGetContentId.ToString()));
            ContentsController controller = new ContentsController(mock.Object);

            IActionResult result = controller.Get(toGetContentId);
            OkObjectResult objectResult = result as OkObjectResult;
            ContentBasicInfo obtainedContent = objectResult.Value as ContentBasicInfo;

            mock.VerifyAll();
            Assert.IsNull(obtainedContent);
        }

        [TestMethod]
        public void Post_DataIsCorrect_Created()
        {
            ContentModel contentModel = new ContentModel()
            {
                ArtistName = "Bon Jovi",
                Categories = new int[] { 1 },
                Playlists = new List<PlaylistBasicInfo>()
                {
                    new PlaylistBasicInfo()
                    {
                        Id = 1,
                        Name = "Best of Bon Jovi"
                    }
                },
                Id = 1,
                ContentLength = "00:01:30",
                Name = "It's My Life",
                ImageUrl = "http://www.images.com/image.jpg",
                ContentUrl = "http://www.audios.com/audio.mp3",
                ContentType = "audio"
            };
            Content contentEntity = contentModel.ToEntity();

            Mock<IContentLogic> contentLogic = new Mock<IContentLogic>(MockBehavior.Strict);
            contentLogic.Setup(m => m.CreateContent(It.IsAny<Content>()));
            contentLogic.Setup(m => m.GetContent(contentEntity.Id)).Returns(contentEntity);

            ContentsController controller = new ContentsController(contentLogic.Object);

            controller.Post(contentModel);
            IActionResult result = controller.Get(contentEntity.Id);
            OkObjectResult objectResult = result as OkObjectResult;
            ContentModel obtainedContent = objectResult.Value as ContentModel;
            Assert.IsTrue(obtainedContent.Id == contentEntity.Id);
        }

        [TestMethod]
        public void Post_NoPlaylist_Created()
        {
            ContentModel contentModel = new ContentModel()
            {
                ArtistName = "Bon Jovi",
                Categories = new int[] { 1 },
                Id = 1,
                ContentLength = "00:01:30",
                Name = "It's My Life",
                ImageUrl = "http://www.images.com/image.jpg",
                ContentUrl = "http://www.audios.com/audio.mp3",
                ContentType = "audio"
            };
            Content contentEntity = contentModel.ToEntity();

            Mock<IContentLogic> contentLogic = new Mock<IContentLogic>(MockBehavior.Strict);
            contentLogic.Setup(m => m.CreateContent(It.IsAny<Content>()));
            contentLogic.Setup(m => m.GetContent(contentEntity.Id)).Returns(contentEntity);

            ContentsController controller = new ContentsController(contentLogic.Object);

            controller.Post(contentModel);
            IActionResult result = controller.Get(contentEntity.Id);
            OkObjectResult objectResult = result as OkObjectResult;
            ContentModel obtainedContent = objectResult.Value as ContentModel;
            Assert.IsTrue(obtainedContent.Id == contentEntity.Id);
        }

        [TestMethod]
        [ExpectedException(typeof(NotFoundException))]
        public void Post_CategoryNotFound_ExceptionThrown()
        {
            ContentModel contentModel = new ContentModel()
            {
                ArtistName = "Bon Jovi",
                Categories = new int[] { 9999 },
                Playlists = new List<PlaylistBasicInfo>()
                {
                    new PlaylistBasicInfo()
                    {
                        Id = 1,
                        Name = "Best of Bon Jovi"
                    }
                },
                Id = 1,
                ContentLength = "00:01:30",
                Name = "It's My Life",
                ImageUrl = "http://www.images.com/image.jpg",
                ContentUrl = "http://www.audios.com/audio.mp3"
            };
            Content contentEntity = contentModel.ToEntity();

            Mock<IContentLogic> contentLogic = new Mock<IContentLogic>(MockBehavior.Strict);
            contentLogic.Setup(m => m.CreateContent(It.IsAny<Content>())).Throws(new NotFoundException(contentEntity.Id.ToString()));
            contentLogic.Setup(m => m.GetContent(contentEntity.Id)).Throws(new NotFoundException(contentEntity.Id.ToString()));

            ContentsController controller = new ContentsController(contentLogic.Object);

            controller.Post(contentModel);
            IActionResult result = controller.Get(contentEntity.Id);
            OkObjectResult objectResult = result as OkObjectResult;
            ContentBasicInfo obtainedContent = objectResult.Value as ContentBasicInfo;
            Assert.IsNull(obtainedContent);
        }

        [TestMethod]
        [ExpectedException(typeof(UnableToCreatePlaylistException))]
        public void Post_NewPlaylistInvalidData_ExceptionThrown()
        {
            ContentModel contentModel = new ContentModel()
            {
                ArtistName = "Bon Jovi",
                Categories = new int[] { 9999 },
                Playlists = new List<PlaylistBasicInfo>()
                {
                    new PlaylistBasicInfo()
                    {
                        Id = 1
                    }
                },
                Id = 1,
                ContentLength = "00:01:30",
                Name = "It's My Life",
                ImageUrl = "http://www.images.com/image.jpg",
                ContentUrl = "http://www.audios.com/audio.mp3"
            };
            Content contentEntity = contentModel.ToEntity();

            Mock<IContentLogic> contentLogic = new Mock<IContentLogic>(MockBehavior.Strict);
            contentLogic.Setup(m => m.CreateContent(It.IsAny<Content>())).Throws(new UnableToCreatePlaylistException());
            contentLogic.Setup(m => m.GetContent(contentEntity.Id)).Throws(new NotFoundException(contentEntity.Id.ToString()));

            ContentsController controller = new ContentsController(contentLogic.Object);

            controller.Post(contentModel);
            IActionResult result = controller.Get(contentEntity.Id);
            OkObjectResult objectResult = result as OkObjectResult;
            ContentBasicInfo obtainedContent = objectResult.Value as ContentBasicInfo;
            Assert.IsNull(obtainedContent);
        }

        [TestMethod]
        [ExpectedException(typeof(MissingCategoriesException))]
        public void Post_NoCategories_ExceptionThrown()
        {
            ContentModel contentModel = new ContentModel()
            {
                ArtistName = "Bon Jovi",
                Playlists = new List<PlaylistBasicInfo>()
                {
                    new PlaylistBasicInfo()
                    {
                        Id = 1
                    }
                },
                Id = 1,
                ContentLength = "00:01:30",
                Name = "It's My Life",
                ImageUrl = "http://www.images.com/image.jpg",
                ContentUrl = "http://www.audios.com/audio.mp3"
            };
            Content contentEntity = contentModel.ToEntity();

            Mock<IContentLogic> contentLogic = new Mock<IContentLogic>(MockBehavior.Strict);
            contentLogic.Setup(m => m.CreateContent(It.IsAny<Content>())).Throws(new MissingCategoriesException());
            contentLogic.Setup(m => m.GetContent(contentEntity.Id)).Throws(new NotFoundException(contentEntity.Id.ToString()));

            ContentsController controller = new ContentsController(contentLogic.Object);

            controller.Post(contentModel);
            IActionResult result = controller.Get(contentEntity.Id);
            OkObjectResult objectResult = result as OkObjectResult;
            ContentBasicInfo obtainedContent = objectResult.Value as ContentBasicInfo;
            Assert.IsNull(obtainedContent);
        }

        [TestMethod]
        [ExpectedException(typeof(NotFoundException))]
        public void Delete_ContentFound_Deleted()
        {
            int toDeleteContent = 1;

            Mock<IContentLogic> mock = new Mock<IContentLogic>(MockBehavior.Strict);
            mock.Setup(m => m.DeleteContent(toDeleteContent));
            mock.Setup(m => m.GetContent(toDeleteContent)).Throws(new NotFoundException(toDeleteContent.ToString()));
            ContentsController controller = new ContentsController(mock.Object);

            IActionResult result = controller.Delete(toDeleteContent);
            IActionResult getResult = controller.Get(toDeleteContent);
            OkObjectResult objectResult = getResult as OkObjectResult;
            ContentBasicInfo obtainedContent = objectResult.Value as ContentBasicInfo;

            mock.VerifyAll();
            Assert.IsNull(obtainedContent);
        }

        [TestMethod]
        public void Patch_DataIsCorrect_Updated()
        {
            ContentModel contentModel = new ContentModel()
            {
                ArtistName = "Bon Jovi",
                Categories = new int[] { 1 },
                Playlists = new List<PlaylistBasicInfo>()
                {
                    new PlaylistBasicInfo()
                    {
                        Id = 1,
                        Name = "Best of Bon Jovi"
                    }
                },
                Id = 1,
                ContentLength = "00:01:30",
                Name = "It's My Life",
                ImageUrl = "http://www.images.com/image.jpg",
                ContentUrl = "http://www.audios.com/audio.mp3",
                ContentType = "audio"
            };
            Content contentEntity = contentModel.ToEntity();

            Mock<IContentLogic> contentLogic = new Mock<IContentLogic>(MockBehavior.Strict);
            contentLogic.Setup(m => m.UpdateContent(It.IsAny<Content>()));
            contentLogic.Setup(m => m.GetContent(contentEntity.Id)).Returns(contentEntity);

            ContentsController controller = new ContentsController(contentLogic.Object);

            controller.Patch(contentModel);
            IActionResult result = controller.Get(contentEntity.Id);
            OkObjectResult objectResult = result as OkObjectResult;
            ContentModel obtainedContent = objectResult.Value as ContentModel;
            Assert.IsTrue((new ContentModelComparer()).
               Compare(new ContentModel(contentEntity), obtainedContent) == 0);
        }

        [TestMethod]
        [ExpectedException(typeof(NotFoundException))]
        public void Patch_CategoryNotFound_ExceptionThrown()
        {
            ContentModel contentModel = new ContentModel()
            {
                ArtistName = "Bon Jovi",
                Categories = new int[] { 9999 },
                Playlists = new List<PlaylistBasicInfo>()
                {
                    new PlaylistBasicInfo()
                    {
                        Id = 1,
                        Name = "Best of Bon Jovi"
                    }
                },
                Id = 1,
                ContentLength = "00:01:30",
                Name = "It's My Life",
                ImageUrl = "http://www.images.com/image.jpg",
                ContentUrl = "http://www.audios.com/audio.mp3"
            };
            Content contentEntity = contentModel.ToEntity();

            Mock<IContentLogic> contentLogic = new Mock<IContentLogic>(MockBehavior.Strict);
            contentLogic.Setup(m => m.UpdateContent(It.IsAny<Content>())).Throws(new NotFoundException(contentEntity.Categories.ElementAt(0).ToString()));
            contentLogic.Setup(m => m.GetContent(contentEntity.Id)).Throws(new NotFoundException(contentEntity.Id.ToString()));

            ContentsController controller = new ContentsController(contentLogic.Object);

            controller.Patch(contentModel);
            IActionResult result = controller.Get(contentEntity.Id);
            OkObjectResult objectResult = result as OkObjectResult;
            ContentBasicInfo obtainedContent = objectResult.Value as ContentBasicInfo;
            Assert.IsNull(obtainedContent);
        }

        [TestMethod]
        [ExpectedException(typeof(UnableToCreatePlaylistException))]
        public void Patch_NewPlaylistInvalidData_ExceptionThrown()
        {
            ContentModel contentModel = new ContentModel()
            {
                ArtistName = "Bon Jovi",
                Categories = new int[] { 9999 },
                Playlists = new List<PlaylistBasicInfo>()
                {
                    new PlaylistBasicInfo()
                    {
                        Id = 1
                    }
                },
                Id = 1,
                ContentLength = "00:01:30",
                Name = "It's My Life",
                ImageUrl = "http://www.images.com/image.jpg",
                ContentUrl = "http://www.audios.com/audio.mp3"
            };
            Content contentEntity = contentModel.ToEntity();

            Mock<IContentLogic> contentLogic = new Mock<IContentLogic>(MockBehavior.Strict);
            contentLogic.Setup(m => m.UpdateContent(It.IsAny<Content>())).Throws(new UnableToCreatePlaylistException());
            contentLogic.Setup(m => m.GetContent(contentEntity.Id)).Throws(new NotFoundException(contentEntity.Id.ToString()));

            ContentsController controller = new ContentsController(contentLogic.Object);

            controller.Patch(contentModel);
            IActionResult result = controller.Get(contentEntity.Id);
            OkObjectResult objectResult = result as OkObjectResult;
            ContentBasicInfo obtainedContent = objectResult.Value as ContentBasicInfo;
            Assert.IsNull(obtainedContent);
        }

        [TestMethod]
        [ExpectedException(typeof(MissingCategoriesException))]
        public void Patch_NoCategories_ExceptionThrown()
        {
            ContentModel contentModel = new ContentModel()
            {
                ArtistName = "Bon Jovi",
                Playlists = new List<PlaylistBasicInfo>()
                {
                    new PlaylistBasicInfo()
                    {
                        Id = 1
                    }
                },
                Id = 1,
                ContentLength = "00:01:30",
                Name = "It's My Life",
                ImageUrl = "http://www.images.com/image.jpg",
                ContentUrl = "http://www.audios.com/audio.mp3"
            };
            Content contentEntity = contentModel.ToEntity();

            Mock<IContentLogic> contentLogic = new Mock<IContentLogic>(MockBehavior.Strict);
            contentLogic.Setup(m => m.UpdateContent(It.IsAny<Content>())).Throws(new MissingCategoriesException());
            contentLogic.Setup(m => m.GetContent(contentEntity.Id)).Throws(new NotFoundException(contentEntity.Id.ToString()));

            ContentsController controller = new ContentsController(contentLogic.Object);

            controller.Patch(contentModel);
            IActionResult result = controller.Get(contentEntity.Id);
            OkObjectResult objectResult = result as OkObjectResult;
            ContentBasicInfo obtainedContent = objectResult.Value as ContentBasicInfo;
            Assert.IsNull(obtainedContent);
        }

        [TestMethod]
        [ExpectedException(typeof(NotFoundException))]
        public void Patch_ContentNotFound_ExceptionThrown()
        {
            ContentModel contentModel = new ContentModel()
            {
                ArtistName = "Bon Jovi",
                Playlists = new List<PlaylistBasicInfo>()
                {
                    new PlaylistBasicInfo()
                    {
                        Id = 1
                    }
                },
                Id = 1,
                ContentLength = "00:01:30",
                Name = "It's My Life",
                ImageUrl = "http://www.images.com/image.jpg",
                ContentUrl = "http://www.audios.com/audio.mp3"
            };
            Content contentEntity = contentModel.ToEntity();

            Mock<IContentLogic> contentLogic = new Mock<IContentLogic>(MockBehavior.Strict);
            contentLogic.Setup(m => m.UpdateContent(It.IsAny<Content>())).Throws(new NotFoundException(contentEntity.Id.ToString()));
            contentLogic.Setup(m => m.GetContent(contentEntity.Id)).Throws(new NotFoundException(contentEntity.Id.ToString()));

            ContentsController controller = new ContentsController(contentLogic.Object);

            controller.Patch(contentModel);
            IActionResult result = controller.Get(contentEntity.Id);
            OkObjectResult objectResult = result as OkObjectResult;
            ContentBasicInfo obtainedContent = objectResult.Value as ContentBasicInfo;
            Assert.IsNull(obtainedContent);
        }

        [TestMethod]
        public void Get_ContentsByContentTypeExist_Fetched()
        {
            Content content = new Content()
            {
                ArtistName = "Bon Jovi",
                Categories = new List<Category>(){
                        new Category()
                        {
                            Id = 1,
                            Name = "Rock"
                        }
                    },
                Id = 1,
                ContentLength = new TimeSpan(0, 2, 30),
                Name = "It's My Life",
                ImageUrl = "http://www.images.com/image.jpg",
                ContentUrl = "http://www.audios.com/audio.mp3",
                ContentType = new ContentType()
                {
                    Id = 1,
                    Name = "audio"
                }
            };

            List<Content> expectedContents = new List<Content>()
            {
                content
            };

            Mock<IContentLogic> mock = new Mock<IContentLogic>(MockBehavior.Strict);
            mock.Setup(m => m.GetContents(content.ContentType.Name)).Returns(expectedContents);
            ContentsController controller = new ContentsController(mock.Object);

            IActionResult result = controller.Get(content.ContentType.Name);
            OkObjectResult objectResult = result as OkObjectResult;
            IEnumerable<ContentBasicInfo> obtainedContents = objectResult.Value as IEnumerable<ContentBasicInfo>;

            mock.VerifyAll();
            CollectionAssert.AreEqual(expectedContents.
                Select(content => new ContentBasicInfo(content)).
                ToList(),
                obtainedContents.ToList(),
                new ContentBasicInfoComparer());
        }
    }
}
