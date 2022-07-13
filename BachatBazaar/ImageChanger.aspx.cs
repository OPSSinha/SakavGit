using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.Mail;

namespace BachatBazaar
{
    public partial class ImageChanger : System.Web.UI.Page
    {
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataRow drw;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGrid();
                //string strUser = Request.QueryString["user"].ToString();
                //Session["UserName"] = strUser;
            }
        }

        protected void FillGrid()
        {
            using (var cnt = ConnectionManager.Inst.CreateNewConnection())
            {
                string strUser = Session["UserName"].ToString();
                SqlDataAdapter da = new SqlDataAdapter("select * from FrontImage where UserName='"+ strUser+"' order by Sno", cnt);
                DataSet ds = new DataSet();
                da.Fill(ds);
                GridView2.DataSource = ds;
                GridView2.DataBind();
            }

        }
        protected void lblUpload_Click(object sender, EventArgs e)
        {
            using (var cnt = ConnectionManager.Inst.CreateNewConnection())
            {
                da = new SqlDataAdapter("Select * from FrontImage where sno=0", cnt);
                da.Fill(ds);
                drw = ds.Tables[0].NewRow();
                if (FileUpload1.HasFile)
                {
                    string FileName = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);

                    FileUpload1.PostedFile.SaveAs(Server.MapPath("/neuroimg/" + FileName));
                    MailAttachment attach = new MailAttachment(Server.MapPath("/neuroimg/" + FileName));

                    drw["ImageName"] = FileName;
                    drw["CreateDate"] = System.DateTime.Now;
                    drw["IsActive"] = chkIsActive.Checked;
                    drw["UserName"] = Session["UserName"].ToString();
                    ds.Tables[0].Rows.Add(drw);

                    SqlCommandBuilder cmb = new SqlCommandBuilder(da);
                    da.Update(ds);
                    MessageBox.Show("Image Uploaded Successfully...");


                }




            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int intRegId = 0;
            foreach (GridViewRow row in GridView2.Rows)
            {
                using (var cnt = ConnectionManager.Inst.CreateNewConnection())
                {
                    cnt.Open();
                    CheckBox check = (CheckBox)row.FindControl("chkSelect");
                    Label lblSno = (Label)row.FindControl("lblSno");
                    if (check.Checked == true)
                    {
                        if (lblSno.Text.Length > 0)
                        {
                            intRegId = Convert.ToInt32(lblSno.Text);
                            da = new SqlDataAdapter("select * from FrontImage where Sno=" + intRegId + "", cnt);
                            ds = new DataSet();
                            da.Fill(ds);

                            if (ds.Tables[0].Rows.Count > 0)
                            {

                                foreach (DataRow dr in ds.Tables[0].Rows)
                                {

                                    string fileName = dr["ImageName"].ToString();
                                    string sourcePath = Server.MapPath("\\neuroimg\\");
                                    string[] files = System.IO.Directory.GetFiles(sourcePath);

                                    dr.Delete();

                                    // Copy the files and overwrite destination files if they already exist.
                                    //foreach (string s in files)
                                    //{
                                    // Use static Path methods to extract only the file name from the path.
                                    fileName = System.IO.Path.GetFileName(fileName);
                                    //   destFile = System.IO.Path.Combine(targetPath, fileName);
                                    System.IO.File.Delete(sourcePath + fileName);
                                    //}

                                }

                                SqlCommandBuilder cmd = new SqlCommandBuilder(da);
                                da.Update(ds);
                                FillGrid();
                            }
                        }


                    }
                }
                //EX!!!
                //IF AccessType = 1
                //{
                //    check.Checked = true;
                //}

                //IF AccessType = 2
                //{
                //    check2.Checked = true;
                //}
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (var cnt = ConnectionManager.Inst.CreateNewConnection())
            {
                cnt.Open();
                SqlDataAdapter daa;
                DataSet dss = new DataSet();

                foreach (GridViewRow gv in GridView2.Rows)
                {
                    Label lblID = (Label)gv.FindControl("lblSno");
                    //CheckBox chkSelect = gvrow.FindControl("chkSelect") as CheckBox;
                    CheckBox IsActive = (CheckBox)gv.FindControl("chkIsActive");


                    daa = new SqlDataAdapter("select * from FrontImage where Sno=" + Convert.ToInt32(lblID.Text) + "", cnt);
                    dss = new DataSet();
                    daa.Fill(dss);

                    if (dss.Tables[0].Rows.Count > 0)
                    {
                        foreach (DataRow dr in dss.Tables[0].Rows)
                        {
                            if (IsActive.Checked == true)
                            {
                                dr["IsActive"] = true;
                            }
                            else
                            {
                                dr["IsActive"] = false;
                            }
                        }
                    }
                    SqlCommandBuilder cmb = new SqlCommandBuilder(daa);
                    daa.Update(dss);

                }
                MessageBox.Show("Record Updated Successfully...");
                FillGrid();
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session["login"] = "0";
            Response.Redirect("Default.aspx");
        }
    }
}