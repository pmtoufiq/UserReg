using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UserRegSample.Gateway;
using UserRegSample.Models;

namespace UserRegSample.Manager
{
    public class CountryManager
    {
        CountryGateway countryGateway = new CountryGateway();
        public List<Country> GetAllCountry()
        {
            return countryGateway.GetAllCountry();
        }
    }
}