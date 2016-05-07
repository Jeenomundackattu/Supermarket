using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
    /// <summary>
    /// ���ݿ������
    /// </summary>
    class DBHelper
    {
        /// <summary>
        /// ���ݿ������ַ���
        /// </summary>
        private static string sConn = "server =.;database =csgl;user id =sa;pwd =1196824358";

        /// <summary>
        /// ���ݿ����Ӷ���
        /// </summary>
        private static SqlConnection conn = new SqlConnection(sConn);

        /// <summary>
        /// �����ݿ�����
        /// </summary>
        public static void Open()
        {
            //�ж����ݿ������Ƿ�ر�
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
        }

        /// <summary>
        /// �ر����ݿ�����
        /// </summary>
        public static void Close()
        {
            //�ж����ݿ������Ƿ��
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
            }
        }

        /// <summary>
        /// ִ��Command�����ExecuteScalar����
        /// </summary>
        /// <param name="sSql">Ҫִ�е�SQL���</param>
        /// <returns></returns>
        public static object ExecuteScalar(string sSql)
        {
            object obj = null;

            SqlCommand comm = new SqlCommand(sSql, conn);

            try
            {
                //���õ�ǰ������ݿ�򿪷���
                Open();

                //ִ��Command���������
                obj = comm.ExecuteScalar();
            }
            catch
            {
                //���쳣�׵����ø÷����ĵط�
                throw;
            }
            finally
            {
                //���õ�ǰ������ݿ�رշ���
                Close();
            }

            return obj;
        }

        /// <summary>
        /// ִ��Command�����ExecuteNonQuery����
        /// </summary>
        /// <param name="sSql">Ҫִ�е�SQL���</param>
        /// <returns></returns>
        public static int ExecuteNonQuery(string sSql)
        {
            int iResult;
            
            SqlCommand comm = new SqlCommand(sSql, conn);

            try
            {
                //���õ�ǰ������ݿ�򿪷���
                Open();

                //ִ��Command���������
                iResult = comm.ExecuteNonQuery();
            }
            catch
            {
                //���쳣�׵����ø÷����ĵط�
                throw;
            }
            finally
            {
                //���õ�ǰ������ݿ�رշ���
                Close();
            }

            return iResult;
        }

        /// <summary>
        /// ִ��Command�����ExecuteNonQuery����
        /// </summary>
        /// <param name="sSql">Ҫִ�е�SQL���</param>
        /// <returns></returns>
        public static bool ExecuteNonQuery(List<string> sSql)
        {
            bool bResult = false;

            SqlCommand comm = new SqlCommand();
            comm.Connection = conn;

            try
            {
                //���õ�ǰ������ݿ�򿪷���
                Open();
                comm.Transaction = conn.BeginTransaction();

                foreach (string s in sSql)
                {
                    comm.CommandText = s;
                    //ִ��Command���������
                    comm.ExecuteNonQuery();
                }

                comm.Transaction.Commit();
                bResult = true;
            }
            catch
            {
                comm.Transaction.Rollback();
                //���쳣�׵����ø÷����ĵط�
                throw;
            }
            finally
            {
                //���õ�ǰ������ݿ�رշ���
                Close();
            }

            return bResult;
        }

        /// <summary>
        /// ִ��Command�����ExecuteReader����
        /// </summary>
        /// <param name="sSql">Ҫִ�е�SQL���</param>
        /// <returns></returns>
        public static SqlDataReader ExecuteReader(string sSql)
        {
            SqlDataReader dr = null;

            SqlCommand comm = new SqlCommand(sSql, conn);

            try
            {
                //���õ�ǰ������ݿ�򿪷���
                Open();

                //ִ��Command���������
                dr = comm.ExecuteReader();
            }
            catch
            {
                //���쳣�׵����ø÷����ĵط�
                throw;
            }
            //�ô����ܹر����ݿ����ӣ����򷵻ص�DataReader���������治�ܶ�ȡ������

            return dr;
        }

        /// <summary>
        /// ͨ��������������ݼ�
        /// </summary>
        /// <param name="sSql">Ҫִ�е�SQL���</param>
        /// <returns></returns>
        public static DataSet Execute(string sSql)
        {
            DataSet ds = new DataSet();

            SqlDataAdapter da = new SqlDataAdapter(sSql, conn);

            try
            {
                da.Fill(ds);
            }
            catch
            {                
                throw;
            }

            return ds;
        }
    }
}
