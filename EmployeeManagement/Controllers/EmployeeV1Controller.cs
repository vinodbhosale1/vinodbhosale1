using EmployeeManagement.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EmployeeManagement.Controllers
{
    public class EmployeeV1Controller : Controller
    {
        private EmployeeManagementDBContext db = new EmployeeManagementDBContext();

        [HttpGet]
        public ActionResult Home()
        {
            return View();
        }

        [HttpGet]
        [Authorize(Roles = "Super Admin,HR,Employee")]
        public ActionResult PersonalDetails()
        {
            ViewBag.BloodGroup = new List<SelectListItem>() {
                new SelectListItem(){ Text = "Not Applicable", Value="Not Applicable"},
                new SelectListItem(){ Text = "A+", Value="A+"},
                new SelectListItem(){ Text = "A-", Value="A-"},
                new SelectListItem(){ Text = "B+", Value="B+"},
                new SelectListItem(){ Text = "B-", Value="B-"},
                new SelectListItem(){ Text = "AB+", Value="AB+"},
                new SelectListItem(){ Text = "AB-", Value="AB-"},
                new SelectListItem(){ Text = "O+", Value="O+"},
                new SelectListItem(){ Text = "O-", Value="O-"}
            };

            return View();
        }

        [HttpPost]
        [Authorize(Roles = "Super Admin,HR,Employee")]
        public ActionResult PersonalDetails
            ([Bind(Include = "Id,UserId,FullName,Photo, ImageFile, PermanentAddress,CurrentAddress,PAN,Adhaar,UAN,Mobile,AlternateMobile,EmailId,AlternateEmailId,BloodGroup,Gender,DateOfBirth")] Employee employee)
        {
            string userEmail = Session["LoggedInUserEmail"].ToString();
            string userId =
                db.AspNetUsers.FirstOrDefault
                (u => u.Email.Equals(userEmail))?.Id;

            if (ModelState.IsValid)
            {
                string fileName = Path.GetFileNameWithoutExtension(employee.ImageFile.FileName);
                string fileExtension = Path.GetExtension(employee.ImageFile.FileName);

                employee.UserId = userId;

                using (MemoryStream ms = new MemoryStream())
                {
                    employee.ImageFile.InputStream.CopyTo(ms);
                    employee.Photo = ms.GetBuffer();
                }

                db.Employees.Add(employee);
                db.SaveChanges();

                if (User.IsInRole("Super Admin,HR"))
                {
                    return RedirectToAction("EmployeeV1");
                }

                return RedirectToAction("EmployeeV1", "Home");
            }

            return View();
        }

        [HttpGet]
        public ActionResult EducationalDetails()
        {
            string userEmail = Session["LoggedInUserEmail"].ToString();

            string userId =
                db.AspNetUsers.FirstOrDefault
                (u => u.Email.Equals(userEmail))?.Id;

            ViewBag.EducationTypeIdList = new SelectList
                (db.EmployeeEducationTypes, "EducationTypeId", "EducationName");

            return View();
        }

        //[HttpGet]
        //[ChildActionOnly]
        //public PartialViewResult AddEducationView()
        //{
        //    ViewBag.EducationTypeIdList = new SelectList
        //        (db.EmployeeEducationTypes, "EducationTypeId", "EducationName");

        //    return PartialView("_AddEducationView");
        //}

        [HttpPost]
        public ActionResult EducationalDetails(FormCollection employeeEducations)
        {
            string userEmail = Session["LoggedInUserEmail"].ToString();

            string userId =
                db.AspNetUsers.FirstOrDefault
                (u => u.Email.Equals(userEmail))?.Id;

            string[] typeIds = employeeEducations["EducationTypeId"]?.Split(',');
            string[] passoutYears = employeeEducations["PassoutYear"]?.Split(',');
            string[] specializations = employeeEducations["Specialization"]?.Split(',');
            string[] percentages = employeeEducations["Percentage"]?.Split(',');
            string[] collegeNames = employeeEducations["CollegeName"]?.Split(',');

            List<EmployeeEducation> educations =
                new List<EmployeeEducation>();

            for (int i = 0; i < typeIds.Length; i++)
            {
                EmployeeEducation edu = new EmployeeEducation()
                {
                    UserId = userId,
                    EducationTypeId = int.Parse(typeIds[i]),
                    Specialization = specializations[i],
                    PassoutYear = int.Parse(passoutYears[i]),
                    Percentage = decimal.Parse(percentages[i]),
                    CollegeName = collegeNames[i]
                };
                educations.Add(edu);
            }

            ViewBag.EducationTypeIdList = new SelectList
                (db.EmployeeEducationTypes, "EducationTypeId", "EducationName");

            return View();
        }

        [HttpGet]
        public ActionResult BankDetails()
        {
            string userEmail = Session["LoggedInUserEmail"].ToString();

            string userId =
                db.AspNetUsers.FirstOrDefault
                (u => u.Email.Equals(userEmail))?.Id;

            return View();
        }

        [HttpPost]
        public ActionResult BankDetails(FormCollection bankDetails)
        {
            string userEmail = Session["LoggedInUserEmail"].ToString();

            string userId =
                db.AspNetUsers.FirstOrDefault
                (u => u.Email.Equals(userEmail))?.Id;

            string[] bankNames = bankDetails["BankName"]?.Split(',');
            string[] branchNames = bankDetails["BranchName"]?.Split(',');
            string[] accountNumbers = bankDetails["AccountNumber"]?.Split(',');
            string[] iFSCCodes = bankDetails["IFSCCode"]?.Split(',');

            List<EmployeeBankAccount> accounts =
                new List<EmployeeBankAccount>();

            for (int i = 0; i < bankNames.Length; i++)
            {
                EmployeeBankAccount account = new EmployeeBankAccount()
                {
                    UserId = userId,
                    BankName = bankNames[i],
                    BranchName = branchNames[i],
                    AccountNumber = accountNumbers[i],
                    IFSCCode = iFSCCodes[i],
                    CreatedDate = DateTime.Now
                };
                accounts.Add(account);
            }

            return View();
        }

        [HttpGet]
        public ActionResult ExperienceDetails()
        {
            string userEmail = Session["LoggedInUserEmail"].ToString();

            string userId =
                db.AspNetUsers.FirstOrDefault
                (u => u.Email.Equals(userEmail))?.Id;

            ViewBag.AccountIdList = new SelectList
                (db.EmployeeBankAccounts, "AccountId", "BankName");

            return View();
        }

        [HttpPost]
        public ActionResult ExperienceDetails(FormCollection experienceDetails)
        {
            string userEmail = Session["LoggedInUserEmail"].ToString();

            string userId =
                db.AspNetUsers.FirstOrDefault
                (u => u.Email.Equals(userEmail))?.Id;

            string[] companyNames = experienceDetails["CompanyName"]?.Split(',');
            string[] joiningDates = experienceDetails["JoiningDate"]?.Split(',');
            string[] currentCTCs = experienceDetails["CurrentCTC"]?.Split(',');
            string[] relivingDates = experienceDetails["RelivingDate"]?.Split(',');
            string[] isPFOpteds = experienceDetails["IsPFOpted"]?.Split(',');
            string[] accountIds = experienceDetails["AccountId"]?.Split(',');

            List<EmployeeExperiece> experiences =
                new List<EmployeeExperiece>();

            for (int i = 0; i < companyNames.Length; i++)
            {
                EmployeeExperiece account = new EmployeeExperiece()
                {
                    UserId = userId,
                    CompanyName = companyNames[i],
                    JoiningDate = DateTime.Parse(joiningDates[i]),
                    CurrentCTC = decimal.Parse(currentCTCs[i]),
                    RelivingDate = DateTime.Parse(relivingDates[i]),
                    IsPFOpted = bool.Parse(isPFOpteds[i]),
                    AccountId = int.Parse(accountIds[i]),
                    CreatedDate = DateTime.Now
                };
                experiences.Add(account);
            }

            ViewBag.AccountIdList = new SelectList
                (db.EmployeeBankAccounts, "AccountId", "BankName");

            return View();
        }

        [HttpGet]
        public ActionResult ITExperienceDetails()
        {
            string userEmail = Session["LoggedInUserEmail"].ToString();

            string userId =
                db.AspNetUsers.FirstOrDefault
                (u => u.Email.Equals(userEmail))?.Id;

            ViewBag.BatchIdList = new SelectList
                (db.Batches, "BatchId", "BatchName");

            ViewBag.TeamIdList = new SelectList
                (db.Teams, "TeamId", "TeamName");

            return View();
        }

        [HttpPost]
        public ActionResult ITExperienceDetails(EmployeeITExperience iTExperience)
        {
            string userEmail = Session["LoggedInUserEmail"].ToString();

            string userId =
                db.AspNetUsers.FirstOrDefault
                (u => u.Email.Equals(userEmail))?.Id;

            iTExperience.CreatedDate = DateTime.Now;
            db.EmployeeITExperiences.Add(iTExperience);
            db.SaveChanges();

            ViewBag.BatchIdList = new SelectList
                (db.Batches, "BatchId", "BatchName");

            ViewBag.TeamIdList = new SelectList
                (db.Teams, "TeamId", "TeamName");

            return View();
        }

        public PartialViewResult EmployeeIncrementView(string userId)
        {
            string userEmail = Session["LoggedInUserEmail"].ToString();

            ViewBag.UserId =
                db.AspNetUsers.FirstOrDefault
                (u => u.Email.Equals(userEmail))?.Id;

            var increments = db.EmployeeIncrements.Where(i => i.UserId.Equals(userId));
            return PartialView("_CurrentEmployeeIncrementPartial", increments);
        }

        public JsonResult InsertEmployeeIncrement(List<EmployeeIncrement> increments)
        {
            string userEmail = Session["LoggedInUserEmail"].ToString();

            string userId =
                db.AspNetUsers.FirstOrDefault
                (u => u.Email.Equals(userEmail))?.Id;

            if (increments == null)
            {
                increments = new List<EmployeeIncrement>();
            }

            foreach (EmployeeIncrement employeeIncrement in increments)
            {
                employeeIncrement.UserId = userId;
                employeeIncrement.ModifiedDate = DateTime.Now;
                db.EmployeeIncrements.Add(employeeIncrement);
            }
            int insertedRecords = db.SaveChanges();
            return Json(insertedRecords);
        }
    }
}