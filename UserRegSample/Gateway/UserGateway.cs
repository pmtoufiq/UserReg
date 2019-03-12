using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UserRegSample.Models;

namespace UserRegSample.Gateway
{
    public class UserGateway:Gateway
    {
        public int Save(User user)
        {
            Query =
                "INSERT INTO UserTable(UserName, Password, Email, DoB, CountryId, CityId) VALUES(@userName, @password, @email, @dob, @countryId, @cityId)";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("userName", user.UserName);
            Command.Parameters.AddWithValue("password", user.Password);
            Command.Parameters.AddWithValue("email", user.Email);
            Command.Parameters.AddWithValue("dob", user.DoB);
            Command.Parameters.AddWithValue("countryId", user.CountryId);
            Command.Parameters.AddWithValue("cityId", user.CityId);
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }

        public List<User> GetAllUser()
        {
            Connection.Open();
            Query = "select * from UserTable u inner join CountryTable cn on cn.CountryId = u.CountryId inner join CityTable ct on ct.CityId = u.CityId";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            List<User> userList = new List<User>();
            while (Reader.Read())
            {
                User user = new User
                {
                    UserId = (int)Reader["UserId"],
                    UserName = (string)Reader["UserName"],
                    Password = (string)Reader["Password"],
                    Email = (string)Reader["Email"],
                    DoB = (string)Reader["DoB"],
                    CountryId = (int)Reader["CountryId"],
                    CountryName = (string)Reader["CountryName"],
                    CityId = (int)Reader["CityId"],
                    CityName = (string)Reader["CityName"]
                };
                userList.Add(user);
            }
            Connection.Close();
            Reader.Close();
            return userList;
        }

        public int UpdateUser(User user)
        {
            Connection.Open();
            Query = "UPDATE UserTable SET UserName='" + user.UserName + "', Email='"+user.Email+"', DoB = '"+user.DoB+"', CountryId='"+user.CountryId+"', CityId='"+user.CityId+"' WHERE UserId = '" + user.UserId + "'";
            Command = new SqlCommand(Query, Connection);
            int rowCount = Command.ExecuteNonQuery();
            Connection.Close();
            return rowCount;
        }

        public int DeleteUser(int id)
        {
            Connection.Open();
            Query = "Delete from UserTable WHERE UserId = '" + id + "'";
            Command = new SqlCommand(Query, Connection);
            int rowCount = Command.ExecuteNonQuery();
            Connection.Close();
            return rowCount;
        }
    }
}