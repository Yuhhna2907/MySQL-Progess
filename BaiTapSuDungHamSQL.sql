use QuanLySinhVien;

SELECT * FROM subject
WHERE Credit = (SELECT MAX(Credit) FROM subject);

SELECT *
FROM mark
WHERE Mark = (
    SELECT MAX(Mark)
    FROM mark
);

SELECT 
    s.StudentId,
    s.StudentName,
    s.Address,
    s.Phone,
    s.Status,
    s.ClassId,
    AVG(m.Mark) AS AverageMark
FROM Student s
JOIN Mark m ON s.StudentId = m.StudentId
GROUP BY s.StudentId, s.StudentName, s.Address, s.Phone, s.Status, s.ClassId
ORDER BY AverageMark DESC;




