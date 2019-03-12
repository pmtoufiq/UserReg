using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UserRegSample.Manager;
using UserRegSample.Models;

namespace UserRegSample.Controllers
{
    public class UserController : Controller
    {
        CountryManager countryManager = new CountryManager();
        CityManager cityManager = new CityManager();
        UserManager userManager = new UserManager();
        // GET: User
        [HttpGet]
        public ActionResult Index()
        {
            ViewBag.Countries = countryManager.GetAllCountry();
            return View();
        }
        [HttpPost]
        public ActionResult Index(User user)
        {
            ViewBag.Message = userManager.Save(user);
            ViewBag.Countries = countryManager.GetAllCountry();
            return RedirectToAction("ViewAllUser");
        }

        public List<Country> GetAllCountry()
        {
            return countryManager.GetAllCountry();
        }

        public List<City> GetAllCity()
        {
            return cityManager.GetAllCity();
        }

        public JsonResult GetCityByCountryId(int CountryId)
        {
            var cities = GetAllCity();
            var cityList = cities.Where(a => a.CountryId == CountryId).ToList();
            return Json(cityList);
        }

        public List<User> GetAllUser()
        {
            return userManager.GetAllUser();
        }

        public ActionResult ViewAllUser()
        {
            List<User> users = userManager.GetAllUser();
            return View(users);
        }

        public JsonResult GetUserById(int UserId)
        {
            var users = GetAllUser();
            var userList = users.Where(a => a.UserId == UserId).ToList();
            return Json(userList);
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var user = GetAllUser().Where(s => s.UserId == id).FirstOrDefault();
            ViewBag.Countries = countryManager.GetAllCountry();
            ViewBag.Cities = cityManager.GetAllCity();
            return View(user);
        }

        [HttpPost]
        public ActionResult Edit(User user)
        {
            ViewBag.UpdateMessage = userManager.UpdateUser(user);
            ViewBag.Countries = countryManager.GetAllCountry();
            ViewBag.Cities = cityManager.GetAllCity();
            return RedirectToAction("ViewAllUser");
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var user = GetAllUser().Where(s => s.UserId == id).FirstOrDefault();
            return View(user);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult ConfirmDelete(int id)
        {
            ViewBag.DeleteMessage = userManager.DeleteUser(id);
            return RedirectToAction("ViewAllUser");
        }
    }
}