using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace educationalProject
{
    public partial class AdminMasterpage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Queries();
        }

        private void Queries()
        {
            DataTable tab = new DataTable();
            BLL obj = new BLL();

            tab.Rows.Clear();
           
            tab = obj.GetNewQueries();
                       
            if (tab.Rows.Count > 0)
            {
                lblCount.Font.Size = 12;
                lblCount.Font.Bold = true;
                lblCount.ForeColor = System.Drawing.Color.DarkRed;
                lblCount.Text = "[" + tab.Rows.Count + "]";
            }
            else
            {
                lblCount.Font.Size = 12;
                lblCount.Font.Bold = true;
                lblCount.ForeColor = System.Drawing.Color.DarkRed;
                lblCount.Text = "[0]";
                lblCount.Visible = false;
            }
        }
    }
}