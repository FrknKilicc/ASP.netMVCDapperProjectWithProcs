using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dapper;
using System.Data.SqlClient;
using ASP.netDapperProjectWithProcs.Models;

namespace ASP.netDapperProjectWithProcs.Controllers
{
    public class UrunlerController : Controller
    {
        // GET: Urunler
        public ActionResult Index()
        {

            return View(DP.Listeleme<Urunler>("listUrunler"));
        }
        public ActionResult AddorUpUrunler(int id = 0)
        {
            if (id == 0)
            {
                return View();
            }
            else
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@UrunID", id);
                return View(DP.Listeleme<Urunler>("listUrunlerByNo", param).FirstOrDefault<Urunler>());
            }

        }
        [HttpPost]
        public ActionResult AddorUpUrunler(Urunler urun)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@UrunID", urun.UrunID);
            param.Add("@UrunAdi", urun.UrunAdi);
            param.Add("@Fiyat", urun.Fiyat);
            param.Add("@StokMiktari", urun.StokMiktari);
            DP.ExecuteReturn("AddorUpdateUrunler", param);
            return RedirectToAction("Index");

        }

        public ActionResult DeleteUrunler(int id = 0)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@UrunID",id);
            DP.ExecuteReturn("DeleteUrunler", param);
            return RedirectToAction("Index");

        }
    }
}