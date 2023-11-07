<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterpage.Master" AutoEventWireup="true" CodeBehind="frmModel.aspx.cs" Inherits="educationalProject.frmModel" %>
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
          <h2>JOB RECOMMENDATON</h2>            
          </div>
        </div>
      </div>
      <div class="row">
       
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
                   <br/>               

       <br />
 <div style="height:250px; width:auto; overflow:auto">

 <h3>Testing Dataset</h3>

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
<br />
</div>
          <br />
          <br />
           <h2><span>JOB </span> PREDICTION USING NAIVE BAYES!!!</h2>
          <hr />

          <table style="width: 25%;">
              <tr>
                  <td>
                      <asp:Button ID="btnPrediction" runat="server" 
                          class="btn btn-primary btn-block btn-lg" Height="50px" 
                          onclick="btnPrediction_Click" Text="Predict Output" Width="150px" />
                  </td>
                  <td>
                      &nbsp;</td>
                  <td>
                      <asp:Button ID="btnResults" runat="server" 
                          class="btn btn-primary btn-block btn-lg" Height="50px" 
                          onclick="btnResults_Click" Text="Result Analysis" Width="150px" />
                  </td>
                  <td>
                      &nbsp;</td>
              </tr>
              <tr>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
                  <td>
                      &nbsp;</td>
              </tr>
          </table>
&nbsp; <br /><div>
      <asp:Table ID="tablePrediction" runat="server">
      </asp:Table>
      </div>
          <br />
        

     

      </div>
    </div>
    </div>


    </asp:Panel>

</asp:Content>
