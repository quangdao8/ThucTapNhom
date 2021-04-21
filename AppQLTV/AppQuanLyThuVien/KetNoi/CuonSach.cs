namespace AppQuanLyThuVien.KetNoi
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CuonSach")]
    public partial class CuonSach
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CuonSach()
        {
            ChiTietMuons = new HashSet<ChiTietMuon>();
        }

        [Key]
        [StringLength(10)]
        public string maCS { get; set; }

        [Required]
        [StringLength(4)]
        public string trangThai { get; set; }

        [Required]
        [StringLength(10)]
        public string maTS { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietMuon> ChiTietMuons { get; set; }

        public virtual TuaSach TuaSach { get; set; }
    }
}
