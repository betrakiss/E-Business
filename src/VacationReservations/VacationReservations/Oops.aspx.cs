﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VacationReservations
{
    public partial class Oops : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // set the 500 status code
            Response.Status = "500 Internal Server Error";
        }
    }
}