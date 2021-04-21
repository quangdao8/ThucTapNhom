namespace AppQuanLyThuVien.KetNoi
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DocGia")]
    public partial class DocGia
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DocGia()
        {
            PhieuMuonTras = new HashSet<PhieuMuonTra>();
        }

        [Key]
        [StringLength(10)]
        public string maDG { get; set; }

        [Required]
        [StringLength(30)]
        public string tenDG { get; set; }

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

        [Required]
        [StringLength(8)]
        public string loaiDG { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhieuMuonTra> PhieuMuonTras { get; set; }
    }
}
