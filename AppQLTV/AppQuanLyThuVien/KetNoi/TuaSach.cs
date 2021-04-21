namespace AppQuanLyThuVien.KetNoi
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TuaSach")]
    public partial class TuaSach
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TuaSach()
        {
            ChiTietNhaps = new HashSet<ChiTietNhap>();
            CuonSaches = new HashSet<CuonSach>();
            TheLoais = new HashSet<TheLoai>();
            TacGias = new HashSet<TacGia>();
        }

        [Key]
        [StringLength(10)]
        public string maTS { get; set; }

        [Required]
        [StringLength(50)]
        public string tenTS { get; set; }

        public int? namXB { get; set; }

        [Column(TypeName = "smallmoney")]
        public decimal? Gia { get; set; }

        [Required]
        [StringLength(8)]
        public string viTri { get; set; }

        [Column(TypeName = "ntext")]
        public string noiDungTT { get; set; }

        [StringLength(20)]
        public string nnChinh { get; set; }

        [Required]
        [StringLength(10)]
        public string maNXB { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietNhap> ChiTietNhaps { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CuonSach> CuonSaches { get; set; }

        public virtual NXB NXB { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TheLoai> TheLoais { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TacGia> TacGias { get; set; }
    }
}
