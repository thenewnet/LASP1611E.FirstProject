using LASP1611E.FirstProject.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LASP1611E.FirstProject.Views.Admin
{
    public partial class ProductCategory : System.Web.UI.Page
    {
        //Declare variable database
        LASP1611E_DBEntities db = new LASP1611E_DBEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadData();
        }

        private void LoadData()
        {
            var data = db.Products.ToList();

            //binding
            grvListing.DataSource = data;
            grvListing.DataBind();
        }

        protected void lbtnSelect_Click(object sender, EventArgs e)
        {
            //display details panel
            pnlDetails.Visible = true;
            //lay id cua ban ghi vua click
            //get id of record
            var idCommand = ((LinkButton)sender).CommandArgument;
            var id = int.Parse(idCommand);

            //truy van vao db lay ra thong tin chi tiet cua ban ghi
            //get details from database
            var listRecords = db.Products.ToList();
            var record = listRecords.FirstOrDefault(x => x.Id == id);
            
            //hien du lieu cua ban ghi ra form
            //display data
            if (record != null)
            {
                txtProductName.Text = record.ProductName;
                txtDetails.Text = record.Details;
            }

            //set value for Hidden field Id
            hidId.Value = idCommand;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //get value of hidden field id
            var id = hidId.Value;
            //check getted value => case edit or addnew 
            if (string.IsNullOrEmpty(id))
            {
                //Add new
                var record = new Product()
                {
                    ProductName = txtProductName.Text,
                    Details = txtDetails.Text
                };
                db.Products.Add(record);
                db.SaveChanges(); //Update into database
            }else{
                //Edit
                var recordId = int.Parse(id);
                var listRecords = db.Products.ToList();
                //get record from database
                var record = listRecords.FirstOrDefault(x => x.Id == recordId);

                if (record != null)
                {
                    //Grant value from form to record
                    record.ProductName = txtProductName.Text;
                    record.Details = txtDetails.Text;
                    //call update to database
                    db.SaveChanges();//Update into database
                }
            }

            // Load data for grid view
            LoadData();
            //hide details panel
            pnlDetails.Visible = false;
        }

        protected void btnAddnew_Click(object sender, EventArgs e)
        {
            ClearForm();
            pnlDetails.Visible = true;
        }

        private void ClearForm()
        {
            txtDetails.Text = string.Empty;
            txtProductName.Text = string.Empty;
            hidId.Value = string.Empty;
        }
    }
}