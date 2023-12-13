using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AdvisingWeb.DatabaseAccess
{
    public class StudentRegistration
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public int Semester { get; set; }
        public string Major { set; get; }
        public string Faculty { set; get; }

        public string Password { get; set; }

    }
}