namespace AppQuanLyThuVien.KetNoi
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThuThu")]
    public partial class ThuThu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ThuThu()
        {
            PhieuMuonTras = new HashSet<PhieuMuonTra>();
            PhieuNhaps = new HashSet<PhieuNhap>();
            SachCNs = new HashSet<SachCN>();
        }

        [Key]
        [StringLength(10)]
        public string maTT { get; set; }

        [Required]
        [StringLength(30)]
        public string tenTT { get; set; }

        [Required]
        [StringLength(3)]
        public string gioiTinh { get; set; }

        [Column(TypeName = "date")]
        public DateTime ngaySinh { get; set; }

        [StringLength(50)]
        public string diaChi { get; set; }

        [Required]
        [StringLength(13)]
        public string SDT { get; set; }

        [StringLength(30)]
        public string capBac { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhieuMuonTra> PhieuMuonTras { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhieuNhap> PhieuNhaps { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SachCN> SachCNs { get; set; }
    }
}
