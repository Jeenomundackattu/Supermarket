using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Models;
using DAL;

namespace BLL
{
   public class YsheManager
    {
       YsheService ys = new YsheService();
       public DataTable add()
       {
           return ys.add();
       }
       //���
       public DataSet GetAllYshe()
       {
           return ys.GetAllYshe();
       }
    }
}
