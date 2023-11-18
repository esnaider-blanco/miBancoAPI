using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace MiBancoAPI.Models
{
    public partial class db_miViajeCR_miBancoContext : DbContext
    {
        public db_miViajeCR_miBancoContext()
        {
        }

        public db_miViajeCR_miBancoContext(DbContextOptions<db_miViajeCR_miBancoContext> options)
            : base(options)
        {
        }

        public virtual DbSet<CuentasBancaria> CuentasBancarias { get; set; }
        public virtual DbSet<CuentaBancariaCustom> CuentaBancariaCustom { get; set; }
        public virtual DbSet<HistoricoLogin> HistoricoLogins { get; set; }
        public virtual DbSet<TiposTransaccion> TiposTransaccions { get; set; }
        public virtual DbSet<Transaccione> Transacciones { get; set; }
        public virtual DbSet<Usuario> Usuarios { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=tiusr26pl.cuc-carrera-ti.ac.cr\\MSSQLSERVER2019;Database=db_miViajeCR_miBanco;Persist Security Info=True;User ID=adminMiBanco;Password=adminMiBanco;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasDefaultSchema("adminMiBanco");

            modelBuilder.Entity<CuentasBancaria>(entity =>
            {
                entity.HasKey(e => e.IdCuentaBancaria)
                    .HasName("PK__CuentasB__98C58F751FD64953");

                entity.HasIndex(e => e.NumeroCuenta, "UQ__CuentasB__E039507BD786C82E")
                    .IsUnique();

                entity.Property(e => e.FechaCreacion).HasColumnType("datetime");

                entity.Property(e => e.NumeroCuenta)
                    .IsRequired()
                    .HasMaxLength(16)
                    .IsUnicode(false);

                entity.Property(e => e.SaldoDisponible).HasColumnType("money");

                entity.HasOne(d => d.IdUsuarioNavigation)
                    .WithMany(p => p.CuentasBancaria)
                    .HasForeignKey(d => d.IdUsuario)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__CuentasBa__IdUsu__3C69FB99");
            });

            modelBuilder.Entity<HistoricoLogin>(entity =>
            {
                entity.Property(e => e.FechaFinSesion).HasColumnType("datetime");

                entity.Property(e => e.FechaInicioSesion).HasColumnType("datetime");

                entity.HasOne(d => d.IdUsuarioNavigation)
                    .WithMany(p => p.HistoricoLogins)
                    .HasForeignKey(d => d.IdUsuario)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Historico__IdUsu__38996AB5");
            });

            modelBuilder.Entity<TiposTransaccion>(entity =>
            {
                entity.HasKey(e => e.IdTipoTransaccion)
                    .HasName("PK__TiposTra__FE769C8D7B955AB9");

                entity.ToTable("TiposTransaccion");

                entity.Property(e => e.TipoTransaccion)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Transaccione>(entity =>
            {
                entity.HasKey(e => e.IdTransaccion)
                    .HasName("PK__Transacc__334B1F7761B642A5");

                entity.Property(e => e.Descripcion)
                    .HasMaxLength(200)
                    .IsUnicode(false);

                entity.Property(e => e.FechaTransaccion).HasColumnType("datetime");

                entity.Property(e => e.Monto).HasColumnType("money");

                entity.HasOne(d => d.IdCuentaBancariaNavigation)
                    .WithMany(p => p.TransaccioneIdCuentaBancariaNavigations)
                    .HasForeignKey(d => d.IdCuentaBancaria)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Transacci__IdCue__4222D4EF");

                entity.HasOne(d => d.IdCuentaBancariaDestinoNavigation)
                    .WithMany(p => p.TransaccioneIdCuentaBancariaDestinoNavigations)
                    .HasForeignKey(d => d.IdCuentaBancariaDestino)
                    .HasConstraintName("FK__Transacci__IdCue__440B1D61");

                entity.HasOne(d => d.IdCuentaBancariaOrigenNavigation)
                    .WithMany(p => p.TransaccioneIdCuentaBancariaOrigenNavigations)
                    .HasForeignKey(d => d.IdCuentaBancariaOrigen)
                    .HasConstraintName("FK__Transacci__IdCue__4316F928");

                entity.HasOne(d => d.IdTipoTransaccionNavigation)
                    .WithMany(p => p.Transacciones)
                    .HasForeignKey(d => d.IdTipoTransaccion)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Transacci__IdTip__412EB0B6");
            });

            modelBuilder.Entity<Usuario>(entity =>
            {
                entity.HasKey(e => e.IdUsuario)
                    .HasName("PK__Usuarios__5B65BF9789B7B6E8");

                entity.Property(e => e.Apellidos)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Contraseña).IsRequired();

                entity.Property(e => e.CorreoElectronico).IsRequired();

                entity.Property(e => e.FechaCreacion).HasColumnType("datetime");

                entity.Property(e => e.FechaNacimiento).HasColumnType("date");

                entity.Property(e => e.Nombre)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Token)
                    .HasMaxLength(10)
                    .IsUnicode(false);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
