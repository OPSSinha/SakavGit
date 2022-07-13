using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

namespace BachatBazaar
{
    public partial class Single : System.Web.UI.Page
    {
        MyDataConnection MDC = new MyDataConnection();
        public int Id = 0;
        public string strUsers = "";

        public string SakavFirm = "";
        public string strPhones = "";
        public string strEmailId = "";

        public string strImageHeading = "";
        public string strRate = "";
        public string strDisc = "";
        public string strID = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            GetSingleTop1();
            GetFirmDetail();

        }
        //protected void btnSubmit_Click(object sender, EventArgs e)
        //{
        //    DataTable dt = MDC.getDataTable("select * from UserMaster where UserName='" + txtUserName.Value + "' and Password='" + txtPaasword.Value + "' and UserType='admin'");
        //    if (dt.Rows.Count > 0)
        //    {
        ////        Response.Redirect("AdminPanel.aspx");
        //    }
        //    else
        //    {
        //        Response.Redirect("Dashboard.aspx");
        //    }
        //}
        protected void GetFirmDetail()
        {
            string strUser = "";

            if (!string.IsNullOrWhiteSpace(Request.QueryString["user"]))
            {
                strUser = Request.QueryString["user"].ToString();
            }
            else
            {
                strUser = "a";
            }
            strUsers = strUser;
            if (strUser == "a")
            {
                SakavFirm = "Sakav";
                strPhones = "9755496553 <br/> 7898703946";
                strEmailId = "techmasu@gmail.com";
            }
            else
            {
                DataTable dtt = MDC.getDataTable("Select * from Individual_App1 where UserName='" + strUser + "'");
                if (dtt.Rows.Count > 0)
                {
                    SakavFirm = dtt.Rows[0]["Firm"].ToString() + "";
                    strPhones = Convert.ToString(dtt.Rows[0]["MobileNo"].ToString() + "") + ",<br/>" + Convert.ToString(dtt.Rows[0]["TelephoneNo"].ToString() + "");
                    strEmailId = dtt.Rows[0]["MailId"].ToString() + "";
                }
            }
        }
        [WebMethod]
        public static string PelFunction(string ImageId)
        {
            string x = "";
            using (var cnt = ConnectionManager.Inst.CreateNewConnection())
            {
                SqlDataAdapter da = new SqlDataAdapter("Select * from ItemMaster where PK_ItemId=" + Convert.ToInt32(ImageId) + "", cnt);
                DataSet dst = new DataSet();
                da.Fill(dst);

                if (dst.Tables[0].Rows.Count > 0)
                {
                    DataSet dss = new DataSet();

                    DataSet dsOrder = new DataSet();
                    dss = (DataSet)HttpContext.Current.Session["ds"];
                    dsOrder = dss.Copy();
                    DataRow dr;
                    dr = dsOrder.Tables[0].NewRow();
                    dr["ImageId"] = ImageId;
                    dr["ImageName"] = dst.Tables[0].Rows[0]["ImageName"].ToString();
                    dr["Qty"] = 1;
                    dr["Rate"] = dst.Tables[0].Rows[0]["Rate"].ToString(); ;
                    dr["SaveRate"] = dst.Tables[0].Rows[0]["OfferRate"].ToString();
                    dr["Category"] = dst.Tables[0].Rows[0]["CategoryName"].ToString();
                    dsOrder.Tables[0].Rows.Add(dr);
                    HttpContext.Current.Session["ds"] = dsOrder;
                    return x;
                }
            }
            return x;
        }
        public string MainMenu()
        {
            int i = 1;
            string strHtml = "";
            DataTable dt = MDC.getDataTable("select * from SubCategoryMaster where CategoryName='KITCHEN'");
            if (dt.Rows.Count > 0)
            {
                strHtml += "<li class='dropdown'>";
                //strHtml += "<a href = '#' class='dropdown-toggle nav-stylehead' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>KITCHEN";
                strHtml += "<span class='caret'></span></a>";
                strHtml += "<ul class='dropdown-menu multi-column columns-3'>";
                strHtml += "<div class='agile_inner_drop_nav_info'>";

                //  < div class="col-sm-6 multi-gd-img">
                //                 <ul class="multi-column-dropdown">
                strHtml += "<div class='col-sm-4 multi-gd-img'>";
                strHtml += "<ul class='multi-column-dropdown'>";

                int k = 1;
                foreach (DataRow dr in dt.Rows)
                {

                    strHtml += "<li>" +
                        "<a href = 'Product.aspx?txt=" + dr["SubCategoryName"].ToString() + "'>" + dr["SubCategoryName"].ToString() + "</a>";
                    strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href='Product.aspx'>Baking Supplies</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'> Coffee, Tea & Beverages</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'> Dried Fruits, Nuts</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'> Sweets, Chocolate</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'>Spices & Masalas</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href= 'Product.aspx'>Jams, Honey & Spreads</a>";
                    //strHtml += "</li>";
                    ////if (i == 11)
                    //{
                    //    strHtml += "</ul>";
                    //    strHtml += "</div>";
                    //    strHtml += "<div class='col-sm-4 multi-gd-img'>";
                    //    strHtml += "<ul class='multi-column-dropdown'>";

                    //}
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'>Pickles</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href='Product.aspx'>Pasta & Noodles</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'>Rice, Flour & Pulses</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'>Sauces & Cooking Pastes</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'>Snack Foods</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'>Oils, Vinegars</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'>Meat, Poultry & Seafood</a>";
                    //strHtml += "</li>";
                    k = k + 1;
                    if (k == 11)
                    {
                        strHtml += "</ul>";
                        strHtml += "</div>";
                        strHtml += "<div class='col-sm-4 multi-gd-img'>";
                        strHtml += "<ul class='multi-column-dropdown'>";

                    }

                }
            }
            strHtml += "</ul>";
            strHtml += "</div>";
            strHtml += "<div class='col-sm-4 multi-gd-img'>";
           // strHtml += "<img src = 'images/nav.png' alt=''>";
            strHtml += "</div>";
            strHtml += "<div class='clearfix'></div>";
            strHtml += "</div>";
            strHtml += "</ul>";
            strHtml += "</li>";
            return strHtml;

        }

        public string MainMenu1()
        {
            int i = 1;
            string strHtml = "";
            DataTable dt = MDC.getDataTable("select * from SubCategoryMaster where CategoryName='Personal Care'");
            if (dt.Rows.Count > 0)
            {
                strHtml += "<li class='dropdown'>";
               // strHtml += "<a href = '#' class='dropdown-toggle nav-stylehead' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'>Personal Care";
                strHtml += "<span class='caret'></span></a>";
                strHtml += "<ul class='dropdown-menu multi-column columns-3'>";
                strHtml += "<div class='agile_inner_drop_nav_info'>";

                //  < div class="col-sm-6 multi-gd-img">
                //                 <ul class="multi-column-dropdown">
                strHtml += "<div class='col-sm-4 multi-gd-img'>";
                strHtml += "<ul class='multi-column-dropdown'>";

                int k = 1;
                foreach (DataRow dr in dt.Rows)
                {

                    strHtml += "<li>" +
                        "<a href = 'Product.aspx?txt=" + dr["SubCategoryName"].ToString() + "'>" + dr["SubCategoryName"].ToString() + "</a>";
                    strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href='Product.aspx'>Baking Supplies</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'> Coffee, Tea & Beverages</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'> Dried Fruits, Nuts</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'> Sweets, Chocolate</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'>Spices & Masalas</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href= 'Product.aspx'>Jams, Honey & Spreads</a>";
                    //strHtml += "</li>";
                    ////if (i == 11)
                    //{
                    //    strHtml += "</ul>";
                    //    strHtml += "</div>";
                    //    strHtml += "<div class='col-sm-4 multi-gd-img'>";
                    //    strHtml += "<ul class='multi-column-dropdown'>";

                    //}
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'>Pickles</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href='Product.aspx'>Pasta & Noodles</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'>Rice, Flour & Pulses</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'>Sauces & Cooking Pastes</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'>Snack Foods</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'>Oils, Vinegars</a>";
                    //strHtml += "</li>";
                    //strHtml += "<li>";
                    //strHtml += "<a href = 'Product.aspx'>Meat, Poultry & Seafood</a>";
                    //strHtml += "</li>";
                    k = k + 1;
                    if (k == 11)
                    {
                        strHtml += "</ul>";
                        strHtml += "</div>";
                        strHtml += "<div class='col-sm-4 multi-gd-img'>";
                        strHtml += "<ul class='multi-column-dropdown'>";

                    }

                }
            }
            strHtml += "</ul>";
            strHtml += "</div>";
            strHtml += "<div class='col-sm-4 multi-gd-img'>";
          //  strHtml += "<img src = 'images/nav.png' alt=''>";
            strHtml += "</div>";
            strHtml += "<div class='clearfix'></div>";
            strHtml += "</div>";
            strHtml += "</ul>";
            strHtml += "</li>";
            return strHtml;

        }
        //public string GetSingleTop1()
        public string SetAllItems()

        {
            string htmlStr = "";
            DataTable dt = MDC.getDataTable("Select * from ItemMaster where IsActive=1 order by ItemName");
            //htmlStr += "<ul>";
            foreach (DataRow dr in dt.Rows)
            {
                htmlStr += "<option value = 'Single.aspx?Id=" + dr["PK_ItemId"].ToString()+"&user=" + Session["UserName"] + "'>" + dr["ItemName"].ToString() + "</option>";
                //htmlStr += "<Li>";
                //htmlStr += "<a href='Product.aspx?txt=" + dr["SubCategoryName"].ToString() + "'>" + dr["SubCategoryName"].ToString() + "</a>";
                //htmlStr += "</Li>";
            }
            //htmlStr += "</ul>";
            return htmlStr;
        }
        protected  string GetSingleTop1()
        {
            strID =  Request.QueryString["Id"].ToString();
            string htmlStr = "";
            DataTable dt = MDC.getDataTable("select * from ItemMaster where PK_ItemId="+Convert.ToInt32(strID));
            if (dt.Rows.Count > 0)
            {
                htmlStr += "<li data-thumb = 'ProductImage/" + dt.Rows[0]["ImageName"] + "'>";
                htmlStr += "<div class='thumb-image'>";
                htmlStr += "<img src = 'ProductImage/" + dt.Rows[0]["ImageName"] + "' data-imagezoom='true' class=img-responsive' alt=''> </div>";

                htmlStr += "<li data-thumb = 'ProductImage/" + dt.Rows[0]["ImageName"] + "'>";
                htmlStr += "<div class='thumb-image'>";
                htmlStr += "<img src = 'ProductImage/" + dt.Rows[0]["ImageName"] + "' data-imagezoom='true' class=img-responsive' alt=''> </div>";

                htmlStr += "<li data-thumb = 'ProductImage/" + dt.Rows[0]["ImageName"]+"'>";
                htmlStr += "<div class='thumb-image'>";
                htmlStr += "<img src = 'ProductImage/" + dt.Rows[0]["ImageName"] + "' data-imagezoom='true' class=img-responsive' alt=''> </div>";
                lblSingleHeading.Text = dt.Rows[0]["ItemName"].ToString();
                strImageHeading= dt.Rows[0]["ItemName"].ToString();
                strRate = dt.Rows[0]["Rate"].ToString();
                lblRate.Text = strRate;
                lblOfferRate.Text = dt.Rows[0]["OfferRate"].ToString()+"";
                strDisc = dt.Rows[0]["Discount"].ToString()+"";
                lblCOD.Text = " Cash on Delivery Eligible.";
                if (Convert.ToBoolean(dt.Rows[0]["IsCOD"])==true)
                {
                  
                }
                if (Convert.ToBoolean(dt.Rows[0]["IsFreeDel"]) == true)
                {
                    lblFree.Text = "Free delivery";
                }
            }
                //             </li>
            return htmlStr;
        }
    }
}