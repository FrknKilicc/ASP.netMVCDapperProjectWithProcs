using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ASP.netDapperProjectWithProcs.Models
{
    public class Siparisler
    {
        public int SiparisID { get; set; }  
        public int KullaniciID{ get; set; }  
        public int UrunID{ get; set; }  
        public int Miktar{ get; set; }  
        public DateTime Tarih{ get; set; }  
    }
}