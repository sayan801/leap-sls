const dotenv = require("dotenv");
dotenv.config();

const { app } = require("./app");

const logger = require("./lib/logger");

const port = parseInt(process.env.PORT || "3001");
app.listen(port, () => logger.info(`Listening on port ${port}!`));
