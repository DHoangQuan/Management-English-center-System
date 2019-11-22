using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using EnglishCenter.Models;
using System.Collections;
using System.Net.Mail;

namespace EnglishCenter.Controllers
{
    public class PeopleController : Controller
    {
        private ModelContext1 db = new ModelContext1();
        public ActionResult SendEmail(string id)
        {

            var acc = db.People.Find(id);
            //send new confirmation email
            const string username = "TCS2001Send@gmail.com";
            const string password = "123ASDzxc";
            SmtpClient smtpclient = new SmtpClient();
            MailMessage mail = new MailMessage();
            MailAddress fromaddress = new MailAddress("TCS2001Send@gmail.com");
            smtpclient.Host = "smtp.gmail.com";
            smtpclient.Port = 587;
            mail.From = fromaddress;
            mail.To.Add(acc.Email);
            mail.Subject = "Change password";
            mail.IsBodyHtml = true;

            if (acc.Gender == "Male")
            {
                mail.Body = "<p>Dear Mr: " + acc.Name
                + ",<br />"
                + "Your password change into: "
                + acc.Password
                + "<br />"
                + "<br />This mail is from the system, please not reply back."
                ;
            }
            else if (acc.Gender == "Female")
            {
                mail.Body = "<p>Dear Ms: " + acc.Name
                + ",<br />"
                + "Your password change into: "
                + acc.Password
                + "<br />"
                + "<br />This mail is from the system, please not reply back."
                ;
            }
            else
            {
                mail.Body = "<p>Dear: " + acc.Name
                + ",<br />"
                + "Your password change into: "
                + acc.Password
                + "<br />"
                + "<br />This mail is from the system, please not reply back."
                ;
            }



            smtpclient.EnableSsl = true;
            smtpclient.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtpclient.Credentials = new NetworkCredential(username, password);
            smtpclient.Send(mail);

            return View();

        }
        public ActionResult Login(Person loginPerson)
        {
            try
            {

                //var acc = db.People.SingleOrDefault(a => a.PeopleID.Equals(loginPerson.PeopleID) && a.Active.Equals("Activated"));
                var acc = db.People.SingleOrDefault(a => a.PeopleID.Equals(loginPerson.PeopleID));
                if (acc == null)
                {
                    ModelState.AddModelError("", "Invalid Phone or you are banned");
                    //TempData["loginInform"] = "<script>alert('Invalid Phone or you are banned');</script>";
                }
                else
                {
                    if (acc.Active == "Banned")
                    {
                        TempData["loginInform"] = "<script>alert('Your account is banned, please contact with TCS2001@gmail.com to open');</script>";
                    }
                    else if (acc.Password != loginPerson.Password)
                    {
                        TempData["loginInform"] = "<script>alert('Wrong password please input again');</script>";
                    }
                    else
                    {
                        if (acc.Password.Equals(loginPerson.Password))
                        {
                            if (acc.Image == null || acc.Image == "")
                            {
                                Session["ImagePerson"] = "null";
                            }
                            else
                            {
                                Session["ImagePerson"] = acc.Image;
                            }
                            if (acc.RoleID == "ROLE05")
                            {
                                var getsttime = db.StudentTimes.Where(c => c.StudentID == acc.PeopleID).FirstOrDefault();
                                Session["StudentTimeLogin"] = getsttime.Future;
                            }
                            Session["PersonName"] = acc.Name;
                            Session["PersonID"] = acc.PeopleID;
                            Session["RoleID"] = acc.RoleID;
                            Session["RoleName"] = acc.Role.Role1;

                            var GetAllowEditAuthentication = db.Authentications.Where(x => x.EditAuthetication == "Allow" && x.PeopleID == acc.PeopleID);
                            var GetAuthComment = db.Authentications.Where(c => c.Comment == "Allow" && c.PeopleID == acc.PeopleID);
                            var GetAuthBlog = db.Authentications.Where(c => c.CreatePost == "Allow" && c.PeopleID == acc.PeopleID);
                            var GetAllowEditBlog = db.Authentications.Where(c => c.EditPost == "Allow" && c.PeopleID == acc.PeopleID);
                            var GetAllowClass = db.Authentications.Where(c => c.Class == "Allow" && c.PeopleID == acc.PeopleID);
                            var GetAllowRoom = db.Authentications.Where(c => c.Room == "Allow" && c.PeopleID == acc.PeopleID);
                            var GetAllowTopics = db.Authentications.Where(c => c.Topics == "Allow" && c.PeopleID == acc.PeopleID);
                            var GetAllowSkills = db.Authentications.Where(c => c.Skills == "Allow" && c.PeopleID == acc.PeopleID);
                            var GetAllowLessons = db.Authentications.Where(c => c.Lessons == "Allow" && c.PeopleID == acc.PeopleID);
                            var GetAllowAttendant = db.Authentications.Where(c => c.Attendant == "Allow" && c.PeopleID == acc.PeopleID);
                            var GetAllowEditStudentTime = db.Authentications.Where(c => c.EditStudentTime == "Allow" && c.PeopleID == acc.PeopleID);
                            var GetAllowBanned = db.Authentications.Where(c => c.Allowbanned == "Allow" && c.PeopleID == acc.PeopleID);
                            //EditAuth
                            if (GetAllowEditAuthentication.Count() == 1)
                            {
                                Session["AllowAuth"] = "Allow";
                            }
                            else
                            {
                                Session["AllowAuth"] = "NotAllow";
                            }
                            //AuthComment
                            if (GetAuthComment.Count() == 1)
                            {
                                Session["AllowComment"] = "Allow";
                            }
                            else
                            {
                                Session["AllowComment"] = "NotAllow";
                            }
                            //AuthBlog
                            if (GetAuthBlog.Count() == 1)
                            {
                                Session["AllowBlog"] = "Allow";
                            }
                            else
                            {
                                Session["AllowBlog"] = "NotAllow";
                            }
                            //AuthEditBlog.
                            if (GetAllowEditBlog.Count() == 1)
                            {
                                Session["AllowEditBlog"] = "Allow";
                            }
                            else
                            {
                                Session["AllowEditBlog"] = "NotAllow";
                            }
                            //AuthClass
                            if (GetAllowClass.Count() == 1)
                            {
                                Session["AllowClass"] = "Allow";
                            }
                            else
                            {
                                Session["AllowClass"] = "NotAllow";
                            }
                            //AuthRoom
                            if (GetAllowRoom.Count() == 1)
                            {
                                Session["AllowRoom"] = "Allow";
                            }
                            else
                            {
                                Session["AllowRoom"] = "NotAllow";
                            }
                            //AuthTopics
                            if (GetAllowTopics.Count() == 1)
                            {
                                Session["AllowTopics"] = "Allow";
                            }
                            else
                            {
                                Session["AllowTopics"] = "NotAllow";
                            }
                            //AuthSkills
                            if (GetAllowSkills.Count() == 1)
                            {
                                Session["AllowSkills"] = "Allow";
                            }
                            else
                            {
                                Session["AllowSkills"] = "NotAllow";
                            }
                            //AuthLessons
                            if (GetAllowLessons.Count() == 1)
                            {
                                Session["AllowLessons"] = "Allow";
                            }
                            else
                            {
                                Session["AllowLessons"] = "NotAllow";
                            }
                            //AuthAttendant
                            if (GetAllowAttendant.Count() == 1)
                            {
                                Session["AllowAttendant"] = "Allow";
                            }
                            else
                            {
                                Session["AllowAttendant"] = "NotAllow";
                            }
                            //AuthStudentTime
                            if (GetAllowEditStudentTime.Count() == 1)
                            {
                                Session["AllowStudentTime"] = "Allow";
                            }
                            else
                            {
                                Session["AllowStudentTime"] = "NotAllow";
                            }
                            //AuthBanned
                            if (GetAllowBanned.Count() == 1)
                            {
                                Session["AllowBanned"] = "Allow";
                            }
                            else
                            {
                                Session["AllowBanned"] = "NotAllow";
                            }
                            if (acc.RoleID == "ROLE04" || acc.RoleID == "ROLE05")
                            {
                                return RedirectToAction("Details", "People", new { id = loginPerson.PeopleID });
                            }
                            else
                            {
                                return RedirectToAction("Index", "People");
                            }

                        }
                        else
                        {
                            ModelState.AddModelError("", "Invalid Password");
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
            }
            return View(loginPerson);
        }

        public ActionResult Logout()
        {
            Session["AllowAuth"] = null;
            Session["AllowComment"] = null;
            Session["AllowBlog"] = null;
            Session["AllowEditBlog"] = null;
            Session["AllowClass"] = null;
            Session["AllowRoom"] = null;
            Session["AllowTopics"] = null;
            Session["AllowSkills"] = null;
            Session["AllowLessons"] = null;
            Session["AllowAttendant"] = null;
            Session["AllowStudentTime"] = null;
            Session["AllowBanned"] = null;
            Session["ImagePerson"] = null;
            Session["PersonName"] = null;
            Session["PersonID"] = null;
            Session["RoleID"] = null;
            Session["RoleName"] = null;
            return RedirectToAction("IndexClient", "Contents");

        }
        public ActionResult ChangePassword(string id)
        {
            Person person = db.People.Find(id);
            ViewBag.PeopleID = new SelectList(db.Authentications, "PeopleID", "EditAuthetication", person.PeopleID);
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "Role1", person.RoleID);
            return PartialView("../People/ChangePassword", person);
        }
        [HttpPost]
        public ActionResult ChangePassword(Person person)
        {
            db.Entry(person).State = EntityState.Modified;
            db.SaveChanges();
            db = new ModelContext1();
            var checkmail = db.People.Find(person.PeopleID);
            if (checkmail.Email == null || checkmail.Email == "")
            {

            }
            else
            {
                SendEmail(person.PeopleID);
            }
            return RedirectToAction("Details", "People", new { id = person.PeopleID });
        }
        public ActionResult DetailsPartial(string id)
        {
            Person person = db.People.Find(id);

            return PartialView("../People/DetailsPartial", person);
        }
        public RedirectToRouteResult Banned(string id)
        {
            Person person = db.People.Find(id);
            person.Active = "Banned";
            db.Entry(person).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "People");
        }
        public RedirectToRouteResult Activated(string id)
        {
            Person person = db.People.Find(id);
            person.Active = "Activated";
            db.Entry(person).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index", "People");
        }
        public ActionResult EditIn4Index(string id)
        {
            Person person = db.People.Find(id);
            ViewBag.PeopleID = new SelectList(db.Authentications, "PeopleID", "EditAuthetication", person.PeopleID);
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "Role1", person.RoleID);
            return PartialView("../People/EditIn4Index", person);
        }
        [HttpPost]
        public ActionResult EditIn4Index(Person person)
        {
            db.Entry(person).State = EntityState.Modified;
            db.SaveChangesAsync();
            db = new ModelContext1();
            return RedirectToAction("Index", "People");
        }
        public ActionResult EditIn4(string id)
        {
            Person person = db.People.Find(id);
            ViewBag.PeopleID = new SelectList(db.Authentications, "PeopleID", "EditAuthetication", person.PeopleID);
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "Role1", person.RoleID);
            return PartialView("../People/EditIn4", person);
        }
        [HttpPost]
        public ActionResult EditIn4(Person person)
        {
            db.Entry(person).State = EntityState.Modified;
            db.SaveChangesAsync();
            db = new ModelContext1();
            return RedirectToAction("Details", "People", new { id = person.PeopleID });
        }
        public ActionResult EditAva(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Person person = db.People.Find(id);
            if (person == null)
            {
                return HttpNotFound();
            }
            ViewBag.PeopleID = new SelectList(db.Authentications, "PeopleID", "EditAuthetication", person.PeopleID);
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "Role1", person.RoleID);
            return PartialView("../People/EditAva", person);
        }
        [HttpPost]
        public ActionResult EditAva(Person person)
        {

            Session["ImagePerson"] = null;
            db.Entry(person).State = EntityState.Modified;
            db.SaveChangesAsync();
            db = new ModelContext1();


            var GetPersonInComment = db.Comments.Where(c => c.PeopleID == person.PeopleID);
            foreach (var img in GetPersonInComment)
            {
                db = new ModelContext1();
                Comment cmt = db.Comments.Find(img.comment_id);
                cmt.Image = person.Image;
                db.Entry(cmt).State = EntityState.Modified;
                db.SaveChangesAsync();
                db = new ModelContext1();
            }
            Session["ImagePerson"] = person.Image;
            return RedirectToAction("Details", "People", new { id = person.PeopleID });
        }
        // GET: People
        public ActionResult Index()
        {
            var people = db.People.Include(p => p.Authentication).Include(p => p.Role);
            return View(people.ToList());
        }

        // GET: People/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Person person = db.People.Find(id);
            Session["DetailsPersonID"] = null;
            Session["DetailsPersonName"] = null;
            Session["DetailsPersonID"] = id;
            Session["DetailsPersonName"] = person.Name;
            if (person == null)
            {
                return HttpNotFound();
            }
            return View(person);
        }
        // GET: People/Create
        public ActionResult Create()
        {
            ViewBag.PeopleID = new SelectList(db.Authentications, "PeopleID", "EditAuthetication");
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "Role1");
            return View();
        }

        // POST: People/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Person person)
        {
            if (ModelState.IsValid)
            {
                if (person.RoleID == null)
                {
                    if (Session["RoleID"].ToString() == "ROLE02")
                    {
                        person.RoleID = "ROLE03";
                        person.Active = "Activated";
                        db.People.Add(person);
                        db.SaveChanges();
                        db = new ModelContext1();
                    }
                    else if (Session["RoleID"].ToString() == "ROLE03" && person.RoleID == null)
                    {
                        person.RoleID = "ROLE04";
                        person.Active = "Activated";
                        db.People.Add(person);
                        db.SaveChanges();
                        db = new ModelContext1();
                    }
                }              
                else
                {
                    person.Active = "Activated";
                    db.People.Add(person);
                    db.SaveChanges();
                    db = new ModelContext1();
                }
                Authentication auth = new Authentication();
                if (person.RoleID == "ROLE01")
                {
                    auth.PeopleID = person.PeopleID;
                    auth.EditAuthetication = "Allow";
                    auth.Comment = "Allow";
                    auth.CreatePost = "Allow";
                    auth.EditPost = "Allow";
                    auth.Class = "Allow";
                    auth.Room = "Allow";
                    auth.Topics = "Allow";
                    auth.Skills = "Allow";
                    auth.Lessons = "Allow";
                    auth.Attendant = "Allow";
                    auth.EditStudentTime = "Allow";
                    auth.Allowbanned = "Allow";
                    db.Authentications.Add(auth);
                    db.SaveChanges();
                    db = new ModelContext1();
                }
                else if (person.RoleID == "ROLE02")
                {
                    auth.PeopleID = person.PeopleID;
                    auth.EditAuthetication = "Allow";
                    auth.Comment = "Allow";
                    auth.CreatePost = "Allow";
                    auth.EditPost = "Allow";
                    auth.Class = "Allow";
                    auth.Room = "Allow";
                    auth.Topics = "Allow";
                    auth.Skills = "Allow";
                    auth.Lessons = "Allow";
                    auth.Attendant = "Allow";
                    auth.EditStudentTime = "Allow";
                    auth.Allowbanned = "Allow";
                    db.Authentications.Add(auth);
                    db.SaveChanges();
                    db = new ModelContext1();
                }
                else if (person.RoleID == "ROLE03")
                {
                    auth.PeopleID = person.PeopleID;
                    auth.EditAuthetication = "NotAllow";
                    auth.Comment = "Allow";
                    auth.CreatePost = "Allow";
                    auth.EditPost = "Allow";
                    auth.Class = "Allow";
                    auth.Room = "Allow";
                    auth.Topics = "Allow";
                    auth.Skills = "Allow";
                    auth.Lessons = "Allow";
                    auth.Attendant = "Allow";
                    auth.EditStudentTime = "Allow";
                    auth.Allowbanned = "Allow";
                    db.Authentications.Add(auth);
                    db.SaveChanges();
                    db = new ModelContext1();
                }
                else if (person.RoleID == "ROLE04")
                {
                    auth.PeopleID = person.PeopleID;
                    auth.EditAuthetication = "NotAllow";
                    auth.Comment = "Allow";
                    auth.CreatePost = "NotAllow";
                    auth.EditPost = "NotAllow";
                    auth.Class = "NotAllow";
                    auth.Room = "NotAllow";
                    auth.Topics = "NotAllow";
                    auth.Skills = "NotAllow";
                    auth.Lessons = "NotAllow";
                    auth.Attendant = "Allow";
                    auth.EditStudentTime = "NotAllow";
                    auth.Allowbanned = "NotAllow";
                    db.Authentications.Add(auth);
                    db.SaveChanges();
                    db = new ModelContext1();
                    LecturerTime ltt = new LecturerTime();
                    ltt.ID = person.PeopleID;
                    ltt.LecturerID = person.PeopleID;
                    ltt.Year = DateTime.Now.Year.ToString();
                    ltt.Month = DateTime.Now.Month.ToString();
                    ltt.TeachingTime = 0;
                    db.LecturerTimes.Add(ltt);
                    db.SaveChanges();
                    db = new ModelContext1();
                }
                else
                {
                    auth.PeopleID = person.PeopleID;
                    auth.EditAuthetication = "NotAllow";
                    auth.Comment = "Allow";
                    auth.CreatePost = "NotAllow";
                    auth.EditPost = "NotAllow";
                    auth.Class = "NotAllow";
                    auth.Room = "NotAllow";
                    auth.Topics = "NotAllow";
                    auth.Skills = "NotAllow";
                    auth.Lessons = "NotAllow";
                    auth.Attendant = "NotAllow";
                    auth.EditStudentTime = "NotAllow";
                    auth.Allowbanned = "NotAllow";
                    db.Authentications.Add(auth);
                    db.SaveChanges();
                    db = new ModelContext1();
                    StudentTime sdt = new StudentTime();
                    sdt.ID = person.PeopleID;
                    sdt.StudentID = person.PeopleID;
                    sdt.Studied = 0;
                    sdt.Future = 0;
                    db.StudentTimes.Add(sdt);
                    db.SaveChanges();
                    db = new ModelContext1();
                }
                return RedirectToAction("Index");
            }

            ViewBag.PeopleID = new SelectList(db.Authentications, "PeopleID", "EditAuthetication", person.PeopleID);
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "Role1", person.RoleID);
            return View(person);
        }

        // GET: People/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Person person = db.People.Find(id);
            if (person == null)
            {
                return HttpNotFound();
            }
            ViewBag.PeopleID = new SelectList(db.Authentications, "PeopleID", "EditAuthetication", person.PeopleID);
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "Role1", person.RoleID);
            return View(person);
        }

        // POST: People/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PeopleID,Name,Phone,DoB,Gender,Email,Active,Password,Address,Image,RoleID")] Person person)
        {
            if (ModelState.IsValid)
            {
                db.Entry(person).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PeopleID = new SelectList(db.Authentications, "PeopleID", "EditAuthetication", person.PeopleID);
            ViewBag.RoleID = new SelectList(db.Roles, "RoleID", "Role1", person.RoleID);
            return View(person);
        }

        // GET: People/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Person person = db.People.Find(id);
            if (person == null)
            {
                return HttpNotFound();
            }
            return View(person);
        }

        // POST: People/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Person person = db.People.Find(id);
            db.People.Remove(person);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
