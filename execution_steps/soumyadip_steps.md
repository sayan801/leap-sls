# Project Workflow

### Client Request
- A client (like Postman) sends an HTTP request to server.

### Express Server
- The server is created
- It listens to port 3000

### Middleware
- Incoming requests pass through middleware

### Routes
 Matching request path with the routes
 - GET /ping
 - POST /fhir/sls/label
 - POST /fhir/sls/transaction

### Controller
- It handles the incoming request

### Validator
- Checks for the structure of the request body

### Labeler Logic
- Reads data and apply rules for labelling
- Then prepares the response

### Response
- Server sends the response back to the server

## DATABASE
- The PostgreSQL database is managed using Drizzle ORM.
- The database is connected via db.js.