using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP.netDapperProjectWithProcs.Models
{
    public class Urunler
    {
        public int UrunID { get; set; }
        public string UrunAdi { get; set; }
        public decimal Fiyat { get; set; }
        public int StokMiktari { get; set; }
    }
}