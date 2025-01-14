﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Management;
using System.Text;
using System.Threading.Tasks;
using Zal.Constants.Models;

namespace Zal.HelperFunctions.SpecificFunctions
{
    class ramPieceDataGetter
    {
         public static List<ramPieceData> GetRamPiecesData()
        {
            var data = new List<ramPieceData>();
            ManagementObjectSearcher searcher = new ManagementObjectSearcher("SELECT * FROM Win32_PhysicalMemory");
            foreach (ManagementObject obj in searcher.Get())
            {
                var ramData = new ramPieceData();
                ramData.capacity = (ulong)obj["Capacity"];
                ramData.manufacturer = (string)obj["Manufacturer"];
                ramData.partNumber = (string)obj["PartNumber"];
                ramData.speed = (uint)obj["Speed"];
                data.Add(ramData);
            }
            return data;
        }
    }
}
