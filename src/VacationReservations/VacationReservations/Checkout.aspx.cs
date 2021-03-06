﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Profile;
using System.Web.UI;
using System.Web.UI.WebControls;
using VacationReservations.Common;
using VacationReservations.Common.Orders;
using VacationReservations.DataAccess;

namespace VacationReservations
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                PopulateControls();
        }

        private void PopulateControls()
        {
            // get the items in the shopping cart
            DataTable dt = ShoppingCartAccess.GetItems();
            // populate the list with the shopping cart contents
            grid.DataSource = dt;
            grid.DataBind();
            grid.Visible = true;
            // display the total amount
            decimal amount = ShoppingCartAccess.GetTotalAmount();
            totalAmountLabel.Text = String.Format("{0:c}", amount);
            // check customer details
            bool addressOK = true;
            bool cardOK = true;

            ProfileBase Profile = HttpContext.Current.Profile;
            if ((string)Profile["Address1"] + (string)Profile["Address2"] == ""
            || (string)Profile["ShippingRegion"] == ""
            || (string)Profile["ShippingRegion"] == "Моля изберете"
            || (string)Profile["Country"] == "")
            {
                addressOK = false;
            }
            if ((string)Profile["CreditCard"] == "")
            {
                cardOK = false;
            }
            // report/hide place order button
            if (!addressOK)
            {
                if (!cardOK)
                {
                    InfoLabel.Text =
                    "Трябва да въведете валид адрес и дебитна карта.";
                }
                else
                {
                    InfoLabel.Text = "Трябва да въведете валиден адрес";
                }
            }
            else if (!cardOK)
            {
                InfoLabel.Text = "Трябва да въведете номер на дебитна карта.";
            }
            else
            {
                InfoLabel.Text = "Моля потвърдете, че детайлите по-горе са вярни преди извършване на поръчката.";
            }
            placeOrderButton.Visible = addressOK && cardOK;
            shippingSelection.Visible = addressOK && cardOK;
            // Populate shipping selection
            if (addressOK && cardOK)
            {
                int shippingRegionId = int.Parse((string)Profile["ShippingRegion"]);
                List<ShippingInfo> shippingInfoData =
                CommerceLibAccess.GetShippingInfo(shippingRegionId);
                foreach (ShippingInfo shippingInfo in shippingInfoData)
                {
                    shippingSelection.Items.Add(
                    new ListItem(shippingInfo.ShippingType,
                    shippingInfo.ShippingID.ToString()));
                }
                shippingSelection.SelectedIndex = 0;
            }
        }

        protected void placeOrderButton_Click(object sender, EventArgs e)
        {
            // Store the total amount
            decimal amount = ShoppingCartAccess.GetTotalAmount();
            // Get shipping ID or default to 0
            int shippingId = 0;
            int.TryParse(shippingSelection.SelectedValue, out shippingId);
            // Get tax ID or default to "No tax"
            string shippingRegion = HttpContext.Current.Profile["ShippingRegion"] as string;
            int taxId;
            switch (shippingRegion)
            {
                case "2":
                    taxId = 1;
                    break;
                default:
                    taxId = 2;
                    break;
            }
            // Create the order and store the order ID
            string orderId =
            ShoppingCartAccess.CreateCommerceLibOrder(shippingId, taxId);
            // Process order
            OrderProcessor processor = new OrderProcessor(orderId);
            processor.Process();
            // Redirect to the conformation page
            Response.Redirect("OrderPlaced.aspx");
        }
    }
}
