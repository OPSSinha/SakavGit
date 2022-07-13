using System;

using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace BachatBazaar
{
    public partial class OfflineReceipt : System.Web.UI.Page
    {
        public string htmlStr;
        public int id = 0;
        MyDataConnection MDC = new MyDataConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            //  GetReceipt();
            if (!IsPostBack)
            {
                SaveOrder();
                htmlStr = GetReceipt();
            }

        }

        protected int GetMaxNo()
        {
            int i = 0;
            using (var cnt = ConnectionManager.Inst.CreateNewConnection())
            {

                SqlDataAdapter daMax = new SqlDataAdapter("Select Max(Sno) from OrderMaster", cnt);
                DataSet dsMax = new DataSet();
                daMax.Fill(dsMax);
                if (dsMax.Tables[0].Rows.Count > 0)
                {
                    if (dsMax.Tables[0].Rows[0][0] == null || dsMax.Tables[0].Rows[0][0].ToString() == "")
                    {
                        i = 1;
                    }
                    else
                    {
                        i = Convert.ToInt32(dsMax.Tables[0].Rows[0][0].ToString()) + 1;
                    }
                }
                else
                {
                    i = 1;
                }


            }
            return i;
        }
        protected void SaveOrder()
        {
            try
            {
                
                using (var cnt = ConnectionManager.Inst.CreateNewConnection())
                {
                    cnt.Open();
                    int x = 0;
                    SqlDataAdapter da = new SqlDataAdapter("Select * from OrderMaster where Sno=0", cnt);
                    DataSet ds = new DataSet();
                    DataRow drw;

                    da.Fill(ds);
                    drw = ds.Tables[0].NewRow();
                    x = GetMaxNo();
                    drw["Sno"] = x;
                    drw["FullName"] = ".";
                    drw["AddressType"] = ".";
                    drw["MobileNo"] = "."; //Session["MobileNo"].ToString();
                    drw["EmailId"] = ".";
                    drw["Address"] = ".";
                    drw["LandMark"] = ".";
                    drw["City"] =".";
                    drw["OrderDate"] = System.DateTime.Now;
                    drw["DispatchDate"] = System.DateTime.Now;
                    drw["DispatchBy"] = ".";
                    drw["Status"] = ".";
                    drw["OrderType"] = "offline";
                    ds.Tables[0].Rows.Add(drw);

                    SqlDataAdapter daOrders = new SqlDataAdapter("select Max(Sno)  from OrderDetail", cnt);
                    DataSet dsOrders = new DataSet();
                    daOrders.Fill(dsOrders);

                   // int OrderId = Convert.ToInt32(dsOrders.Tables[0].Rows[0][0].ToString());

                    SqlDataAdapter daOrder = new SqlDataAdapter("select * from OrderDetail where Sno=0", cnt);
                    DataSet dsOrder = new DataSet();
                    daOrder.Fill(dsOrder);
                    int i = 0;
                    DataRow drOrder;
                    DataTable dtLocal = (DataTable)Session["dtLocal"];

                    string svt = dtLocal.Rows.Count.ToString();


                    foreach (DataRow dr in dtLocal.Rows)
                    {
                        drOrder = dsOrder.Tables[0].NewRow();
                        drOrder["FK_OrderId"] = x;
                        drOrder["ItemName"] = dr["ItemName"].ToString();
                        drOrder["ItemId"] = Convert.ToInt32(dr["ItemId"].ToString());
                        drOrder["Qty"] = Convert.ToDecimal(dr["Qty"].ToString());
                        drOrder["Amount"] = Convert.ToDecimal(dr["Amount"].ToString());
                        drOrder["EmailId"] = ".";
                        drOrder["OrderDate"] = System.DateTime.Now;

                        DataTable dtImage = MDC.getDataTable("select * from ItemMaster where PK_ItemId=" + Convert.ToInt32(dr["ItemId"].ToString()) + "");
                        if (dtImage.Rows.Count > 0)
                        {
                            drOrder["ImageName"] = dtImage.Rows[0]["ImageName"].ToString();
                        }
                        dsOrder.Tables[0].Rows.Add(drOrder);
                    }
                    SqlCommandBuilder cmbs = new SqlCommandBuilder(daOrder);
                    daOrder.Update(dsOrder);

                    SqlCommandBuilder cmb = new SqlCommandBuilder(da);
                    da.Update(ds);
                    //SendMail(txtEmailId.Value, x);
                    MessageBox.Show("Thanks for shopping, your order will be delivered shortly...");
                    Session["str"]=MakeReceipt(x);
                   


                    //txtMobileNo.Value = "";
                    //txtLandMark.Value = "";
                    //txtAddress.Value = "";
                    //txtAddressType.Value = "";
                    //txtCity.Value = "";
                    //txtEmailId.Value = "";
                    //txtFullName.Value = "";
                }
            }
            catch (Exception ex)
            {

            }
        }
        protected string MakeReceipt(Int32 Id)
        {
            string htmlStr = "";
            using (var cnt = ConnectionManager.Inst.CreateNewConnection())
            {
                int n = 1;
                decimal dsAmt = 0;
              //  int id = Convert.ToInt32(Request.QueryString["Id"].ToString());
                //int ids = Convert.ToInt32(Request.QueryString["Ids"].ToString());
                SqlDataAdapter da = new SqlDataAdapter("select * from OrderMaster where Sno=" + Id + "", cnt);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    SqlDataAdapter daPrint = new SqlDataAdapter("select * from OrderDetail where FK_OrderId=" + Id, cnt);
                    DataSet dsPrint = new DataSet();
                    daPrint.Fill(dsPrint);
                    if (dsPrint.Tables[0].Rows.Count > 0)
                    {
                       
                        DataTable dtFirm = MDC.getDataTable("select * from OrderMaster  where Sno=" + Id + "");
                        if (dtFirm.Rows.Count > 0)
                        {



                            htmlStr += "<table width=100% border='1' height='100px'><tr><td align=center><Strong>"+ Convert.ToString(dtFirm.Rows[0]["FullName"] +"") + "</Strong></td></tr>";
                            htmlStr += "<tr><td align=center><Strong>"+ Convert.ToString(dtFirm.Rows[0]["Address"] + "") +","+ Convert.ToString(dtFirm.Rows[0]["MobileNo"] + "") + "," + Convert.ToString(dtFirm.Rows[0]["Address"] + "") + "</Strong></td></tr>";
                            htmlStr += "<tr><td align=center><Strong>" + Convert.ToString(dtFirm.Rows[0]["MobileNo"] + "") + ","+ Convert.ToString(dtFirm.Rows[0]["LandMark"] + "") + ",EmailId:"+ Convert.ToString(dtFirm.Rows[0]["EmailId"] + "") + "</Strong></td></tr>";
                            htmlStr += "</table>";
                            htmlStr += "<table width=100% border='1'><tr><td align=center><Strong>Receipt</Strong></td></tr></table>";
                            htmlStr += "<table width=100% border='1'><tr><td height='400px' valign='top'>";
                            htmlStr += "<table style='padding:2px' width=100%><tr><td><Strong>Receipt No :</Strong></td><td>" + Id + "</td><td><Strong>Date:</Strong></td><td>" + Convert.ToDateTime(System.DateTime.Now).ToString("dd/MM/yyyy") + "</td><td><Strong>Delivery Boy:</Strong></td><td>Delivery From Shop</td></tr>";
                            //if (ds.Tables[0].Rows[0]["DispatchDate"].ToString().Length > 0)
                            //{
                            //    htmlStr += "<tr><td><Strong>Name :</Strong></td><td>" + ds.Tables[0].Rows[0]["FullName"].ToString() + "</td><td><Strong>City :</Strong></td><td>" + ds.Tables[0].Rows[0]["City"].ToString() + "</td><td><Strong>Dispatch Date:</Strong></td><td>" + Convert.ToDateTime(System.DateTime.Now).ToString("dd/MM/yyyy") + "</td></tr>";
                            //}
                            //else
                            //{
                            //    htmlStr += "<tr><td><Strong>Name :</Strong></td><td>" + ds.Tables[0].Rows[0]["FullName"].ToString() + "</td><td><Strong>City :</Strong></td><td>" + ds.Tables[0].Rows[0]["City"].ToString() + "</td><td><Strong>Dispatch Date:</Strong></td><td></td></tr>";
                            //}

                            htmlStr += "<tr><td><Strong>Address :</Strong></td><td colspan='3'>" + ds.Tables[0].Rows[0]["Address"].ToString() + "</td><td><Strong>Mobile No :</Strong></td><td colspan='2'>" + ds.Tables[0].Rows[0]["MobileNo"].ToString() + "</td></tr>";

                            htmlStr += "<table width=100% border='1'><tr><td align=left><Strong>SN.</Strong></td><td align=left><Strong>Item Name</Strong></td><td align=right><Strong>Qty</Strong></td><td align=right><Strong>Amount</Strong></td></tr>";
                            foreach (DataRow dr in dsPrint.Tables[0].Rows)
                            {
                                htmlStr += "<tr><td align=left valign='top'>" + n + "</td><td align=left valign='top'>" + dr["ItemName"] + "</td><td align=right valign='top'>" + dsPrint.Tables[0].Rows[0]["Qty"].ToString() + "</td><td align=right valign='top'>" + dsPrint.Tables[0].Rows[0]["Amount"].ToString() + "</td></tr>";
                                dsAmt = dsAmt + Convert.ToDecimal(dsPrint.Tables[0].Rows[0]["Amount"].ToString());
                                n = n + 1;
                            }

                            htmlStr += "<tr><td align='right' valign='top' colspan='2'>TOTAL :</td><td></td><td align=right valign='top'>" + dsAmt + "</td></tr>";
                            htmlStr += "</table>";
                            htmlStr += "<table width=100% border='1'><tr><td align='right' height='100px' valign='bottom' style='padding:2px'><Strong>Admin</Strong></td></tr></table>";
                        }
                    }
                }
            }
            return htmlStr;
        }
        protected string GetReceipt()
        {
            string htmlStr  = Session["str"].ToString();
            return htmlStr;
        }
    }
}