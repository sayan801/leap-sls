const { db, pool } = require("./db");
const { codes, metadata, code_group_mappings } = require("../../db-schema");

const seedData = async () => {
  try {
    // Start a transaction
    await db.transaction(async (tx) => {
      // Insert data into codes table
      await tx.insert(codes).values([
        {
          system: "http://snomed.info/sct",
          code: "724713006",
          display: "Harmful use of ketamine (disorder)",
          type: "code"
        },
        {
          system: "http://hl7.org/fhir/sid/icd-10",
          code: "F19.1",
          display: "Other psychoactive substance abuse",
          type: "code"
        },
        {
          system: "http://snomed.info/sct",
          code: "145121000119106",
          display: "Intravenous nondependent opioid abuse (disorder)",
          type: "code"
        },
        {
          system: "http://hl7.org/fhir/sid/icd-10",
          code: "F11.1",
          display: "Opioid abuse",
          type: "code"
        },
        {
          system: "group",
          code: "ketamine",
          display: "ketamine substance use",
          type: "group"
        },
        {
          system: "group",
          code: "opiod",
          display: "opiod substance use",
          type: "group"
        },
        {
          system: "http://terminology.hl7.org/CodeSystem/v3-ActCode",
          code: "SUD",
          display: "substance use disorder information sensitivity",
          type: "sensitivity"
        },
        {
          system: "http://terminology.hl7.org/CodeSystem/v3-Confidentiality",
          code: "R",
          display: "restricted",
          type: "confidentiality"
        }
      ]);

      // Insert data into metadata table
      await tx.insert(metadata).values([
        {
          type: "why",
          uri: null,
          system: "http://terminology.hl7.org/CodeSystem/v3-ActCode",
          code: "42CFRPart2",
          display: "42 CFR Part2"
        },
        {
          type: "who",
          uri: null,
          system: null,
          code: null,
          display: "XYZ Security Labeling Service v1.0.2"
        }
      ]);

      // Insert data into code_group_mappings table
      await tx.insert(code_group_mappings).values([
        { code_id: 5, group_id: 7, metadata_id: 1 },
        { code_id: 6, group_id: 7, metadata_id: 1 },
        { code_id: 7, group_id: 8, metadata_id: 1 },
        { code_id: 1, group_id: 5, metadata_id: null },
        { code_id: 2, group_id: 5, metadata_id: null },
        { code_id: 3, group_id: 6, metadata_id: null },
        { code_id: 4, group_id: 6, metadata_id: null }
      ]);
    });

    console.log("Database seeded successfully!");
  } catch (error) {
    console.error("Error seeding database:", error);
  } finally {
    // Close the pool connection
    await pool.end();
  }
};

// Execute the seed function
seedData();
