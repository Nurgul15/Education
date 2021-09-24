using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EducationEdmxProject
{
    class Program
    {
        static void Main(string[] args)
        {
            var context = new EducationEntities();
            IQueryable<User> users = context.Users;
            foreach (var user in users)
            {
                Console.WriteLine(user.FirstName);
            }

            Console.ReadLine();
        }
    }
}
