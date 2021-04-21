namespace AppQuanLyThuVien.KetNoi
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietNhap")]
    public partial class ChiTietNhap
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string soPN { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string maTS { get; set; }

        public int soLuong { get; set; }

        [Column(TypeName = "money")]
        public decimal donGia { get; set; }

        public virtual PhieuNhap PhieuNhap { get; set; }

        public virtual TuaSach TuaSach { get; set; }
    }
}
