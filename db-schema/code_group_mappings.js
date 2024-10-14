const { pgTable, integer, serial } = require("drizzle-orm/pg-core");
const { codes } = require("./codes.js");
const { metadata } = require("./metadata.js");

const code_group_mappings = pgTable("code_group_mappings", {
  id: serial("id").primaryKey(),
  code_id: integer("code_id")
    .references(() => codes.id)
    .notNull(),
  group_id: integer("group_id")
    .references(() => codes.id)
    .notNull(),
  metadata_id: integer("metadata_id").references(() => metadata.id)
});

module.exports = { code_group_mappings };
