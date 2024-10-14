const { pgTable, varchar, serial, text } = require("drizzle-orm/pg-core");

const metadata = pgTable("metadata", {
  id: serial("id").primaryKey(),
  type: varchar("type", { length: 255 }).notNull(),
  uri: text("uri"),
  system: varchar("system", { length: 255 }),
  code: varchar("code", { length: 255 }),
  display: text("display")
});

module.exports = { metadata };
