using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Http;
using System.Collections;
using System.Web.Script.Serialization;
using System.IO;
using System.Configuration;
using SD = System.Drawing;

namespace BachatBazaar
{
    public partial class Registration : System.Web.UI.Page
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
                chkAdharCard.Enabled = false;
                chkPayementSlip.Enabled = false;
              //  btnUpload.Enabled = false;
                chkPhoto.Enabled = false;
                

                FillCategory();
               // FillCoordinator();
                GetState();
                //GetPinCode();
                FillUpload();
                getRegNo();
                BindGrid();

                //getFiles();
            }
           
        }
        protected void FillUpload()
        {
            ddlId.Items.Add("SELECT");
            ddlId.Items.Add("Adhar Card");
            ddlId.Items.Add("Payment Slip");
            ddlId.Items.Add("Photo");
        }
        protected void GetState()
        {
            DataTable dt = MDC.getDataTable("select distinct State from RTO");
            if (dt.Rows.Count > 0)
            {
                DrpState.DataSource = dt;
                DrpState.DataTextField = "State";
                DrpState.DataValueField = "State";
                DrpState.DataBind();
            }
        }

        protected void GetPinCode()
        {
            DataTable dt = MDC.getDataTable("select distinct Pincode from PinCode where City ='"+DrpCity.Text+"'");
            if (dt.Rows.Count > 0)
            {
                ddlPin.DataSource = dt;
                ddlPin.DataTextField = "Pincode";
                ddlPin.DataValueField = "Pincode";
                ddlPin.DataBind();
            }
        }

        protected void GetJila()
        {
            DataTable dt = MDC.getDataTable("select distinct DistrictsName from Pincode where State='" + DrpState.Text + "' and City='" + DrpCity.Text + "'");

            if (dt.Rows.Count > 0)
            {
                txtJilaEnglish.Text = dt.Rows[0][0].ToString();
            }
        }


        protected void getRegNo()
        {
            DataTable dt = MDC.getDataTable("select max(PK_APP_ID1) from Individual_App1");
            if (dt.Rows.Count > 0)
            {
                if (!string.IsNullOrWhiteSpace(dt.Rows[0][0].ToString()))
                {

                    txtRegNo.Text = Convert.ToInt32(Convert.ToInt32(dt.Rows[0][0].ToString()) + 1).ToString();
                }
                else
                {
                    txtRegNo.Text = "1";
                }
            }
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();
            SqlDataAdapter da1 = new SqlDataAdapter();
            DataSet ds1 = new DataSet();
            string intRegId = "";

            intRegId = txtRegNo.Text;
            da = new SqlDataAdapter("select * from Individual_App1 where PK_APP_ID1='" + intRegId + "'", con);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count <= 0)
            {

                da1 = new SqlDataAdapter("select * from Tb_Images where PK_RegId='" + intRegId + "'", con);
                ds1 = new DataSet();
                da1.Fill(ds1);


                foreach (DataRow dr1 in ds1.Tables[0].Rows)
                {


                    dr1.Delete();

                }

                SqlCommandBuilder cmd1 = new SqlCommandBuilder(da1);
                da1.Update(ds1);
            }
        }
        protected void FillCoordinator()
        {
            Int32 k = 0;
            DataTable dt = MDC.getDataTable("select * from Individual_App1 where TypeName in ('Form_C_Individual','Form_C_Society')");
            if (dt.Rows.Count > 0)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (dt.Rows[k]["UpperNameEnglish"] != System.DBNull.Value || dt.Rows[k]["UpperNameEnglish"].ToString().Length > 0)
                    {
                       drpRefMember.Items.Add(dt.Rows[k]["UpperNameEnglish"].ToString());
                    }
                    k = k + 1;
                }

            }

        }
        protected void Upload(object sender, EventArgs e)
        {
            string folderPath = Server.MapPath("~/Files/");

            string strPath = FileUpload2.FileName.ToString();

            string[] authorsList = strPath.Split('.');
            string fName = "";
            string fExt = "";
            int i = 0;
            foreach (string author in authorsList)
            {
                //   Console.WriteLine(author);
                if (i <= 0)
                {
                    fName = author.ToString();
                }
                else
                {
                    fExt = author.ToString();

                }
                i = i + 1;
            }

            strPath = txtRegNo.Text + "." + fExt;

            fName = strPath;


            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists Create it.
                Directory.CreateDirectory(folderPath);
            }

            //Save the File to the Directory (Folder).
            FileUpload2.SaveAs(folderPath +System.IO.Path.GetFileName(FileUpload2.FileName));
            //FileUpload1.SaveAs(folderPath + System.IO.Path.GetFileName(fName));

            //Display the Picture in Image control.
            Image1.ImageUrl = "~/Files/" + System.IO.Path.GetFileName(FileUpload2.FileName);
            // imgPhoto.ImageUrl = "~/Files/" + System.IO.Path.GetFileName(fName);

            string ssql1 = "";
            ssql1 = "select * from MainImage1 where Sno=0";
            DataTable dt1 = MDC.getDataTable("select * from MainImage1 where Sno=0");
            DataRow dr1;
            dr1 = dt1.NewRow();
            dr1["PK_RegId"] = txtRegNo.Text;
            dr1["ImageName"] = FileUpload2.FileName;
            dr1["CreateDate"] = System.DateTime.Now;
            chkPhoto.Checked = true;
            //dr["PK_RegId"] = txtRegNo.Text;
            dt1.Rows.Add(dr1);
            //dt.Rows.Add(dr);

            if (MDC.InsertData(dt1, dr1, ssql1) == true)
            {
                //MessageBox.Show("Record Saved Successfully...");
                //clearAll();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {


            if (drpRefMember.Text == "SELECT")
            {
                MessageBox.Show("Please Select Reference Member!");
            }
            else
            {
                // dt=MDC.getDataTable("select * from ")
                //string ttx = TranslateText("Hello");
                string ssql = "";
                string ssql1 = "";

                if (chkAdharCard.Checked == false)
                {
                    MessageBox.Show("Please Upload Adhar Card!");
                    //txtEnglishName.Focus();
                    return;
                }

                if (chkPayementSlip.Checked == false)
                {
                    MessageBox.Show("Please Upload Payment Slip!");
                    //txtEnglishName.Focus();

                    return;

                }


                if (chkPhoto.Checked == false)
                {
                    MessageBox.Show("Please Upload Photo!");
                    //txtEnglishName.Focus();
                    return;

                }
                if (DropDownList1.Text  == "Select")
                {
                    MessageBox.Show("Please Select नगद/online/चेक!");
                    return;

                }
                if (txtEnglishName.Text.Length <= 0)
                {
                    MessageBox.Show("Please Enter Name!");
                    txtEnglishName.Focus();
                    return;

                }

                if (txtSurNameEng.Text.Length <= 0)
                {
                    MessageBox.Show("Please Enter Surname!");
                    txtSurNameEng.Focus();
                    return;

                }

                if (txtFatherEnglishName.Text.Length <= 0)
                {
                    //MessageBox.Show("Please Enter Father's Name!");
                    return;

                }


                if (txtAddressEnglish.Text.Length <= 0)
                {
                    MessageBox.Show("Please Enter Address!");
                    return;

                }

                if (DrpState.SelectedValue == "Select")
                {
                    MessageBox.Show("Please Select State!");
                    return;

                }


                if (DrpCity.SelectedValue == "" || DrpCity.SelectedValue == "(not alloted)")
                {
                    MessageBox.Show("Please Select City!");
                    return;

                }






                if (txtBlockEnglish.Text.Length <= 0)
                {
                    MessageBox.Show("Please Enter Tehsil!");
                    return;

                }

                if (txtMobile.Text.Length <= 0)
                {
                    MessageBox.Show("Please Enter Mobile!");
                    txtMobile.Focus();
                    return;

                }

                if (txtPassword.Text.Length <= 5)
                {
                    MessageBox.Show("Password must be 6 characters!");
                    txtPassword.Focus();
                    return;

                }

                if (drpBcategory.SelectedValue == "Select")
                {
                    MessageBox.Show("Please Select Business Category!");
                    return;

                }
                //if (txtEmail.Text.Length <= 0)
                //{
                //    //MessageBox.Show("Please Enter Email ID !");
                //    //return;

                //}
                //if (txtPANno.Text.Length <= 0)
                //{
                //    //MessageBox.Show("Please Enter PAN CARD !");
                //    //return;

                //}

                //if (txtAdhaarNo.Text.Length <= 0)
                //{
                //    MessageBox.Show("Please Enter Aadhar No!");
                //    txtAdhaarNo.Focus();
                //    return;

                //}

                //ssql1 = "select * from Tb_Images where PK_RegId=" + txtRegNo.Text;
                //DataTable dt1 = MDC.getDataTable("select * from Individual_App1 where PK_APP_ID1=" + ID);

                //if (dt1.Rows.Count > 0)
                //{
                //    //Image1.ImageUrl = "~/Files/" + Id + ".jpg";
                //    foreach (DataRow dr1 in dt1.Rows)
                //    {
                //        // txtRegNo.Text = dr1["Ima"].ToString();
                //    }
                //}



                ssql = "select * from Individual_App1 where PK_APP_ID1=0";
                    DataTable dt = MDC.getDataTable("select * from Individual_App1 where PK_APP_ID1=0");

                    DataRow dr;
                    dr = dt.NewRow();

                    //PK_C_ID int Unchecked
                    //TypeId  int Unchecked
                    //TypeName nvarchar(100)	Unchecked
                    dr["TypeName"] = DrpRank.Text;
                    dr["RefMember"] = drpRefMember.Text;
                    dr["UpperNameEnglish"] = txtEnglishName.Text; //  nvarchar(20t0)   Unchecked
                    dr["FatherName"] = txtFatherEnglishName.Text;
                    dr["SurNameEng"] = txtSurNameEng.Text;
                    dr ["State"] = DrpState.Text;   
                    //dr["Amount"] = txtRs.Text;
                    //  dr["ChequeDate"] =Convert.ToDateTime(txtChequeDate.Value);    
                    dr["Address"] = txtAddressEnglish.Text; //  nvarchar(20t0)   Unchecked
                    dr["Tehsil"] = txtBlockEnglish.Text;
                    dr["City"] = DrpCity.Text;
                    dr["District"] = txtJilaEnglish.Text;                                      /*dr["UpperNameHindi"] = txtHindiName.Text; //    nvarchar(200)   Checked*/
                    dr["PIN"] = ddlPin.Text;
                    dr["CityEnglish"] = txtCityEnglish.Text;
                    dr["MobileNo"] = txtMobile.Text;
                    dr["CreateDate"] = System.DateTime.Now;//   date Unchecked
                    dr["UpdateDate"] = System.DateTime.Now; //date    Unchecked
                    dr["IsActive"] = true;
                    //dr["photo"] = true;
                    dr["IsApproved"] = false;

                    dr["UserName"] = txtUsername.Text; 
                    dr["CategoryPrice"] = txtRs.Text;

                    dr["Password"] = txtPassword.Text;
                    dr["PaymentMode"] = DropDownList1.Text;
                    dr["Category"] = drpBcategory.Text;
                    dr["Firm"] = txtFirmName.Text; 

                //dr["RefMember"] = drpRefMember.Text;
                ///* dr["AddressHindi"] = txtAddressHindi.Text; //*/     nvarchar(200)   Checked
                //dr["Address1"] = txtBuildingEnglishName.Text; //  nvarchar(20t0)   Unchecked
                //dr["AddressHindi1"] = txtBuildingHindiName.Text; //     nvarchar(200)   Checked
                //dr["Address2"] = txtMargEnglish.Text; //  nvarchar(20t0)   Unchecked
                //dr["AddressHindi2"] = txtMargHindi.Text; //     nvarchar(200)   Checked
                //dr["Address3"] = txtMohallaEnglish.Text; //  nvarchar(20t0)   Unchecked
                //dr["AddressHindi3"] = txtMohallaHindi.Text; //     nvarchar(200)   Checked
                //dr["Address4"] = txtLandMarkEnglish.Text; //  nvarchar(20t0)   Unchecked
                //dr["AddressHindi4"] = txtLandMarkHindi.Text; //     nvarchar(200)   Checked
                //dr["PIN"] = DrpPinCode.Text;
                //Address1    nvarchar(200)   Checked
                //AddressHindi1   nvarchar(200)   Unchecked
                //Address2    nvarchar(200)   Unchecked
                //AddressHindi2   nvarchar(200)   Unchecked= 
                //Address3    nvarchar(200)   Unchecked
                //AddressHindi3   nvarchar(200)   Checked
                //Address4    nvarchar(200)   Checked
                //AddressHindi4   nvarchar(200)   Unchecked
                //FK_CityId   nvarchar(50)    Checked
                //dr["Landmark"] = txtLandMarkEnglish.Text; //     nvarchar(200)   Checked
                //dr["LandmarkHindi"] = txtLandMarkHindi.Text; //    nvarchar(200)   Checked
                //District    nvarchar(50)    Checked
                //DistrictHindi   nvarchar(50)    Checked
                //Tehsil  nvarchar(50)    Checked
                //TehsilHindi nvarchar(50)    Checked
                //StateiId    int Checked
                //CountryId   int Checked
                // dr["MailId"] = txtMobile.Text;
                //    int Unchecked
                //dr["PaNNo"] = txtPANno.Text;// nvarchar(50)	Unchecked
                //dr["TelephoneNo"] = txtPhone.Text;
                /* dr["AdharNo"] = txtAdhaarNo.Text;
                //dr["IsPrime"] = true; // bit Unchecked
                //dr["Firm"] = txtSocietyNameEng.Text;
                //dr["NameHindi"] = txtSocietyNameHindi.Text;
                //dr["FatherNameHindi"] = txtFatherHindiName.Text;
                //dr["FatherNameHindi"] = txtFatherHindiName.Text;
                //dr["UserName"] = txtUserName.Text;
                //dr["Password"] = txtPassword.Text;
                //dr["RefMember"] = drpRefMember.Text;
                // dr["MailId"] = txtMobile.Text;
                //dr["MobileNo"] = txtMobile.Text;//    int Unchecked
                //dr["PaNNo"] = txtPANno.Text;// nvarchar(50)	Unchecked
                //dr["TelephoneNo"] = txtPhone.Text;
                /* dr["AdharNo"] = txtAdhaarNo.Text;*///  nvarchar(50)    Unchecked
                                                      //dr["UpdateDate"] = System.DateTime.Now; //date    Unchecked
                                                      //dr["IsActive"] = true; //    bit Unchecked
                                                      //dr["IsPrime"] = true; //bit unchecked
                                                      //dr["Name"] = txtEnglishName.Text;
                                                      //dr["NameHindi"] = txtHindiName.Text;
                                                      //dr["FatherNameHindi"] = txtFatherHindiName.Text;
                                                      //dr["FatherNameHindi"] = txtFatherHindiName.Text;
                                                      //dr["AnnualSale"] = txtAnnualSale.Text;
                                                      //dr["DistrictHindi"] = txtJilaHindi.Text;
                                                      //dr["WorkArea"] = txtWorkArea.Text;
                                                      //dr["Establish"] = ChkSthapna.Checked;
                                                      //dr["Gst"] = chkGST.Checked;
                                                      //dr["Gumasta"] = chkGST.Checked;
                                                      //dr["State"] = DrpState.Text;
                                                      //dr["Other"] = chkOther.Checked;
                                                      //dr["Category"] = drpCategory.Text;
                                                      //dr["BusinessDetail"] = txtDetail.Text;
                                                      //dr["UserName"] = txtUserName.Text;
                                                      //dr["Password"] = txtPassword.Text;
                                                      //dr["ChequeNo"] = txtChequeNo.Value; //    nvarchar(200)   Checked
                                                      //dr["BankName"] = txtBankName.Value; //    nvarchar(200)   Checked
                                                      //dr["TypeId"] = 2;                     

                //sm
                dt.Rows.Add(dr);
          
                if (MDC.InsertData(dt, dr, ssql) == true)
                {
                    MessageBox.Show("Record Saved Successfully...");
                    clearAll();
                }
            
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
        protected void clearAll()
        {
            
            txtAddressEnglish.Text = "";
            //txtAddressHindi.Text = "";
            //txtBuildingEnglishName.Text = "";
            //txtBuildingHindiName.Text = "";
            //txtMargEnglish.Text = "";
            //txtMargHindi.Text = "";
            //txtMohallaEnglish.Text = "";
            //txtMohallaHindi.Text = "";
            txtJilaEnglish.Text = "";
            //txtJilaHindi.Text = "";
            //txtLandMarkEnglish.Text = "";
            //txtLandMarkHindi.Text = "";

            //txtHindiName.Text = "";
            txtBlockEnglish.Text = "";
          //  ddlPin.Text = "";
            //txtBlockHindi.Text = "";
            //txtHindiName.Text = "";
            //txtUserName.Text = "";
            //drpRefMember.Text = "";
            txtMobile.Text = "";
            //txtPANno.Text = "";
            //txtPhone.Text = "";
            //txtUserName.Text = "";
            txtCityEnglish.Text = "";
            //txtCityHindi.Text = "";
            txtMobile.Text = "";
            //txtPANno.Text = "";
            //txtPhone.Text = "";
            //txtAdhaarNo.Text = "";
            //txtLandMarkEnglish.Text = "";
            //
            txtEnglishName.Text = "";
            //txtHindiName.Text = "";
            //txtUserName.Text = "";
            txtFatherEnglishName.Text = "";
            //txtFatherHindiName.Text = "";
            //

           // drpRefMember.Text = "SELECT";

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

        protected void txtEnglishName_TextChanged(object sender, EventArgs e)
        {
            if (txtEnglishName.Text.Length > 0)
            {
               // txtHindiName.Text = TranslateText(txtEnglishName.Text);
            }
        }

        protected void txtFatherEnglishName_TextChanged(object sender, EventArgs e)
        {
            if (txtFatherEnglishName.Text.Length > 0)
            {
               // txtFatherHindiName.Text = TranslateText(txtFatherEnglishName.Text);
            }
        }

        protected void txtAddressEnglish_TextChanged(object sender, EventArgs e)
        {
            if (txtAddressEnglish.Text.Length > 0)
            {
              //  txtAddressHindi.Text = TranslateText(txtAddressEnglish.Text);
            }

        }

        //protected void txtBuildingEnglishName_TextChanged(object sender, EventArgs e)
        //{
        //    if (txtBuildingEnglishName.Text.Length > 0)
        //    {
        //        txtBuildingHindiName.Text = TranslateText(txtBuildingEnglishName.Text);
        //    }
        //}

        //protected void txtMargEnglish_TextChanged(object sender, EventArgs e)
        //{
        //    if (txtMargEnglish.Text.Length > 0)
        //    {
        //        txtMargHindi.Text = TranslateText(txtMargEnglish.Text);
        //    }
        //}

        //protected void txtMohallaEnglish_TextChanged(object sender, EventArgs e)
        //{
        //    if (txtMohallaEnglish.Text.Length > 0)
        //    {
        //        txtMohallaHindi.Text = TranslateText(txtMohallaEnglish.Text);
        //    }
        //}

        //protected void txtLandMarkEnglish_TextChanged(object sender, EventArgs e)
        //{
        //    if (txtLandMarkEnglish.Text.Length > 0)
        //    {
        //        txtLandMarkHindi.Text = TranslateText(txtLandMarkEnglish.Text);
        //    }
        //}

        protected void txtCityEnglish_TextChanged(object sender, EventArgs e)
        {
            if (txtCityEnglish.Text.Length > 0)
            {
               // txtCityHindi.Text = TranslateText(txtCityEnglish.Text);
            }
        }

        protected void txtBlockEnglish_TextChanged(object sender, EventArgs e)
        {
            if (txtBlockEnglish.Text.Length > 0)
            {
                //   txtBlockHindi.Text = TranslateText(txtBlockEnglish.Text);
                    // txtBlockEng.Text = TranslateText(txtBlockEnglish.Text);
            }
        }

        //protected void txtSocietyNameEng_TextChanged(object sender, EventArgs e)
        //{
        //    txtSocietyNameHindi.Text = TranslateText(txtSocietyNameEng.Text);
        //}
        //protected void txtConfirmPassword_TextChanged(object sender, EventArgs e)
        //{
        //    if (txtConfirmPassword2.Text != txtPassword.Text)
        //    {
        //        MessageBox.Show("Password & Confirm Password must be same");
        //        return;
        //    }
        //}

        protected void txtJilaEnglish_TextChanged(object sender, EventArgs e)
        {
            if (txtCityEnglish.Text.Length > 0)
            {
                //txtJilaHindi.Text = TranslateText(txtJilaEnglish.Text);
            }

        }
        protected void txtStateEnglish_TextChanged(object sender, EventArgs e)
        {
            //if (txtStateEnglish.Text.Length > 0)
            //{
            //    txtJilaHindi.Text = TranslateText(txtStateEnglish.Text);
            //}

        }
        protected void DrpCity_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DrpCity.Text.Length > 0 && DrpState.Text.Length > 0)
            {
                //DrpState_SelectedIndexChangedGetPinCode();
                GetJila();
                GetPinCode();
                DataTable dt = MDC.getDataTable("select distinct CityCode from RTO where City='" + DrpCity.Text.Trim() + "'");

                if (dt.Rows.Count > 0)
                {
                    if (DrpRank.Text == "C-Individual")
                    {
                        txtUsername.Text = "CI" + "-" + dt.Rows[0]["CityCode"].ToString() + "-" + txtRegNo.Text;
                    }
                    if (DrpRank.Text == "C-Society")
                    {
                        txtUsername.Text = "CS" + "-" + dt.Rows[0]["CityCode"].ToString() + "-" + txtRegNo.Text;
                    }
                    if (DrpRank.Text == "D-Individual")
                    {
                        txtUsername.Text = "DI" + "-" + dt.Rows[0]["CityCode"].ToString() + "-" + txtRegNo.Text;
                    }
                    if (DrpRank.Text == "D-Society")
                    {
                        txtUsername.Text = "DS" + "-" + dt.Rows[0]["CityCode"].ToString() + "-" + txtRegNo.Text;
                    }
                }

            }
        }

        protected void DrpState_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DrpState.Text.Length > 0)
            {
                DataTable dt = MDC.getDataTable("select distinct City from RTO where State='" + DrpState.Text + "'");

                if (dt.Rows.Count > 0)
                {
                    DrpCity.DataSource = dt;
                    DrpCity.DataTextField = "City";
                    DrpCity.DataValueField = "City";
                    DrpCity.DataBind();
                }

            }
        }

        protected void drpCategory_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void txtSurNameEng_TextChanged(object sender, EventArgs e)
        {
            //txtSurNameEng.Text = TranslateText(txtSurNameEng.Text);
        }


        protected void btnUpload_Click(object sender, EventArgs e)
        {
            string ImgPath = string.Empty;
            string DbImgPath = string.Empty;
            string intRegId = "";
            try
            {
                if (FileUpload1.HasFile)
                {
                    //SqlDataAdapter daDel = new SqlDataAdapter("Select * from Tb_Images where PK_RegId=" + txtRegNo.Text + "", con);
                    //DataSet dsDel = new DataSet();
                    //daDel.Fill(dsDel);
                    //if(dsDel.Tables[0].Rows.Count>0)
                    //{
                    //    foreach(DataRow dr in dsDel.Tables[0].Rows)
                    //    {
                    //        dr.Delete();
                    //    }
                    //    SqlCommandBuilder cmb = new SqlCommandBuilder(daDel);
                    //    daDel.Update(dsDel);
                    //}



                    ImgPath = (Server.MapPath("~/Images/") + Guid.NewGuid() + FileUpload1.FileName);
                    //ImgPath = (Server.MapPath("~/Images/") + ddlId.Text  +"_"+ txtRegNo+);
                    FileUpload1.SaveAs(ImgPath);
      
                    string RegId = txtRegNo.Text;

                    DbImgPath = ImgPath.Substring(ImgPath.LastIndexOf("\\"));
                    DbImgPath = DbImgPath.Insert(0, "Images");
                    
                    SqlCommand cmd = new SqlCommand("Insert into Tb_Images (Image_Path,PK_RegId,IdType) values (@Image_Path,@regId,@IdType)", con);
                    cmd.Parameters.AddWithValue("@Image_Path", DbImgPath);
                    cmd.Parameters.AddWithValue("@regId", RegId);
                    cmd.Parameters.AddWithValue("@IdType", ddlId.Text);

                    if (ddlId.Text == "Adhar Card")
                    {
                        chkAdharCard.Checked = true;
                    }
                    
                    if (ddlId.Text == "Payment Slip")
                    {
                        chkPayementSlip.Checked = true;
                    }
                    if (ddlId.Text == "Photo")
                    {
                        chkPhoto.Checked = true;
                        
                    }
                  
                  // btnUpload.Enabled = false;

                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    cmd.Connection = con;
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    BindGrid();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Please select the image to upload');", true);
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
            }
            finally
            {
                ImgPath = string.Empty;
                DbImgPath = string.Empty;
                con.Close();
            }
        }

       

        protected void BindGrid()
        {
            string Id1 = txtRegNo.Text; 
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter();

            try
            {
                SqlCommand cmd = new SqlCommand("select * from Tb_Images where PK_RegId='"+Id1+"'", con);
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



        protected void grdImages_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string physicalPath = string.Empty;
            string imgPath = string.Empty;
            string finalPath = string.Empty;
            
            try
            {
                int imgId = Convert.ToInt32(grdImages.DataKeys[e.RowIndex].Value);
                string ssql = "";
                ssql = "select * from Tb_Images where Image_Id= " + imgId;
                DataTable dt = MDC.getDataTable("select * from Tb_Images where Image_Id=" + imgId);
                string IDtype ="";

                if (dt.Rows.Count > 0)
                {
                    foreach (DataRow dr in dt.Rows)
                    {
                        IDtype = dr["IdType"].ToString();
                    }
                }

                if (IDtype == "Adhar Card")
                {
                    chkAdharCard.Checked = false;
                }

                if (IDtype == "Payment Slip")
                {
                    chkPayementSlip.Checked = false;
                }
                if (IDtype == "Photo")
                {
                    chkPhoto.Checked = false;
                }

                SqlCommand cmd = new SqlCommand("delete from Tb_Images where Image_Id=@Image_Id", con);
                cmd.Parameters.AddWithValue("@Image_Id", imgId);
                cmd.CommandType = CommandType.Text;
                con.Open();
                cmd.ExecuteNonQuery();
                cmd.Dispose();

                //Get the application physical path of the application
                physicalPath = HttpContext.Current.Request.MapPath(Request.ApplicationPath);
                //Get the Image path from the DataKeyNames
                imgPath = grdImages.DataKeys[e.RowIndex].Values["Image_Path"].ToString();
                //Create the complete path of the image
                finalPath = physicalPath + "\\" + imgPath;

                FileInfo file = new FileInfo(finalPath);
                if (file.Exists)//checking file exsits or not
                {
                    file.Delete();//Delete the file
                }
                BindGrid();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Error occured : " + ex.Message.ToString() + "');", true);
            }
            finally
            {
                con.Close();
                physicalPath = string.Empty;
                imgPath = string.Empty;
                finalPath = string.Empty;
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
            BindGrid();
        }

        protected void grdImages_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdImages.PageIndex = e.NewPageIndex;
            BindGrid();
        }

       


        protected void btnUpload_Click1(object sender, EventArgs e)
        {

        }

        protected void btnUploads_Click(object sender, EventArgs e)
        {

        }
        protected void btn_Click(object sender, EventArgs e)
        {

        }

       

        protected void DrpRank_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DrpRank.Text == "C-Individual")
            {
                txtRs.Text = "500";
            }
            if (DrpRank.Text == "D-Individual")
            {
                txtRs.Text = "500";
            }
            if (DrpRank.Text == "C-Society")
            {
                txtRs.Text = "1000";
            }
            if (DrpRank.Text == "D-Society")
            {
                txtRs.Text = "1000";
            }

            if (DrpRank.Text == "C-Individual" || DrpRank.Text == "C - Society")
            {
                DataTable dt = MDC.getDataTable("select distinct MemberName from B1MemberList");

                if (dt.Rows.Count > 0)
                {
                    drpRefMember.DataSource = dt;
                    drpRefMember.DataTextField = "MemberName";
                    drpRefMember.DataValueField = "MemberName";
                    drpRefMember.DataBind();
                }

            }

            if (DrpRank.Text == "D-Individual" || DrpRank.Text == "D-Society")
            {
                DataTable dt = MDC.getDataTable("select distinct MemberName from C1MemberList");

                if (dt.Rows.Count > 0)
                {
                    drpRefMember.DataSource = dt;
                    drpRefMember.DataTextField = "MemberName";
                    drpRefMember.DataValueField = "MemberName";
                    drpRefMember.DataBind();
                }

            }
        } 

        protected void ddlPin_SelectedIndexChanged(object sender, EventArgs e)
        { 
        }

        protected void DrpRank_TextChanged(object sender, EventArgs e)
        {
            if (DrpRank.Text == "C-Individual")
            {
                txtRs.Text = "1000";
            }
            if (DrpRank.Text == "D-Individual")
            {
                txtRs.Text = "500";
            }
            if (DrpRank.Text == "C-Society")
            {
                txtRs.Text = "1000";
            }
            if (DrpRank.Text == "D-Society")
            {
                txtRs.Text = "500";
            }

            if (DrpRank.Text == "C-Individual")
            {
                DataTable dt = MDC.getDataTable("select distinct MemberName from B1MemberList");

                if (dt.Rows.Count > 0)
                {
                    drpRefMember.DataSource = dt;
                    drpRefMember.DataTextField = "MemberName";
                    drpRefMember.DataValueField = "MemberName";
                    drpRefMember.DataBind();
                }


            }

            if (DrpRank.Text == "C-Society")
            {
                DataTable dt = MDC.getDataTable("select distinct MemberName from B1MemberList");

                if (dt.Rows.Count > 0)
                {
                    drpRefMember.DataSource = dt;
                    drpRefMember.DataTextField = "MemberName";
                    drpRefMember.DataValueField = "MemberName";
                    drpRefMember.DataBind();
                }


            }



            //if (DrpRank.Text == "D-Society")
            //{
            //    DataTable dt = MDC.getDataTable("select distinct MemberName from C1MemberList");

            //    if (dt.Rows.Count > 0)
            //    {
            //        drpRefMember.DataSource = dt;
            //        drpRefMember.DataTextField = "MemberName";
            //        drpRefMember.DataValueField = "MemberName";
            //        drpRefMember.DataBind();
            //    }

            //}
            if (DrpRank.Text == "D-Society")
            {
                DataTable dt = MDC.getDataTable("select * from Individual_App1 where TypeName in ('C-Individual','C-Society') and IsApproved =1");

                if (dt.Rows.Count > 0)
                {
                    dt.Columns.Add("FullName", typeof(string), "UpperNameEnglish + ' ' + SurNameEng");
                    drpRefMember.DataSource = dt;
                    drpRefMember.DataTextField = "FullName";
                    drpRefMember.DataValueField = "FullName";
                    drpRefMember.DataBind();
                }

            }

            if (DrpRank.Text == "D-Individual")
            {

                DataTable dt = MDC.getDataTable("select * from Individual_App1 where TypeName in ('C-Individual','C-Society') and IsApproved =1");

                if (dt.Rows.Count > 0)
                {
                    dt.Columns.Add("FullName", typeof(string), "UpperNameEnglish + ' ' + SurNameEng");
                    drpRefMember.DataSource = dt;
                    drpRefMember.DataTextField = "FullName";
                    drpRefMember.DataValueField = "FullName";
                    drpRefMember.DataBind();
                }

            }
        }

        protected void DrpCity_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        //protected void UploadFile(object sender, EventArgs e)
        //{
        //    if (FileUpload1.HasFile)
        //    {
        //        string fileName = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);
        //        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Uploads/") + fileName);
        //        Response.Redirect(Request.Url.AbsoluteUri);
        //    }
        //}

        //protected void getFiles()
        //{
        //    string[] filePaths = Directory.GetFiles(Server.MapPath("~/Uploads/"));
        //    List<ListItem> files = new List<ListItem>();
        //    foreach (string filePath in filePaths)
        //    {
        //        files.Add(new ListItem(System.IO.Path.GetFileName(filePath), filePath));
        //    }
        //    GridView1.DataSource = files;
        //    GridView1.DataBind();
        //}

        //protected void DownloadFile(object sender, EventArgs e)
        //{
        //    string filePath = (sender as LinkButton).CommandArgument;
        //    Response.ContentType = ContentType;
        //    Response.AppendHeader("Content-Disposition", "attachment; filename=" + System.IO.Path.GetFileName(filePath));
        //    Response.WriteFile(filePath);
        //    Response.End();
        //}

        //protected void DeleteFile(object sender, EventArgs e)
        //{
        //    string filePath = (sender as LinkButton).CommandArgument;
        //    File.Delete(filePath);
        //    Response.Redirect(Request.Url.AbsoluteUri);
        //}

    }
}