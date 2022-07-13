<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile ="~/Site1.Master"  CodeBehind="EditDSociteyLatest.aspx.cs" Inherits="BachatBazaar.EditDSociteyLatest" %>

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
        
    .anji{
    <div class="form-group" style="width:190px;">
    <input class="form-control" id="exampleFormControlInput1"  placeholder="">
  </div>
    }
  </style>
      <img src="images/banner2.jpg"  class="img-fluid"  />
	
		<!-- //banner 2 -->

	<!-- main -->
	<!-- page details -->
	<div class="breadcrumb-agile container-fluid" >
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb m-0">
				<li class="breadcrumb-item">
					<a href="Default.aspx">Home</a>
				</li>
				<li class="breadcrumb-item active" aria-current="page">Registration - Form D Society</li>
			</ol>
		</nav>
	</div>
	<!-- //page details -->

	<!-- gallery page -->
    
    <div class="title text-center mb-5">
				<h2 class="text-dark mb-2">Registration - Form D Society/Dealer</h2>
                 <h4 class="text-dark mb-2"><b> आवेदन विक्रेता   </b>
                      </h4>
    </div>
  
    <table align="center" style="margin-left:20px; width:100%;border-color:2px solid black">

        
        <tr>
            <td> Reg No.</td>
            <td><asp:TextBox ID="txtRegNo" runat ="server" Width="168px" ></asp:TextBox></td>
        </tr>
        <br />
        <br />
        <tr>
            <td>Ref. Member</td>
            <td>
                <%--<asp:DropDownList ID="drpRefMember" style="border-color:black"runat="server">
                    <asp:ListItem Text="SELECT" Value="SELECT"></asp:ListItem>
                    <asp:ListItem Text="Sanket Joshi" Value="Sanket Joshi">SanKet Joshi</asp:ListItem>
                    <asp:ListItem Text="Milind Karandekar" Value="Milind Karandekar">Milind Karandekar</asp:ListItem>
                    <asp:ListItem Text="Sunil Thosre" Value="Sunil Thosre">Sunil Thosre</asp:ListItem>
                    <asp:ListItem Text="Mrs. Poonam Kulkarni" Value="Mrs. Poonam Kulkarni">Mrs. Poonam Kulkarni</asp:ListItem>
                    </asp:DropDownList>--%>
                 <asp:DropDownList ID="drpRefMember" style="border-color:black"  runat="server">
                                            <asp:ListItem Text="SELECT" Value="SELECT"></asp:ListItem>
                                            <asp:ListItem Text="Sanket Joshi" Value="Sanket Joshi"></asp:ListItem>
                                            <asp:ListItem Text="Milind Karandekar" Value="Milind Karandekar"></asp:ListItem>
                                            <asp:ListItem Text="Sunil Thosre" Value="Sunil Thosre"></asp:ListItem>
                                            <asp:ListItem Text="Mrs. Poonam Kulkarni" Value="Mrs. Poonam Kulkarni"></asp:ListItem>
                                        </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
               <asp:CheckBox ID="chkPhoto" runat="server" Visible="false" /></td>
               <td>
               <asp:CheckBox ID="CheckBox1" runat="server" Visible="false" /></td>
               <td>
               <asp:CheckBox ID="CheckBox2" runat="server" Visible="false"/></td>
               <td>
               <asp:Image ID="Image1"  runat ="server" Height ="150px" Width ="120px" Visible="false" />
                &nbsp;<br />
               <asp:FileUpload ID="FileUpload2" runat="server" Visible="false"  />
               <br />
               <asp:Button ID="Button1" runat="server" Text="Upload" Visible="false" />
               </td>
             </tr>
        </table>
     <table><tr>
         <td>
             <asp:GridView ID="grdImages" runat="server" AutoGenerateColumns="False" 
            EmptyDataText = "No files uploaded" 
            EnableModelValidation="True" ForeColor="#333333" GridLines="None"
            DataKeyNames="Image_Id,Image_Path">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>  

     <asp:TemplateField HeaderText="Image" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
             <%--<img src='<%#Eval("Image_Path") %>' item-style width="100px"  alt="" /> --%> 
                <%--<asp:Image src='<%#Eval("Image_Path") %>' Width="500px" Height = "100px" />--%>
                <%--<img  ItemStyle-Width="50px"  src='<%#Eval("Image_Path") %>' 
ControlStyle-Width="200" ControlStyle-Height = "200"  />--%>
                <asp:Image ID="Image2" src='<%#Eval("Image_Path") %>'  runat ="server" Height ="150px" Width ="120px" />
            </ItemTemplate>
     </asp:TemplateField>
        
        <asp:BoundField HeaderText="Type" DataField="IdType" />
          
              <asp:TemplateField HeaderText="Download" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
        <ItemTemplate>
            <asp:ImageButton ID="imgDownload" runat="server" ImageUrl="~/Images/DownloadIcon.png" OnClick="imgDownload_Click" ToolTip="Download Image" CausesValidation="false" />
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
         </td>
            </tr></table>


           <asp:UpdatePanel ID="updMenus" runat ="server" UpdateMode ="Conditional">
            <ContentTemplate>
                <div >
                    <br />
                    <br />
                    <br />
            <table style="padding :5px; width:100%;">
         <tr>
             <td>
           <b>नोट :-</b> सदयस्ता हेतु धनादेश " साकव सेवा संस्था " के नाम से दये होगा |फोटो,आधार कार्ड,जमा की रसीद.,चेक सलग्न आवश्यक है |
           इन सभी की सॉफ्ट कॉपी साथ में लेकर बैठे। अपलोड करते समय परेशानी नहीं हो। 
             </td>
         </tr>
                <tr>
                <td>
                      मै संस्था &quot;साकव&quot; की वार्षिक सदस्यता प्रवज्ञ &quot;C&quot; श्रेणी (समन्यवक) की सदस्यता प्राप्त करने हेतु आवेदन कर रहा/रही&nbsp; हु |
                        <br />
                        इस हेतु RS.____________ साकव सेवा संस्था के खाता क्र _____________________ बैंक ऑफ़ महाराष्ट्र. लोकमान्य नगर शाखा &nbsp;&nbsp;ACCOUNT NO . 60347976796 IFSC CODE MAHB0000768 MICR CODE 452014004
                        में नगद /online /चेक द्वारा जमा किये है 
                       
                        <br />
                        <input  name="text" style="width:170px;border-color:black"  runat="server" id="txtChequeNo" /> के &nbsp; &nbsp; बैंक / शाखा
                        <input id="txtBankName"  style="width:170px; text-transform:uppercase;border-color:black" runat ="server"  name="text" /> के &nbsp; दिनांक
                        <input id="txtChequeDate" runat ="server"  name="text" placeholder="dd/mm/yyyy" style="width:170px;border-color:black" > के द्वारा<br />
                        <br />
                        जमा कर रहा / रही हु | </div>

       
            </td>
        </tr>

       <table>

             <tr>
              <td>Name  </td>
              <td>
              <asp:TextBox ID="txtEnglishName" style="border-color:black" runat="server" AutoPostBack="true" class="form-control" OnTextChanged="txtEnglishName_TextChanged" width="190px"></asp:TextBox>
              </td>
             </tr>

             <tr>
              <td>Father'S / Husband Name</td>
               <td>
                <asp:TextBox ID="txtFatherEnglishName" style="border-color:black" runat="server" AutoPostBack="true" class="form-control" OnTextChanged="txtFatherEnglishName_TextChanged" width="190px"></asp:TextBox>
               </td>
             </tr>

             <tr>
               <td>Surname</td>
               <td>
                <asp:TextBox ID="txtSurNameEng" style="border-color:black" runat="server" AutoPostBack="true" class="form-control" OnTextChanged="txtFatherEnglishName_TextChanged" width="190px"></asp:TextBox>
               </td>
            </tr>


            <tr>
               <td>State </td>
               <td>
                <asp:DropDownList ID="DrpState"  runat="server" style="border-color:black" AutoPostBack="true" Height="27px" Width="186px">
                </asp:DropDownList>
               </td>
            </tr>

            <tr>
              <td>City </td>
                <td>
                  <asp:DropDownList ID="DrpCity" runat="server" style="border-color:black" AutoPostBack="true" Height="27px" Width="186px" >
                  </asp:DropDownList>
                    <br />
                  <asp:TextBox ID="txtCityEnglish" runat="server" AutoPostBack="true" class="form-control" OnTextChanged="txtCityEnglish_TextChanged" Visible="false" width="190px"></asp:TextBox>
                </td>
            </tr>

            <tr>
               <td>District </td>
               <td>
                    <asp:TextBox ID="txtJilaEnglish" runat="server" style="border-color:black" runat="server" AutoPostBack="true" class="form-control" OnTextChanged="txtJilaEnglish_TextChanged" width="190px"></asp:TextBox>
               </td>
          </tr>
                            
            <tr>
                <td>Tehsil </td>
                <td>
                     <asp:TextBox ID="txtBlockEnglish" style="border-color:black" runat="server" AutoPostBack="true" class="form-control" OnTextChanged="txtBlockEnglish_TextChanged" width="190px"></asp:TextBox>
                </td>
            </tr>
                       
          <tr>
               <td>Pin Code </td>
               <td>
                    <asp:DropDownList ID="DrpPinCode" style="border-color:black" runat="server" Height="27px" Width="186px">
                    </asp:DropDownList>
                    <asp:TextBox ID="txtPin" runat="server" class="form-control" Visible="false" width="190px"></asp:TextBox>
               </td>
         </tr>

                        
       <tr>
               <td>Address  </td>
               <td>
                     <asp:TextBox ID="txtAddressEnglish" style="border-color:black" runat="server" AutoPostBack="true" class="form-control" OnTextChanged="txtAddressEnglish_TextChanged" width="190px"></asp:TextBox>
               </td>
               
      </tr>

      <tr>
        <td>Mobile </td>
                                       
        <td>
          <asp:TextBox ID="txtMobile" style="border-color:black" runat="server" class="form-control" width="190px"></asp:TextBox>
        </td>
        </tr>
</table>
      <table width="100%">
         <tr>
            <td  align="center">
                                  
          <%-- <asp:Button class="btn btn-primary" ID="btnSubmit"  OnClientClick ="return doConfirm();" runat ="server"  Text ="SUBMIT" OnClick="btnSubmit_Click" />
               <asp:Button ID="btnOK" runat ="server" Text ="OK" OnClick ="btnOK_Click" />--%>

            </td>
         </tr>
                </table>
              
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
                                        </td>--%>
                            <%-- <tr>
                                 <td>Address</td>
                                 <td>
                                     <asp:TextBox ID =" txtAddress" runat="server" placeholder="Address"></asp:TextBox>
                                 </td>
                             </tr>--%>
                                    <%--<tr>
                                        <td>Username </td>
                                        <td>
                                            <asp:TextBox ID="txtUserName" runat="server" placeholder="User Name"></asp:TextBox>
                                        </td>--%>
                                 <%--       <td>Password</td>
                                        <td>
                                                                          &nbsp;&nbsp;&nbsp;<asp:TextBox ID="txtPassword" Type="password" runat="server" placeholder="Password" TextMode="Password" onclick="myFunction();" ></asp:TextBox>--%>
                                                   <%-- <asp:CheckBox ID="chkShowPWD" runat ="server" AutoPostBack ="true" Text="view" OnCheckedChanged="chkShowPWD_CheckedChanged" /> --%>
                                                  <%-- <input type="checkbox" id="pass" onclick="showpass(this);" />--%>
      
            <script type="text/javascript">
                function showpass(check_box) {
                    <%--var spass = document.getElementById("<%=txtPassword.ClientID%>");--%>
                    if (check_box.checked)
                        spass.setAttribute("type", "text");
                    else
                        spass.setAttribute("type", "password");
                }
           </script>
                        
                                        </td>
                                        
                                    </tr>
                </ContentTemplate>
          </asp:UpdatePanel>
 
                    
     

     <div>
     <asp:GridView ID="gvMenuTiming"  runat="server" AutoGenerateColumns="False" CssClass="myTableClass" Width="100%" >
                                <HeaderStyle BackColor="#217b90" Font-Bold="true" ForeColor="White"  />
         <Columns>
                        <asp:TemplateField HeaderText="Id#">
                                        <ItemTemplate>
                                            <asp:Label ID="lblMemberId"  Width="80px" Text='<%# Eval("MemberId") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                        </asp:TemplateField>
                       <asp:TemplateField HeaderText="Doc Type">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDocType"  Text='<%# Eval("DocType") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <asp:Image  ID="Img"  Width ="200px" Height ="150"  runat="server"></asp:Image>
                                        </ItemTemplate>
                     </asp:TemplateField>
           </Columns>
       </asp:GridView>
</div>

             </ContentTemplate>
                    
        </asp:Content>         
        
              
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
