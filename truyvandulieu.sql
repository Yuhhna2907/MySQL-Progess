use QuanLySinhVien;
select *
from student;

select *
from student
where Status = true;

select *
from subject
where credit < 10;

select s.studentID, s.studentName,c.className
from student S join class C on s.classID = c.classID
where c.className = 'A1';

select s.studentID, s.studentName, sub.SubName,m.mark
from student S join mark M on s.studentID = m.studentID join subject sub on m.subID=sub.subID
where sub.SubName = 'CF';
