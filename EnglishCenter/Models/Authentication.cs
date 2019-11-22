namespace EnglishCenter.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Authentication")]
    public partial class Authentication
    {
        [Key]
        [StringLength(50)]
        public string PeopleID { get; set; }

        public string EditAuthetication { get; set; }
        [NotMapped]
        public bool CheckEditAuthetication { get; set; }
        public string Comment { get; set; }
        [NotMapped]
        public bool CheckComment { get; set; }
        public string CreatePost { get; set; }
        [NotMapped]
        public bool CheckCreatePost { get; set; }
        public string EditPost { get; set; }
        [NotMapped]
        public bool CheckEditPost { get; set; }
        public string Class { get; set; }
        [NotMapped]
        public bool CheckClass { get; set; }
        public string Room { get; set; }
        [NotMapped]
        public bool CheckRoom { get; set; }
        public string Topics { get; set; }
        [NotMapped]
        public bool CheckTopics { get; set; }
        public string Skills { get; set; }
        [NotMapped]
        public bool CheckSkills { get; set; }
        public string Lessons { get; set; }
        [NotMapped]
        public bool CheckLessons { get; set; }
        public string Attendant { get; set; }
        [NotMapped]
        public bool CheckAttendant { get; set; }
        public string EditStudentTime { get; set; }
        [NotMapped]
        public bool CheckEditStudentTime { get; set; }
        public string Allowbanned { get; set; }
        [NotMapped]
        public bool CheckAllowbanned { get; set; }
        public string Notes { get; set; }

        public virtual Person Person { get; set; }
    }
    public class AuthenticationModel
    {
        public List<Authentication> Auth { get; set; }
    }
}
