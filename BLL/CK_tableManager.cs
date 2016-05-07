using System;
using System.Collections.Generic;
using System.Text;
using Models;
using DAL;
using System.Data;

namespace BLL
{
   public class CK_tableManager
    {
       CK_tableService cs=new CK_tableService();
       public DataSet select()
       {
           return cs.select();
       }
       public DataSet gegt()
       {
           return cs.geon();
       }
       public DataSet GetAllCK_table()
       {
           return cs.GetAllCK_table();
       }
      
   


       //����
       public int GetAddCK_table(CK_table a)
       {
           return cs.GetAddCK_table(a);
       }
       //�ж��Ƿ�ɹ�
       public string ShowGetAddCK_table(CK_table a)
       {
           string Message = "";
           int aa = GetAddCK_table(a);
           if (aa > 0)
           {
               Message = "�����ɹ�";
           }
           return Message;
       }

       public int GetUpdateCK_table(CK_table a)
       {
           return cs.GetUpdateCK_table(a);
       }
       //�ж������Ƿ�ɹ�
       public string ShowGetUpdateCK_table(CK_table a)
       {
           string Message = "";
           int aa = GetUpdateCK_table(a);
           if (aa > 0)
           {
               Message = "�޸ĳɹ�";
           }
           return Message;
       }

       public int GetDeleteCK_table(CK_table a)
       {
           return cs.GetDeleteCK_table(a);
       }
       //�ж�ɾ���Ƿ�ɹ�
       public string ShowGetDeleteCK_table(CK_table a)
       {
           string Message = "";
           int aa = GetDeleteCK_table(a);
           if (aa > 0)
           {
               Message = "ɾ���ɹ�";
           }
           return Message;
       }
      
    }
}
