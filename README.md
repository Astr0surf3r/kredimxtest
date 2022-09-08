
## WHAT I DID

## ACCORDING THE ASSESSMENT PART II (a3 directory) I CREATED A DEMO RAILS API on HEROKU

link PRODUCTION REST API APP [KREDIMXTEST REST API](https://kredimxtest.herokuapp.com).

ENDPOINTS

- POST https://kredimxtest.herokuapp.com/api/v1/authenticate       LOGIN 
- GET  https://kredimxtest.herokuapp.com/api/v1/invoices           LIST ALL INVOICES 
- GET  https://kredimxtest.herokuapp.com/api/v1/amount-range       AMOUNT RANGE INVOICES
- POST https://kredimxtest.herokuapp.com/api/v1/invoices           CREATE INVOICE
- DEL  https://kredimxtest.herokuapp.com/api/v1/invoices/:id       DELETE INVOICE 
- PUT  https://kredimxtest.herokuapp.com/api/v1/invoices/:id       EDIT INVOICE
- GET  https://kredimxtest.herokuapp.com/api/v1/qrcode-invoice/:id QR CODE INVOICE ENDPOINT
- POST https://kredimxtest.herokuapp.com/api/v1/qrcode-invoice/:id UPLOAD XML INVOICES

### NOTE: original files repo assessment app [kredimx/rails-assessment](https://github.com/kredimx/rails-assessment/tree/seniors/assessments-a3/a3)

## HOW TEST THE ENDPOINTS?

inside the /public directory there are 2 files:

- A. **20220811012132-invoices.zip**
- B. **KREDIMX-TEST.postman_collection.json**

In the REST API APP on HEROKU already exist a user 

email: astr0surf3r@gmail.com
password: monterrey2022

to populate the database you can upload the unzip the invoices file in /public directory or create new ones with the follow command: 

`rake xml:generate_invoice`

to test the endpoint IMPORT in [**POSTMAN**](https://www.postman.com/product/rest-client/) the file named **KREDIMX-TEST.postman_collection.json** inside the `POSTMAN CLIENT`  so you can upload all the invoices 

To check all the invoices imported check the follow endpoint

`https://kredimxtest.herokuapp.com/api/v1/invoices`

### NOTE: with POSTMAN is not necessary the authentication because uses a token authentication by default postman collection as global env variable

# Part II

This is the Rails starter code for take-home assessment.

## Take-home assessment: Invoices management

### * Project setup
- Ruby version: 3.1.0
- PostgreSQL (at least version 9.3 installed)
- Configuration: You can use any container manager such as Docker, or setup directly in your local.

### * User stories
- As an authenticated User, I want to create invoices so that I can add custom invoices.

- As an authenticated User, I want to edit invoices so that I can correct any invoice data.

- As an authenticated User, I want to remove invoices so that I can discard unnecessary invoices.

- As an authenticated User, I want to see the list of all the created/uploaded invoices so that I can found invoices easily.
  + Acceptance criteria:
    - The user should be able to filter invoices by status, emitter, receiver and amount range

- As an authenticated User, I want to see a list of all the invoices I have received from a provider(emitter)
  + Acceptance criteria:
    - The user should be able to filter invoices by issue date (emitted_at)
    - The user should be able to see the total amount of the filtered list

- As an authenticated User, I want to import a set of XML that contain invoices so that I can see the invoice data in the database.
  + Acceptance criteria:
    - The user should be able to upload hundreds of files at a time (extract the ZIP file `public/20220811012132-invoices.zip` to see the XML format and test with that batch of XML files. Feel free to update the XML data)
    - If you need to create more XML files, after extracting the zip run this task `rake xml:generate_invoice` to generate more XML files within that same extracted directory `public/20220811012132-invoices/`
    - Hint: take a look at active_support’s `Hash.from_xml`

- As an authenticated User, I want to have an endpoint that renderizes the image of invoice `cfdi_digital_stamp` as QR so that I can read it faster

### * Observations
- A user is a invoice receiver and is able to upload invoices
- This Rails app was created for only API.

### * Objectives
- A reasonable architecture. No need to tune performance, but use best practices of...
  - software design: design principles (SOLID) and design patterns
  - performance: like paging, avoiding n+1 queries, background processing, etc. where you think it makes sense.
- Testing, it is very important for us to see that you understand how to test Ruby on Rails code.
- Well-organized code and following conventions (`rubocop`)
- The code doesn't need to be perfect, but aim for good readability.

### * Delivery instructions
- Let us know when you have started. Publish your code on `Github` and share it with the initial commit
- Write us any question, or doubt by e-mail message.
- Delivery:
  - If you implemented API only, use Postman, or any other similar
  - Optional: use a client app or use Rails to render server/client side
  - Bonus: put it online. You can use Heroku, or any other similar
- When you have completed, let us know by e-mail.
