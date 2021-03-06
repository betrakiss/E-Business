﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace VacationReservations.DataAccess
{
    public static class VacationReservationsConfiguration
    {
        private static string dbConnectionString;
        private static string dbProviderName;

        private readonly static int productsPerPage;
        private readonly static int productDescriptionLength;
        private readonly static string siteName;

        static VacationReservationsConfiguration()
        {
            dbConnectionString = ConfigurationManager.ConnectionStrings["VacationReservationsConnection"].ConnectionString;
            dbProviderName = ConfigurationManager.ConnectionStrings["VacationReservationsConnection"].ProviderName;
            productsPerPage = Int32.Parse(ConfigurationManager.AppSettings["ProductsPerPage"]);
            productDescriptionLength = Int32.Parse(ConfigurationManager.AppSettings["ProductDescriptionLength"]);
            siteName = ConfigurationManager.AppSettings["SiteName"];
        }

        public static string DbConnectionString
        {
            get
            {
                return dbConnectionString;
            }
        }

        public static string DbProviderName
        {
            get
            {
                return dbProviderName;
            }
        }

        public static string MailServer
        {
            get
            {
                return ConfigurationManager.AppSettings["MailServer"];
            }
        }

        public static string MailUsername
        {
            get
            {
                return ConfigurationManager.AppSettings["MailUsername"];
            }
        }

        public static string MailPassword
        {
            get
            {
                return ConfigurationManager.AppSettings["MailPassword"];
            }
        }

        public static string MailFrom
        {
            get
            {
                return ConfigurationManager.AppSettings["MailFrom"];
            }
        }

        public static bool EnableErrorLogEmail
        {
            get
            {
                return bool.Parse(ConfigurationManager.AppSettings
                ["EnableErrorLogEmail"]);
            }
        }

        public static string ErrorLogEmail
        {
            get
            {
                return ConfigurationManager.AppSettings["ErrorLogEmail"];
            }
        }

        public static int ProductsPerPage
        {
            get
            {
                return productsPerPage;
            }
        }

        public static int ProductDescriptionLength
        {
            get
            {
                return productDescriptionLength;
            }
        }

        public static string SiteName
        {
            get
            {
                return siteName;
            }
        }


        // Returns the number of days for shopping cart expiration
        public static int CartPersistDays
        {
            get
            {
                return int.Parse(ConfigurationManager.AppSettings["CartPersistDays"]);
            }
        }

        // Returns the email address for customers to contact the site
        public static string CustomerServiceEmail
        {
            get
            {
                return
                ConfigurationManager.AppSettings["CustomerServiceEmail"];
            }
        }
        // The "from" address for auto-generated order processor emails
        public static string OrderProcessorEmail
        {
            get
            {
                return
                ConfigurationManager.AppSettings["OrderProcessorEmail"];
            }
        }
        // The email address to use to contact the supplier
        public static string SupplierEmail
        {
            get
            {
                return ConfigurationManager.AppSettings["SupplierEmail"];
            }
        }
    }
}
