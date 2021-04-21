namespace AppQuanLyThuVien.KetNoi
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NCC")]
    public partial class NCC
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NCC()
        {
            PhieuNhaps = new HashSet<PhieuNhap>();
            SachCNs = new HashSet<SachCN>();
        }

        [Key]
        [StringLength(10)]
        public string maNCC { get; set; }

        [Required]
        [StringLength(30)]
        public string tenNCC { get; set; }

        [StringLength(50)]
        public string diaChi { get; set; }

        [Required]
        [StringLength(13)]
        public string SDT { get; set; }

        [StringLength(50)]
        public string email { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhieuNhap> PhieuNhaps { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SachCN> SachCNs { get; set; }
    }
}
