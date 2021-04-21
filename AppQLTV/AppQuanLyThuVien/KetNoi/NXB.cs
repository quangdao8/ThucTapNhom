namespace AppQuanLyThuVien.KetNoi
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NXB")]
    public partial class NXB
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NXB()
        {
            TuaSaches = new HashSet<TuaSach>();
        }

        [Key]
        [StringLength(10)]
        public string maNXB { get; set; }

        [Required]
        [StringLength(30)]
        public string tenNXB { get; set; }

        [StringLength(50)]
        public string diaChi { get; set; }

        [Required]
        [StringLength(13)]
        public string SDT { get; set; }

        [StringLength(50)]
        public string email { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TuaSach> TuaSaches { get; set; }
    }
}
