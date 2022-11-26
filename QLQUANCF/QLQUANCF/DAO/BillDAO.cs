using QLQUANCF.DTO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Text;
using System.Threading.Tasks;

//CÓ NHIỆM VỤ lấy ra bill từ idtablefood
namespace QLQUANCF.DAO
{
    public class BillDAO
    {
        private static BillDAO instance;

        public static BillDAO Instance 
        { 
            get { if (instance == null) instance = new BillDAO();return BillDAO.instance; }
            private set { BillDAO.instance = value; }
        }
    
        private BillDAO() { }

        /// <summary>
        /// thành công : idBill
        /// thất bại => -1
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        
        //1 trả id , 2 trả bill => trả id
        public int GetUncheckBillIDByTableID(int id)
        {
            //return (int)DataProvider.Instance.ExecuteScalar("");//không dùng đc query scalar , bị lỗi nếu ép kiểu k dc


           DataTable data = DataProvider.Instance.ExecuteQuery("select * from bill where idtablefood = " + id + " and status = 0");//lấy trường (số lượng)=>thành công=>chuyển thành bill=>lấy id
        
            if (data.Rows.Count>0) 
            {
                Bill bill = new Bill(data.Rows[0]);
                return bill.IdBill;
            }

            return -1;
        }
    }
}
