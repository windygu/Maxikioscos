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
    
    public partial class Provincia
    {
        public Provincia()
        {
            this.Localidades = new HashSet<Localidad>();
        }
    
        public int ProvinciaId { get; set; }
        public string Descripcion { get; set; }
        public Nullable<System.DateTime> FechaUltimaModificacion { get; set; }
        public bool Eliminado { get; set; }
        public bool Desincronizado { get; set; }
    
        public virtual ICollection<Localidad> Localidades { get; set; }
    }
}
