using System;
using System.Collections.Generic;
using System.Text;
using Models;
using System.Data;
using DAL;

namespace BLL
{
   public class KH_xinxiManager
    {
       KH_xinxiService ks = new KH_xinxiService();
       public DataSet khxxi(string sname)
       {
           return ks.khxxi(sname);
       }
       public int insertKH(KH_xinxi kx)
       {
           return ks.insertKH(kx);
       }
       public string kh(KH_xinxi kx)
       {
           string s = "";
           if (insertKH(kx)>0)
           {
               s = "�����ɹ�";
           }
           else
           {
               s = "����ʧ��";
           }
           return s;
       }
       public DataSet xiougai(KH_xinxi kh)
       {
           return ks.xiougai(kh);
       }
       public int xiougaixz(KH_xinxi kx)
       {
           return ks.xiougaixz(kx);
       }
       public string khxiougai(KH_xinxi kx)
       {
           string s = "";
           if (xiougaixz(kx) > 0)
           {
               s = "�޸ĳɹ�";
           }
           else
           {
               s = "�޸�ʧ��";
           }
           return s;
       }

       //ȫ�����
       public DataSet GetAllKH_xinxi()
       {
           return ks.GetAllKH_xinxi();
       }

       //����
       public int GetAddKH_xinxi(KH_xinxi aa)
       {
           return ks.GetAddKH_xinxi(aa);
       }
       //�����ж�
       public string ShowGetAddKH_xinxi(KH_xinxi aa)
       {
           string Message = "";
           int i = ks.GetAddKH_xinxi(aa);
           if (i > 0)
           {
               Message = "�����ɹ�";
           }
           return Message;
       }


       //�޸�
       public int GetUpdateKH_xinxi(KH_xinxi aa)
       {
           return ks.GetUpdateKH_xinxi(aa);
       }
       //�޸��ж�
       public string ShowGetUpdateKH_xinxi(KH_xinxi aa)
       {
           string Message = "";
           int i = ks.GetUpdateKH_xinxi(aa);
           if (i > 0)
           {
               Message = "�޸ĳɹ�";
           }
           return Message;
       }


       //ɾ��
       public int GetDeleteKH_xinxi(KH_xinxi aa)
       {
           return ks.GetDeleteKH_xinxi(aa);
       }

       //��ѯ
       public DataSet GetSelectKH_xinxi(KH_xinxi aa)
       {
           return ks.GetSelectKH_xinxi(aa);
       }

       public DataSet KH_xinxi()
       {
           return ks.KH_xinxi();
       }
       public DataSet likeKH_xinxi(string name)
       {
           return ks.likeKH_xinxi(name);
       }

    }
}
