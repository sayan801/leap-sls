const Ajv = require("ajv");
const ajv = new Ajv();


const slsRequestSchema = require("../schema/sls-request.schema.json");
const slsRequestValidator = ajv.compile(slsRequestSchema);

const validationException = (errors) => ({
  httpCode: 400,
  error: "bad_request",
  errorMessage: `Invalid request: ${prettifySchemaValidationErrors(errors)}`
});


function validateSlsRequest(req) {
  const body = req.body;
  if (!slsRequestValidator(body)) {
    throw validationException(slsRequestValidator.errors);
  }
}


function prettifySchemaValidationErrors(givenErrors) {
  const errors = givenErrors || [];
  return errors
    .map((error) => `${error.instancePath} ${error.message}`)
    .join("; ");
}

module.exports = {
  validateSlsRequest
};
