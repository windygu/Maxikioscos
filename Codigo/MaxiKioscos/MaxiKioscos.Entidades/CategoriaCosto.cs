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
    
    public partial class CategoriaCosto
    {
        public CategoriaCosto()
        {
            this.Costos = new HashSet<Costo>();
        }
    
        public int CategoriaCostoId { get; set; }
        public string Descripcion { get; set; }
        public System.Guid Identifier { get; set; }
        public bool Desincronizado { get; set; }
        public bool Eliminado { get; set; }
        public Nullable<System.DateTime> FechaUltimaModificacion { get; set; }
    
        public virtual ICollection<Costo> Costos { get; set; }
    }
}