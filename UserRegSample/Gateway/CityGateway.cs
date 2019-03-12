using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UserRegSample.Models;

namespace UserRegSample.Gateway
{
    public class CityGateway:Gateway
    {
        public List<City> GetAllCity()
        {
            Connection.Open();
            Query = "Select * from CityTable";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            List<City> cityList = new List<City>();
            while (Reader.Read())
            {
                City city = new City
                {
                    CityId = (int)Reader["CityId"],
                    CityName = (string)Reader["CityName"],
                    CountryId = (int)Reader["CountryId"]
                };
                cityList.Add(city);
            }
            Connection.Close();
            Reader.Close();
            return cityList;
        }
    }
}