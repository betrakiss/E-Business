﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VacationReservations.Common.Orders
{
    public class OrderProcessorException : ApplicationException
    {
        private int sourceStage;
        public OrderProcessorException(string message, int exceptionSourceStage) : base(message)
        {
            sourceStage = exceptionSourceStage;
        }
        public int SourceStage
        {
            get
            {
                return sourceStage;
            }
        }
    }
}
