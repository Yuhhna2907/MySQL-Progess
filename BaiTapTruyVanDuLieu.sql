use QuanLySinhVien;

select *
from student
where studentName like 'h%';

select *
from class
where month(StartDate)= 12;

select *
from subject
where Credit>=3 and Credit <=5;

update student
set classID = 2
where studentName = 'Hung';

select s.studentName, sub.subName, m.Mark
from student s
join mark m on s.studentId = m.StudentId 
join subject sub on m.SubId = sub.SubId
order by m.Mark desc , s.StudentName asc; 




