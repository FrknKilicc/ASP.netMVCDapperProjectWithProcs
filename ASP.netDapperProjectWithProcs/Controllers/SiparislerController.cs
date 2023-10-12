using ASP.netDapperProjectWithProcs.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Dapper;
using System.Data.SqlClient;

namespace ASP.netDapperProjectWithProcs.Controllers
{
    public class SiparislerController : Controller
    {
        // GET: Siparisler
        public ActionResult Index()
        {
            return View(DP.Listeleme<Siparisler>("listSiparisler"));
        }
        public ActionResult AddorUpSiparisler(int id = 0)
        {
            if (id == 0)
            {
                return View();
            }
            else
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@SiparisID", id);
                return View(DP.Listeleme<Siparisler>("listSiparislerByNo", param).FirstOrDefault<Siparisler>());
            }

        }
        [HttpPost]
        public ActionResult AddorUpSiparisler(Siparisler siparis)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@SiparisID", siparis.SiparisID);
            param.Add("@KullaniciID", siparis.KullaniciID);
            param.Add("@UrunID", siparis.UrunID);
            param.Add("@Miktar", siparis.Miktar);
            param.Add("@Tarih", siparis.Tarih);
            DP.ExecuteReturn("AddorUpdateSiparisler", param);
            return RedirectToAction("Index");

        }
        public ActionResult DeleteSiparisler(int id = 0)
        {
            DynamicParameters param = new DynamicParameters();

            param.Add("@SiparisID", id);
            DP.ExecuteReturn("DeleteSiparisler", param);
            return RedirectToAction("Index");

        }
    }
}