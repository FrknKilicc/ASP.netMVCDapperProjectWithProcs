using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dapper;
using System.Data.SqlClient;

namespace ASP.netDapperProjectWithProcs.Models
{
    public class DP
    {
        public static string ConnectionString = @"Server= FURKAN\FURKANKILIC;Database=DapperProject;Integrated Security=true;";

        public static void ExecuteReturn(string procadi, DynamicParameters param = null)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                db.Open();
                db.Execute(procadi, param, commandType: System.Data.CommandType.StoredProcedure);
            }

        }

        public static IEnumerable<T> Listeleme<T> (string procadi, DynamicParameters param = null)
        {
            using (SqlConnection db = new SqlConnection(ConnectionString))
            {
                db.Open();
                return db.Query<T>(procadi, param, commandType: System.Data.CommandType.StoredProcedure);
            }
        }
       
    }
}