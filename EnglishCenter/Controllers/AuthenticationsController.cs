using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using EnglishCenter.Models;

namespace EnglishCenter.Controllers
{
    public class AuthenticationsController : Controller
    {
        private ModelContext1 db = new ModelContext1();

        // GET: Authentications
        public ActionResult Index()
        {
            var authentications = db.Authentications.Include(a => a.Person);
            return View(authentications.ToList());
        }
        public ActionResult IndexPerSonal(string id)
        {
            var authentications = db.Authentications.Where(a => a.PeopleID == id);
            Session["IndexPersonalIdPerson"] = null;
            Session["IndexPersonalIdPerson"] = id;
            AuthenticationModel authmodel = new AuthenticationModel();
            authmodel.Auth = authentications.ToList();
            return View(authmodel);
        }
        public ActionResult checkSession(string id)
        {
            if (Session["PersonID"].ToString() == id)
            {
                var checkSession = db.Authentications.Where(c => c.PeopleID == id).FirstOrDefault();
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
                Session["AllowAuth"] = checkSession.EditAuthetication;
                Session["AllowComment"] = checkSession.Comment;
                Session["AllowBlog"] = checkSession.CreatePost;
                Session["AllowEditBlog"] = checkSession.EditPost;
                Session["AllowClass"] = checkSession.Class;
                Session["AllowRoom"] = checkSession.Room;
                Session["AllowTopics"] = checkSession.Topics;
                Session["AllowSkills"] = checkSession.Skills;
                Session["AllowLessons"] = checkSession.Lessons;
                Session["AllowAttendant"] = checkSession.Attendant;
                Session["AllowStudentTime"] = checkSession.CheckEditStudentTime;
                Session["AllowBanned"] = checkSession.Allowbanned;
            }
            return View();
        }
        [HttpPost]
        public ActionResult IndexPerSonal(AuthenticationModel AuthModel)
        {
            var itemlist = AuthModel.Auth.Where(c => c.CheckEditAuthetication == true
            || c.CheckComment == true || c.CheckCreatePost == true || c.CheckEditPost == true
            || c.CheckClass == true || c.CheckRoom == true || c.CheckTopics == true || c.CheckSkills == true
            || c.CheckLessons == true || c.CheckAttendant == true || c.CheckEditStudentTime == true || c.CheckAllowbanned == true);
            foreach (var item in itemlist)
            {
                
                //EditAuthetication
                if (item.EditAuthetication == "Allow"  && item.CheckEditAuthetication == true )
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.EditAuthetication = "NotAllow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                else if ((item.EditAuthetication == "NotAllow" || item.EditAuthetication == null) && item.CheckEditAuthetication == true )
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.EditAuthetication = "Allow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                //Comment
                if (item.Comment == "Allow"  && item.CheckComment == true )
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Comment = "NotAllow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                else if ((item.Comment == "NotAllow" || item.Comment == null) && item.CheckComment == true)
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Comment = "Allow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                //CreatePost
                if ((item.CreatePost == "NotAllow" || item.CreatePost == null) && item.CheckCreatePost == true )
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.CreatePost = "Allow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                else if (item.CreatePost == "Allow" && item.CheckCreatePost == true )
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.CreatePost = "NotAllow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                //EditPost
                if ((item.EditPost == "NotAllow" || item.EditPost == null) && item.CheckEditPost == true )
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.EditPost = "Allow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                else if (item.EditPost == "Allow"  && item.CheckEditPost == true)
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.EditPost = "NotAllow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                //Class
                if ((item.Class == "NotAllow" || item.Class == null) && item.CheckClass == true )
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Class = "Allow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                else if (item.Class == "Allow" && item.CheckClass == true)
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Class = "NotAllow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                //Room
                if ((item.Room == "NotAllow" || item.Room == null) && item.CheckRoom == true )
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Room = "Allow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                else if (item.Room == "Allow" && item.CheckRoom == true )
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Room = "NotAllow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                //Topics
                if ((item.Topics == "NotAllow" || item.Topics == null) && item.CheckTopics == true )
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Topics = "Allow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                else if (item.Topics == "Allow" && item.CheckTopics == true )
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Topics = "NotAllow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                //Skills
                if ((item.Skills == "NotAllow" || item.Skills == null) && item.CheckSkills == true )
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Skills = "Allow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                else if (item.Skills == "Allow" && item.CheckSkills == true)
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Skills = "NotAllow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                //Lessons
                if ((item.Lessons == "NotAllow" || item.Lessons == null) && item.CheckLessons == true )
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Lessons = "Allow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                else if (item.Lessons == "Allow" && item.CheckLessons == true)
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Lessons = "NotAllow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                //Attendant
                if ((item.Attendant == "NotAllow" || item.Attendant == null) && item.CheckAttendant == true )
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Attendant = "Allow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                else if (item.Attendant == "Allow" && item.CheckAttendant == true)
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Attendant = "NotAllow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                //EditStudentTime
                if ((item.EditStudentTime == "NotAllow" || item.EditStudentTime == null) && item.CheckEditStudentTime == true )
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.EditStudentTime = "Allow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                else if (item.EditStudentTime == "Allow" && item.CheckEditStudentTime == true)
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.EditStudentTime = "NotAllow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                //Allowbanned
                if (item.Allowbanned == "Allow" && item.CheckAllowbanned == true)
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Allowbanned = "NotAllow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }
                else if ((item.Allowbanned == "NotAllow" || item.Allowbanned == null) && item.CheckAllowbanned == true)
                {
                    Authentication auth = db.Authentications.Find(item.PeopleID);
                    auth.Allowbanned = "Allow";
                    db.Entry(auth).State = EntityState.Modified;
                    db.SaveChanges();
                }

            }
            var getid = itemlist.FirstOrDefault();
            checkSession(getid.PeopleID);
            return RedirectToAction("IndexPerSonal", "Authentications", new { id = Session["IndexPersonalIdPerson"].ToString() });
        }
        // GET: Authentications/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Authentication authentication = db.Authentications.Find(id);
            if (authentication == null)
            {
                return HttpNotFound();
            }
            return View(authentication);
        }

        // GET: Authentications/Create
        public ActionResult Create()
        {
            ViewBag.PeopleID = new SelectList(db.People, "PeopleID", "Name");
            return View();
        }

        // POST: Authentications/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "PeopleID,EditAuthetication,Comment,CreatePost,EditPost,Class,Room,Topics,Skills,Lessons,Attendant,EditStudentTime,Notes")] Authentication authentication)
        {
            if (ModelState.IsValid)
            {
                db.Authentications.Add(authentication);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PeopleID = new SelectList(db.People, "PeopleID", "Name", authentication.PeopleID);
            return View(authentication);
        }

        // GET: Authentications/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Authentication authentication = db.Authentications.Find(id);
            if (authentication == null)
            {
                return HttpNotFound();
            }
            ViewBag.PeopleID = new SelectList(db.People, "PeopleID", "Name", authentication.PeopleID);
            return View(authentication);
        }

        // POST: Authentications/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "PeopleID,EditAuthetication,Comment,CreatePost,EditPost,Class,Room,Topics,Skills,Lessons,Attendant,EditStudentTime,Notes")] Authentication authentication)
        {
            if (ModelState.IsValid)
            {
                db.Entry(authentication).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PeopleID = new SelectList(db.People, "PeopleID", "Name", authentication.PeopleID);
            return View(authentication);
        }

        // GET: Authentications/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Authentication authentication = db.Authentications.Find(id);
            if (authentication == null)
            {
                return HttpNotFound();
            }
            return View(authentication);
        }

        // POST: Authentications/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            Authentication authentication = db.Authentications.Find(id);
            db.Authentications.Remove(authentication);
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
