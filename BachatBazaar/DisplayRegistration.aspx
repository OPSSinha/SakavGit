<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile ="~/Site1.Master" CodeBehind="DisplayRegistration.aspx.cs" Inherits="BachatBazaar.DisplayRegistration" %>


<asp:Content ID ="contentss" ContentPlaceHolderID ="ContentPlaceHolder1" runat ="server">
    <!-- //Web-Fonts -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="Scripts/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-2.2.3.min.js"></script>
    <script src="Scripts/jquery.min.js" ></script>
    <script src="Scripts/jquery-ui.min.js" ></script>
    <link href="Scripts/jquery-ui.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script>
      function GetImage() {
             
             var x = document.getElementById("<%=txtRegNo.ClientID%>").value;
         
           window.open("ImageUploadReg.aspx?Id="+x,"_blank", "WIDTH=1080,HEIGHT=790,scrollbars=no, menubar=no,resizable=yes,directories=no,location=no");  
       }
           function doConfirm(){
           if (confirm("Are you sure you want to continue?")) {
               return true;

           }
           else {
               return false;
           }
        }
   </script>
 <%--<script type="text/javascript">
         $(function () {
             $("[id$=txtMenuDate]").datepicker({
                 showOn: 'button',
                 buttonImageOnly: true,
                 buttonImage: 'img/cal-icon.png',
                 dateFormat: "dd/mm/yy",
                 padding:'20px'

             });
          
         });
    </script>--%>
    <style>
        .img-fluid{
            height:280px;
            width : 100%;
            background-color:darkslategray;
        }
        img.InGrid
        {
            max-width: 50px;
            max-height: 50px;
        }
        select.form-control {
            height: 34px !important;
        }
        
    .anji{
    <div class="form-group" style="width:190px;">
    <input class="form-control" id="exampleFormControlInput1"  placeholder="">
  </div>
    }
  </style>
   <%--   <img src="images/banner2.jpg"  class="img-fluid" style="width:100%;" />--%>
   <%--  <img src="images/banner2.jpg"   style="width:100%;" />--%>
	
		<!-- //banner 2 -->

	<!-- gallery page -->
    <div class="breadcrumb-agile container"  style="margin-left:5px;margin-top:20px;">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb m-0">
				<li class="breadcrumb-item">
					<a href="Default.aspx">Home</a>
				</li>
			</ol>
		</nav>
	</div>
    
  <br />
    
           
  <%--  <table align="center" style="margin-left:20px; width:100%;border-color:2px solid black">
  --%>
   <%-- <asp:UpdatePanel ID="op" runat ="server" >
         <ContentTemplate>  --%>
            <%-- <form>--%>
    <table>
        
            <tr>
                <td>
                    <div class="form-group">
                        <div class="col-md-12">
                            <div class="row">
                                <label class="col-md-4">Reg No</label> 
                        <div class="col-md-8"><asp:TextBox ID="txtRegNo" class="form-control" runat ="server" Enabled="false" style="width:100%;"></asp:TextBox>
                        </div>

                            </div>
                            </div>
                        </div>
                 </td>
                        
            </tr>
            <caption>
              
                <%--<tr>
                    
                    <td><div class="form-group">
                        <div class="col-md-12">
                            <div class="row"><label class="col-md-4">Ref. Member </label>
                        <div class="col-md-8">
                            <asp:DropDownList ID="drpRefMember" AutoPostBack="true" runat="server" class="form-control" style="border-color:black">
                            </asp:DropDownList>
                            </div>
                        </div>
                            </div>
                        </div>
                        
                    </td>
                </tr>--%>
               <%-- <tr>
                    <td colspan ="3" style="height:5px">
                        <asp:CheckBox ID="chkPhoto" runat="server" Visible="false" />
                        <asp:CheckBox ID="chkAdharCard" runat="server" Visible="false" />
                        <asp:CheckBox ID="chkPayementSlip" runat="server" Visible="false" />
                    </td>
                   
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="150px" Visible="false" Width="120px" />
                        <br />--%>
                        <%--<asp:FileUpload ID="FileUpload2" runat="server" Visible="false" />--%>
                       <%-- <br />--%>
                       <%-- <asp:Button ID="Button1" runat="server" OnClick="Upload" Text="Upload" Visible="false" />--%>
                    <%--</td>--%>
               <%-- </tr>
              --%>
            </caption>
        </table>
          
    <%--<table align="center" style="margin-left:20px; width:100%;border-color:2px solid black" >
    --%>
            
    <table>
        <tr>

        <td>
    <%--<b style="width: 100%;float: left;font-weight: bold;text-align:center;">Upload Adhar Card, Payment Slip, Photo</b>
    <br />
    <div class="form-group">
         <div class="col-md-12">
            <div class="row">
     <asp:Label ID="lbl1" runat="server" Text="Select File Type" CssClass="col-md-4"></asp:Label>--%>
                <%--<div class="col-md-8">
                    <asp:DropDownList ID="ddlId" class="form-control"  runat="server"  style="float:left;">
                       
                    </asp:DropDownList>--%>
                    <%--<asp:FileUpload ID="FileUpload1" runat="server" />
                     
                  <asp:Button ID="btnUploads" runat="server" Text="Upload Images" OnClick="btnUpload_Click" />         --%>
               <%-- </div>--%>
        

                
                <center>
<asp:GridView ID="grdImages" runat="server" AutoGenerateColumns="False" 
            EmptyDataText = "No files uploaded" 
            EnableModelValidation="True" ForeColor="#333333" GridLines="None"
             DataKeyNames="Image_Id,Image_Path">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>  

     <asp:TemplateField HeaderText="Image" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
             
                <asp:Image ID="Image2" src='<%#Eval("Image_Path") %>'  runat ="server" Height ="150px" Width ="120px" />
            </ItemTemplate>
     </asp:TemplateField>
        
        <asp:BoundField HeaderText="Type" DataField="IdType" />
          
              <%--<asp:TemplateField HeaderText="Download" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
        <ItemTemplate onrowdeleting="grdImages_RowDeleting"  >
            <asp:ImageButton ID="imgDownload" runat="server" ImageUrl="~/Images/DownloadIcon.png" OnClick="imgDownload_Click" ToolTip="Download Image" CausesValidation="false"   />
            <%-- ToolTip="Download Image" CausesValidation="false" OnClick="imgDownload_Click"--%>
       <%-- </ItemTemplate>
        </asp:TemplateField>--%>

         <%--<asp:TemplateField HeaderText="Delete"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                 <asp:ImageButton ID="imgDelete" runat="server" CommandName="Delete"  ImageUrl="~/Images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete selected record ?')" ToolTip="Delete" CausesValidation="false" />
            <%--CommandName="Delete" --%>
            <%--</ItemTemplate>
         </asp:TemplateField>--%>
    </Columns>
    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
</asp:GridView>
</center>
 
          </td>
           </tr>

    </table>
               


       <%--    <asp:UpdatePanel ID="updMenus" runat ="server" UpdateMode ="Conditional">
            <ContentTemplate>--%>
                <div >
                    <br />
              
                    
              
    
                   
<asp:UpdatePanel ID="upPanel" runat ="server" >
    <ContentTemplate> 
   <table style="padding:5px; width:100%;">
         
         <%--   <table align="center" style="margin-left:20px; width:100%;border-color:2px solid black" >
         --%>   <tr>
                <td>
  
      <b>नोट :-</b> सदयस्ता हेतु धनादेश " साकव सेवा संस्था " के नाम से दये होगा |फोटो,आधार कार्ड,जमा की रसीद.,चेक सलग्न आवश्यक है |
           इन सभी की सॉफ्ट कॉपी साथ में लेकर बैठे। अपलोड करते समय परेशानी नहीं हो।
           

                </td>
                </tr>
                <tr>
                <td>
                      मै संस्था &quot;साकव&quot; की वार्षिक सदस्यता प्रवज्ञ &nbsp;<asp:TextBox ID="txtRank" runat="server"></asp:TextBox> श्रेणी (समन्यवक) की सदस्यता प्राप्त करने हेतु आवेदन कर रहा/रही&nbsp; हु |
                        <br />
                        इस हेतु Rs.&nbsp;<div class="form-group"><asp:TextBox ID="txtRs"  class="form-control" runat ="server" ></asp:TextBox></div>&nbsp; साकव सेवा संस्था के खाता क्र  60347976796 (IFSC CODE MAHB0000768, MICR CODE 452014004) बैंक ऑफ़ महाराष्ट्र. लोकमान्य नगर शाखा &nbsp;&nbsp;<br />
                        में &nbsp;<%--<asp:DropDownList ID="DropDownList1" runat ="server" >
                          <asp:ListItem Value ="Select" Text ="Select"></asp:ListItem>
                            <asp:ListItem Value ="नगद" Text ="नगद"></asp:ListItem>
                          <asp:ListItem Value ="online" Text ="online"></asp:ListItem>
                          <asp:ListItem Value ="चेक" Text ="चेक"></asp:ListItem>
                          </asp:DropDownList>--%><asp:TextBox ID="txtPaymentMode" runat="server"></asp:TextBox>  &nbsp; द्वारा जमा किये है 
                       
                        <br />
                   <%--     <div class="form-group"><input name="text" style="width:170px;border-color:black" class="form-control" runat="server" id="txtChequeNo" /> </div>के &nbsp; &nbsp; बैंक / शाखा
                        <div class="form-group"><input id="txtBankName" class="form-control" style="width:170px; text-transform:uppercase; border-color:black" runat ="server"  name="text" /></div> के &nbsp; दिनांक
                        <div class="form-group"><input id="txtChequeDate" class="form-control" runat ="server"  name="text" placeholder="dd/mm/yyyy" style="width:170px;border-color:black" ></div> के द्वारा<br />
                        <br />
                       जमा कर रहा / रही हु | --%>

       
            </td>
        </tr>
      <tr>
                    
                    <td><div class="form-group">
                        <div class="col-md-12">
                            <div class="row"><label class="col-md-4">Ref. Member </label>
                        <%--<div class="col-md-8">--%>
                            <%--<asp:DropDownList ID="drpRefMember" AutoPostBack="true" runat="server" class="form-control" style="border-color:black">
                            </asp:DropDownList>--%>
                            <div class="form-group"><asp:TextBox ID="txtRefMember"  style="border-color:black" runat="server"  class="form-control"></asp:TextBox></div>
                           <%-- </div>--%>
                        </div>
                            </div>
                        </div>
                        
                    </td>
                </tr>

       
</table>
   
 <table align="center" style="border-color:2px solid black;margin: 0 auto;    margin-top: 20px;">
             <tr>
              <td><label>Name</label> </td>
              <td>
              <div class="form-group"><asp:TextBox ID="txtEnglishName" style="border-color:black" runat="server"  class="form-control" ></asp:TextBox></div>
              </td>
             </tr>

             <tr>
              <td><label>Father's / Husband Name</label></td>
               <td>
                <div class="form-group"><asp:TextBox ID="txtFatherEnglishName" style="border-color:black" runat="server"  class="form-control"></asp:TextBox></div>
               </td>
             </tr>

             <tr>
               <td><label>Surname</label></td>
               <td>
                <div class="form-group"><asp:TextBox ID="txtSurNameEng" style="border-color:black" runat="server"  class="form-control"></asp:TextBox></div>
               </td>
            </tr>
          <tr>
               <td><label>State</label> </td>
               <td>
                <%--<div class="form-group"><asp:DropDownList ID="DrpState" class="form-control" runat="server" style="border-color:black" AutoPostBack="true"  >
                </asp:DropDownList></div>--%>
                   <div class="form-group"><asp:TextBox ID="txtState" style="border-color:black" runat="server"  class="form-control"></asp:TextBox></div>
               </td>
            </tr>

            <tr>
              <td><label>City</label> </td>
                <td>
                  <div class="form-group">
                      <%--<asp:DropDownList ID="DrpCity" runat="server" class="form-control" style="border-color:black" AutoPostBack="true" >
                      </asp:DropDownList>--%>
                      <div class="form-group"><asp:TextBox ID="txtCity" style="border-color:black" runat="server"  class="form-control"></asp:TextBox></div>
                   </div>
                    
                  <div class="form-group"><asp:TextBox ID="txtCityEnglish" runat="server"  AutoPostBack="true" class="form-control"  Visible="false"></asp:TextBox></div>
                </td>
            </tr>
    
               
        
            <tr>
               <td><label>District</label> </td>
               <td>
                    <div class="form-group"><asp:TextBox ID="txtJilaEnglish" runat="server" style="border-color:black"  class="form-control"></asp:TextBox></div>
               </td>
          </tr>
                            
            <tr>
                <td><label>Tehsil </label></td>
                <td>
                     <div class="form-group"><asp:TextBox ID="txtBlockEnglish" style="border-color:black" runat="server" class="form-control"></asp:TextBox></div>
                </td>
            </tr>
                       
          <%--<tr>
               <td><label>Pin</label> </td>
               <td>
                  
                    <div class="form-group"><asp:TextBox ID="txtPin" runat="server" class="form-control" style="border-color:black"></asp:TextBox></div>
               </td>
         </tr>--%>
     <tr>
              <td><label>Pin</label> </td>
                <td>
                  <div class="form-group">
                     <%-- <asp:DropDownList ID="ddlPin" runat="server" class="form-control" style="border-color:black" AutoPostBack="true" >
                      </asp:DropDownList>--%>
                      <asp:TextBox ID="txtPin" style="border-color:black" runat="server"  class="form-control"></asp:TextBox>
                   </div>
                    
                 <%--// <div class="form-group"><asp:TextBox ID="TextBox1" runat="server"  AutoPostBack="true" class="form-control"  Visible="false"></asp:TextBox></div>--%>
                </td>
            </tr>

                        
       <tr>
               <td><label>Address </label> </td>
               <td>
                     <div class="form-group"><asp:TextBox ID="txtAddressEnglish" style="border-color:black" runat="server"  class="form-control"></asp:TextBox></div>
               </td>
               
      </tr>

      <tr>
        <td><label>Mobile</label> </td>
                                       
        <td>
          <div class="form-group"><asp:TextBox ID="txtMobile" style="border-color:black" runat="server" class="form-control"></asp:TextBox></div>
        </td>
        </tr>
     <tr>
        <td><label>Username</label> </td>
                                       
        <td>
          <div class="form-group"><asp:TextBox ID="txtUsername" style="border-color:black" runat="server" class="form-control"></asp:TextBox></div>
        </td>
        </tr>
      <tr>
        <td><label>Password</label> </td>
                                       
        <td>
          <div class="form-group"><asp:TextBox ID="txtPassword" style="border-color:black" runat="server" class="form-control"></asp:TextBox></div>
        </td>
        </tr>
      <tr>
              <td><label>Business Category</label> </td>
                <td>
                  <div class="form-group">
                      <asp:DropDownList ID="drpBcategory" runat="server" class="form-control" style="border-color:black" >
                      </asp:DropDownList>
                   </div>
                    
                 <%--// <div class="form-group"><asp:TextBox ID="TextBox1" runat="server"  AutoPostBack="true" class="form-control"  Visible="false"></asp:TextBox></div>--%>
                </td>
            </tr>

       <tr>
              <td><label>Firm Name</label> </td>
                <td>
                  <div class="form-group">
                     <asp:TextBox ID="txtFirmName" style="border-color:black" runat="server" class="form-control"></asp:TextBox>
                   </div>
                    
                 <%--// <div class="form-group"><asp:TextBox ID="TextBox1" runat="server"  AutoPostBack="true" class="form-control"  Visible="false"></asp:TextBox></div>--%>
                </td>
            </tr>
     <%--<tr>
        <td><label>Password</label> </td>
                                       
        <td>
          <div class="form-group"><asp:TextBox ID="txtPassword" style="border-color:black" runat="server" class="form-control" TextMode="Password"></asp:TextBox></div>
        </td>
        </tr>--%>
     
                                    <%-- <tr>
                                        <td>फ़ोन एस टी डी </td>
                                        <td>
                                            <asp:TextBox ID="txtPhone" runat="server" style="border-color:black" class="form-control" width="190px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>ईमेल आय डी </td>
                                        <td colspan="3">
                                            <asp:TextBox ID="txtEmail" runat="server" style="border-color:black" class="form-control" width="190px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>पेन क्रमांक </td>
                                        <td>
                                            <asp:TextBox ID="txtPANno" runat="server" style="border-color:black" class="form-control" width="190px"></asp:TextBox>
                                        </td>
                                        <%--<td>संस्था रजिस्रेशन क्रमांक </td>
                                        <td>
                                            <asp:TextBox ID="txtAdhaarNo" style="border-color:black" runat="server" class="form-control" width="190px"></asp:TextBox>
                                        </td>
                                  
                                    <tr>
                                        <td>Username </td>
                                        <td>
                                            <asp:TextBox ID="txtUserName" runat="server" placeholder="User Name"></asp:TextBox>
                                        </td>
                                 <%--       <td>Password</td>
                                        <td>
                                                                          &nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtPassword" Type="password" runat="server" placeholder="Password" TextMode="Password" onclick="myFunction();" ></asp:TextBox>--%>
                                                   <%-- <asp:CheckBox ID="chkShowPWD" runat ="server" AutoPostBack ="true" Text="view" OnCheckedChanged="chkShowPWD_CheckedChanged" /> --%>
                                                  <%-- <input type="checkbox" id="pass" onclick="showpass(this);" />--%>
      </table>
       </ContentTemplate>
  </asp:UpdatePanel>
    
    <table width="100%">
       <tr>
         <td  align="center">
                                  
               <asp:Button class="btn btn-primary" ID="btnSubmit"   runat ="server"  Text="Update" OnClick="btnSubmit_Click"  />
               <%--<asp:Button ID="btnOK" runat ="server" Text ="OK" OnClick ="btnOK_Click" />--%>

            </td>
     </tr>
    </table>

          
        </div>
                 
             


          
                        
         <%--  </td>
                                       
          </tr>--%>
        <%--   </table>
                     </div>    --%>
  <%-- </ContentTemplate>
  </asp:UpdatePanel>--%>
    <%--<Triggers>
                <asp:PostBackTrigger ControlID="btnUpload" />
            </Triggers>--%>
   
  <script type="text/javascript">
      function showpass(check_box) {
                    <%--var spass = document.getElementById("<%=txtPassword.ClientID%>");--%>
          if (check_box.checked)
              spass.setAttribute("type", "text");
          else
              spass.setAttribute("type", "password");
      }
  </script>
   </asp:Content>
