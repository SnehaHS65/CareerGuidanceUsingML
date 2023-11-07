<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="TestingDataset.aspx.cs" Inherits="educationalProject.TestingDataset" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Panel ID="Panel1" runat="server">
    <!-- Start contact Area -->  
    <div id="about" class="about-area area-padding">
   <div class="container">
      <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
          <div class="section-headline text-center">
            <h2>Job Prediction Testing Dataset</h2>
          </div>
        </div>
      </div>
      <div class="row">
        <!-- single-well start-->
       
        <!-- single-well end-->
       
              <a href="#">
                <h4 class="sec-head">educational dataset</h4>
              </a>
              
                        
                  <br/>
                  <br/>
                  
          <asp:DropDownList ID="DropDownList1" runat="server" Height="50px" Width="250px" 
              AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
              <asp:ListItem Value="CS">Computer Science</asp:ListItem>
              <asp:ListItem Value="EC">Electronics &amp; Communication</asp:ListItem>
              <asp:ListItem Value="EE">Electrical &amp; Electronics</asp:ListItem>
              <asp:ListItem Value="ME">Mechanical</asp:ListItem>
          </asp:DropDownList>
           <br/>
                  <br />
          <asp:Label ID="lblCourse" runat="server"></asp:Label>
                  <br />     
                   <br/>                                                                        
                
                <div style="height:1540px; width:100%; overflow:auto">
<asp:GridView ID="GridView1" runat="server" BackColor="White" 
         BorderColor="#CC9966" BorderWidth="1px" CellPadding="4" BorderStyle="None">

    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
    <PagerStyle ForeColor="#330099" 
        HorizontalAlign="Center" BackColor="#FFFFCC" />
    <RowStyle ForeColor="#330099" BackColor="White" />
    <SelectedRowStyle BackColor="#FFCC66" ForeColor="#663399" Font-Bold="True" />
    <SortedAscendingCellStyle BackColor="#FEFCEB" />
    <SortedAscendingHeaderStyle BackColor="#AF0101" />
    <SortedDescendingCellStyle BackColor="#F6F0C0" />
    <SortedDescendingHeaderStyle BackColor="#7E0000" />

</asp:GridView>
</div>
                   <br />
               
     

        <!-- End col-->
      </div>
    </div>
    </div>
  <!-- End Contact Area -->


    </asp:Panel>



</asp:Content>
