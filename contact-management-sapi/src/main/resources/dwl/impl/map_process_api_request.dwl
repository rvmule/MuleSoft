%dw 2.0
output application/java
---
{
  "database_credentials": {
    "url": payload.database_credentials.url,
    "driverClass": payload.database_credentials.driverClass
  },
  "query": payload.query,
  parameters: payload.Parameters
}