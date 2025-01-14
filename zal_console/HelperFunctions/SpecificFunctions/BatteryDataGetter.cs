﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Zal.Constants.Models;

namespace Zal.HelperFunctions.SpecificFunctions
{
     class batteryDataGetter
    {
       public static batteryData getbatteryData()
        {
            PowerStatus p = System.Windows.Forms.SystemInformation.PowerStatus;

            int life = (int)(p.BatteryLifePercent * 100);

            var data = new batteryData();
            data.hasBattery = p.BatteryChargeStatus != BatteryChargeStatus.NoSystemBattery;
            data.life = (uint)life;
            data.isCharging = p.PowerLineStatus == System.Windows.Forms.PowerLineStatus.Online;
           data.lifeRemaining = (uint)p.BatteryLifeRemaining;
           
            return data;
        }
    }
}
