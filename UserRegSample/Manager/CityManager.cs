using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UserRegSample.Gateway;
using UserRegSample.Models;

namespace UserRegSample.Manager
{
    
    public class CityManager
    {
        CityGateway cityGateway = new CityGateway();
        public List<City> GetAllCity()
        {
            return cityGateway.GetAllCity();
        }
    }
}