%dw 2.0
output application/json
---
{
	database_credentials: {
		"url": p('mssql.idb.url') default null,
		"driverClass": p('mssql.idb.driver') default null
	},
	Identification_query: {
		"query" :
		 "INSERT INTO Customers (FirstName, LastName, DOB, Gender, Title) VALUES" 
		 ++"("++"'"++ payload.Identification.FirstName ++ "',"++ "'"++ payload.Identification.LastName ++ "',"++ "'"++ payload.Identification.DOB ++ "',"++ "'"++ payload.Identification.Gender ++ "',"++ "'"++ payload.Identification.Title ++ "'"++ ");"	
		},
	Address_query: payload.Address map (address,index) -> {
		"query" :
		 "INSERT INTO Customers (number, street, Unit, City, State, zipcode) VALUES" 
		 ++"("++"'"++ address.number ++ "',"++"'"++ address.street ++ "',"++ "'"++ address.Unit ++ "',"++ "'"++ address.City ++ "',"++ "'"++ address.State ++ "',"++ "'" ++ address.zipcode ++ "'"++");"	
		},
	Communication_query: payload.Communication map (communication,index) -> {
		"query" :
		 "INSERT INTO Customers (value, preferred) VALUES" 
		 ++"("++ "'"++ communication.value ++ "',"++ "'" ++ (communication.preferred?) ++ "'"++");"	
		}
}