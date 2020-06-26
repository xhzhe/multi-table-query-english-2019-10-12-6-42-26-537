use homework;
# 1.Query the existence of 1 course
select * from course where id=1;
# 2.Query the presence of both 1 and 2 courses
select * from course where id=1 or id=2;
# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
select student.id, student.name, AVG(student_course.score)
from student,
     student_course
where student.id = student_course.studentId
group by student.id
having avg(student_course.score) >= 60;
# 4.Query the SQL statement of student information that does not have grades in the student_course table
select student.*
from student
         left join
     student_course on student.id = student_course.studentId
where student.id not in (select distinct student_course.studentId from student_course);
# 5.Query all SQL with grades
select distinct student.*
from student,
     student_course
where student.id in (select distinct student_course.studentId from student_course);
# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
select distinct student.*
from student,
     student_course
where student.id = student_course.studentId
  and student_course.courseId = 1
  and student.id in
      (select distinct student_course.studentId from student_course where student_course.courseId = 2);
# 7.Retrieve 1 student score with less than 60 scores in descending order
select distinct student.*, student_course.score
from student,
     student_course
where student.id = student_course.studentId
  and student_course.courseId = 1
  and student_course.score < 60
order by student_course.score;
# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
select student_course.courseId, course.name, avg(student_course.score)
from student_course,
     course
where student_course.courseId = course.id
group by courseId
order by AVG(student_course.score);
# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
select student.name, student_course.score
from student_course,
     course,
     student
where student_course.courseId = course.id
  and course.name = 'Math'
  and student_course.score < 60
  and student.id = student_course.studentId;