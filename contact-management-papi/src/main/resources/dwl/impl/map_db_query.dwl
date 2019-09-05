%dw 2.0
output application/json
---
{
	database_credentials: {
		"url": p('mssql.idb.url'),
		"driverClass": p('mssql.idb.driver')},
	"query" : "call dbo.personInformation (:FirstName, :LastName, :DOB, :Gender, :Title, :Number, :Street,:Unit,:State,:Zipcode,:PhoneNumbe,:EmailAddress)",
	Parameters: {
	FirstName: payload.Identification.FirstName,
	LastName: payload.Identification.LastName,
	DOB: payload.Identification.DOB,
	Gender: payload.Identification.Gender,
	Title: payload.Identification.Title,
	Number: payload.Address.number[0],
	Street: payload.Address.street[0],
	Unit: payload.Address.Unit[0],
	City: payload.Address.City[0],
	State: payload.Address.State[0],
	Zipcode: payload.Address.zipcode[0],
	PhoneNumber: payload.Communication.value[1],
	Email: payload.Communication.value[0]
}
	
}