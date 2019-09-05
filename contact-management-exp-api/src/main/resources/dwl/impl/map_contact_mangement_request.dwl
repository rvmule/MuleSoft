%dw 2.0
output application/json
---
{
	Identification: payload.Identification,
	Address: payload.Address map ( address , indexOfAddress ) -> {
		"type": address."type",
		number: address.number,
		street: address.street,
		Unit: address.Unit,
		City: address.City,
		State: address.State,
		zipcode: address.zipcode
	},
	Communication: payload.Communication map ( communication , indexOfCommunication ) -> {
		"type": communication."type",
		value: communication.value,
		preferred: communication.preferred
	}
}