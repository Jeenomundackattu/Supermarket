using System;
using System.Collections.Generic;
using System.Text;
using Models;
using DAL;
using System.Data;

namespace BLL
{
    public class CZ_YuangongManager
    {
        CZ_YuangongServeic cs = new CZ_YuangongServeic();
        public CZ_Yuangong chaxun(CZ_Yuangong cz)
        {
            return cs.chaxun(cz);
        }

        public bool login(CZ_Yuangong cz, ref string h)
        {
            bool b = false;
            if (cs.chaxun(cz) == null)
            {
                h = "�û���������";
            }
            else
            {
                if (cz.CZ_yPassword == cs.chaxun(cz).CZ_yPassword)
                {
                    h = cz.CZ_yName;
                    b = true;

                }
                else
                {
                    h = "�������";
                }
            }
            return b;
        }
        public List<CZ_Yuangong> add()
        {
            return cs.add();
        }



        public DataSet GetAllCZ_Yuangong()
        {
            return cs.GetAllCZ_Yuangong();
        }


        //�޸�
        public int GetAllCZ_Yuangong(CZ_Yuangong aa)
        {
            return cs.UpdateCZ_Yuangong(aa);
        }
        //�ж��޸�
        public string ShowGetAllCZ_Yuangong(CZ_Yuangong aaa)
        {
            string Message;
            int i = cs.UpdateCZ_Yuangong(aaa);
            if (i > 0)
            {
                Message = "�޸ĳɹ�";
            }
            else
            {
                Message = "�޸�ʧ��";
            }
            return Message;
        }

        //ɾ��
        public int DeleteCZ_Yuangong(CZ_Yuangong aa)
        {
            return cs.DeleteCZ_Yuangong(aa);
        }

        //�޸�
        public int UpdateCZ_Yuangong(CZ_Yuangong aa)
        {
            return cs.UpdateCZ_Yuangong(aa);
        }
        //�ж��޸�
        public string ShowUpdateCZ_Yuangong(CZ_Yuangong aaa)
        {
            string Message;
            int i = UpdateCZ_Yuangong(aaa);
            if (i > 0)
            {
                Message = "�޸ĳɹ�";
            }
            else
            {
                Message = "�޸�ʧ��";
            }
            return Message;
        }
        //����
        public int GetAddCZ_Yuangong(CZ_Yuangong aa)
        {
            return cs.GetAddCZ_Yuangong(aa);
        }
        //�ж������Ƿ�ɹ�
        public string ShowGetAddCZ_Yuangong(CZ_Yuangong aa)
        {
            string Message = "";
            int i = GetAddCZ_Yuangong(aa);
            if (i > 0)
            {
                Message = "�����ɹ�";
            }
            else
            {
                Message = "����ʧ��";
            }
            return Message;
        }

    }
}
