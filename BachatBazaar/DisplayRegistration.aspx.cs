using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using System.Collections;
using System.Web.Script.Serialization;
using System.IO;
using System.Configuration;

namespace BachatBazaar
{
    public partial class DisplayRegistration : System.Web.UI.Page
    {
        DataTable dt;
        DataRow dr;
        bool isSave = false;
        MyDataConnection MDC = new MyDataConnection();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["kirana"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // DisabledText();
                FillCategory();
                GetData();
                BindGrid();
            }
        }
        protected void FillCategory()
        {
            Int32 k = 0;
            // string strUser = Session["UserName"].ToString();
            DataTable dt = MDC.getDataTable("select Distinct CategoryName from CategoryMaster order by CategoryName");

            if (dt.Rows.Count > 0)
            {
                drpBcategory.Items.Add("Select");
                foreach (DataRow dr in dt.Rows)
                {

                    drpBcategory.Items.Add(dt.Rows[k]["CategoryName"].ToString());
                    // drpCategorySearch1.Items.Add(dt.Rows[k]["CategoryName"].ToString());


                    k = k + 1;
                }

            }



        }
        protected void imgDownload_Click(object sender, EventArgs e)
        {
            try
            {
                ImageButton imgBtn = sender as ImageButton;
                GridViewRow gvrow = imgBtn.NamingContainer as GridViewRow;
                //Get the Image path from the DataKeyNames          
                string ImgPath = grdImages.DataKeys[gvrow.RowIndex].Values["Image_Path"].ToString();
                Response.AddHeader("Content-Disposition", "attachment;filename=\"" + ImgPath + "\"");
                Response.TransmitFile(Server.MapPath(ImgPath));
                Response.End();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
            }
        }

        protected void DisabledText()
        {
            txtRs.Enabled = false;
            txtRegNo.Enabled = false;
            txtRefMember.Enabled = false;
            txtRank.Enabled = false;
            txtEnglishName.Enabled = false;
            txtFatherEnglishName.Enabled = false;
            txtSurNameEng.Enabled = false;
            txtJilaEnglish.Enabled = false;
            txtState.Enabled = false;
            txtCityEnglish.Enabled = false;
            txtCity.Enabled = false;
            txtCityEnglish.Enabled = false;
            txtBlockEnglish.Enabled = false;
            txtBlockEnglish.Enabled = false;
            txtUsername.Enabled = false;
            txtPin.Enabled = false;
            txtMobile.Enabled = false;
            txtPaymentMode.Enabled = false;
            txtAddressEnglish.Enabled = false;

        }
        protected void GetData()
        {
            int Id = Convert.ToInt32(Request["Id"].ToString());

            string ssql = "";

            if (Id > 0)
            {
                ssql = "select * from Individual_App1 where PK_APP_ID=" + Id;
                DataTable dt = MDC.getDataTable("select * from Individual_App1 where PK_APP_ID1=" + Id);

                if (dt.Rows.Count > 0)
                {
                    //Image1.ImageUrl = "~/Files/" + Id + ".jpg";
                    foreach (DataRow dr in dt.Rows)
                    {
                        txtRegNo.Text = dr["PK_App_ID1"].ToString();
                        txtRefMember.Text = dr["RefMember"].ToString();
                        txtRank.Text = dr["TypeName"].ToString();
                        txtEnglishName.Text = dr["UpperNameEnglish"].ToString();
                        txtFatherEnglishName.Text = dr["FatherName"].ToString();
                        txtSurNameEng.Text = dr["SurNameEng"].ToString();
                        txtJilaEnglish.Text = dr["District"].ToString();
                        txtState.Text = dr["State"].ToString();
                        txtCityEnglish.Text = dr["City"].ToString();
                        txtCity.Text = dr["City"].ToString();
                        txtCityEnglish.Text = dr["City"].ToString();
                        txtBlockEnglish.Text = dr["Tehsil"].ToString();
                        txtBlockEnglish.Text = dr["District"].ToString();
                        txtUsername.Text = dr["Username"].ToString();
                        txtPin.Text = dr["PIN"].ToString();
                        txtMobile.Text = dr["MobileNo"].ToString();
                        txtPaymentMode.Text = dr["PaymentMode"].ToString();
                        txtRs.Text = dr["CategoryPrice"].ToString();
                        //txtChequeDate.Value = dr["ChequeDate"].ToString();
                        txtAddressEnglish.Text = dr["Address"].ToString();
                        txtPassword.Text = dr["Password"].ToString();
                        drpBcategory.Text = dr["Category"].ToString();


                        using (var cnt = ConnectionManager.Inst.CreateNewConnection())
                        {
                            string strMsg = "";
                            cnt.Open();
                            int ID = Convert.ToInt32(Request.QueryString["Id"].ToString());
                            SqlDataAdapter daUser = new SqlDataAdapter("select * from MainImage1 where PK_RegId=" + Id, cnt);
                            DataSet dsUser = new DataSet();
                            daUser.Fill(dsUser);
                            if (dsUser.Tables[0].Rows.Count > 0)
                            {
                                string img = dsUser.Tables[0].Rows[0]["ImageName"].ToString();
                                //FileUpload2 = dsUser.Tables[0].Rows[0]["Image1"].ToString();
                                //imgPhoto.ImageUrl = "~/Files/" + Path.GetFileName(filename1);
                                //Image1.ImageUrl = "~/Files/" + System.IO.Path.GetFileName(FileUpload2);
                             //   Image1.ImageUrl = "~/Files/" + img;
                            }

                            if (dr["Establish"] == System.DBNull.Value)
                            {
                                //ChkSthapna.Checked = false;
                            }
                            else
                            {
                                //ChkSthapna.Checked = Convert.ToBoolean(dr["Establish"]);
                            }

                            if (dr["Gst"] == System.DBNull.Value)
                            {
                                //chkGST.Checked = false;
                            }
                            else
                            {
                                //chkGST.Checked = Convert.ToBoolean(dr["Gst"]);
                            }
                            if (dr["Gumasta"] == System.DBNull.Value)
                            {
                                //  chkGST.Checked = false;
                            }
                            else
                            {
                                // chkGST.Checked = Convert.ToBoolean(dr["Gumasta"]);
                            }
                            if (dr["Other"] == System.DBNull.Value)
                            {
                                // chkOther.Checked = false;
                            }
                            else
                            {
                                // chkOther.Checked = Convert.ToBoolean(dr["Other"]);
                            }
                            //sm

                        }
                    }
                }
            }
        }

        protected void SetData()
        {
            int Id = Convert.ToInt32(Request["Id"].ToString());

            string ssql = "";

            if (Id > 0)
            {
                ssql = "select * from Individual_App1 where PK_APP_ID=" + Id;
                SqlDataAdapter  da =new SqlDataAdapter("select * from Individual_App1 where PK_APP_ID1=" + Id,con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        dr["PK_App_ID1"] = txtRegNo.Text;
                        dr["RefMember"] =txtRefMember.Text;
                        dr["TypeName"]=txtRank.Text;
                        dr["UpperNameEnglish"]=txtEnglishName.Text;
                        dr["FatherName"]=txtFatherEnglishName.Text;
                        dr["SurNameEng"]=txtSurNameEng.Text;
                        dr["District"]=txtJilaEnglish.Text;
                        dr["State"] = txtState.Text;
                        dr["City"]=txtCity.Text;
                        dr["City"] = txtCityEnglish.Text;
                        dr["Tehsil"] = txtBlockEnglish.Text;
                        dr["District"]=txtBlockEnglish.Text;
                        dr["Username"]=txtUsername.Text;
                        dr["PIN"]=txtPin.Text;
                        dr["MobileNo"]=txtMobile.Text;
                        dr["PaymentMode"]=txtPaymentMode.Text;
                        dr["CategoryPrice"]=txtRs.Text;
                        //txtChequeDate.Value = dr["ChequeDate"].ToString();
                        dr["Address"]=txtAddressEnglish.Text;
                        dr["Password"] = txtPassword.Text;// = .ToString();
                        dr["Category"] = drpBcategory.Text; //= .ToString();
                        dr["Firm"] = txtFirmName.Text;
                        SqlCommandBuilder cmbs = new SqlCommandBuilder(da);
                        da.Update(dt);
                        MessageBox.Show("Record Updated Successfully....");

                        }
                    }
                }
            }
        
        protected void BindGrid()
        {
            string Id1 = txtRegNo.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter();
            try
            {
                SqlCommand cmd = new SqlCommand("select * from Tb_Images where PK_RegId='" + Id1 + "'", con);
                adp.SelectCommand = cmd;
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {

                    grdImages.DataSource = dt;
                    grdImages.DataBind();
                }
                else
                {
                    grdImages.DataSource = null;
                    grdImages.DataBind();
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
            }
            finally
            {
                dt.Clear();
                dt.Dispose();
                adp.Dispose();
            }
        }

        public string TranslateText(string input)
        {
            // Set the language from/to in the url (or pass it into this function)
            string url = String.Format
            ("https://translate.googleapis.com/translate_a/single?client=gtx&sl={0}&tl={1}&dt=t&q={2}",
             "en", "hi", Uri.EscapeUriString(input));
            HttpClient httpClient = new HttpClient();
            string result = httpClient.GetStringAsync(url).Result;

            // Get all json data
            var jsonData = new JavaScriptSerializer().Deserialize<List<dynamic>>(result);

            // Extract just the first array element (This is the only data we are interested in)
            var translationItems = jsonData[0];

            // Translation Data
            string translation = "";

            // Loop through the collection extracting the translated objects
            foreach (object item in translationItems)
            {
                // Convert the item array to IEnumerable
                IEnumerable translationLineObject = item as IEnumerable;

                // Convert the IEnumerable translationLineObject to a IEnumerator
                IEnumerator translationLineString = translationLineObject.GetEnumerator();

                // Get first object in IEnumerator
                translationLineString.MoveNext();

                // Save its value (translated text)
                translation += string.Format(" {0}", Convert.ToString(translationLineString.Current));
            }

            // Remove first blank character
            if (translation.Length > 1) { translation = translation.Substring(1); };

            // Return translation
            return translation;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SetData();
        }
    }
}