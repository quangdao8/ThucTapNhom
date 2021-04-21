namespace AppQuanLyThuVien.KetNoi
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SachCN")]
    public partial class SachCN
    {
        [Key]
        [StringLength(10)]
        public string tenSach { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        public string tacGia { get; set; }

        [StringLength(20)]
        public string theLoai { get; set; }

        [Required]
        [StringLength(9)]
        public string loaiHinhNhap { get; set; }

        [Required]
        [StringLength(10)]
        public string maTT { get; set; }

        [StringLength(10)]
        public string maNCC { get; set; }

        public virtual NCC NCC { get; set; }

        public virtual ThuThu ThuThu { get; set; }
    }
}
