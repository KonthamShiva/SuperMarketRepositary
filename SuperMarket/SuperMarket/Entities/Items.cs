using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using SQLConnector;
using System.Data;
using SuperMarket.ResponceClass;

namespace SuperMarket.Entities
{
    public class Items
    {
        const string SUCCESS_MSG = "Successfully {0} a Items";
        const string Failure_MSG = "Unable to {0} a Items";
        public int Id { get; set; }
        public string Name { get; set; }
        public decimal CP { set; get; }
        public decimal SP { set; get; }
        public int StockAvailable { get; set; }

        public static string Create(Items objItems)
        {
            SQLConnector.DBOperations objdb = new DBOperations(Properties.Settings.Default.SuperMarketConnectionString);
            string stInsert = @"INSERT INTO [Items]([Name],[CP],[SP],[StockAvailable])
             VALUES(@Name, @CP,@SP, @StockAvailable";
            string[] strAddParameterName = new string[] { "Name", "CP", "SP", "StockAvailable" };
            object[] objAddparametervalue = new object[] { objItems.Name, objItems.CP, objItems.SP, objItems.StockAvailable };
            if (!objdb.ExecuteQuery(stInsert, strAddParameterName, objAddparametervalue))
                return null;
            //new Response(9999, string.Format(Failure_MSG, "insert"));

            else

                return null; 
            //new Response(5555, string.Format(SUCCESS_MSG, "inserted"));
        }

        public static string Delete(int intId)
        {
            DBOperations objdb = new DBOperations(Properties.Settings.Default.SuperMarketConnectionString);
            string strDelete = "DELETE FROM [Items] WHERE Id=@Id";
            string[] strAddParameterName = new string[] { "Id" };
            object[] objAddparametervalue = new object[] { intId };
            if (!objdb.ExecuteQuery(strDelete, strAddParameterName, objAddparametervalue))

                return null;//new Response(9999, string.Format(Failure_MSG, "delete"));
            else

                return null;// new Response(5555, string.Format(SUCCESS_MSG, "deleted"));
        }

        public static string Update(Items objItems)
        {
            DBOperations objdb = new DBOperations(Properties.Settings.Default.SuperMarketConnectionString);
            string strUpsate = @"UPDATE [Items]
            SET [Name] = @Name
            ,[CP] = @CP
             ,[SP] = @SP
            ,[StockAvailable] = @StockAvailable, int,>
                WHERE Id=@Id ";
            string[] strAddParameterName = new string[] { "Name", "CP", "SP", "Id" };
            object[] objAddparametervalue = new object[] { objItems.Name, objItems.CP, objItems.SP, objItems.Id };
            if (!objdb.ExecuteQuery(strUpsate, strAddParameterName, objAddparametervalue))
                 return null;// new Response(9999, string.Format(Failure_MSG, "update"));
            else
                return null; //new Response(5555, string.Format(SUCCESS_MSG, "updated"));
        }

        public static Items Get(int Id)
        {
            DBOperations objdb = new DBOperations(Properties.Settings.Default.SuperMarketConnectionString);

            Items objItems = new Items();
            string strGetOneRecord = "SELECT * FROM [Items] where Id=@Id";
            string[] strAddParameterName = new string[] { "Id" };
            object[] objAddparametervalue = new object[] { objItems.Id };
            System.Data.DataTable objtab = objdb.ExecuteGetAllQuery(strGetOneRecord, strAddParameterName, objAddparametervalue);
            return objItems;
        }

        public static List<Items> GetAll()
        {
            DBOperations objdb = new DBOperations(Properties.Settings.Default.SuperMarketConnectionString);
            List<Items> lstItems = new List<Items>();
            Items objItems = new Items();
            string strGetOneRecord = "SELECT * FROM [Items]";
            DataTable objtab = new DataTable();
            objtab = objdb.ExecuteGetAllQuery(strGetOneRecord, new string[] { }, new object[] { });

            for (int i = 0; i < objtab.Rows.Count; i++)
            {
                objItems = new Items();
                objItems.Id = (int)objtab.Rows[i]["Id"];
                objItems.StockAvailable = (int)objtab.Rows[i]["StockAvailable"];
                objItems.Name = objtab.Rows[i]["Name"].ToString();
                objItems.CP = Convert.ToDecimal(objtab.Rows[i]["CP"]);
                objItems.SP = Convert.ToDecimal(objtab.Rows[i]["SP"]);
                lstItems.Add(objItems);
            }
            return lstItems;
        }


    }
}