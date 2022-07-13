<%@ Page Language="C#" MasterPageFile ="~/Site1.Master"  AutoEventWireup="true" CodeBehind="ImageUploadReg.aspx.cs" Inherits="NeuroGyan.ImageUploadReg" %>

<asp:Content ID="myVideo" ContentPlaceHolderID ="ContentPlaceHolder1" runat ="server" >

     <section class="blog_mob-tempsls py-5" id="blog">
         <div class="container py-xl-5 py-lg-3">
       <p><a href="AdminPanel.aspx">Admin Panel</a></p>
         
             <div class="title-section mb-md-5 mb-4">
                
               <h5 class="mob-tempsls-title text-uppercase text-bl font-weight-bold">Image Upload Which One Applicable</h5>
                <br />
               
            </div>
          
            <div>
               
                <table style="    width: 100%;">
                    <tr>
                       <td colspan="2" height ="50">
                               <asp:GridView ID="GridView2"  runat="server" AutoGenerateColumns="False" CssClass="myTableClass" Width="100%">
                                <HeaderStyle BackColor="#3399ff" Font-Bold="true" ForeColor="White" />
                                <Columns>
                              <%--      <asp:BoundField DataField="PK_ComplaintId" HeaderText="PK_ComplaintId" Visible="false" />--%>
                                    <asp:TemplateField HeaderText="#Id"  visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAttachmentId" Text='<%# Eval("Sno") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Document Type">
                                        <ItemTemplate>
                                          <asp:Label ID="lblDocType" Text='<%# Eval("DocType") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Attachment">
                                        <ItemTemplate>

                                          <input id="inpAttachment2" style="width:100%;" tabIndex="5" type="file" size="53" name="filMyFile" runat="server">
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Create Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCreateDate" Text='<%# Eval("CreateDate") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                 </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">

                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <asp:Button ID="btnUpload" CssClass="btn btn-primary" runat="server" Text ="Upload"  OnClick="btnUpload_Click"/>
                        </td>
                    </tr>
                </table>

            <%--    <table style ="width:60%">
                    <tr>
                        <td>
                            <label id="lbl">Select a Image File...</label>
                        </td>
                        <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <br />
                           <asp:Button ID="lblUpload" runat ="server" Text ="Submit" OnClick="lblUpload_Click" />
                        </td>
                    </tr>
                </table>--%>
                    <br />
                <br />
                <table width ="100%">
                <tr>
                    <td>
               <asp:GridView ID="gvMenuTiming" runat="server" AutoGenerateColumns="False" AllowSorting="true"   CssClass="myTableClass" Width="100%" 
                                
                               >

                                <HeaderStyle BackColor="#217b90" Font-Bold="true" ForeColor="White" />
                                <Columns>
                                      <asp:TemplateField HeaderText="S. No.#">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSno"  Width="80px" Text='<%# Eval("MemberId") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                  
                                      <asp:TemplateField HeaderText="Image Name ">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQuestion" Text='<%# Eval("DocType") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                       </asp:TemplateField>
                                   
                                        <asp:TemplateField HeaderText="Image">
                                        <ItemTemplate>
                                            <asp:Image  ID="Img" Width ="250px" Height ="150"  runat="server"></asp:Image>
                                        </ItemTemplate>
                              </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:CheckBox  ID="chkSelect" runat ="server" ></asp:CheckBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                   </td>
                </tr>
                    <tr>
                       <td>

                       </td>
                       <td>
                        <asp:Button ID="btnSubmit" runat ="server" Text ="Delete" Visible="false"  OnClick="btnSubmit_Click" />
                       </td>
                    </tr>
</table>
      
       </div> 
      </div> 
      </section>

</asp:Content>