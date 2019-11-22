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
    public class HistoryStudentTimesController : Controller
    {
        private ModelContext1 db = new ModelContext1();

        // GET: HistoryStudentTimes
        public ActionResult Index()
        {
            var historyStudentTimes = db.HistoryStudentTimes.Include(h => h.Person).Include(h => h.Person1);
            return View(historyStudentTimes.ToList());
        }
        public ActionResult MinusAndNote(int id)
        {
            HistoryStudentTime historyStudentTime = db.HistoryStudentTimes.Find(id);
            return PartialView("../HistoryStudentTimes/MinusAndNote", historyStudentTime);
        }
        [HttpPost]
        public ActionResult MinusAndNote(HistoryStudentTime historyStudentTime)
        {
            var x = historyStudentTime.NumberSlot;
            var getslototminus = db.StudentTimes.Where(c => c.ID == historyStudentTime.AddForPerson).FirstOrDefault();
            historyStudentTime.NumberSlot = Convert.ToInt32(getslototminus.Future) - x;
            db.Entry(historyStudentTime).State = EntityState.Modified;
            db.SaveChanges();
            db = new ModelContext1();
            //var getslot = db.HistoryStudentTimes.Where(c => c.HistoryStudentTime1 == historyStudentTime.HistoryStudentTime1).FirstOrDefault();
            StudentTime stt = db.StudentTimes.Find(historyStudentTime.AddForPerson);
            stt.Future = Convert.ToInt32(stt.Future)-x;
            db.Entry(stt).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("IndexPerson", new { id = Session["StudentTimePassIdPerson"].ToString() });

        }
        public ActionResult IndexPerson(string id)
        {
            Session["StudentTimePassIdPerson"] = null;
            Session["StudentTimePassIdPerson"] = id;
            var historyStudentTimes = db.HistoryStudentTimes.Where(c=>c.AddForPerson == id);
            return View(historyStudentTimes.OrderByDescending(c=>c.DateAdd).ToList());
        }
        [HttpPost]
        public ActionResult AddSTime(HistoryStudentTime historyStudentTime, int numberofslot,string Note)
        {
            if (Session["AllowStudentTime"].ToString() == "Allow")
            {
                historyStudentTime.AddForPerson = Session["StudentTimePassIdPerson"].ToString();
                historyStudentTime.DateAdd = DateTime.Now;
                historyStudentTime.NumberSlot = numberofslot;
                historyStudentTime.PersonAdd = Session["PersonID"].ToString();
                historyStudentTime.Note = Note;
                db.HistoryStudentTimes.Add(historyStudentTime);
                db.SaveChangesAsync();
                db = new ModelContext1();
                string x = Session["StudentTimePassIdPerson"].ToString();
                var StudentTime = db.StudentTimes.Where(c => c.StudentID == x).FirstOrDefault();
                StudentTime history = db.StudentTimes.Find(StudentTime.ID);
                history.Future = history.Future +numberofslot;
                db.Entry(history).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("IndexPerson", new { id = Session["StudentTimePassIdPerson"].ToString() });
            }else
            {
                TempData["StudentTimeInform"] = "<script>alert('You have no permit to add Student Times');</script>";
                return RedirectToAction("IndexPerson", new { id = Session["StudentTimePassIdPerson"].ToString() });
            }
        }
        public ActionResult DeleteConfirmed(int id)
        {
            HistoryStudentTime historyStudentTime = db.HistoryStudentTimes.Find(id);
            db.HistoryStudentTimes.Remove(historyStudentTime);
            db.SaveChanges();
            return RedirectToAction("IndexPerson", new { id = Session["StudentTimePassIdPerson"].ToString() });
        }
        // GET: HistoryStudentTimes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HistoryStudentTime historyStudentTime = db.HistoryStudentTimes.Find(id);
            if (historyStudentTime == null)
            {
                return HttpNotFound();
            }
            return View(historyStudentTime);
        }
        
        
        // GET: HistoryStudentTimes/Create
        public ActionResult Create()
        {
            ViewBag.PersonAdd = new SelectList(db.People, "PeopleID", "Name");
            ViewBag.AddForPerson = new SelectList(db.People, "PeopleID", "Name");
            return View();
        }

        // POST: HistoryStudentTimes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(HistoryStudentTime historyStudentTime)
        {
            if (ModelState.IsValid)
            {
                db.HistoryStudentTimes.Add(historyStudentTime);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PersonAdd = new SelectList(db.People, "PeopleID", "Name", historyStudentTime.PersonAdd);
            ViewBag.AddForPerson = new SelectList(db.People, "PeopleID", "Name", historyStudentTime.AddForPerson);
            return View(historyStudentTime);
        }

        // GET: HistoryStudentTimes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HistoryStudentTime historyStudentTime = db.HistoryStudentTimes.Find(id);
            if (historyStudentTime == null)
            {
                return HttpNotFound();
            }
            ViewBag.PersonAdd = new SelectList(db.People, "PeopleID", "Name", historyStudentTime.PersonAdd);
            ViewBag.AddForPerson = new SelectList(db.People, "PeopleID", "Name", historyStudentTime.AddForPerson);
            return View(historyStudentTime);
        }

        // POST: HistoryStudentTimes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "HistoryStudentTime1,AddForPerson,DateAdd,NumberSlot,PersonAdd")] HistoryStudentTime historyStudentTime)
        {
            if (ModelState.IsValid)
            {
                db.Entry(historyStudentTime).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PersonAdd = new SelectList(db.People, "PeopleID", "Name", historyStudentTime.PersonAdd);
            ViewBag.AddForPerson = new SelectList(db.People, "PeopleID", "Name", historyStudentTime.AddForPerson);
            return View(historyStudentTime);
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
