using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UserRegSample.Models;

namespace UserRegSample.Gateway
{
    public class CountryGateway:Gateway
    {
        public List<Country> GetAllCountry()
        {
            Connection.Open();
            Query = "Select * from CountryTable";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            List<Country> countryList = new List<Country>();
            while (Reader.Read())
            {
                Country country = new Country
                {
                    CountryId = (int)Reader["CountryId"],
                    CountryName = (string)Reader["CountryName"],
                };
                countryList.Add(country);
            }
            Connection.Close();
            Reader.Close();
            return countryList;
        }
    }
}