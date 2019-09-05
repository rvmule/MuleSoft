Mulesoft:
1. Contact Management API is developed based on API-Led Connectivity approach and Mule 4 version.

Database:
1. Created Table
2. Created Stored Procedure which insert data if record doesnt match. If record matches update operation is called.
3. Run scripts to perform creation and execution of the table.

Front-end:
1. Created Form fields to insert data and JavaScript to make service call.
2. Change IP address at @127 line to point to mulesoft Experience API.
3. Run FE code in https://www.w3schools.com/js/tryit.asp?filename=tryjs_myfirst to view the form.

Mule Code Overview:
1. RAML 1.0 is used to build API interface.
2. API are created in layers based on API-Led Connectivity for purpose of component reuseability.
3. Experience API to map the request.
4. Process API to build database query and credentials which are posted to system API dynamically.
5. System API uses the database creds and query dynamically from process API request.
6. Error Handler is used to map any error occurence in the mule flows.
7. Correlation Id is used in header to track the thread across API's.

Running the tests:

Mule Experience API End point:
1. URL# http://localhost:8081/api/exp/contact
2. Headers(optional): 'CID': '12345'
3. Method: POST
4. Content-type: application/json
Body:
{

	"Identification": {

		"FirstName": "Bob",

		"LastName": "Frederick",

		"DOB": "06/21/1980",

		"Gender": "M",

		"Title": "Manager"

	},

	"Address": [{

		"type ": "home",

		"number": 1234,

		"street": "blah blah St",

		"Unit": "1 a",

		"City": "Somewhere",

		"State": "WV",

		"zipcode": "12345"

	}],

	"Communication": [{

			"type": "email",

			"value": "bfe@sample.com",

	  		"preferred" : "true"

		},

		{

			"type": "cell",

			"value": "304-555-8282"

		}

	]

}
Mule Process API End point:
1. URL# http://localhost:8082/api/process/contact
2. Headers(optional): 'CID': '12345'
3. Method: POST
4. Content-type: application/json
5. Body:
{
  "database_credentials": {
    "url": "jdbc:sqlserver://;user=;password=",
    "driverClass": "com.microsoft.sqlserver.jdbc.SQLServerDriver"
  },
  "query": "call dbo.personInformation (:FirstName, :LastName, :DOB, :Gender, :Title, :Number, :Street,:Unit,:State,:Zipcode,:PhoneNumbe,:EmailAddress)",
  "Parameters": {
    "FirstName": "Bob",
    "LastName": "Frederick",
    "DOB": "06/21/1980",
    "Gender": "M",
    "Title": "Manager",
    "Number": 1234,
    "Street": "blah blah St",
    "Unit": "1 a",
    "City": "Somewhere",
    "State": "123",
    "Zipcode": "12345",
    "PhoneNumber": "304-555-8282",
    "Email": "bfe@sample.com"
  }
}

Mule System API End point:
1. URL# http://localhost:8083/api/system/contact
2. Headers(optional): 'CID': '12345'
3. Method: POST
4. Content-type: application/json

Note:
1. For developement all endpoints are configured to localhost including database.
2. To make a connection to Database please run the Database Scripts and point to desired to environment changing credentials in System API default.properties file.
3. Front end is configured with Form fields and to point to mulesoft change the IP address @127 line in the script.



