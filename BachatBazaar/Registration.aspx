<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile ="~/Site1.Master" CodeBehind="Registration.aspx.cs" Inherits="BachatBazaar.Registration" %>
<%--<%@ Page Language="C#" AutoEventWireup="True" MasterPageFile ="~/Site1.Master"  CodeBehind="Form_D_Society.aspx.cs" Inherits="BachatBazaar.Form_D_Society" %>
--%>
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
    
  
    <div class="container">
        <%--<table width="100%" style ="padding:5px">
            <tr>
            <td style="text-align:justify;padding:5px">
                <br /><b style="font-weight:bold;">सप्रेम नमस्कार,</b><br />
              <b>‘‘साकव’’</b> चा अर्थ पुल,माध्यम केव्हा जोडण्या साठी केलेला प्रयत्न, ह्या अनुशंघा ने साकव सेवा संस्था ही संघटना स्थापन करण्यात आली आहे ज्याचा 
                मध्यमाने सर्व मराठी भाषिक मंडली / व्यवसायी /उधोजका साठी सम्पूर्ण भारतात सोयी व व्यवसाय करण्याचा व व्यवसाय वाढी चा सोपा मार्ग आहे<br />
                <b style="font-weight:bold;text-align:center;width:100%;float:left;color: #dfc222;font-size:20px;">उद्देश्य</b><br> 
                ह्या संघटने चा मूळ उद्देश सम्पूर्ण भारतात सलग्न समस्त मराठी भाषी संस्था / व्यक्तिनां  व्यवसाय व ओधोगिक जगात आर्थिक दृष्टया  सुध्रड  व  मजबूत करणे ह्यांचे उत्पाद ला बाजारात   
                स्थापित करण्या साठी  योजना तयार करणे, विभिन्न माध्यमातुन  विज्ञापन करणे , केंद्र व राज्य सरकार च्या बरोबर मिळून मेळे  आयोजित करणे , उत्पादना च्या  गुणवत्ते मध्ये  सुधार
                करण्या साठी  व विक्री वाढी साठी वर्कशॉप आयोजित करणे, सरकारी योजना चा फायदा आपल्या लोकां पर्यंत पोह्चावणे स्किल डेवलपमेंट च्या अंतर्गत स्वता चे उत्पाद निर्माण करविणे, 
                रोजगार निर्माण उपलब्ध करविणे, ह्या शिवाय आपल्या सभासदा साठी विभिन्न सोयी, पर शहरात निवासी व्यवस्था करणे, यात्रा दरम्यान व घरी टिफिन व्यवस्था, कलाकाराना साठी मंच, 
                परिचय सम्मलेन, वरिष्ठ  नागरिका साठी सोयी,  चिकित्सा व अन्य ......<br /><br />
                <b style="font-weight:bold;text-align:center;width:100%;float:left;color: #dfc222;font-size:20px;">‘‘साकव’’  :- कामा  ची मांडणी </b><br>
               ह्या अंतर्गत प्रत्येक शहरात समन्वयक म्हणुन स्थानीय संस्था / व्यक्ति
               अथवा दोन्ही नेमण्यात येतील व ह्याना पुढे “C” को-ऑर्डिनेटर (समन्वयक)
               म्हणण्यात येइल ह्या साठी पंजीयन  राशी रु १०००/- वार्षिक राहिल|</b><br>
                “C” को-ऑर्डिनेटर (समन्वयक) च्या  मध्यमाने छोटे /माध्यम
                /मोठे, व्यवसायी / उद्योजक / निवास व्यवस्था होस्ट (यजमान) ‘‘साकव’’ 
                बरोबर सलग्न होऊ शकतील पुढे ह्याना “D” डीलर (वितरक) म्हणण्यात येइल
                ह्या साठी पंजीयन  राशी रु ५००/- वार्षिक राहिल| 
                <br />
                <b style="font-weight:bold;text-align:center;width:100%;float:left;color: #dfc222;font-size:20px;">‘‘साकव’’  :- व्यवसाय अश्या  प्रकारे होणार </b><br>
                ‘‘साकव’’ द्वारा एक ऑनलाइन ऐप तयार करण्यात येत आहे, सलग्न  “D” 
                डीलर (वितरक) आपले प्रोडक्ट (उत्पाद) ह्या ऐप वर अपलोड करतील व 
                ऑनलाइन पद्धति ने विक्री व निवास व्यवस्था होईल<br />
                मराठी पाऊल पड़ते पुढे, हे ब्रीद वाक्य धरून एक पाऊल  पुढे टाकण्याचा हा 
               आमचा प्रयत्न आहे  निश्चितच हयात आपला सहभाग आम्हाला लाभणार आहे 
               आणि आम्ही सगले मिळून हे लक्ष गाठू<br />
               विस्तृत माहिती साठी व्हाट्स अप्प क्र 9098938181  वर संपर्क करू शकता|
             </td>
        </tr>
        </table>--%>
         <div align="center">
		    <h2 class="text-dark mb-2" style="font-weight:bold;color: #dfc222 !important;font-size:30px;">Registration Form</h2>
         </div>
           
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
                                <%--<label class="col-md-4">Reg No</label>--%> 
                        <div class="col-md-8"><asp:TextBox ID="txtRegNo" class="form-control" runat ="server" Visible="false" Enabled="false" style="width:100%;"></asp:TextBox>
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
                <tr>
                    <td colspan ="3" style="height:5px">
                        <asp:CheckBox ID="chkPhoto" runat="server" Visible="false" />
                        <asp:CheckBox ID="chkAdharCard" runat="server" Visible="false" />
                        <asp:CheckBox ID="chkPayementSlip" runat="server" Visible="false" />
                    </td>
                   
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="150px" Visible="false" Width="120px" />
                        <br />
                        <asp:FileUpload ID="FileUpload2" runat="server" Visible="false" />
                        <br />
                        <asp:Button ID="Button1" runat="server" OnClick="Upload" Text="Upload" Visible="false" />
                    </td>
                </tr>
              
            </caption>
        </table>
          
    <%--<table align="center" style="margin-left:20px; width:100%;border-color:2px solid black" >
    --%>
            
    <table>
        <tr>

        <td>
    <b style="width: 100%;float: left;font-weight: bold;text-align:center;">Upload Adhar Card, Payment Slip, Photo</b>
    <br />
    <div class="form-group">
         <div class="col-md-12">
            <div class="row">
     <asp:Label ID="lbl1" runat="server" Text="Select File Type" CssClass="col-md-4"></asp:Label>
                <div class="col-md-8">
                    <asp:DropDownList ID="ddlId" class="form-control"  runat="server"  style="float:left;">
                       
                    </asp:DropDownList>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                     
                  <asp:Button ID="btnUploads" runat="server" Text="Upload Images" OnClick="btnUpload_Click" />         
                </div>
        
  <br />
<br />
                
                <center>
<asp:GridView ID="grdImages" runat="server" AutoGenerateColumns="False" 
            EmptyDataText = "No files uploaded" 
            EnableModelValidation="True" ForeColor="#333333" GridLines="None"
            onrowdeleting="grdImages_RowDeleting" DataKeyNames="Image_Id,Image_Path">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>  

     <asp:TemplateField HeaderText="Image" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
             
                <asp:Image ID="Image2" src='<%#Eval("Image_Path") %>'  runat ="server" Height ="150px" Width ="120px" />
            </ItemTemplate>
     </asp:TemplateField>
        
        <asp:BoundField HeaderText="Type" DataField="IdType" />
          
              <asp:TemplateField HeaderText="Download" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:ImageButton ID="imgDownload" runat="server" ImageUrl="~/Images/DownloadIcon.png" OnClick="imgDownload_Click" ToolTip="Download Image" CausesValidation="false"   />
            <%-- ToolTip="Download Image" CausesValidation="false" OnClick="imgDownload_Click"--%>
        </ItemTemplate>
        </asp:TemplateField>

         <asp:TemplateField HeaderText="Delete"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                 <asp:ImageButton ID="imgDelete" runat="server" CommandName="Delete"  ImageUrl="~/Images/Delete.png" OnClientClick="return confirm('Are you sure you want to delete selected record ?')" ToolTip="Delete" CausesValidation="false" />
            <%--CommandName="Delete" --%>
            </ItemTemplate>
         </asp:TemplateField>
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
                      मै संस्था &quot;साकव&quot; की वार्षिक सदस्यता प्रवज्ञ &nbsp;<asp:DropDownList ID="DrpRank" runat ="server" AutoPostBack="true" OnSelectedIndexChanged="DrpRank_SelectedIndexChanged" OnTextChanged="DrpRank_TextChanged">
                          <asp:ListItem Value ="Select" Text ="Select"></asp:ListItem>
                          <asp:ListItem Value ="C-Individual" Text ="C-Individual"></asp:ListItem>
                          <asp:ListItem Value ="C-Society" Text ="C-Society"></asp:ListItem>
                          <asp:ListItem Value ="D-Individual" Text ="D-Individual"></asp:ListItem>
                          <asp:ListItem Value ="D-Society" Text ="D-Society"></asp:ListItem>

                                                                                  </asp:DropDownList> श्रेणी (समन्यवक) की सदस्यता प्राप्त करने हेतु आवेदन कर रहा/रही&nbsp; हु |
                        <br />
                        इस हेतु Rs.&nbsp;<div class="form-group"><asp:TextBox ID="txtRs" Text="500" class="form-control" runat ="server" ></asp:TextBox></div>&nbsp; साकव सेवा संस्था के खाता क्र  60347976796 (IFSC CODE MAHB0000768, MICR CODE 452014004) बैंक ऑफ़ महाराष्ट्र. लोकमान्य नगर शाखा &nbsp;&nbsp;<br />
                        में &nbsp;<asp:DropDownList ID="DropDownList1" runat ="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
                          <asp:ListItem Value ="Select" Text ="Select"></asp:ListItem>
                            <asp:ListItem Value ="नगद" Text ="नगद"></asp:ListItem>
                          <asp:ListItem Value ="online" Text ="online"></asp:ListItem>
                          <asp:ListItem Value ="चेक" Text ="चेक"></asp:ListItem>
                          </asp:DropDownList> &nbsp; द्वारा जमा किये है 
                       
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
                        <div class="col-md-8">
                            <asp:DropDownList ID="drpRefMember" AutoPostBack="true" runat="server" class="form-control" style="border-color:black">
                            </asp:DropDownList>
                            </div>
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
              <div class="form-group"><asp:TextBox ID="txtEnglishName" style="border-color:black" runat="server"  class="form-control" OnTextChanged="txtEnglishName_TextChanged"></asp:TextBox></div>
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
                <div class="form-group"><asp:DropDownList ID="DrpState" class="form-control" runat="server" style="border-color:black" AutoPostBack="true"  OnSelectedIndexChanged="DrpState_SelectedIndexChanged">
                </asp:DropDownList></div>
               </td>
            </tr>

            <tr>
              <td><label>City</label> </td>
                <td>
                  <div class="form-group">
                      <asp:DropDownList ID="DrpCity" runat="server" class="form-control" style="border-color:black" AutoPostBack="true" OnSelectedIndexChanged ="DrpCity_SelectedIndexChanged">
                      </asp:DropDownList>
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
                      <asp:DropDownList ID="ddlPin" runat="server" class="form-control" style="border-color:black" AutoPostBack="true" OnSelectedIndexChanged="ddlPin_SelectedIndexChanged">
                      </asp:DropDownList>
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
          <div class="form-group"><asp:TextBox ID="txtPassword" style="border-color:black" runat="server" class="form-control" TextMode="Password"></asp:TextBox></div>
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
          <div class="form-group"><asp:TextBox ID="txtFirmName" style="border-color:black" runat="server" class="form-control"></asp:TextBox></div>
                    
                 <%--// <div class="form-group"><asp:TextBox ID="TextBox1" runat="server"  AutoPostBack="true" class="form-control"  Visible="false"></asp:TextBox></div>--%>
                </td>
            </tr>
     
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
                                  
               <asp:Button class="btn btn-primary" ID="btnSubmit"  OnClientClick ="return doConfirm();" runat ="server"  Text ="SUBMIT" OnClick="btnSubmit_Click" />
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
              
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                