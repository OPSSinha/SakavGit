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
using System.Web.UI.HtmlControls;

namespace NeuroGyan
{
 
    
    public partial class ImageUploadReg : System.Web.UI.Page
    {
        MyDataConnection MDC = new MyDataConnection();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataRow drw;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillGrid();
                GetAttachments();
            }
        }
        protected void getImage()
        {
            int x = 0;
            string strId = Request.QueryString["Id"].ToString();
            try
            {
                if (strId.Length > 0)
                {
                    DataTable dt = MDC.getDataTable("select * from MainImage where MemberId=" + Convert.ToInt32(strId));
                    if (dt.Rows.Count > 0)
                    {
                        gvMenuTiming.DataSource = dt;
                        gvMenuTiming.DataBind();

                        foreach (GridViewRow gv in gvMenuTiming.Rows)
                        {
                            Label lblMemberId = (Label)gv.FindControl("lblMemberId");
                            Image Img = (Image)gv.FindControl("Img");

                            //if (Convert.ToInt32(lblMemberId.Text) > 0)
                            //{
                            Img.ImageUrl = "~/neuroimg/" + strId + "_" + dt.Rows[x]["ImageName"].ToString();
                            //  }
                            x = x + 1;
                        }

                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void FillGrid()
        {
            using (var cnt = ConnectionManager.Inst.CreateNewConnection())
            {
                int regNo = Convert.ToInt32(Request.QueryString["Id"].ToString());
                SqlDataAdapter da = new SqlDataAdapter("select * from  MainImage where sno="+regNo+"", cnt);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gvMenuTiming.DataSource = ds;
                gvMenuTiming.DataBind();
            }

        }
        protected void FillImages()
        {

            using (var cnt = ConnectionManager.Inst.CreateNewConnection())
            {
                int x = 0;
                int regNo = Convert.ToInt32(Request.QueryString["Id"].ToString());

                SqlDataAdapter da = new SqlDataAdapter("select * from  MainImage where MemberId=" + regNo + "", cnt);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvMenuTiming.DataSource = dt;
                gvMenuTiming.DataBind();

                foreach (GridViewRow gv in gvMenuTiming.Rows)
                {
                    Label lblMemberId = (Label)gv.FindControl("lblMemberId");
                    Image Img = (Image)gv.FindControl("Img");

                    //if (Convert.ToInt32(lblMemberId.Text) > 0)
                    //{
                    if (dt.Rows[x]["ImageName"].ToString().Length > 0)
                    {
                        Img.ImageUrl = "~/neuroimg/" + regNo + "_" + dt.Rows[x]["ImageName"].ToString();
                    }
                    //  }
                    x = x + 1;
                }

               
            }

        }
        protected void GetAttachments()
        {

            string strRemark = "";

            DataTable dtaR = MDC.getDataTable("select * from MainImage where sno=0");

            try
            {
                DataRow dr;
                int count = 11;
                for (int i = 1; i <= count; i++)
                {

                    dr = dtaR.NewRow();
                    dr["Sno"] = i;
                    if (i == 1)
                    {
                        dr["DocType"] = "01.Registration Society";
                    }
                    if (i == 2)
                    {
                        dr["DocType"] = "02.Residence Proof";
                    }
                    if (i == 3)
                    {
                        dr["DocType"] = "03.Adhaar Card";
                    }
                    if (i == 4)
                    {
                        dr["DocType"] = "04.PAN CARD";
                    }
                    if (i == 5)
                    {
                        dr["DocType"] = "05.Voter Id";
                    }
                    if (i == 6)
                    {
                        dr["DocType"] = "06.Ghumasta";
                    }
                    if (i == 7)
                    {
                        dr["DocType"] = "07.GST";
                    }
                    if (i == 8)
                    {
                        dr["DocType"] = "08.Recipt";
                    }
                    if (i == 9)
                    {
                        dr["DocType"] = "09.Cancelled Cheque";
                    }
                    
                   
                   
                   
                    if (i == 10)
                    {
                        dr["DocType"] = "10.Society/Dealer Profile";
                    }
                    if (i == 11)
                    {
                        dr["DocType"] = "11.Others";
                    }
                   
                    dr["ImageName"] = "";
                    dr["CreateDate"] = System.DateTime.Now.ToString();
                    dtaR.Rows.Add(dr);

                }
                GridView2.DataSource = dtaR;
                GridView2.DataBind();
            }


            //for (int i = 0; i < GridView1.Rows.Count; i++)
            //{
            //    Label lblId = (Label)GridView1.Rows[i].FindControl("lblTranId");
            //    TextBox text = (TextBox)GridView1.Rows[i].FindControl("txtRemark");
            //    Label lblCreateDate = (Label)GridView1.Rows[i].FindControl("lblCreateDate");

            //    if (lblId.Text != "")
            //    {
            //        text.Enabled = false;
            //        lblCreateDate.Enabled = false;
            //        if (strRemark == "")
            //        {
            //            strRemark = strRemark + "," + text.Text;
            //        }
            //        else
            //        {
            //            strRemark = strRemark + "," + text.Text;
            //        }
            //        txtRemark.Text = strRemark;
            //    }

            //}


            // }
            catch (Exception ex)
            {

            }
        }
        //protected void lblUpload_Click(object sender, EventArgs e)
        //{
        //    using (var cnt = ConnectionManager.Inst.CreateNewConnection())
        //    {
        //        int regNo = Convert.ToInt32(Request.QueryString["Id"].ToString());
        //        da = new SqlDataAdapter("Select * from RegImage where sno=0", cnt);
        //        da.Fill(ds);
        //        drw = ds.Tables[0].NewRow();
        //        if (FileUpload1.HasFile)
        //        {
        //            string FileName = System.IO.Path.GetFileName(FileUpload1.PostedFile.FileName);

        //            FileUpload1.PostedFile.SaveAs(Server.MapPath("/RegImg/" + FileName));
        //            MailAttachment attach = new MailAttachment(Server.MapPath("/RegImg/" + FileName));

        //            drw["ImageName"] = FileName;
        //            drw["RegNo"] = regNo;
        //            drw["CreateDate"] = System.DateTime.Now;

        //            ds.Tables[0].Rows.Add(drw);

        //            SqlCommandBuilder cmb = new SqlCommandBuilder(da);
        //            da.Update(ds);
        //            MessageBox.Show("Image Uploaded Successfully...");


        //        }




        //    }
        //}

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int intRegId = 0;
            foreach (GridViewRow row in gvMenuTiming.Rows)
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
                            da = new SqlDataAdapter("select * from MainImage where Sno=" + intRegId + "", cnt);
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

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            SaveAttachments();
        }
        protected string SaveAttachments()
        {
            string strFileName = "";
            string strFileNames = ""; ;
            DataSet dss = new DataSet();
            DataRow dr;
            string Id = Request.QueryString["Id"].ToString();
            MDC.OpenConnetion();

            for (int i = 0; i < GridView2.Rows.Count; i++)
            {

                Label lblDocType = (Label)GridView2.Rows[i].FindControl("lblDocType");

                Label lblId = (Label)GridView2.Rows[i].FindControl("lblAttachmentId");
                //  Label lblCreateDate = (Label)GridView1.Rows[i].FindControl("lblCreateDate");
                HtmlInputFile inpAttachment2 = (HtmlInputFile)GridView2.Rows[i].Cells[0].FindControl("inpAttachment2");

                inpAttachment2.Attributes["type"] = "file";

                /* Get a reference to PostedFile object */
                HttpPostedFile attFile = inpAttachment2.PostedFile;
                /* Get size of the file */
                if (attFile != null)
                {
                    int attachFileLength = attFile.ContentLength;

                   //strFileName = Path.GetFileName(inpAttachment2.PostedFile.FileName);
                    /* Save the file on the server */

                    if (attFile.FileName != "")
                    {
                        strFileName = attFile.FileName;
                       // strFileName = CmpId + "_" + strFileName;
                        string strPath = Server.MapPath("neuroimg/" + strFileName);

                        if (strFileNames == "")
                        {
                            strFileNames = strFileName;
                        }
                        else
                        {
                            strFileNames = strFileNames + " " + strFileName;
                        }
                        inpAttachment2.PostedFile.SaveAs(Server.MapPath("neuroimg/" + Id+"_"+strFileName));
                        /* Create the email attachment with the uploaded file */
                        MailAttachment attach = new MailAttachment(Server.MapPath("/neuroimg/" + Id + "_" + strFileName));
                    }
                    if (strFileName != "")
                    {
                      //  string Id = Request.QueryString["Id"].ToString();
                        //SqlDataAdapter da = new SqlDataAdapter("Select * from FileAttachmentDetail where PK_AttachmenDetailId=0", MDC.SqlCon);
                        SqlDataAdapter da = new SqlDataAdapter("Select * from MainImage where Sno=0", MDC.SqlCon);
                        da.Fill(dss);

                        dr = dss.Tables[0].NewRow();
                        //dr["Sno"] = i;
                        dr["MemberId"] =Convert.ToInt32(Id);
                        dr["ImageName"] = strFileName;
                        dr["CreateDate"] = System.DateTime.Now;
                        dr["DocType"] = lblDocType.Text;

                        dss.Tables[0].Rows.Add(dr);

                        SqlCommandBuilder cmb = new SqlCommandBuilder(da);
                        da.Update(dss);
                        strFileName = "";
                    }
                    
                }
              
                //  }
            }
            MessageBox.Show("Document(s) Uploaded Successfully...");
            FillImages();
            return strFileNames;
        }
    }
}