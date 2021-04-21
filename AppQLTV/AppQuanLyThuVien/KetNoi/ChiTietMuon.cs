namespace AppQuanLyThuVien.KetNoi
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietMuon")]
    public partial class ChiTietMuon
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(10)]
        public string soPMT { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(10)]
        public string maCS { get; set; }

        [Column(TypeName = "money")]
        public decimal? tienCoc { get; set; }

        [Column(TypeName = "money")]
        public decimal? tienTToan { get; set; }

        public virtual CuonSach CuonSach { get; set; }

        public virtual PhieuMuonTra PhieuMuonTra { get; set; }
    }
}
