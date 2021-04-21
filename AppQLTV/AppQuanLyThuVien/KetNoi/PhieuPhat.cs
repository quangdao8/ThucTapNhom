namespace AppQuanLyThuVien.KetNoi
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhieuPhat")]
    public partial class PhieuPhat
    {
        [Key]
        [StringLength(10)]
        public string soPP { get; set; }

        [Column(TypeName = "date")]
        public DateTime ngayLap { get; set; }

        [Required]
        [StringLength(8)]
        public string loiVP { get; set; }

        [Column(TypeName = "money")]
        public decimal tienPhat { get; set; }

        [Required]
        [StringLength(50)]
        public string tenSach { get; set; }

        [Required]
        [StringLength(10)]
        public string soPMT { get; set; }

        public virtual PhieuMuonTra PhieuMuonTra { get; set; }
    }
}
