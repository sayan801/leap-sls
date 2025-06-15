-- Custom SQL migration file, put your code below! --
/* 
 ORGANIZATION SCHEME:
 1-9:       Confidentiality codes
 10-99:     Sensitivity codes
 1000-9999: Group codes
 ≥10000:    Individual codes (group ID × 10 + sequence)
 */
-- CONFIDENTIALITY CODES (1-9)
INSERT INTO
  codes (id, system_id, code, display, type)
VALUES
  (1, 6, 'R', 'Restricted', 'confidentiality'),
  (2, 6, 'V', 'Very restricted', 'confidentiality'),
  (3, 6, 'N', 'Normal', 'confidentiality') ON CONFLICT DO NOTHING;

-- SENSITIVITY CODES (10-99)
INSERT INTO
  codes (id, system_id, code, display, type)
VALUES
  -- Core sensitivity categories
  (
    10,
    5,
    'SUD',
    'Substance use disorder information sensitivity',
    'sensitivity'
  ),
  (
    11,
    5,
    'SEX',
    'Sexuality and reproductive health information sensitivity',
    'sensitivity'
  ),
  (
    12,
    5,
    'BH',
    'Behavioral health information sensitivity',
    'sensitivity'
  ),
  (
    13,
    5,
    'HIV',
    'HIV/AIDS information sensitivity',
    'sensitivity'
  ),
  (
    14,
    5,
    'SDV',
    'Sexual assault, abuse, or domestic violence information sensitivity',
    'sensitivity'
  ),
  -- Refined substance use categories
  (
    20,
    5,
    'OPIOIDUD',
    'Opioid use disorder information sensitivity',
    'sensitivity'
  ),
  (
    21,
    5,
    'ETH',
    'Substance abuse treatment information sensitivity',
    'sensitivity'
  ),
  -- Refined behavioral health categories
  (
    30,
    5,
    'PSY',
    'Psychiatry information sensitivity',
    'sensitivity'
  ),
  (
    31,
    5,
    'PSYTHPN',
    'Psychotherapy note information sensitivity',
    'sensitivity'
  ),
  (
    32,
    5,
    'BHDS',
    'Behavioral and developmental disability information sensitivity',
    'sensitivity'
  ) ON CONFLICT DO NOTHING;

-- GROUP CODES (1000-9999)
INSERT INTO
  codes (id, system_id, code, display, type)
VALUES
  -- Provider/role groups (1000-1999)
  (
    1100,
    1,
    'addiction_provider',
    'Addiction medicine providers',
    'group'
  ),
  (
    1200,
    1,
    'psych_provider',
    'Psychiatric providers',
    'group'
  ),
  (
    1300,
    1,
    'bh_provider',
    'Behavioral health providers',
    'group'
  ),
  (
    1400,
    1,
    'team_provider',
    'Team-based providers',
    'group'
  ),
  -- Condition/diagnosis groups (2000-2999)
  (
    2100,
    1,
    'opioid_condition',
    'Opioid-related conditions',
    'group'
  ),
  (
    2200,
    1,
    'hallucinogen_condition',
    'Hallucinogen-related conditions',
    'group'
  ),
  (
    2300,
    1,
    'depressive_condition',
    'Depressive disorders',
    'group'
  ),
  (
    2400,
    1,
    'anxiety_condition',
    'Anxiety and obsessive disorders',
    'group'
  ),
  -- Medication groups (3000-3999)
  (
    3100,
    1,
    'opioid_medication',
    'Opioid-related medications',
    'group'
  ),
  (
    3200,
    1,
    'bh_medication',
    'Behavioral health medications',
    'group'
  ),
  -- Assessment/instrument groups (4000-4999)
  (
    4100,
    1,
    'bh_assessment',
    'Behavioral health assessments',
    'group'
  ),
  (
    4200,
    1,
    'depression_assessment',
    'Depression screening instruments',
    'group'
  ) ON CONFLICT DO NOTHING;

-- INDIVIDUAL CODES (≥10000)
-- Format: Group ID × 10 + sequence (e.g., codes for group 1100 are 11001-11009)
-- Provider/role codes (11000-14999)
INSERT INTO
  codes (id, system_id, code, display, type)
VALUES
  -- Addiction providers (11000-11999)
  (
    11001,
    2,
    '309354004',
    'Addiction medicine specialist',
    'code'
  ),
  -- Psychiatric providers (12000-12999)
  (
    12001,
    2,
    '309343006',
    'Psychiatrist (occupation)',
    'code'
  ),
  -- Behavioral health providers (13000-13999)
  (
    13001,
    2,
    '66288003',
    'Psychotherapist (occupation)',
    'code'
  ),
  (
    13002,
    2,
    '310026003',
    'Mental health counselor',
    'code'
  ),
  -- Team providers (14000-14999)
  (
    14001,
    7,
    'LA27976-2',
    'Interdisciplinary team',
    'code'
  ),
  (
    14002,
    2,
    '386661006',
    'Multidisciplinary care',
    'code'
  ) ON CONFLICT DO NOTHING;

-- Condition/diagnosis codes (21000-24999)
INSERT INTO
  codes (id, system_id, code, display, type)
VALUES
  -- Opioid conditions (21000-21999)
  (
    21001,
    3,
    'F11.11',
    'Opioid abuse, in remission',
    'code'
  ),
  (21002, 2, '5602001', 'Opioid abuse', 'code'),
  (
    21003,
    2,
    '145121000119106',
    'Intravenous nondependent opioid abuse (disorder)',
    'code'
  ),
  (21004, 3, 'F11.1', 'Opioid abuse', 'code'),
  -- Hallucinogen conditions (22000-22999)
  (
    22001,
    2,
    '724713006',
    'Harmful use of ketamine (disorder)',
    'code'
  ),
  (
    22002,
    3,
    'F16.20',
    'Hallucinogen dependence, uncomplicated',
    'code'
  ),
  -- Depressive conditions (23000-23999)
  (
    23001,
    3,
    'F33.1',
    'Major depressive disorder, recurrent, moderate',
    'code'
  ),
  (
    23002,
    2,
    '310496002',
    'Major depressive disorder, recurrent, moderate',
    'code'
  ),
  -- Anxiety conditions (24000-24999)
  (
    24001,
    3,
    'F60.5',
    'Obsessive-compulsive personality disorder',
    'code'
  ),
  (
    24002,
    2,
    '1376001',
    'Obsessive-compulsive personality disorder',
    'code'
  ) ON CONFLICT DO NOTHING;

-- Medication codes (31000-32999)
INSERT INTO
  codes (id, system_id, code, display, type)
VALUES
  -- Opioid medications (31000-31999)
  (
    31001,
    2,
    '425741009',
    'Buprenorphine/naloxone',
    'code'
  ),
  (
    31002,
    4,
    '352364',
    'Buprenorphine 8 MG / Naloxone 2 MG Sublingual Tablet',
    'code'
  ),
  (
    31003,
    2,
    '373265006',
    'Buprenorphine (substance)',
    'code'
  ),
  -- Behavioral health medications (32000-32999)
  (
    32001,
    4,
    '315952',
    'Fluoxetine 20 MG Oral Capsule',
    'code'
  ),
  (
    32002,
    2,
    '372767007',
    'Fluoxetine (substance)',
    'code'
  ) ON CONFLICT DO NOTHING;

-- Assessment/instrument codes (41000-42999)
INSERT INTO
  codes (id, system_id, code, display, type)
VALUES
  -- Behavioral health assessments (41000-41999)
  (
    41001,
    2,
    '444175001',
    'Cognitive behavioral therapy record',
    'code'
  ),
  (
    41002,
    8,
    '96127',
    'Brief emotional/behavioral assessment',
    'code'
  ),
  -- Depression assessments (42000-42999)
  (
    42001,
    2,
    '720433000',
    'PHQ-9 depression screening instrument',
    'code'
  ),
  (
    42002,
    7,
    '44249-1',
    'PHQ-9 quick depression assessment panel',
    'code'
  ),
  (
    42003,
    7,
    '89204-2',
    'Patient Health Questionnaire-9: Depression',
    'code'
  ) ON CONFLICT DO NOTHING;

-- RULES MAPPINGS
-- 1. MAP CODES TO THEIR GROUPS
INSERT INTO
  rules (id, code_id, group_id)
VALUES
  -- Provider/role mappings
  -- Addiction medicine specialist → Addiction providers
  (1001, 11001, 1100),
  -- Psychiatrist → Psychiatric providers
  (1002, 12001, 1200),
  -- Psychotherapist → BH providers
  (1003, 13001, 1300),
  -- Mental health counselor → BH providers
  (1004, 13002, 1300),
  -- Interdisciplinary team → Team providers
  (1005, 14001, 1400),
  -- Multidisciplinary care → Team providers
  (1006, 14002, 1400),
  -- Condition/diagnosis mappings
  -- Opioid abuse, in remission → Opioid conditions
  (2001, 21001, 2100),
  -- Opioid abuse → Opioid conditions
  (2002, 21002, 2100),
  -- IV opioid abuse → Opioid conditions
  (2003, 21003, 2100),
  -- Opioid abuse (ICD) → Opioid conditions
  (2004, 21004, 2100),
  -- Ketamine use → Hallucinogen conditions
  (2005, 22001, 2200),
  -- Hallucinogen dependence → Hallucinogen conditions
  (2006, 22002, 2200),
  -- Major depression (ICD) → Depressive conditions
  (2007, 23001, 2300),
  -- Major depression (SNOMED) → Depressive conditions
  (2008, 23002, 2300),
  -- OCD (ICD) → Anxiety conditions
  (2009, 24001, 2400),
  -- OCD (SNOMED) → Anxiety conditions
  (2010, 24002, 2400),
  -- Medication mappings
  -- Buprenorphine/naloxone → Opioid medications
  (3001, 31001, 3100),
  -- Buprenorphine/Naloxone Tablet → Opioid medications
  (3002, 31002, 3100),
  -- Buprenorphine substance → Opioid medications
  (3003, 31003, 3100),
  -- Fluoxetine → BH medications
  (3004, 32001, 3200),
  -- Fluoxetine substance → BH medications
  (3005, 32002, 3200),
  -- Assessment/instrument mappings
  -- CBT record → BH assessments
  (4001, 41001, 4100),
  -- Brief assessment → BH assessments
  (4002, 41002, 4100),
  -- PHQ-9 instrument → Depression assessments
  (4003, 42001, 4200),
  -- PHQ-9 panel → Depression assessments
  (4004, 42002, 4200),
  -- PHQ-9 questionnaire → Depression assessments
  (4005, 42003, 4200);

-- 2. MAP GROUPS TO HL7 SENSITIVITY CATEGORIES
INSERT INTO
  rules (id, code_id, group_id)
VALUES
  -- SUD sensitivity (ID=10) mappings 
  -- Addiction providers → SUD sensitivity
  (5001, 1100, 10),
  -- Opioid conditions → SUD sensitivity  
  (5002, 2100, 10),
  -- Hallucinogen conditions → SUD sensitivity
  (5003, 2200, 10),
  -- Opioid medications → SUD sensitivity
  (5004, 3100, 10),
  -- OPIOIDUD specific mappings
  -- Opioid conditions → OPIOIDUD sensitivity
  (5101, 2100, 20),
  -- Opioid medications → OPIOIDUD sensitivity
  (5102, 3100, 20),
  -- ETH (substance abuse treatment) mappings
  -- Addiction providers → ETH sensitivity
  (5201, 1100, 21),
  -- BH sensitivity (ID=12) mappings
  -- Psychiatric providers → BH sensitivity
  (5301, 1200, 12),
  -- BH providers → BH sensitivity
  (5302, 1300, 12),
  -- Team providers → BH sensitivity
  (5303, 1400, 12),
  -- Depressive conditions → BH sensitivity
  (5304, 2300, 12),
  -- Anxiety conditions → BH sensitivity  
  (5305, 2400, 12),
  -- BH medications → BH sensitivity
  (5306, 3200, 12),
  -- BH assessments → BH sensitivity
  (5307, 4100, 12),
  -- Depression assessments → BH sensitivity
  (5308, 4200, 12),
  -- PSY (psychiatry) specific mappings
  -- Psychiatric providers → PSY sensitivity
  (5401, 1200, 30),
  -- BH providers → PSY sensitivity
  (5402, 1300, 30),
  -- Depressive conditions → PSY sensitivity
  (5403, 2300, 30),
  -- Anxiety conditions → PSY sensitivity
  (5404, 2400, 30),
  -- PSYTHPN (psychotherapy notes) mappings
  -- CBT record → PSYTHPN sensitivity
  (5501, 41001, 31);

-- 3. MAP SENSITIVITY TO CONFIDENTIALITY LEVEL
INSERT INTO
  rules (id, code_id, group_id)
VALUES
  -- SUD → Restricted
  (6001, 10, 1),
  -- SEX → Restricted  
  (6002, 11, 1),
  -- BH → Restricted
  (6003, 12, 1),
  -- HIV → Restricted
  (6004, 13, 1),
  -- SDV → Restricted
  (6005, 14, 1),
  -- OPIOIDUD → Restricted
  (6006, 20, 1),
  -- ETH → Restricted
  (6007, 21, 1),
  -- PSY → Restricted
  (6008, 30, 1),
  -- PSYTHPN → restricted
  (6009, 31, 1),
  -- BHDS → Restricted
  (6010, 32, 1);

-- Add empty system alias for LOCAL
INSERT INTO
  code_system_aliases (system_id, alias)
VALUES
  (1, 'local_code_group') ON CONFLICT DO NOTHING;

-- RULE METADATA
INSERT INTO
  rule_metadata (rule_id, metadata_id)
VALUES
  -- SUD → 42CFRPart2
  (6001, 1),
  -- OPIOIDUD → 42CFRPart2
  (6006, 1),
  -- ETH → 42CFRPart2
  (6007, 1),
  -- SUD → LEAP+ Security Labeling Service
  (6001, 2),
  -- SEX → LEAP+ Security Labeling Service
  (6002, 2),
  -- BH → LEAP+ Security Labeling Service
  (6003, 2),
  -- HIV → LEAP+ Security Labeling Service
  (6004, 2),
  -- SDV → LEAP+ Security Labeling Service
  (6005, 2),
  -- OPIOIDUD → LEAP+ Security Labeling Service
  (6006, 2),
  -- ETH → LEAP+ Security Labeling Service
  (6007, 2),
  -- PSY → LEAP+ Security Labeling Service
  (6008, 2),
  -- BHDS → LEAP+ Security Labeling Service
  (6009, 2),
  -- PSYTHPN → LEAP+ Security Labeling Service
  (6010, 2);