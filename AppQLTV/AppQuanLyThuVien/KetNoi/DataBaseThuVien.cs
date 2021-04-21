using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace AppQuanLyThuVien.KetNoi
{
    public partial class DataBaseThuVien : DbContext
    {
        public DataBaseThuVien()
            : base("name=DataBaseThuVien")
        {
        }

        public virtual DbSet<ChiTietMuon> ChiTietMuons { get; set; }
        public virtual DbSet<ChiTietNhap> ChiTietNhaps { get; set; }
        public virtual DbSet<CuonSach> CuonSaches { get; set; }
        public virtual DbSet<DocGia> DocGias { get; set; }
        public virtual DbSet<NCC> NCCs { get; set; }
        public virtual DbSet<NXB> NXBs { get; set; }
        public virtual DbSet<PhieuMuonTra> PhieuMuonTras { get; set; }
        public virtual DbSet<PhieuNhap> PhieuNhaps { get; set; }
        public virtual DbSet<PhieuPhat> PhieuPhats { get; set; }
        public virtual DbSet<SachCN> SachCNs { get; set; }
        public virtual DbSet<TacGia> TacGias { get; set; }
        public virtual DbSet<TheLoai> TheLoais { get; set; }
        public virtual DbSet<ThuThu> ThuThus { get; set; }
        public virtual DbSet<TuaSach> TuaSaches { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChiTietMuon>()
                .Property(e => e.soPMT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietMuon>()
                .Property(e => e.maCS)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietMuon>()
                .Property(e => e.tienCoc)
                .HasPrecision(19, 4);

            modelBuilder.Entity<ChiTietMuon>()
                .Property(e => e.tienTToan)
                .HasPrecision(19, 4);

            modelBuilder.Entity<ChiTietNhap>()
                .Property(e => e.soPN)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietNhap>()
                .Property(e => e.maTS)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietNhap>()
                .Property(e => e.donGia)
                .HasPrecision(19, 4);

            modelBuilder.Entity<CuonSach>()
                .Property(e => e.maCS)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<CuonSach>()
                .Property(e => e.maTS)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<CuonSach>()
                .HasMany(e => e.ChiTietMuons)
                .WithRequired(e => e.CuonSach)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DocGia>()
                .Property(e => e.maDG)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<DocGia>()
                .Property(e => e.SDT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<DocGia>()
                .HasMany(e => e.PhieuMuonTras)
                .WithRequired(e => e.DocGia)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NCC>()
                .Property(e => e.maNCC)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NCC>()
                .Property(e => e.SDT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NCC>()
                .Property(e => e.email)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NCC>()
                .HasMany(e => e.PhieuNhaps)
                .WithRequired(e => e.NCC)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NXB>()
                .Property(e => e.maNXB)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NXB>()
                .Property(e => e.SDT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NXB>()
                .Property(e => e.email)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<NXB>()
                .HasMany(e => e.TuaSaches)
                .WithRequired(e => e.NXB)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PhieuMuonTra>()
                .Property(e => e.soPMT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<PhieuMuonTra>()
                .Property(e => e.maDG)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<PhieuMuonTra>()
                .Property(e => e.maTT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<PhieuMuonTra>()
                .HasMany(e => e.ChiTietMuons)
                .WithRequired(e => e.PhieuMuonTra)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PhieuMuonTra>()
                .HasMany(e => e.PhieuPhats)
                .WithRequired(e => e.PhieuMuonTra)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PhieuNhap>()
                .Property(e => e.soPN)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<PhieuNhap>()
                .Property(e => e.maTT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<PhieuNhap>()
                .Property(e => e.maNCC)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<PhieuNhap>()
                .HasMany(e => e.ChiTietNhaps)
                .WithRequired(e => e.PhieuNhap)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PhieuPhat>()
                .Property(e => e.soPP)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<PhieuPhat>()
                .Property(e => e.tienPhat)
                .HasPrecision(19, 4);

            modelBuilder.Entity<PhieuPhat>()
                .Property(e => e.soPMT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<SachCN>()
                .Property(e => e.tenSach)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<SachCN>()
                .Property(e => e.maTT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<SachCN>()
                .Property(e => e.maNCC)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TacGia>()
                .Property(e => e.maTG)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TacGia>()
                .HasMany(e => e.TuaSaches)
                .WithMany(e => e.TacGias)
                .Map(m => m.ToTable("Viet").MapLeftKey("maTG").MapRightKey("maTS"));

            modelBuilder.Entity<TheLoai>()
                .Property(e => e.maTL)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TheLoai>()
                .HasMany(e => e.TuaSaches)
                .WithMany(e => e.TheLoais)
                .Map(m => m.ToTable("TS_TL").MapLeftKey("maTL").MapRightKey("maTS"));

            modelBuilder.Entity<ThuThu>()
                .Property(e => e.maTT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<ThuThu>()
                .Property(e => e.SDT)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<ThuThu>()
                .HasMany(e => e.PhieuMuonTras)
                .WithRequired(e => e.ThuThu)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ThuThu>()
                .HasMany(e => e.PhieuNhaps)
                .WithRequired(e => e.ThuThu)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ThuThu>()
                .HasMany(e => e.SachCNs)
                .WithRequired(e => e.ThuThu)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TuaSach>()
                .Property(e => e.maTS)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TuaSach>()
                .Property(e => e.Gia)
                .HasPrecision(10, 4);

            modelBuilder.Entity<TuaSach>()
                .Property(e => e.viTri)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TuaSach>()
                .Property(e => e.maNXB)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<TuaSach>()
                .HasMany(e => e.ChiTietNhaps)
                .WithRequired(e => e.TuaSach)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TuaSach>()
                .HasMany(e => e.CuonSaches)
                .WithRequired(e => e.TuaSach)
                .WillCascadeOnDelete(false);
        }
    }
}
