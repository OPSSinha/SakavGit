<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubCategoryMaster.aspx.cs" Inherits="BachatBazaar.SubCategoryMaster" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title> Category | Master</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper" style="margin-top:0px;">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light" style="margin-top:-20px;">
    <!-- Left navbar links -->
    
    <!-- SEARCH FORM -->
    <!--<form class="form-inline ml-3">
      <div class="input-group input-group-sm">
        <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
        <div class="input-group-append">
          <button class="btn btn-navbar" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </div>
      </div>
    </form>
-->
    <!-- Right navbar links -->
<!--    <ul class="navbar-nav ml-auto">-->
      <!-- Messages Dropdown Menu -->
      <!--<li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge">3</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <a href="#" class="dropdown-item">-->
            <!-- Message Start -->
           <!-- <div class="media">
              <img src="dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  Brad Diesel
                  <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                </h3>
                <p class="text-sm">Call me whenever you can...</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
              </div>
            </div>-->
            <!-- Message End -->
          <!--</a>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item">-->
            <!-- Message Start -->
          
         
            <!-- Message End -->
         
      <!-- Notifications Dropdown Menu -->
     
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="Default.aspx" class="brand-link">
      <img src="/images/logo2.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           >
      <span class="brand-text font-weight-light">Sakav</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar" style="margin-top:0px;">
      <!-- Sidebar user panel (optional) -->
     
     <br>
      <!-- Sidebar Menu -->
       <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item has-treeview menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
           
            <ul class="nav nav-treeview">
             <!-- <li class="nav-item">
                <a href="pages/layout/top-nav.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Top Navigation</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/layout/top-nav-sidebar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Top Navigation + Sidebar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/layout/boxed.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Boxed</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/layout/fixed-sidebar.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Sidebar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/layout/fixed-topnav.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Navbar</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="pages/layout/fixed-footer.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Fixed Footer</p>
                </a>
              </li>-->
              <li class="nav-item">
                <a href="ImageUpload.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Image Upload </p>
                </a>
              </li>
            </ul>
          </li>
               <li class="nav-item">
                <a href="CategoryMaster.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Category Master</p>
                </a>
              </li>
          
              <li class="nav-item">
                <a href="SubCategoryMaster.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Sub Category Master</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="ItemMaster.aspx" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Item Master</p>
                </a>
              </li>
          
            <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Profile</p>
                </a>
              </li>
             
            
            
              <li class="nav-item">
                <a href="#" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Contacts</p>
                </a>
              </li>
          
            </ul>
         
          
           
            
            
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="margin-top:0px;">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">&nbsp&nbsp Sub Category Master</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="AdminPanel.aspx">Admin Panel</a></li>
              <li class="breadcrumb-item active">Sub Category Master</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
   
              
          <section class="col-lg-5 connectedSortable">

          
           
  <!-- /.content-wrapper -->
  

  <!-- Control Sidebar -->
 
  <!-- /.control-sidebar -->



<form id="form1" runat="server">
        <div align="center">
            <table width="100%">
                <tr>
                    <td>
                        S. No.
                    </td>
                    <td>
                        <asp:TextBox class="form-control" ID="txtSno" runat ="server" Enabled="false" ></asp:TextBox>
                    </td>
                    </tr>

                <tr>
                    <td>
                        Category Name
                    </td>
                    <td>
                       <asp:DropDownList ID="drpCategory" runat ="server" Width="190px" Enabled ="false" >
                         <%--   <asp:ListItem Text="SELECT" Value="SELECT"></asp:ListItem>--%>
                       </asp:DropDownList>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Sub Category Name
                    </td>
                    <td>
                      <asp:TextBox ID="txtSubCategoryName" runat ="server" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Is Active?
                    </td>
                    <td>
                        <%--<asp:TextBox class="form-control" ID="TextBox1" runat ="server" Enabled="false" ></asp:TextBox>--%>
                        <asp:CheckBox ID="chkIsActive" runat ="server" />
                    </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <br />
                           <asp:Button ID="btnSubmit" class="form-control btn btn-primary" runat ="server" Text ="Submit" OnClick="lblUpload_Click" />
                        </td>
                    </tr>
              <tr>
                  <td colspan="2">
                      <br />
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
                                            <asp:LinkButton ID="lblPK_SubCategoryId" CommandName = "Show" CommandArgument ='<%# Eval("PK_SubCategoryId") %>' Width="80px" Text='<%# Eval("PK_SubCategoryId") %>' runat="server"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Category Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCategoryName"  Text='<%# Eval("CategoryName") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                   <asp:TemplateField HeaderText="Sub Category Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSubCategoryName"  Text='<%# Eval("SubCategoryName") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                         
                            <asp:TemplateField HeaderText="Is Active?">
                                        <ItemTemplate>
                                            <asp:CheckBox  ID="chkIsActive" Checked  ='<%# Eval("IsActive") %>'  runat="server"></asp:CheckBox>
                                        </ItemTemplate>
                              </asp:TemplateField>
                           
                            </Columns>
                    </asp:GridView>
                  </td>
              </tr>
            </table>
        </div>
    </form>
    
<script src="plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
                    
</body>
    </html>