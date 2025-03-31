/* Constants reference:
 HL7_SUD_CODE_ID = 1
 HL7_R_CODE_ID = 4
 
 KETAMINE_CODE_ID = 101
 HALL_CODE_ID = 102
 OPIOID_IV_CODE_ID = 103
 OPIOID_CODE_ID = 104
 HALL_GROUP_ID = 105
 OPIOID_GROUP_ID = 106
 */
INSERT INTO
  codes (id, system_id, code, display, type)
VALUES
  (
    101,
    2,
    '724713006',
    'Harmful use of ketamine (disorder)',
    'code'
  ),
  (
    102,
    3,
    'F16.20',
    'Hallucinogen dependence, uncomplicated',
    'code'
  ),
  (
    103,
    2,
    '145121000119106',
    'Intravenous nondependent opioid abuse (disorder)',
    'code'
  ),
  (
    104,
    3,
    'F11.1',
    'Opioid abuse',
    'code'
  ),
  (
    105,
    1,
    'hallucinogen',
    'hallucinogen substance use',
    'group'
  ),
  (
    106,
    1,
    'opiod',
    'opiod substance use',
    'group'
  ) ON CONFLICT DO NOTHING;

-- Insert data into rules table
INSERT INTO
  rules (id, code_id, group_id)
VALUES
  (101, 101, 105),
  (102, 102, 105),
  (103, 104, 106),
  (104, 103, 106),
  (105, 106, 1),
  (106, 105, 1),
  (107, 1, 4);

INSERT INTO
  code_system_aliases (system_id, alias)
VALUES
  (1, '');

INSERT INTO
  rule_metadata (rule_id, metadata_id)
VALUES
  (107, 1),
  (107, 2);