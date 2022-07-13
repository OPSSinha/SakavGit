<%@ Page Language="C#"  AutoEventWireup="true" MasterPageFile="~/Site1.Master" CodeBehind="MemberList.aspx.cs" Inherits="BachatBazaar.MemberList" %>

<asp:Content ID ="contents" ContentPlaceHolderID ="ContentPlaceHolder1" runat ="server">
     <div class="mian-content">
		<!-- header -->
	
		<!-- //header -->

		<!-- banner 2 -->
				<%--<div class="banner2-w3ls">

		</div>Commented--%>
		<!-- //banner 2 -->
	</div>
	<!-- main -->
	<!-- page details -->
	<div class="breadcrumb-agile">
		<nav aria-label="breadcrumb">
			<ol class="breadcrumb m-0">
				<li class="breadcrumb-item">
					<a href="Default.aspx">Home</a>
				</li>
                
				<li class="breadcrumb-item active" aria-current="page">Menu Item Master</li>
                  <li class="" style="margin-left:650px;">
					<a href="CategoryMaster2.aspx">Category Master</a>
				</li>
			</ol>
		</nav>
       
      
            
	</div>
    <%--<div class="gallery py-5">--%>
		<div class="container py-xl-5 py-lg-3">
			<div class="title text-center mb-5" align="Center">
				<h2 class="text-dark mb-2">Member List</h2>
			</div>
			<asp:UpdatePanel ID="upPanel" runat ="server" >
		    <ContentTemplate> 
              <table style="width :100%" align="center">
				  <tr>
					  <td>
						  <asp:Label ID="Label1" runat="server" Text="Select Category"></asp:Label>
					  </td>
				  </tr>
				  <tr>
					  <td>
						  <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
						  <asp:ListItem Value ="Select" Text ="Select"></asp:ListItem>
                          <asp:ListItem Value ="Form_C_Society" Text ="Form_C_Society"></asp:ListItem>
                          <asp:ListItem Value ="Form_D_Society" Text ="Form_D_Society"></asp:ListItem>
                          <asp:ListItem Value ="C-Individual" Text ="C-Individual"></asp:ListItem>
						  <asp:ListItem Value ="D-Individual" Text ="D-Individual"></asp:ListItem>
							   <asp:ListItem Value ="D-Society" Text ="D-Society"></asp:ListItem>
						  </asp:DropDownList>
					  </td>
					  <%--<td align="right">
                          <asp:Button ID="btnUpdate" runat ="server" Text ="Update" OnClick="btnUpdate_Click" />
                      </td>--%>
				  </tr>
            <tr>
                <td>
         
                    <br />
                    <table width="110%" align="Center">
                        <tr>
               <td>
                                <asp:GridView ID="gvMenuTiming"  runat="server" AutoGenerateColumns="False" CssClass="myTableClass" Width="100%" OnRowCommand="gvMenuTiming_RowCommand">
                                <HeaderStyle BackColor="#217b90" Font-Bold="true" ForeColor="White"  />
          
          <%--          <asp:GridView ID="gvMenuTiming" runat="server"  OnRowCommand="gvMenuTiming_RowCommand" AutoGenerateColumns="false">
          --%>           <%--   <Columns>
                            <asp:CommandField HeaderText="Select" ShowHeader="true" ShowSelectButton="true" />
                        </Columns>--%>
                        <Columns>
                           <%-- <asp:BoundField HeaderText="ID" DataField="PK_APP_ID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                            <asp:BoundField HeaderText="ID" DataField="PK_APP_ID" ItemStyle-CssClass="hidden" HeaderStyle-CssClass="hidden" />
                           --%>
                              <asp:TemplateField HeaderText="Id#">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lblSno" CommandName = "Show" CommandArgument ='<%# Eval("PK_APP_ID1") %>' Width="80px" Text='<%# Eval("PK_APP_ID1") %>' runat="server"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                            <asp:BoundField HeaderText="Form Type" DataField="TypeName" />
							<asp:TemplateField HeaderText="Name" SortExpression="UpperNameEnglish">
							<ItemTemplate>
								<asp:Label ID="lblName" runat="server" Text='<%# Eval("UpperNameEnglish") +" "+ Eval("SurNameEng")%>' ></asp:Label>
							</ItemTemplate>
							</asp:TemplateField>
                            <%--<asp:BoundField HeaderText="Name" DataField="UpperNameEnglish" />--%>
                            
                            <%--<asp:BoundField HeaderText="Name Hindi" DataField="NameHindi" />--%>
                              <asp:BoundField HeaderText="Firm" DataField="Firm" />
                            <asp:BoundField HeaderText="Address" DataField="Address" />
                            <asp:BoundField HeaderText="Mobile No" DataField="MobileNo" />
                            <asp:BoundField HeaderText="Ref. Member" DataField="RefMember" />
                            <asp:BoundField HeaderText="User Name" DataField="UserName" />
                             <asp:BoundField HeaderText="Password" DataField="Password" />
                           
                             <asp:TemplateField HeaderText="Category">
                                        <ItemTemplate>
                                            <asp:Label  ID="lblCategory" Text ='<%# Eval("Category") %>'   runat="server"></asp:Label>
                                        </ItemTemplate>
                              </asp:TemplateField>

                              <asp:TemplateField HeaderText="Is Active?">
                                        <ItemTemplate>
                                            <asp:CheckBox  ID="chkIsActive" Checked  ='<%# Eval("IsActive") %>'  Enabled="false" runat="server"></asp:CheckBox>
                                        </ItemTemplate>
                              </asp:TemplateField>
                             <asp:TemplateField HeaderText="Is Approved?">
                                        <ItemTemplate>
                                            <asp:CheckBox  ID="IsApproved" Checked  ='<%# Eval("IsApproved") %>'  runat="server"></asp:CheckBox>
                                        </ItemTemplate>
                              </asp:TemplateField>
                            
                           <%-- <asp:BoundField HeaderText ="District" DataField="DistrictName" />
                            <asp:BoundField HeaderText="State" DataField="StateName" />--%>
                            </Columns>
                    </asp:GridView>
                </td>
            </tr>
                    </table>
              
  <%--      <table>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
              
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Height="30px" Width="76px" />
                </td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                 
                </td>
            </tr>
        </table>--%>
                    </td>
                </tr>
             </table>
				</ContentTemplate>
  </asp:UpdatePanel>
			<div>
				<table width="10%" align="Center">
				<tr>
					<td align="right">
                          <asp:Button ID="btnUpdate" runat ="server" Text ="Update" OnClick="btnUpdate_Click" />
                      </td>
				</tr>
				</table>
			</div>
		<%--	<div class="row w3ls_portfolio_grids">
				<div class="col-sm-4 agileinfo_portfolio_grid">
					<div class="w3_agile_portfolio_grid1">
						<a href="images/g1.jpg" title="Cakes Bakery">
							<div class="agileits_portfolio_sub_grid agileits_w3layouts_team_grid">
								<div class="w3layouts_port_head">
									<h3>Cakes Bakery</h3>
								</div>
								<img src="images/g1.jpg" alt=" " class="img-fluid" />
							</div>
						</a>
					</div>
					<div class="w3_agile_portfolio_grid1">
						<a href="images/g2.jpg" title="Cakes Bakery">
							<div class="agileits_portfolio_sub_grid agileits_w3layouts_team_grid">
								<div class="w3layouts_port_head">
									<h3>Cakes Bakery</h3>
								</div>
								<img src="images/g2.jpg" alt=" " class="img-fluid" />
							</div>
						</a>
					</div>
					<div class="w3_agile_portfolio_grid1">
						<a href="images/g3.jpg" title="Cakes Bakery">
							<div class="agileits_portfolio_sub_grid agileits_w3layouts_team_grid">
								<div class="w3layouts_port_head">
									<h3>Cakes Bakery</h3>
								</div>
								<img src="images/g3.jpg" alt=" " class="img-fluid" />
							</div>
						</a>
					</div>
				</div>
				<div class="col-sm-4 agileinfo_portfolio_grid">
					<div class="w3_agile_portfolio_grid1">
						<a href="images/g4.jpg" title="Cakes Bakery">
							<div class="agileits_portfolio_sub_grid agileits_w3layouts_team_grid">
								<div class="w3layouts_port_head">
									<h3>Cakes Bakery</h3>
								</div>
								<img src="images/g4.jpg" alt=" " class="img-fluid" />
							</div>
						</a>
					</div>
					<div class="w3_agile_portfolio_grid1">
						<a href="images/g5.jpg" title="Cakes Bakery">
							<div class="agileits_portfolio_sub_grid agileits_w3layouts_team_grid">
								<div class="w3layouts_port_head">
									<h3>Cakes Bakery</h3>
								</div>
								<img src="images/g5.jpg" alt=" " class="img-fluid" />
							</div>
						</a>
					</div>
					<div class="w3_agile_portfolio_grid1">
						<a href="images/g6.jpg" title="Cakes Bakery">
							<div class="agileits_portfolio_sub_grid agileits_w3layouts_team_grid">
								<div class="w3layouts_port_head">
									<h3>Cakes Bakery</h3>
								</div>
								<img src="images/g6.jpg" alt=" " class="img-fluid" />
							</div>
						</a>
					</div>
				</div>
				<div class="col-sm-4 agileinfo_portfolio_grid">
					<div class="w3_agile_portfolio_grid1">
						<a href="images/g7.jpg" title="Cakes Bakery">
							<div class="agileits_portfolio_sub_grid agileits_w3layouts_team_grid">
								<div class="w3layouts_port_head">
									<h3>Cakes Bakery</h3>
								</div>
								<img src="images/g7.jpg" alt=" " class="img-fluid" />
							</div>
						</a>
					</div>
					<div class="w3_agile_portfolio_grid1">
						<a href="images/g8.jpg" title="Cakes Bakery">
							<div class="agileits_portfolio_sub_grid agileits_w3layouts_team_grid">
								<div class="w3layouts_port_head">
									<h3>Cakes Bakery</h3>
								</div>
								<img src="images/g8.jpg" alt=" " class="img-fluid" />
							</div>
						</a>
					</div>
					<div class="w3_agile_portfolio_grid1">
						<a href="images/g9.jpg" title="Cakes Bakery">
							<div class="agileits_portfolio_sub_grid agileits_w3layouts_team_grid">
								<div class="w3layouts_port_head">
									<h3>Cakes Bakery</h3>
								</div>
								<img src="images/g9.jpg" alt=" " class="img-fluid" />
							</div>
						</a>
					</div>
				</div>
			</div>--%>
		</div>
	<%--</div>--%>
    </asp:Content>
    
  
