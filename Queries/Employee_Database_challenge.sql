DROP TABLE Retiring_Titles

Select COUNT(title),title 
INTO Retiring_Titles
from unique_titles
GROUP BY title

ORDER BY count(title) DESC


Select * from Retiring_Titles
