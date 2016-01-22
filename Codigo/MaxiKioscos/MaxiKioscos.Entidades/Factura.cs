//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MaxiKioscos.Entidades
{
    using System;
    using System.Collections.Generic;
    
    public partial class Factura
    {
        public Factura()
        {
            this.Compras = new HashSet<Compra>();
        }
    
        public int FacturaId { get; set; }
        public System.Guid Identifier { get; set; }
        public int ProveedorId { get; set; }
        public string FacturaNro { get; set; }
        public decimal ImporteTotal { get; set; }
        public System.DateTime Fecha { get; set; }
        public int MaxiKioscoId { get; set; }
        public bool Desincronizado { get; set; }
        public Nullable<System.DateTime> FechaUltimaModificacion { get; set; }
        public bool Eliminado { get; set; }
        public Nullable<int> CierreCajaId { get; set; }
        public Nullable<int> UsuarioId { get; set; }
        public string AutoNumero { get; set; }
        public System.DateTime FechaCreacion { get; set; }
        public bool Finalizada { get; set; }
    
        public virtual MaxiKiosco MaxiKiosco { get; set; }
        public virtual Proveedor Proveedor { get; set; }
        public virtual ICollection<Compra> Compras { get; set; }
        public virtual CierreCaja CierreCaja { get; set; }
        public virtual Usuario UsuarioCreador { get; set; }
    }
}
