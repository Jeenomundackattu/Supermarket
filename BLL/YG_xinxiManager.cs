using System;
using System.Collections.Generic;
using System.Text;
using Models;
using DAL;
using System.Data;

namespace BLL
{
   public  class YG_xinxiManager
    {
       YG_xinxiService ys = new YG_xinxiService();
       public List<YG_xinxi> chaxun()
       {
           return ys.chaxun();
       }
     
       public DataSet YG_xinxi()
       {
           return ys.xinxi();
       }
       public bool addYG_xinxi(YG_xinxi yg, ref string name)
       {
           bool b = false;
           int i = ys.addYG_xinxi(yg);
           if (i > 0)
           {
               b = true;
               name = "�����ɹ���";
           }
           else
           {
               name = "����ʧ�ܣ�";
           }
           return b;

       }
       public int updateYG_xinxi(YG_xinxi yg)
       {
           int i = 0;
           i = ys.updateYG_xinxi(yg);
           if (i > 0)
           {
               Console.WriteLine("�޸ĳɹ�!");

           }
           else
           {
               Console.WriteLine("�޸�ʧ��!");
           }
           return i;
       }
       public DataSet likexixi(string name, string sname)
       {
           return ys.likexixi(name, sname);
       }
       //��������
       public DataSet GetFillYG_xinxi()
       {
           return ys.GetFillYG_xinxi();
       }

       //����
       public int GetAddYG_xinxi(YG_xinxi aa)
       {
           return ys.GetAddYG_xinxi(aa);
       }
       //�ж��Ƿ������ɹ�
       public string ShowGetAddYG_xinxi(YG_xinxi aa)
       {
           string Message = "";
           int i = GetAddYG_xinxi(aa);
           if (i > 0)
           {
               Message = "�����ɹ�";
           }
           return Message;
       }


       //�޸�
       public int GetUpdateYG_xinxi(YG_xinxi aa)
       {
           return ys.GetUpdateYG_xinxi(aa);
       }
       //�ж��Ƿ��޸ĳɹ�
       public string ShowGetUpdateYG_xinxi(YG_xinxi aa)
       {
           string Message = "";
           int i = GetUpdateYG_xinxi(aa);
           if (i > 0)
           {
               Message = "�޸ĳɹ�";
           }
           return Message;
       }


       //ɾ��
       public int GetDeleteYG_xinxi(YG_xinxi aa)
       {
           return ys.GetDeleteYG_xinxi(aa);
       }

       //��ѯ
       public DataSet GetSelectYG_xinxi(YG_xinxi aa)
       {
           return ys.GetSelectYG_xinxi(aa);
       }
      
    }
}
