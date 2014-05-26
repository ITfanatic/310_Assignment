--this works, just need to implement it and modify the front and back end to accomodate the change
SELECT 
	sv.GrantType as [Type of Grants], 
	COUNT(sv.GrantType) as [Amount of Grants for Specified Age], 
	SUM(sv.GrantValue) as [Total Cost]
FROM
    Student_vouchers sv
INNER JOIN 
    Student_Registration_Form s
ON 
    s.Student_ID=sv.student_ID 
WHERE --The dob converted to age is equal to the age supplied
	CONVERT(int,ROUND(DATEDIFF(hour,s.DOB,GETDATE())/8766.0,0)) = 46
GROUP BY 
    GrantType