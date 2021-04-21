namespace AppQuanLyThuVien.KetNoi
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhieuMuonTra")]
    public partial class PhieuMuonTra
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PhieuMuonTra()
        {
            ChiTietMuons = new HashSet<ChiTietMuon>();
            PhieuPhats = new HashSet<PhieuPhat>();
        }

        [Key]
        [StringLength(10)]
        public string soPMT { get; set; }

        [Column(TypeName = "date")]
        public DateTime ngayLap { get; set; }

        [Column(TypeName = "date")]
        public DateTime ngayHTra { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ngayTra { get; set; }

        [Required]
        [StringLength(10)]
        public string maDG { get; set; }

        [Required]
        [StringLength(10)]
        public string maTT { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietMuon> ChiTietMuons { get; set; }

        public virtual DocGia DocGia { get; set; }

        public virtual ThuThu ThuThu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhieuPhat> PhieuPhats { get; set; }
    }
}
