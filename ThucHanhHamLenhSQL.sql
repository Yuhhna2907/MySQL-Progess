use QuanLySinhVien;

select address , count(StudentID) as 'Số lượng học viên'
from student
group by address;

select s.studentId, s.studentName, avg(m.mark)
from student s join mark m on s.studentID = m.studentID
group by s.studentID, s.studentName
having avg(m.mark) > 15;

select s.studentId, s.studentName, avg(mark)
from student s join mark m on s.studentID = m.studentID
group by s.studentID, s.studentName
having avg(mark)>= all (select avg(mark) from mark group by mark.studentID)
