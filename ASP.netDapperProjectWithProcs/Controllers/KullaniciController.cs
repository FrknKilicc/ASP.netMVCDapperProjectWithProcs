using ASP.netDapperProjectWithProcs.Models;
using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ASP.netDapperProjectWithProcs.Controllers
{
    public class KullaniciController : Controller
    {
        // GET: Kullanici
        public ActionResult Index()
        {
            return View(DP.Listeleme<Kullanicilar>("ListKullanicilar"));
        }
        public ActionResult AddorUpKullanici(int id = 0)
        {
            if (id == 0)
            {
                return View();
            }
            else
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@KullaniciID", id);
                return View(DP.Listeleme<Kullanicilar>("ListKullanicilarByNo", param).FirstOrDefault<Kullanicilar>());
            }
        }
        [HttpPost]
        public ActionResult AddorUpKullanici (Kullanicilar kullanici)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@kullaniciID", kullanici.KullaniciID);
            param.Add("@Adi", kullanici.Adi);
            param.Add("@Soyadi", kullanici.Soyadi);
            param.Add("@email", kullanici.Email);
            DP.ExecuteReturn("AddorUpdateKullanicilar", param);
            return RedirectToAction("Index");


        }
        public ActionResult DeleteKullanici (int id = 0)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@KullaniciID", id);
            DP.ExecuteReturn("DeleteKullanicilar", param);
            return RedirectToAction("Index");

        }
    }
}