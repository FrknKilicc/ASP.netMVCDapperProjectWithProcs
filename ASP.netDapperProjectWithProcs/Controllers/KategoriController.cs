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
    public class KategoriController : Controller
    {
        // GET: Kategori
        public ActionResult Index()
        {
            return View(DP.Listeleme<Kategoriler>("ListKategori"));
        }

        public ActionResult AddorUpKategori(int id = 0)
        {
            if (id == 0)
            {
                return View();
            }
            else
            {
                DynamicParameters param = new DynamicParameters();
                param.Add("@KategoriID",id);
                return View(DP.Listeleme<Kategoriler>("ListKategoriByNo", param).FirstOrDefault<Kategoriler>());
            }
        }
        [HttpPost]
        public ActionResult AddorUpKategori(Kategoriler kategori)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@KategoriID", kategori.KategoriID);
            param.Add("@KategoriAdi", kategori.KategoriAdi);
            DP.ExecuteReturn("AddorUpdateKategori", param);
            return RedirectToAction("Index");
        }
        public ActionResult DeleteKategori (int id = 0) 
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@KategoriID", id);
            DP.ExecuteReturn("DeleteKategori", param);
            return RedirectToAction ("Index");
        }

    }
}