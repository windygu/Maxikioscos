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
    
    public partial class EstadoTicket
    {
        public EstadoTicket()
        {
            this.TicketErrors = new HashSet<TicketError>();
        }
    
        public EstadoTicketEnum EstadoTicketId { get; set; }
        public string Descripcion { get; set; }
    
        public virtual ICollection<TicketError> TicketErrors { get; set; }
    }
}
