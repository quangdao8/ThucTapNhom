namespace AppQuanLyThuVien.KetNoi
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhieuNhap")]
    public partial class PhieuNhap
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PhieuNhap()
        {
            ChiTietNhaps = new HashSet<ChiTietNhap>();
        }

        [Key]
        [StringLength(10)]
        public string soPN { get; set; }

        [Column(TypeName = "date")]
        public DateTime ngayLap { get; set; }

        [Required]
        [StringLength(10)]
        public string maTT { get; set; }

        [Required]
        [StringLength(10)]
        public string maNCC { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietNhap> ChiTietNhaps { get; set; }

        public virtual NCC NCC { get; set; }

        public virtual ThuThu ThuThu { get; set; }
    }
}
