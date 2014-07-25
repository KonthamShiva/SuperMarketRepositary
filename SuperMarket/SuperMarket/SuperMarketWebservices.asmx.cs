using SuperMarket.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace SuperMarket
{
    /// <summary>
    /// Summary description for SuperMarketWebservices
    /// </summary>

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class SuperMarketWebservices : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld(string strHello)
        {
            return strHello;
        }
        /// <summary>
        /// WebMethod to GetUserRecord by using ajax calls
        /// </summary>
        /// <param name="objUsersTable"> Javascript object of Userdetails </param>
        /// <returns>UserssTable Object</returns>
        [WebMethod]
        public UsersTable GetUserRecord(UsersTable objUsersTable)
        {
            return UsersTable.GetByID(objUsersTable);
        }
        #region Items CRUD Operations webmethods
        [WebMethod]
        public List<Items> GetAllItems()
        {
            return Items.GetAll();
        }
       
        [WebMethod]
        public string InsertItems(Items objItems)
        {

            return Items.Create(objItems);
        }
       
        [WebMethod]
        public string UpdateItems(Items objItems)
        {

            return Items.Update(objItems);
        }
        
        [WebMethod]
        public string DeleteItems(int IntId)
        {

            return Items.Delete(IntId);
        }
        #endregion
    }
}
