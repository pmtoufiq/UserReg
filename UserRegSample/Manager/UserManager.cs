using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UserRegSample.Gateway;
using UserRegSample.Models;

namespace UserRegSample.Manager
{
    public class UserManager
    {
        UserGateway userGateway = new UserGateway();
        public string Save(User user)
        {
            if (userGateway.Save(user) > 0)
            {
                return "User saved successfully.";
            }
            return "Failed to save the user.";
        }

        public List<User> GetAllUser()
        {
            return userGateway.GetAllUser();
        }

        public string UpdateUser(User user)
        {

            int rowCount = userGateway.UpdateUser(user);
            if (rowCount > 0)
            {
                return "User updated successfully.";
            }
            return "User is not updated";
        }

        public string DeleteUser(int id)
        {
            int rowCount = userGateway.DeleteUser(id);
            if (rowCount > 0)
            {
                return "User deleted successfully.";
            }else
            {
                return "User is not deleted";
            }
            
        }
    }
}