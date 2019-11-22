namespace EnglishCenter.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HistoryStudentTime")]
    public partial class HistoryStudentTime
    {
        [Key]
        [Column("HistoryStudentTime")]
        public int HistoryStudentTime1 { get; set; }

        [StringLength(50)]
        public string AddForPerson { get; set; }

        public DateTime? DateAdd { get; set; }

        public int? NumberSlot { get; set; }

        [StringLength(50)]
        public string PersonAdd { get; set; }

        public string Note { get; set; }
        public virtual Person Person { get; set; }

        public virtual Person Person1 { get; set; }
    }
}
