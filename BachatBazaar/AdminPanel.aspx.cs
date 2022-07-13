using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace BachatBazaar
{
    public partial class AdminPanel : System.Web.UI.Page
    {
        public string strUser = "";
        protected void Page_Load(object sender, EventArgs e)
        {
           

            strUser = Session["username"].ToString();
        }
    }
}