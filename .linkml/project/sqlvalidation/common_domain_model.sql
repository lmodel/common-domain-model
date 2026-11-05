-- ====================================================================
-- SQL Validation Queries
-- Generated from LinkML schema
-- LinkML v1.11.0
-- Generator: sqlvalidationgen.py v0.1.0
-- Dialect: sqlite
-- ====================================================================

SELECT 'AdjustedRelativeDateOffset' AS table_name, 'businessDayConvention' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AdjustedRelativeDateOffset" 
WHERE "AdjustedRelativeDateOffset"."businessDayConvention" IS NULL

UNION ALL

SELECT 'AdjustedRelativeDateOffset' AS table_name, 'businessDayConvention' AS column_name, 'enum' AS constraint_type, id AS record_id, "businessDayConvention" AS invalid_value 
FROM "AdjustedRelativeDateOffset" 
WHERE "AdjustedRelativeDateOffset"."businessDayConvention" IS NOT NULL AND ("AdjustedRelativeDateOffset"."businessDayConvention" NOT IN ('FOLLOWING', 'FRN', 'MODFOLLOWING', 'PRECEDING', 'MODPRECEDING', 'NEAREST', 'NONE', 'NotApplicable'))

UNION ALL

SELECT 'AdjustedRelativeDateOffset' AS table_name, 'dayType' AS column_name, 'enum' AS constraint_type, id AS record_id, "dayType" AS invalid_value 
FROM "AdjustedRelativeDateOffset" 
WHERE "AdjustedRelativeDateOffset"."dayType" IS NOT NULL AND ("AdjustedRelativeDateOffset"."dayType" NOT IN ('Business', 'Calendar', 'CurrencyBusiness', 'ExchangeBusiness', 'ScheduledTradingDay'))

UNION ALL

SELECT 'AdjustedRelativeDateOffset' AS table_name, 'periodMultiplier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AdjustedRelativeDateOffset" 
WHERE "AdjustedRelativeDateOffset"."periodMultiplier" IS NULL

UNION ALL

SELECT 'AdjustedRelativeDateOffset' AS table_name, 'period' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AdjustedRelativeDateOffset" 
WHERE "AdjustedRelativeDateOffset".period IS NULL

UNION ALL

SELECT 'AdjustedRelativeDateOffset' AS table_name, 'period' AS column_name, 'enum' AS constraint_type, id AS record_id, period AS invalid_value 
FROM "AdjustedRelativeDateOffset" 
WHERE "AdjustedRelativeDateOffset".period IS NOT NULL AND ("AdjustedRelativeDateOffset".period NOT IN ('D', 'W', 'M', 'Y'))

UNION ALL

SELECT 'BusinessCenters' AS table_name, 'commodityBusinessCalendar' AS column_name, 'enum' AS constraint_type, id AS record_id, "commodityBusinessCalendar" AS invalid_value 
FROM "BusinessCenters" 
WHERE "BusinessCenters"."commodityBusinessCalendar" IS NOT NULL AND ("BusinessCenters"."commodityBusinessCalendar" NOT IN ('ADSM', 'AGRUS_FMB', 'APPI', 'ARGUS_CRUDE', 'ARGUS_EUROPEAN_GAS', 'ARGUS_EUROPEAN_PRODUCTS', 'ARGUS_INTERNATIONAL_LPG', 'ARGUS_MCCLOSKEYS_COAL_REPORT', 'ARGUS_US_PRODUCTS', 'ASX', 'AWB', 'AWEX', 'BALTIC_EXCHANGE', 'BANK_NEGARA_MALAYSIA_POLICY_COMMITTEE', 'BELPEX', 'BLUENEXT', 'BM_F', 'BURSA_MALAYSIA_SETTLEMENT', 'BURSA_MALAYSIA_TRADING', 'CANADIAN_GAS_PRICE_REPORTER', 'CBOT_SOFT', 'CMAI_AROMATICS_MARKET_REPORT', 'CMAI_GLOBAL_PLASTICS_AND_POLYMERS_MARKET_REPORT', 'CMAI_METHANOL_MARKET_REPORT', 'CMAI_MONOMERS_MARKET_REPORT', 'CME_DAIRY', 'CME_NON_DAIRY_SOFT', 'COMEX', 'CRU', 'CRU_LONG', 'DEPARTMENT_OF_ENERGY', 'DEWITT_BENZENE_DERIVATIVES', 'DME', 'DOW_JONES', 'DOW_JONES_ENERGY_SERVICE', 'DowJonesPower', 'EEX_COAL', 'EEX_EMISSIONS', 'EEX_GAS', 'EEX_POWER', 'EURONEX_MATIF', 'FERTECON', 'FERTILIZER_WEEK', 'GAS_DAILY', 'GAS_DAILY_PRICE_GUIDE', 'GLOBALCOAL', 'HEREN_REPORT', 'ICE_10X_DAILY', 'ICE_10X_MONTHLY', 'ICE_CANADA', 'ICE_ECX', 'ICE_GAS', 'ICE_OIL', 'ICE_US_AGRICULTURAL', 'ICIS_PRICING_BENZENE__EUROPE_', 'ICIS_PRICING_ETHYLENE__EUROPE_', 'ICIS_PRICING_POLYPROPYLENE__EUROPE_', 'INSIDE_FERC', 'JAPAN_MOF_TSRR', 'KCBOT', 'KUALA_LUMPUR_BANK', 'LABUAN_BANK', 'LIFFE_LONDON_SOFT', 'LME', 'LONDON_BULLION_MARKET', 'LONDON_BULLION_MARKET_GOLD_A_M_ONLY', 'LONDON_PLATINUM_PALLADIUM_MARKET', 'MGEX', 'N2EX', 'NASDAQ_OMX', 'NATURAL_GAS_WEEK', 'NERC', 'NGI', 'NGX', 'NUCLEAR_MARKET_REVIEW', 'NYMEX_ELECTRICITY', 'NYMEX_GAS', 'NYMEX_NATURAL_GAS', 'NYMEX_OIL', 'OFFICIAL_BOARD_MARKETS', 'OPIS_LP_GAS', 'OPIS_PROPANE', 'PAPER_PACKAGING_MONITOR', 'PAPER_TRADER', 'PERTAMINA', 'PETROCHEMWIRE', 'PIX_PULP_BENCHMARK_INDICES', 'PLATTS_APAG_MARKETSCAN', 'PLATTS_BUNKERWIRE', 'PLATTS_CLEAN_TANKERWIRE', 'PLATTS_CRUDE_OIL_MARKETWIRE', 'PLATTS_DIRTY_TANKERWIRE', 'PLATTS_EUROPEAN_GAS', 'PLATTS_EUROPEAN_MARKETSCAN', 'PLATTS_METALS_ALERT', 'PLATTS_OILGRAM', 'PLATTS_TSI_IRON_ORE', 'PLATTS_TSI_SCRAP', 'PLATTS_TSI_STEEL', 'PLATTS_US_MARKETSCAN', 'PULP_AND_PAPER_INTERNATIONAL', 'PULP_AND_PAPER_WEEK', 'RIM_PRODUCTS_INTELLIGENCE_DAILY', 'SAFEX_SOFT', 'SFE_SOFT', 'SGX', 'SICOM', 'SP_GSCI', 'STATISTICHES_BUNDESAMT', 'TGE', 'TOCOM_OIL', 'TOCOM_PRECIOUS', 'TOCOM_SOFT', 'UX_WEEKLY', 'WORLD_PULP_MONTHLY'))

UNION ALL

SELECT 'BusinessCenterTime' AS table_name, 'hourMinuteTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BusinessCenterTime" 
WHERE "BusinessCenterTime"."hourMinuteTime" IS NULL

UNION ALL

SELECT 'BusinessCenterTime' AS table_name, 'businessCenter' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BusinessCenterTime" 
WHERE "BusinessCenterTime"."businessCenter" IS NULL

UNION ALL

SELECT 'BusinessDateRange' AS table_name, 'businessDayConvention' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BusinessDateRange" 
WHERE "BusinessDateRange"."businessDayConvention" IS NULL

UNION ALL

SELECT 'BusinessDateRange' AS table_name, 'businessDayConvention' AS column_name, 'enum' AS constraint_type, id AS record_id, "businessDayConvention" AS invalid_value 
FROM "BusinessDateRange" 
WHERE "BusinessDateRange"."businessDayConvention" IS NOT NULL AND ("BusinessDateRange"."businessDayConvention" NOT IN ('FOLLOWING', 'FRN', 'MODFOLLOWING', 'PRECEDING', 'MODPRECEDING', 'NEAREST', 'NONE', 'NotApplicable'))

UNION ALL

SELECT 'BusinessDateRange' AS table_name, 'startDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BusinessDateRange" 
WHERE "BusinessDateRange"."startDate" IS NULL

UNION ALL

SELECT 'BusinessDateRange' AS table_name, 'endDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BusinessDateRange" 
WHERE "BusinessDateRange"."endDate" IS NULL

UNION ALL

SELECT 'BusinessDayAdjustments' AS table_name, 'businessDayConvention' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BusinessDayAdjustments" 
WHERE "BusinessDayAdjustments"."businessDayConvention" IS NULL

UNION ALL

SELECT 'BusinessDayAdjustments' AS table_name, 'businessDayConvention' AS column_name, 'enum' AS constraint_type, id AS record_id, "businessDayConvention" AS invalid_value 
FROM "BusinessDayAdjustments" 
WHERE "BusinessDayAdjustments"."businessDayConvention" IS NOT NULL AND ("BusinessDayAdjustments"."businessDayConvention" NOT IN ('FOLLOWING', 'FRN', 'MODFOLLOWING', 'PRECEDING', 'MODPRECEDING', 'NEAREST', 'NONE', 'NotApplicable'))

UNION ALL

SELECT 'DateRange' AS table_name, 'startDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DateRange" 
WHERE "DateRange"."startDate" IS NULL

UNION ALL

SELECT 'DateRange' AS table_name, 'endDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DateRange" 
WHERE "DateRange"."endDate" IS NULL

UNION ALL

SELECT 'DateList' AS table_name, 'date' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DateList" 
WHERE "DateList".date IS NULL

UNION ALL

SELECT 'DateTimeList' AS table_name, 'dateTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DateTimeList" 
WHERE "DateTimeList"."dateTime" IS NULL

UNION ALL

SELECT 'Frequency' AS table_name, 'periodMultiplier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Frequency" 
WHERE "Frequency"."periodMultiplier" IS NULL

UNION ALL

SELECT 'Frequency' AS table_name, 'period' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Frequency" 
WHERE "Frequency".period IS NULL

UNION ALL

SELECT 'Frequency' AS table_name, 'period' AS column_name, 'enum' AS constraint_type, id AS record_id, period AS invalid_value 
FROM "Frequency" 
WHERE "Frequency".period IS NOT NULL AND ("Frequency".period NOT IN ('H', 'D', 'W', 'M', 'Y', 'T', 'C'))

UNION ALL

SELECT 'Offset' AS table_name, 'dayType' AS column_name, 'enum' AS constraint_type, id AS record_id, "dayType" AS invalid_value 
FROM "Offset" 
WHERE "Offset"."dayType" IS NOT NULL AND ("Offset"."dayType" NOT IN ('Business', 'Calendar', 'CurrencyBusiness', 'ExchangeBusiness', 'ScheduledTradingDay'))

UNION ALL

SELECT 'Offset' AS table_name, 'periodMultiplier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Offset" 
WHERE "Offset"."periodMultiplier" IS NULL

UNION ALL

SELECT 'Offset' AS table_name, 'period' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Offset" 
WHERE "Offset".period IS NULL

UNION ALL

SELECT 'Offset' AS table_name, 'period' AS column_name, 'enum' AS constraint_type, id AS record_id, period AS invalid_value 
FROM "Offset" 
WHERE "Offset".period IS NOT NULL AND ("Offset".period NOT IN ('D', 'W', 'M', 'Y'))

UNION ALL

SELECT 'Period' AS table_name, 'periodMultiplier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Period" 
WHERE "Period"."periodMultiplier" IS NULL

UNION ALL

SELECT 'Period' AS table_name, 'period' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Period" 
WHERE "Period".period IS NULL

UNION ALL

SELECT 'Period' AS table_name, 'period' AS column_name, 'enum' AS constraint_type, id AS record_id, period AS invalid_value 
FROM "Period" 
WHERE "Period".period IS NOT NULL AND ("Period".period NOT IN ('D', 'W', 'M', 'Y'))

UNION ALL

SELECT 'RelativeDates' AS table_name, 'businessDayConvention' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RelativeDates" 
WHERE "RelativeDates"."businessDayConvention" IS NULL

UNION ALL

SELECT 'RelativeDates' AS table_name, 'businessDayConvention' AS column_name, 'enum' AS constraint_type, id AS record_id, "businessDayConvention" AS invalid_value 
FROM "RelativeDates" 
WHERE "RelativeDates"."businessDayConvention" IS NOT NULL AND ("RelativeDates"."businessDayConvention" NOT IN ('FOLLOWING', 'FRN', 'MODFOLLOWING', 'PRECEDING', 'MODPRECEDING', 'NEAREST', 'NONE', 'NotApplicable'))

UNION ALL

SELECT 'RelativeDates' AS table_name, 'dayType' AS column_name, 'enum' AS constraint_type, id AS record_id, "dayType" AS invalid_value 
FROM "RelativeDates" 
WHERE "RelativeDates"."dayType" IS NOT NULL AND ("RelativeDates"."dayType" NOT IN ('Business', 'Calendar', 'CurrencyBusiness', 'ExchangeBusiness', 'ScheduledTradingDay'))

UNION ALL

SELECT 'RelativeDates' AS table_name, 'periodMultiplier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RelativeDates" 
WHERE "RelativeDates"."periodMultiplier" IS NULL

UNION ALL

SELECT 'RelativeDates' AS table_name, 'period' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RelativeDates" 
WHERE "RelativeDates".period IS NULL

UNION ALL

SELECT 'RelativeDates' AS table_name, 'period' AS column_name, 'enum' AS constraint_type, id AS record_id, period AS invalid_value 
FROM "RelativeDates" 
WHERE "RelativeDates".period IS NOT NULL AND ("RelativeDates".period NOT IN ('D', 'W', 'M', 'Y'))

UNION ALL

SELECT 'RelativeDateOffset' AS table_name, 'businessDayConvention' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RelativeDateOffset" 
WHERE "RelativeDateOffset"."businessDayConvention" IS NULL

UNION ALL

SELECT 'RelativeDateOffset' AS table_name, 'businessDayConvention' AS column_name, 'enum' AS constraint_type, id AS record_id, "businessDayConvention" AS invalid_value 
FROM "RelativeDateOffset" 
WHERE "RelativeDateOffset"."businessDayConvention" IS NOT NULL AND ("RelativeDateOffset"."businessDayConvention" NOT IN ('FOLLOWING', 'FRN', 'MODFOLLOWING', 'PRECEDING', 'MODPRECEDING', 'NEAREST', 'NONE', 'NotApplicable'))

UNION ALL

SELECT 'RelativeDateOffset' AS table_name, 'dayType' AS column_name, 'enum' AS constraint_type, id AS record_id, "dayType" AS invalid_value 
FROM "RelativeDateOffset" 
WHERE "RelativeDateOffset"."dayType" IS NOT NULL AND ("RelativeDateOffset"."dayType" NOT IN ('Business', 'Calendar', 'CurrencyBusiness', 'ExchangeBusiness', 'ScheduledTradingDay'))

UNION ALL

SELECT 'RelativeDateOffset' AS table_name, 'periodMultiplier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RelativeDateOffset" 
WHERE "RelativeDateOffset"."periodMultiplier" IS NULL

UNION ALL

SELECT 'RelativeDateOffset' AS table_name, 'period' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RelativeDateOffset" 
WHERE "RelativeDateOffset".period IS NULL

UNION ALL

SELECT 'RelativeDateOffset' AS table_name, 'period' AS column_name, 'enum' AS constraint_type, id AS record_id, period AS invalid_value 
FROM "RelativeDateOffset" 
WHERE "RelativeDateOffset".period IS NOT NULL AND ("RelativeDateOffset".period NOT IN ('D', 'W', 'M', 'Y'))

UNION ALL

SELECT 'TimeZone' AS table_name, 'time' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TimeZone" 
WHERE "TimeZone".time IS NULL

UNION ALL

SELECT 'RelativeTime' AS table_name, 'offsetTimeUnit' AS column_name, 'enum' AS constraint_type, id AS record_id, "offsetTimeUnit" AS invalid_value 
FROM "RelativeTime" 
WHERE "RelativeTime"."offsetTimeUnit" IS NOT NULL AND ("RelativeTime"."offsetTimeUnit" NOT IN ('Second', 'Minute', 'Hour', 'Day', 'Week', 'Month', 'Year'))

UNION ALL

SELECT 'RelativeTimeOffset' AS table_name, 'offsetTimeUnit' AS column_name, 'enum' AS constraint_type, id AS record_id, "offsetTimeUnit" AS invalid_value 
FROM "RelativeTimeOffset" 
WHERE "RelativeTimeOffset"."offsetTimeUnit" IS NOT NULL AND ("RelativeTimeOffset"."offsetTimeUnit" NOT IN ('Second', 'Minute', 'Hour', 'Day', 'Week', 'Month', 'Year'))

UNION ALL

SELECT 'TimeRounding' AS table_name, 'roundingDirection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TimeRounding" 
WHERE "TimeRounding"."roundingDirection" IS NULL

UNION ALL

SELECT 'TimeRounding' AS table_name, 'roundingDirection' AS column_name, 'enum' AS constraint_type, id AS record_id, "roundingDirection" AS invalid_value 
FROM "TimeRounding" 
WHERE "TimeRounding"."roundingDirection" IS NOT NULL AND ("TimeRounding"."roundingDirection" NOT IN ('Up', 'Down', 'Nearest'))

UNION ALL

SELECT 'TimeRounding' AS table_name, 'roundToUnit' AS column_name, 'enum' AS constraint_type, id AS record_id, "roundToUnit" AS invalid_value 
FROM "TimeRounding" 
WHERE "TimeRounding"."roundToUnit" IS NOT NULL AND ("TimeRounding"."roundToUnit" NOT IN ('Second', 'Minute', 'Hour', 'Day', 'Week', 'Month', 'Year'))

UNION ALL

SELECT 'PeriodBound' AS table_name, 'period' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PeriodBound" 
WHERE "PeriodBound".period IS NULL

UNION ALL

SELECT 'PeriodBound' AS table_name, 'inclusive' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PeriodBound" 
WHERE "PeriodBound".inclusive IS NULL

UNION ALL

SELECT 'AveragingSchedule' AS table_name, 'startDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AveragingSchedule" 
WHERE "AveragingSchedule"."startDate" IS NULL

UNION ALL

SELECT 'AveragingSchedule' AS table_name, 'endDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AveragingSchedule" 
WHERE "AveragingSchedule"."endDate" IS NULL

UNION ALL

SELECT 'AveragingSchedule' AS table_name, 'averagingPeriodFrequency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AveragingSchedule" 
WHERE "AveragingSchedule"."averagingPeriodFrequency" IS NULL

UNION ALL

SELECT 'PeriodicDates' AS table_name, 'dayType' AS column_name, 'enum' AS constraint_type, id AS record_id, "dayType" AS invalid_value 
FROM "PeriodicDates" 
WHERE "PeriodicDates"."dayType" IS NOT NULL AND ("PeriodicDates"."dayType" NOT IN ('Business', 'Calendar', 'CurrencyBusiness', 'ExchangeBusiness', 'ScheduledTradingDay'))

UNION ALL

SELECT 'CalculationPeriodFrequency' AS table_name, 'rollConvention' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationPeriodFrequency" 
WHERE "CalculationPeriodFrequency"."rollConvention" IS NULL

UNION ALL

SELECT 'CalculationPeriodFrequency' AS table_name, 'rollConvention' AS column_name, 'enum' AS constraint_type, id AS record_id, "rollConvention" AS invalid_value 
FROM "CalculationPeriodFrequency" 
WHERE "CalculationPeriodFrequency"."rollConvention" IS NOT NULL AND ("CalculationPeriodFrequency"."rollConvention" NOT IN ('EOM', 'FRN', 'IMM', 'IMMCAD', 'IMMAUD', 'IMMNZD', 'SFE', 'NONE', 'TBILL', '_1', '_2', '_3', '_4', '_5', '_6', '_7', '_8', '_9', '_10', '_11', '_12', '_13', '_14', '_15', '_16', '_17', '_18', '_19', '_20', '_21', '_22', '_23', '_24', '_25', '_26', '_27', '_28', '_29', '_30', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'))

UNION ALL

SELECT 'CalculationPeriodFrequency' AS table_name, 'periodMultiplier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationPeriodFrequency" 
WHERE "CalculationPeriodFrequency"."periodMultiplier" IS NULL

UNION ALL

SELECT 'CalculationPeriodFrequency' AS table_name, 'period' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationPeriodFrequency" 
WHERE "CalculationPeriodFrequency".period IS NULL

UNION ALL

SELECT 'CalculationPeriodFrequency' AS table_name, 'period' AS column_name, 'enum' AS constraint_type, id AS record_id, period AS invalid_value 
FROM "CalculationPeriodFrequency" 
WHERE "CalculationPeriodFrequency".period IS NOT NULL AND ("CalculationPeriodFrequency".period NOT IN ('H', 'D', 'W', 'M', 'Y', 'T', 'C'))

UNION ALL

SELECT 'CalculationFrequency' AS table_name, 'period' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationFrequency" 
WHERE "CalculationFrequency".period IS NULL

UNION ALL

SELECT 'CalculationFrequency' AS table_name, 'dayOfWeek' AS column_name, 'enum' AS constraint_type, id AS record_id, "dayOfWeek" AS invalid_value 
FROM "CalculationFrequency" 
WHERE "CalculationFrequency"."dayOfWeek" IS NOT NULL AND ("CalculationFrequency"."dayOfWeek" NOT IN ('MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'))

UNION ALL

SELECT 'CalculationFrequency' AS table_name, 'offsetDays' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationFrequency" 
WHERE "CalculationFrequency"."offsetDays" IS NULL

UNION ALL

SELECT 'CalculationFrequency' AS table_name, 'dateLocation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationFrequency" 
WHERE "CalculationFrequency"."dateLocation" IS NULL

UNION ALL

SELECT 'UnitType' AS table_name, 'capacityUnit' AS column_name, 'enum' AS constraint_type, id AS record_id, "capacityUnit" AS invalid_value 
FROM "UnitType" 
WHERE "UnitType"."capacityUnit" IS NOT NULL AND ("UnitType"."capacityUnit" NOT IN ('ALW', 'BBL', 'BCF', 'BDFT', 'CBM', 'CER', 'CRT', 'DAG', 'DAY', 'DMTU', 'ENVCRD', 'ENVOFST', 'FEU', 'G', 'GBBSH', 'GBBTU', 'GBCWT', 'GBGAL', 'GBMBTU', 'GBMMBTU', 'GBT', 'GBTHM', 'GJ', 'GW', 'GWH', 'HL', 'HOGB', 'ISOBTU', 'ISOMBTU', 'ISOMMBTU', 'ISOTHM', 'J', 'KG', 'KL', 'KW', 'KWD', 'KWH', 'KWM', 'KWMIN', 'KWY', 'L', 'LB', 'MB', 'MBF', 'MJ', 'MMBF', 'MMBBL', 'MSF', 'MT', 'MW', 'MWD', 'MWH', 'MWM', 'MWMIN', 'MWY', 'OZT', 'SGB', 'TEU', 'USBSH', 'USBTU', 'USCWT', 'USGAL', 'USMBTU', 'USMMBTU', 'UST', 'USTHM'))

UNION ALL

SELECT 'UnitType' AS table_name, 'weatherUnit' AS column_name, 'enum' AS constraint_type, id AS record_id, "weatherUnit" AS invalid_value 
FROM "UnitType" 
WHERE "UnitType"."weatherUnit" IS NOT NULL AND ("UnitType"."weatherUnit" NOT IN ('CDD', 'CPD', 'HDD'))

UNION ALL

SELECT 'UnitType' AS table_name, 'financialUnit' AS column_name, 'enum' AS constraint_type, id AS record_id, "financialUnit" AS invalid_value 
FROM "UnitType" 
WHERE "UnitType"."financialUnit" IS NOT NULL AND ("UnitType"."financialUnit" NOT IN ('Contract', 'ContractualProduct', 'IndexUnit', 'LogNormalVolatility', 'Share', 'ValuePerDay', 'ValuePerPercent', 'Weight'))

UNION ALL

SELECT 'NonNegativeStep' AS table_name, 'stepDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "NonNegativeStep" 
WHERE "NonNegativeStep"."stepDate" IS NULL

UNION ALL

SELECT 'NonNegativeStep' AS table_name, 'stepValue' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "NonNegativeStep" 
WHERE "NonNegativeStep"."stepValue" IS NULL

UNION ALL

SELECT 'Rounding' AS table_name, 'roundingDirection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Rounding" 
WHERE "Rounding"."roundingDirection" IS NULL

UNION ALL

SELECT 'Rounding' AS table_name, 'roundingDirection' AS column_name, 'enum' AS constraint_type, id AS record_id, "roundingDirection" AS invalid_value 
FROM "Rounding" 
WHERE "Rounding"."roundingDirection" IS NOT NULL AND ("Rounding"."roundingDirection" NOT IN ('Up', 'Down', 'Nearest'))

UNION ALL

SELECT 'Schedule' AS table_name, 'value' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Schedule" 
WHERE "Schedule".value IS NULL

UNION ALL

SELECT 'DatedValue' AS table_name, 'date' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DatedValue" 
WHERE "DatedValue".date IS NULL

UNION ALL

SELECT 'DatedValue' AS table_name, 'value' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DatedValue" 
WHERE "DatedValue".value IS NULL

UNION ALL

SELECT 'NumberBound' AS table_name, 'number' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "NumberBound" 
WHERE "NumberBound".number IS NULL

UNION ALL

SELECT 'NumberBound' AS table_name, 'inclusive' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "NumberBound" 
WHERE "NumberBound".inclusive IS NULL

UNION ALL

SELECT 'MoneyBound' AS table_name, 'money' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MoneyBound" 
WHERE "MoneyBound".money IS NULL

UNION ALL

SELECT 'MoneyBound' AS table_name, 'inclusive' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MoneyBound" 
WHERE "MoneyBound".inclusive IS NULL

UNION ALL

SELECT 'AveragingCalculationMethod' AS table_name, 'isWeighted' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AveragingCalculationMethod" 
WHERE "AveragingCalculationMethod"."isWeighted" IS NULL

UNION ALL

SELECT 'AveragingCalculationMethod' AS table_name, 'calculationMethod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AveragingCalculationMethod" 
WHERE "AveragingCalculationMethod"."calculationMethod" IS NULL

UNION ALL

SELECT 'AveragingCalculationMethod' AS table_name, 'calculationMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "calculationMethod" AS invalid_value 
FROM "AveragingCalculationMethod" 
WHERE "AveragingCalculationMethod"."calculationMethod" IS NOT NULL AND ("AveragingCalculationMethod"."calculationMethod" NOT IN ('Arithmetic', 'Geometric', 'Harmonic'))

UNION ALL

SELECT 'AssetBase' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetBase" 
WHERE "AssetBase".identifier IS NULL

UNION ALL

SELECT 'AssetBase' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetBase" 
WHERE "AssetBase"."assetType" IS NULL

UNION ALL

SELECT 'AssetBase' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "AssetBase" 
WHERE "AssetBase"."assetType" IS NOT NULL AND ("AssetBase"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'AssetIdentifier' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetIdentifier" 
WHERE "AssetIdentifier".identifier IS NULL

UNION ALL

SELECT 'AssetIdentifier' AS table_name, 'identifierType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetIdentifier" 
WHERE "AssetIdentifier"."identifierType" IS NULL

UNION ALL

SELECT 'AssetIdentifier' AS table_name, 'identifierType' AS column_name, 'enum' AS constraint_type, id AS record_id, "identifierType" AS invalid_value 
FROM "AssetIdentifier" 
WHERE "AssetIdentifier"."identifierType" IS NOT NULL AND ("AssetIdentifier"."identifierType" NOT IN ('CurrencyCode', 'ExchangeCode', 'ClearingCode'))

UNION ALL

SELECT 'InstrumentBase' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InstrumentBase" 
WHERE "InstrumentBase".identifier IS NULL

UNION ALL

SELECT 'InstrumentBase' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InstrumentBase" 
WHERE "InstrumentBase"."assetType" IS NULL

UNION ALL

SELECT 'InstrumentBase' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "InstrumentBase" 
WHERE "InstrumentBase"."assetType" IS NOT NULL AND ("InstrumentBase"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'ProductIdentifier' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ProductIdentifier" 
WHERE "ProductIdentifier".identifier IS NULL

UNION ALL

SELECT 'ProductIdentifier' AS table_name, 'source' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ProductIdentifier" 
WHERE "ProductIdentifier".source IS NULL

UNION ALL

SELECT 'ProductIdentifier' AS table_name, 'source' AS column_name, 'enum' AS constraint_type, id AS record_id, source AS invalid_value 
FROM "ProductIdentifier" 
WHERE "ProductIdentifier".source IS NOT NULL AND ("ProductIdentifier".source NOT IN ('BBGID', 'BBGTICKER', 'CUSIP', 'FIGI', 'ISDACRP', 'ISIN', 'Name', 'REDID', 'RIC', 'Other', 'Sicovam', 'SEDOL', 'UPI', 'Valoren', 'Wertpapier'))

UNION ALL

SELECT 'Taxonomy' AS table_name, 'source' AS column_name, 'enum' AS constraint_type, id AS record_id, source AS invalid_value 
FROM "Taxonomy" 
WHERE "Taxonomy".source IS NOT NULL AND ("Taxonomy".source NOT IN ('CFI', 'ISDA', 'ICAD', 'EMIR', 'EU_EMIR_EligibleCollateralAssetClass', 'UK_EMIR_EligibleCollateralAssetClass', 'CFTC', 'US_CFTC_PR_EligibleCollateralAssetClass', 'MAS', 'CSA', 'Other'))

UNION ALL

SELECT 'ProductTaxonomy' AS table_name, 'primaryAssetClass' AS column_name, 'enum' AS constraint_type, id AS record_id, "primaryAssetClass" AS invalid_value 
FROM "ProductTaxonomy" 
WHERE "ProductTaxonomy"."primaryAssetClass" IS NOT NULL AND ("ProductTaxonomy"."primaryAssetClass" NOT IN ('Commodity', 'Credit', 'Equity', 'ForeignExchange', 'InterestRate', 'MoneyMarket'))

UNION ALL

SELECT 'ProductTaxonomy' AS table_name, 'secondaryAssetClass' AS column_name, 'enum' AS constraint_type, id AS record_id, "secondaryAssetClass" AS invalid_value 
FROM "ProductTaxonomy" 
WHERE "ProductTaxonomy"."secondaryAssetClass" IS NOT NULL AND ("ProductTaxonomy"."secondaryAssetClass" NOT IN ('Commodity', 'Credit', 'Equity', 'ForeignExchange', 'InterestRate', 'MoneyMarket'))

UNION ALL

SELECT 'ProductTaxonomy' AS table_name, 'source' AS column_name, 'enum' AS constraint_type, id AS record_id, source AS invalid_value 
FROM "ProductTaxonomy" 
WHERE "ProductTaxonomy".source IS NOT NULL AND ("ProductTaxonomy".source NOT IN ('CFI', 'ISDA', 'ICAD', 'EMIR', 'EU_EMIR_EligibleCollateralAssetClass', 'UK_EMIR_EligibleCollateralAssetClass', 'CFTC', 'US_CFTC_PR_EligibleCollateralAssetClass', 'MAS', 'CSA', 'Other'))

UNION ALL

SELECT 'Cash' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Cash" 
WHERE "Cash".identifier IS NULL

UNION ALL

SELECT 'Cash' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Cash" 
WHERE "Cash"."assetType" IS NULL

UNION ALL

SELECT 'Cash' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "Cash" 
WHERE "Cash"."assetType" IS NOT NULL AND ("Cash"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'Commodity' AS table_name, 'priceQuoteType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Commodity" 
WHERE "Commodity"."priceQuoteType" IS NULL

UNION ALL

SELECT 'Commodity' AS table_name, 'priceQuoteType' AS column_name, 'enum' AS constraint_type, id AS record_id, "priceQuoteType" AS invalid_value 
FROM "Commodity" 
WHERE "Commodity"."priceQuoteType" IS NOT NULL AND ("Commodity"."priceQuoteType" NOT IN ('Afternoon', 'Ask', 'Bid', 'Closing', 'High', 'Index', 'MeanOfBidAndAsk', 'LocationalMarginal', 'Low', 'MarginalHourly', 'MarketClearing', 'MeanOfHighAndLow', 'Morning', 'Official', 'Opening', 'OSP', 'Settlement', 'Spot', 'Mid', 'NationalSingle', 'WeightedAverage', 'UnWeightedAverage'))

UNION ALL

SELECT 'Commodity' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Commodity" 
WHERE "Commodity".identifier IS NULL

UNION ALL

SELECT 'Commodity' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Commodity" 
WHERE "Commodity"."assetType" IS NULL

UNION ALL

SELECT 'Commodity' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "Commodity" 
WHERE "Commodity"."assetType" IS NOT NULL AND ("Commodity"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'CommodityProductDefinition' AS table_name, 'referenceFramework' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CommodityProductDefinition" 
WHERE "CommodityProductDefinition"."referenceFramework" IS NULL

UNION ALL

SELECT 'CommodityProductDefinition' AS table_name, 'commodityInfoPublisher' AS column_name, 'enum' AS constraint_type, id AS record_id, "commodityInfoPublisher" AS invalid_value 
FROM "CommodityProductDefinition" 
WHERE "CommodityProductDefinition"."commodityInfoPublisher" IS NOT NULL AND ("CommodityProductDefinition"."commodityInfoPublisher" NOT IN ('Argus', 'ArgusMcCloskeys', 'ArgusAmericasCrudeReport', 'ArgusBiofuelReport', 'ArgusCrudeReport', 'ArgusEuropeanProductsReport', 'ArgusFMB', 'ArgusInternationalLPGReport', 'ArgusLPG', 'ArgusNatGas', 'AssocBanksSingapore', 'BandD', 'BalticExchange', 'BankOfCanada', 'BankOfEngland', 'BankOfJapan', 'Bloomberg', 'BLUENEXT', 'CAISO', 'CanadianGasPriceReporter', 'CanadianGasReporter', 'ChemicalMarketsAssociation', 'CMAIAromaticsMarketReport', 'CMAIWeeklyMethanolMarketReport', 'CRUSteelLongProductMonitor', 'CRUSteelSheetProductsMonitor', 'DowJonesEnergyService', 'DowJonesEnergyServiceScreen', 'DowJonesNatGas', 'EEX', 'ERCOT', 'EuroCentralBank', 'EURONEXMATIF', 'FederalReserve', 'FERTECON', 'FertilizerWeek', 'FHLBSF', 'GasDaily', 'GasDailyPriceGuide', 'GlobalCoale', 'GME', 'HerenReport', 'ICE', 'ICE10XDailyNaturalGas', 'ICE10XDailyPower', 'ICE10XMonthly', 'ICEDayAheadIndex', 'ICEECX', 'ICIS', 'InsideFERC', 'IPE', 'ISDA', 'ISONewEngland', 'JAPANMOFTSRR', 'LEBA', 'LondonBullionMarketAssociation', 'LONDONPLATINUMPALLADIUMMARKET', 'MegawattDaily', 'MetalBulletin', 'MISO', 'NaturalGasWeek', 'NGIBidweekSurvey', 'NYISO', 'OBM', 'OMEL', 'OPIS', 'PaperTrader', 'PIX', 'PJM', 'PlattsAsiaPacific', 'PlattsAsiaPacificArabMarketscan', 'PlattsCleanTankerwire', 'PlattsCoalTrader', 'PlattsCrudeOilMarketwire', 'PlattsDirtyTakerwire', 'PlattsENGR', 'PlattsEuropean', 'PlattsEuropeanMarketscan', 'PlattsGasDaily', 'PlattsGasDailyPriceGuide', 'PlattsInsideFERC', 'PlattsLPG', 'PlattsMarketwire', 'PlattsMegawattDaily', 'PlattsMetalsAlert', 'PlattsOilgram', 'PlattsOilgramBunkerwire', 'PlattsPolymerscan', 'PlattsTSIIronOre', 'TSIScrap', 'TSISteel', 'PlattsUS', 'PlattsUSMarketscan', 'PPM', 'PPMEurope', 'PPW', 'ReserveBankAustralia', 'ReserveBankNewZealand', 'Reuters', 'ReutersScreen', 'RIMIntelligenceProducts', 'SeaPac', 'Telerate', 'TelerateScreen', 'UXWEEKLY', 'WorldCrudeReport', 'WorldPulpMonthly'))

UNION ALL

SELECT 'CommodityProductDefinition' AS table_name, 'exchangeId' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CommodityProductDefinition" 
WHERE "CommodityProductDefinition"."exchangeId" IS NULL

UNION ALL

SELECT 'CommodityReferenceFramework' AS table_name, 'commodityName' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CommodityReferenceFramework" 
WHERE "CommodityReferenceFramework"."commodityName" IS NULL

UNION ALL

SELECT 'CommodityReferenceFramework' AS table_name, 'capacityUnit' AS column_name, 'enum' AS constraint_type, id AS record_id, "capacityUnit" AS invalid_value 
FROM "CommodityReferenceFramework" 
WHERE "CommodityReferenceFramework"."capacityUnit" IS NOT NULL AND ("CommodityReferenceFramework"."capacityUnit" NOT IN ('ALW', 'BBL', 'BCF', 'BDFT', 'CBM', 'CER', 'CRT', 'DAG', 'DAY', 'DMTU', 'ENVCRD', 'ENVOFST', 'FEU', 'G', 'GBBSH', 'GBBTU', 'GBCWT', 'GBGAL', 'GBMBTU', 'GBMMBTU', 'GBT', 'GBTHM', 'GJ', 'GW', 'GWH', 'HL', 'HOGB', 'ISOBTU', 'ISOMBTU', 'ISOMMBTU', 'ISOTHM', 'J', 'KG', 'KL', 'KW', 'KWD', 'KWH', 'KWM', 'KWMIN', 'KWY', 'L', 'LB', 'MB', 'MBF', 'MJ', 'MMBF', 'MMBBL', 'MSF', 'MT', 'MW', 'MWD', 'MWH', 'MWM', 'MWMIN', 'MWY', 'OZT', 'SGB', 'TEU', 'USBSH', 'USBTU', 'USCWT', 'USGAL', 'USMBTU', 'USMMBTU', 'UST', 'USTHM'))

UNION ALL

SELECT 'CommodityReferenceFramework' AS table_name, 'weatherUnit' AS column_name, 'enum' AS constraint_type, id AS record_id, "weatherUnit" AS invalid_value 
FROM "CommodityReferenceFramework" 
WHERE "CommodityReferenceFramework"."weatherUnit" IS NOT NULL AND ("CommodityReferenceFramework"."weatherUnit" NOT IN ('CDD', 'CPD', 'HDD'))

UNION ALL

SELECT 'CommodityReferenceFramework' AS table_name, 'currency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CommodityReferenceFramework" 
WHERE "CommodityReferenceFramework".currency IS NULL

UNION ALL

SELECT 'DigitalAsset' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DigitalAsset" 
WHERE "DigitalAsset".identifier IS NULL

UNION ALL

SELECT 'DigitalAsset' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DigitalAsset" 
WHERE "DigitalAsset"."assetType" IS NULL

UNION ALL

SELECT 'DigitalAsset' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "DigitalAsset" 
WHERE "DigitalAsset"."assetType" IS NOT NULL AND ("DigitalAsset"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'ListedDerivative' AS table_name, 'optionType' AS column_name, 'enum' AS constraint_type, id AS record_id, "optionType" AS invalid_value 
FROM "ListedDerivative" 
WHERE "ListedDerivative"."optionType" IS NOT NULL AND ("ListedDerivative"."optionType" NOT IN ('Put', 'Call'))

UNION ALL

SELECT 'ListedDerivative' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ListedDerivative" 
WHERE "ListedDerivative".identifier IS NULL

UNION ALL

SELECT 'ListedDerivative' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ListedDerivative" 
WHERE "ListedDerivative"."assetType" IS NULL

UNION ALL

SELECT 'ListedDerivative' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "ListedDerivative" 
WHERE "ListedDerivative"."assetType" IS NOT NULL AND ("ListedDerivative"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'Loan' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Loan" 
WHERE "Loan".identifier IS NULL

UNION ALL

SELECT 'Loan' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Loan" 
WHERE "Loan"."assetType" IS NULL

UNION ALL

SELECT 'Loan' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "Loan" 
WHERE "Loan"."assetType" IS NOT NULL AND ("Loan"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'CollateralTaxonomy' AS table_name, 'taxonomyValue' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralTaxonomy" 
WHERE "CollateralTaxonomy"."taxonomyValue" IS NULL

UNION ALL

SELECT 'CollateralTaxonomy' AS table_name, 'taxonomySource' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralTaxonomy" 
WHERE "CollateralTaxonomy"."taxonomySource" IS NULL

UNION ALL

SELECT 'CollateralTaxonomy' AS table_name, 'taxonomySource' AS column_name, 'enum' AS constraint_type, id AS record_id, "taxonomySource" AS invalid_value 
FROM "CollateralTaxonomy" 
WHERE "CollateralTaxonomy"."taxonomySource" IS NOT NULL AND ("CollateralTaxonomy"."taxonomySource" NOT IN ('CFI', 'ISDA', 'ICAD', 'EMIR', 'EU_EMIR_EligibleCollateralAssetClass', 'UK_EMIR_EligibleCollateralAssetClass', 'CFTC', 'US_CFTC_PR_EligibleCollateralAssetClass', 'MAS', 'CSA', 'Other'))

UNION ALL

SELECT 'CollateralTaxonomyValue' AS table_name, 'eu_EMIR_EligibleCollateral' AS column_name, 'enum' AS constraint_type, id AS record_id, "eu_EMIR_EligibleCollateral" AS invalid_value 
FROM "CollateralTaxonomyValue" 
WHERE "CollateralTaxonomyValue"."eu_EMIR_EligibleCollateral" IS NOT NULL AND ("CollateralTaxonomyValue"."eu_EMIR_EligibleCollateral" NOT IN ('EU_EMIRTypeA', 'EU_EMIRTypeB', 'EU_EMIRTypeC', 'EU_EMIRTypeD', 'EU_EMIRTypeE', 'EU_EMIRTypeF', 'EU_EMIRTypeG', 'EU_EMIRTypeH', 'EU_EMIRTypeI', 'EU_EMIRTypeJ', 'EU_EMIRTypeK', 'EU_EMIRTypeL', 'EU_EMIRTypeM', 'EU_EMIRTypeN', 'EU_EMIRTypeO', 'EU_EMIRTypeP', 'EU_EMIRTypeQ', 'EU_EMIRTypeR'))

UNION ALL

SELECT 'CollateralTaxonomyValue' AS table_name, 'uk_EMIR_EligibleCollateral' AS column_name, 'enum' AS constraint_type, id AS record_id, "uk_EMIR_EligibleCollateral" AS invalid_value 
FROM "CollateralTaxonomyValue" 
WHERE "CollateralTaxonomyValue"."uk_EMIR_EligibleCollateral" IS NOT NULL AND ("CollateralTaxonomyValue"."uk_EMIR_EligibleCollateral" NOT IN ('UK_EMIRTypeA', 'UK_EMIRTypeB', 'UK_EMIRTypeC', 'UK_EMIRTypeD', 'UK_EMIRTypeE', 'UK_EMIRTypeF', 'UK_EMIRTypeG', 'UK_EMIRTypeH', 'UK_EMIRTypeI', 'UK_EMIRTypeJ', 'UK_EMIRTypeK', 'UK_EMIRTypeL', 'UK_EMIRTypeM', 'UK_EMIRTypeN', 'UK_EMIRTypeO', 'UK_EMIRTypeP', 'UK_EMIRTypeQ', 'UK_EMIRTypeR'))

UNION ALL

SELECT 'CollateralTaxonomyValue' AS table_name, 'us_CFTC_PR_EligibleCollateral' AS column_name, 'enum' AS constraint_type, id AS record_id, "us_CFTC_PR_EligibleCollateral" AS invalid_value 
FROM "CollateralTaxonomyValue" 
WHERE "CollateralTaxonomyValue"."us_CFTC_PR_EligibleCollateral" IS NOT NULL AND ("CollateralTaxonomyValue"."us_CFTC_PR_EligibleCollateral" NOT IN ('US_CFTC_PRType1', 'US_CFTC_PRType2', 'US_CFTC_PRType3', 'US_CFTC_PRType4', 'US_CFTC_PRType5A', 'US_CFTC_PRType5B', 'US_CFTC_PRType6', 'US_CFTC_PRType7', 'US_CFTC_PRType8A', 'US_CFTC_PRType8B', 'US_CFTC_PRType8C', 'US_CFTC_PRType9', 'US_CTFC_PRType10'))

UNION ALL

SELECT 'Security' AS table_name, 'securityType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Security" 
WHERE "Security"."securityType" IS NULL

UNION ALL

SELECT 'Security' AS table_name, 'securityType' AS column_name, 'enum' AS constraint_type, id AS record_id, "securityType" AS invalid_value 
FROM "Security" 
WHERE "Security"."securityType" IS NOT NULL AND ("Security"."securityType" NOT IN ('Debt', 'Equity', 'Fund', 'Warrant', 'Certificate'))

UNION ALL

SELECT 'Security' AS table_name, 'fundType' AS column_name, 'enum' AS constraint_type, id AS record_id, "fundType" AS invalid_value 
FROM "Security" 
WHERE "Security"."fundType" IS NOT NULL AND ("Security"."fundType" NOT IN ('MoneyMarketFund', 'ExchangeTradedFund', 'MutualFund', 'OtherFund'))

UNION ALL

SELECT 'Security' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Security" 
WHERE "Security".identifier IS NULL

UNION ALL

SELECT 'Security' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Security" 
WHERE "Security"."assetType" IS NULL

UNION ALL

SELECT 'Security' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "Security" 
WHERE "Security"."assetType" IS NOT NULL AND ("Security"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'EquityType' AS table_name, 'equityType' AS column_name, 'enum' AS constraint_type, id AS record_id, "equityType" AS invalid_value 
FROM "EquityType" 
WHERE "EquityType"."equityType" IS NOT NULL AND ("EquityType"."equityType" NOT IN ('Ordinary', 'NonConvertiblePreference', 'DepositaryReceipt', 'ConvertiblePreference'))

UNION ALL

SELECT 'EquityType' AS table_name, 'depositaryReceipt' AS column_name, 'enum' AS constraint_type, id AS record_id, "depositaryReceipt" AS invalid_value 
FROM "EquityType" 
WHERE "EquityType"."depositaryReceipt" IS NOT NULL AND ("EquityType"."depositaryReceipt" NOT IN ('ADR', 'GDR', 'IDR', 'EDR'))

UNION ALL

SELECT 'DebtEconomics' AS table_name, 'seniority' AS column_name, 'enum' AS constraint_type, id AS record_id, seniority AS invalid_value 
FROM "DebtEconomics" 
WHERE "DebtEconomics".seniority IS NOT NULL AND ("DebtEconomics".seniority NOT IN ('Secured', 'Senior', 'Subordinated'))

UNION ALL

SELECT 'DebtEconomics' AS table_name, 'interest' AS column_name, 'enum' AS constraint_type, id AS record_id, interest AS invalid_value 
FROM "DebtEconomics" 
WHERE "DebtEconomics".interest IS NOT NULL AND ("DebtEconomics".interest NOT IN ('Fixed', 'Floating', 'InflationLinked', 'IndexLinked', 'InterestOnly', 'OtherStructured', 'InverseFloating', 'ZeroCoupon'))

UNION ALL

SELECT 'DebtEconomics' AS table_name, 'principal' AS column_name, 'enum' AS constraint_type, id AS record_id, principal AS invalid_value 
FROM "DebtEconomics" 
WHERE "DebtEconomics".principal IS NOT NULL AND ("DebtEconomics".principal NOT IN ('Bullet', 'Callable', 'Puttable', 'Amortising', 'InflationLinked', 'IndexLinked', 'OtherStructured', 'PrincipalOnly'))

UNION ALL

SELECT 'DebtRedemption' AS table_name, 'redemptionType' AS column_name, 'enum' AS constraint_type, id AS record_id, "redemptionType" AS invalid_value 
FROM "DebtRedemption" 
WHERE "DebtRedemption"."redemptionType" IS NOT NULL AND ("DebtRedemption"."redemptionType" NOT IN ('Convertible', 'Exchangeable', 'ContingentConvertible', 'Sinkable', 'Extraordinary'))

UNION ALL

SELECT 'DebtRedemption' AS table_name, 'putCall' AS column_name, 'enum' AS constraint_type, id AS record_id, "putCall" AS invalid_value 
FROM "DebtRedemption" 
WHERE "DebtRedemption"."putCall" IS NOT NULL AND ("DebtRedemption"."putCall" NOT IN ('Put', 'Call'))

UNION ALL

SELECT 'DebtRedemption' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "DebtRedemption" 
WHERE "DebtRedemption".party IS NOT NULL AND ("DebtRedemption".party NOT IN ('Holder', 'Issuer'))

UNION ALL

SELECT 'SecuredDebt' AS table_name, 'securedType' AS column_name, 'enum' AS constraint_type, id AS record_id, "securedType" AS invalid_value 
FROM "SecuredDebt" 
WHERE "SecuredDebt"."securedType" IS NOT NULL AND ("SecuredDebt"."securedType" NOT IN ('AssetBacked', 'CollateralizedObligation', 'CoveredBonds'))

UNION ALL

SELECT 'SecuredDebt' AS table_name, 'assetBacked' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetBacked" AS invalid_value 
FROM "SecuredDebt" 
WHERE "SecuredDebt"."assetBacked" IS NOT NULL AND ("SecuredDebt"."assetBacked" NOT IN ('HomeEquity', 'AutoLoan', 'StudentLoan', 'CreditCard', 'Property', 'Mortgage', 'Other'))

UNION ALL

SELECT 'SecuredDebt' AS table_name, 'collateralizedObligation' AS column_name, 'enum' AS constraint_type, id AS record_id, "collateralizedObligation" AS invalid_value 
FROM "SecuredDebt" 
WHERE "SecuredDebt"."collateralizedObligation" IS NOT NULL AND ("SecuredDebt"."collateralizedObligation" NOT IN ('CDO', 'CMO', 'CLO', 'CBO'))

UNION ALL

SELECT 'SecuredDebt' AS table_name, 'coveredBond' AS column_name, 'enum' AS constraint_type, id AS record_id, "coveredBond" AS invalid_value 
FROM "SecuredDebt" 
WHERE "SecuredDebt"."coveredBond" IS NOT NULL AND ("SecuredDebt"."coveredBond" NOT IN ('Pfandbriefe', 'JumboPfandbriefe'))

UNION ALL

SELECT 'SecuredDebt' AS table_name, 'propertyType' AS column_name, 'enum' AS constraint_type, id AS record_id, "propertyType" AS invalid_value 
FROM "SecuredDebt" 
WHERE "SecuredDebt"."propertyType" IS NOT NULL AND ("SecuredDebt"."propertyType" NOT IN ('Commercial', 'Residential'))

UNION ALL

SELECT 'CollateralGuarantorType' AS table_name, 'guarantorType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralGuarantorType" 
WHERE "CollateralGuarantorType"."guarantorType" IS NULL

UNION ALL

SELECT 'CollateralGuarantorType' AS table_name, 'guarantorType' AS column_name, 'enum' AS constraint_type, id AS record_id, "guarantorType" AS invalid_value 
FROM "CollateralGuarantorType" 
WHERE "CollateralGuarantorType"."guarantorType" IS NOT NULL AND ("CollateralGuarantorType"."guarantorType" NOT IN ('SupraNational', 'SovereignCentralBank', 'QuasiGovernment', 'RegionalGovernment', 'Corporate', 'Fund', 'SpecialPurposeVehicle'))

UNION ALL

SELECT 'CollateralIssuerType' AS table_name, 'issuerType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralIssuerType" 
WHERE "CollateralIssuerType"."issuerType" IS NULL

UNION ALL

SELECT 'CollateralIssuerType' AS table_name, 'issuerType' AS column_name, 'enum' AS constraint_type, id AS record_id, "issuerType" AS invalid_value 
FROM "CollateralIssuerType" 
WHERE "CollateralIssuerType"."issuerType" IS NOT NULL AND ("CollateralIssuerType"."issuerType" NOT IN ('SupraNational', 'SovereignCentralBank', 'QuasiGovernment', 'RegionalGovernment', 'Corporate', 'Fund', 'SpecialPurposeVehicle'))

UNION ALL

SELECT 'CollateralIssuerType' AS table_name, 'supraNationalType' AS column_name, 'enum' AS constraint_type, id AS record_id, "supraNationalType" AS invalid_value 
FROM "CollateralIssuerType" 
WHERE "CollateralIssuerType"."supraNationalType" IS NOT NULL AND ("CollateralIssuerType"."supraNationalType" NOT IN ('InternationalOrganisation', 'MultilateralBank'))

UNION ALL

SELECT 'QuasiGovernmentIssuerType' AS table_name, 'sovereignEntity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "QuasiGovernmentIssuerType" 
WHERE "QuasiGovernmentIssuerType"."sovereignEntity" IS NULL

UNION ALL

SELECT 'RegionalGovernmentIssuerType' AS table_name, 'sovereignRecourse' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RegionalGovernmentIssuerType" 
WHERE "RegionalGovernmentIssuerType"."sovereignRecourse" IS NULL

UNION ALL

SELECT 'SpecialPurposeVehicleIssuerType' AS table_name, 'creditRisk' AS column_name, 'enum' AS constraint_type, id AS record_id, "creditRisk" AS invalid_value 
FROM "SpecialPurposeVehicleIssuerType" 
WHERE "SpecialPurposeVehicleIssuerType"."creditRisk" IS NOT NULL AND ("SpecialPurposeVehicleIssuerType"."creditRisk" NOT IN ('TranchedCreditRisk', 'UntranchedCreditRisk'))

UNION ALL

SELECT 'TaxonomyClassification' AS table_name, 'value' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TaxonomyClassification" 
WHERE "TaxonomyClassification".value IS NULL

UNION ALL

SELECT 'AssetType' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetType" 
WHERE "AssetType"."assetType" IS NULL

UNION ALL

SELECT 'AssetType' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "AssetType" 
WHERE "AssetType"."assetType" IS NOT NULL AND ("AssetType"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'AssetType' AS table_name, 'securityType' AS column_name, 'enum' AS constraint_type, id AS record_id, "securityType" AS invalid_value 
FROM "AssetType" 
WHERE "AssetType"."securityType" IS NOT NULL AND ("AssetType"."securityType" NOT IN ('Debt', 'Equity', 'Fund', 'Warrant', 'Certificate'))

UNION ALL

SELECT 'AssetType' AS table_name, 'fundType' AS column_name, 'enum' AS constraint_type, id AS record_id, "fundType" AS invalid_value 
FROM "AssetType" 
WHERE "AssetType"."fundType" IS NOT NULL AND ("AssetType"."fundType" NOT IN ('MoneyMarketFund', 'ExchangeTradedFund', 'MutualFund', 'OtherFund'))

UNION ALL

SELECT 'PriceSource' AS table_name, 'pricePublisher' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PriceSource" 
WHERE "PriceSource"."pricePublisher" IS NULL

UNION ALL

SELECT 'NotDomesticCurrency' AS table_name, 'applicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "NotDomesticCurrency" 
WHERE "NotDomesticCurrency".applicable IS NULL

UNION ALL

SELECT 'Obligations' AS table_name, 'category' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Obligations" 
WHERE "Obligations".category IS NULL

UNION ALL

SELECT 'Obligations' AS table_name, 'category' AS column_name, 'enum' AS constraint_type, id AS record_id, category AS invalid_value 
FROM "Obligations" 
WHERE "Obligations".category IS NOT NULL AND ("Obligations".category NOT IN ('Payment', 'BorrowedMoney', 'ReferenceObligationsOnly', 'Bond', 'Loan', 'BondOrLoan'))

UNION ALL

SELECT 'SpecifiedCurrency' AS table_name, 'applicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SpecifiedCurrency" 
WHERE "SpecifiedCurrency".applicable IS NULL

UNION ALL

SELECT 'CodeList' AS table_name, 'identification' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CodeList" 
WHERE "CodeList".identification IS NULL

UNION ALL

SELECT 'CodeListIdentification' AS table_name, 'shortName' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CodeListIdentification" 
WHERE "CodeListIdentification"."shortName" IS NULL

UNION ALL

SELECT 'CodeListIdentification' AS table_name, 'version' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CodeListIdentification" 
WHERE "CodeListIdentification".version IS NULL

UNION ALL

SELECT 'CodeListIdentification' AS table_name, 'canonicalUri' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CodeListIdentification" 
WHERE "CodeListIdentification"."canonicalUri" IS NULL

UNION ALL

SELECT 'CodeValue' AS table_name, 'value' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CodeValue" 
WHERE "CodeValue".value IS NULL

UNION ALL

SELECT 'AssignedIdentifier' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssignedIdentifier" 
WHERE "AssignedIdentifier".identifier IS NULL

UNION ALL

SELECT 'Identifier' AS table_name, 'assignedIdentifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Identifier" 
WHERE "Identifier"."assignedIdentifier" IS NULL

UNION ALL

SELECT 'IdentifiedList' AS table_name, 'listId' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IdentifiedList" 
WHERE "IdentifiedList"."listId" IS NULL

UNION ALL

SELECT 'IdentifiedList' AS table_name, 'componentId' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IdentifiedList" 
WHERE "IdentifiedList"."componentId" IS NULL

UNION ALL

SELECT 'LocationIdentifier' AS table_name, 'locationIdentifierType' AS column_name, 'enum' AS constraint_type, id AS record_id, "locationIdentifierType" AS invalid_value 
FROM "LocationIdentifier" 
WHERE "LocationIdentifier"."locationIdentifierType" IS NOT NULL AND ("LocationIdentifier"."locationIdentifierType" NOT IN ('DeliveryPoint', 'EntryPoint', 'InterconnectionPoint', 'WithdrawalPoint', 'DeliveryZone', 'BuyerHub', 'SellerHub'))

UNION ALL

SELECT 'LocationIdentifier' AS table_name, 'assignedIdentifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LocationIdentifier" 
WHERE "LocationIdentifier"."assignedIdentifier" IS NULL

UNION ALL

SELECT 'Counterparty' AS table_name, 'role' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Counterparty" 
WHERE "Counterparty".role IS NULL

UNION ALL

SELECT 'Counterparty' AS table_name, 'role' AS column_name, 'enum' AS constraint_type, id AS record_id, role AS invalid_value 
FROM "Counterparty" 
WHERE "Counterparty".role IS NOT NULL AND ("Counterparty".role NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'Counterparty' AS table_name, 'partyReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Counterparty" 
WHERE "Counterparty"."partyReference" IS NULL

UNION ALL

SELECT 'AncillaryParty' AS table_name, 'role' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AncillaryParty" 
WHERE "AncillaryParty".role IS NULL

UNION ALL

SELECT 'AncillaryParty' AS table_name, 'role' AS column_name, 'enum' AS constraint_type, id AS record_id, role AS invalid_value 
FROM "AncillaryParty" 
WHERE "AncillaryParty".role IS NOT NULL AND ("AncillaryParty".role NOT IN ('DisruptionEventsDeterminingParty', 'ExtraordinaryDividendsParty', 'PredeterminedClearingOrganizationParty', 'ExerciseNoticeReceiverPartyManual', 'ExerciseNoticeReceiverPartyOptionalEarlyTermination', 'ExerciseNoticeReceiverPartyCancelableProvision', 'ExerciseNoticeReceiverPartyExtendibleProvision', 'CalculationAgentIndependent', 'CalculationAgentOptionalEarlyTermination', 'CalculationAgentMandatoryEarlyTermination', 'CalculationAgentFallback'))

UNION ALL

SELECT 'AncillaryParty' AS table_name, 'partyReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AncillaryParty" 
WHERE "AncillaryParty"."partyReference" IS NULL

UNION ALL

SELECT 'AncillaryParty' AS table_name, 'onBehalfOf' AS column_name, 'enum' AS constraint_type, id AS record_id, "onBehalfOf" AS invalid_value 
FROM "AncillaryParty" 
WHERE "AncillaryParty"."onBehalfOf" IS NOT NULL AND ("AncillaryParty"."onBehalfOf" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'BuyerSeller' AS table_name, 'buyer' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BuyerSeller" 
WHERE "BuyerSeller".buyer IS NULL

UNION ALL

SELECT 'BuyerSeller' AS table_name, 'buyer' AS column_name, 'enum' AS constraint_type, id AS record_id, buyer AS invalid_value 
FROM "BuyerSeller" 
WHERE "BuyerSeller".buyer IS NOT NULL AND ("BuyerSeller".buyer NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'BuyerSeller' AS table_name, 'seller' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BuyerSeller" 
WHERE "BuyerSeller".seller IS NULL

UNION ALL

SELECT 'BuyerSeller' AS table_name, 'seller' AS column_name, 'enum' AS constraint_type, id AS record_id, seller AS invalid_value 
FROM "BuyerSeller" 
WHERE "BuyerSeller".seller IS NOT NULL AND ("BuyerSeller".seller NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'PayerReceiver' AS table_name, 'payer' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PayerReceiver" 
WHERE "PayerReceiver".payer IS NULL

UNION ALL

SELECT 'PayerReceiver' AS table_name, 'payer' AS column_name, 'enum' AS constraint_type, id AS record_id, payer AS invalid_value 
FROM "PayerReceiver" 
WHERE "PayerReceiver".payer IS NOT NULL AND ("PayerReceiver".payer NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'PayerReceiver' AS table_name, 'receiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PayerReceiver" 
WHERE "PayerReceiver".receiver IS NULL

UNION ALL

SELECT 'PayerReceiver' AS table_name, 'receiver' AS column_name, 'enum' AS constraint_type, id AS record_id, receiver AS invalid_value 
FROM "PayerReceiver" 
WHERE "PayerReceiver".receiver IS NOT NULL AND ("PayerReceiver".receiver NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'PartyReferencePayerReceiver' AS table_name, 'payerPartyReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PartyReferencePayerReceiver" 
WHERE "PartyReferencePayerReceiver"."payerPartyReference" IS NULL

UNION ALL

SELECT 'PartyReferencePayerReceiver' AS table_name, 'receiverPartyReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PartyReferencePayerReceiver" 
WHERE "PartyReferencePayerReceiver"."receiverPartyReference" IS NULL

UNION ALL

SELECT 'ReferenceBank' AS table_name, 'referenceBankId' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ReferenceBank" 
WHERE "ReferenceBank"."referenceBankId" IS NULL

UNION ALL

SELECT 'ReferenceBanks' AS table_name, 'referenceBank' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ReferenceBanks" 
WHERE "ReferenceBanks"."referenceBank" IS NULL

UNION ALL

SELECT 'RelatedParty' AS table_name, 'partyReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RelatedParty" 
WHERE "RelatedParty"."partyReference" IS NULL

UNION ALL

SELECT 'RelatedParty' AS table_name, 'role' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RelatedParty" 
WHERE "RelatedParty".role IS NULL

UNION ALL

SELECT 'RelatedParty' AS table_name, 'role' AS column_name, 'enum' AS constraint_type, id AS record_id, role AS invalid_value 
FROM "RelatedParty" 
WHERE "RelatedParty".role IS NOT NULL AND ("RelatedParty".role NOT IN ('Accountant', 'AgentLender', 'AllocationAgent', 'ArrangingBroker', 'BarrierDeterminationAgent', 'BeneficialOwner', 'Beneficiary', 'BookingParty', 'Borrower', 'Buyer', 'BuyerDecisionMaker', 'Chargor', 'ClearingClient', 'ClearingExceptionParty', 'ClearingFirm', 'ClearingOrganization', 'Client', 'ClientDecisionMaker', 'ConfirmationPlatform', 'ContractualParty', 'CounterPartyAffiliate', 'CounterPartyUltimateParent', 'Counterparty', 'CreditSupportProvider', 'Custodian', 'DataSubmitter', 'DeterminingParty', 'DisputingParty', 'DocumentRepository', 'ExecutingBroker', 'ExecutingEntity', 'ExecutionAgent', 'ExecutionFacility', 'Guarantor', 'HedgingParty', 'Lender', 'MarginAffiliate', 'OrderTransmitter', 'Pledgor', 'PrimeBroker', 'PriorTradeRepository', 'PTRRServiceProvider', 'PublicationVenue', 'ReportingParty', 'ReportingPartyAffiliate', 'ReportingPartyUltimateParent', 'Seller', 'SellerDecisionMaker', 'SecuredParty', 'SettlementAgent', 'TradeRepository', 'TradeSource', 'TradingManager', 'TradingPartner', 'TripartyAgent', 'ThirdPartyCustodian'))

UNION ALL

SELECT 'Account' AS table_name, 'accountNumber' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Account" 
WHERE "Account"."accountNumber" IS NULL

UNION ALL

SELECT 'Account' AS table_name, 'accountType' AS column_name, 'enum' AS constraint_type, id AS record_id, "accountType" AS invalid_value 
FROM "Account" 
WHERE "Account"."accountType" IS NOT NULL AND ("Account"."accountType" NOT IN ('AggregateClient', 'Client', 'House'))

UNION ALL

SELECT 'Address' AS table_name, 'street' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Address" 
WHERE "Address".street IS NULL

UNION ALL

SELECT 'BusinessUnit' AS table_name, 'name' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BusinessUnit" 
WHERE "BusinessUnit".name IS NULL

UNION ALL

SELECT 'LegalEntity' AS table_name, 'name' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegalEntity" 
WHERE "LegalEntity".name IS NULL

UNION ALL

SELECT 'NaturalPersonRole' AS table_name, 'personReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "NaturalPersonRole" 
WHERE "NaturalPersonRole"."personReference" IS NULL

UNION ALL

SELECT 'NaturalPersonRole' AS table_name, 'role' AS column_name, 'enum' AS constraint_type, id AS record_id, role AS invalid_value 
FROM "NaturalPersonRole" 
WHERE "NaturalPersonRole".role IS NOT NULL AND ("NaturalPersonRole".role NOT IN ('Broker', 'Buyer', 'DecisionMaker', 'ExecutionWithinFirm', 'InvestmentDecisionMaker', 'Seller', 'Trader'))

UNION ALL

SELECT 'Party' AS table_name, 'partyId' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Party" 
WHERE "Party"."partyId" IS NULL

UNION ALL

SELECT 'PartyIdentifier' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PartyIdentifier" 
WHERE "PartyIdentifier".identifier IS NULL

UNION ALL

SELECT 'PartyIdentifier' AS table_name, 'identifierType' AS column_name, 'enum' AS constraint_type, id AS record_id, "identifierType" AS invalid_value 
FROM "PartyIdentifier" 
WHERE "PartyIdentifier"."identifierType" IS NOT NULL AND ("PartyIdentifier"."identifierType" NOT IN ('BIC', 'LEI', 'MIC'))

UNION ALL

SELECT 'EntityIdentifier' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EntityIdentifier" 
WHERE "EntityIdentifier".identifier IS NULL

UNION ALL

SELECT 'EntityIdentifier' AS table_name, 'identifierType' AS column_name, 'enum' AS constraint_type, id AS record_id, "identifierType" AS invalid_value 
FROM "EntityIdentifier" 
WHERE "EntityIdentifier"."identifierType" IS NOT NULL AND ("EntityIdentifier"."identifierType" NOT IN ('REDID', 'CountryCode', 'Other'))

UNION ALL

SELECT 'PersonIdentifier' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PersonIdentifier" 
WHERE "PersonIdentifier".identifier IS NULL

UNION ALL

SELECT 'PersonIdentifier' AS table_name, 'identifierType' AS column_name, 'enum' AS constraint_type, id AS record_id, "identifierType" AS invalid_value 
FROM "PersonIdentifier" 
WHERE "PersonIdentifier"."identifierType" IS NOT NULL AND ("PersonIdentifier"."identifierType" NOT IN ('ARNU', 'CCPT', 'CUST', 'DRLC', 'EMPL', 'NIDN', 'SOSE', 'TXID', 'NPID', 'PLID'))

UNION ALL

SELECT 'PartyRole' AS table_name, 'partyReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PartyRole" 
WHERE "PartyRole"."partyReference" IS NULL

UNION ALL

SELECT 'PartyRole' AS table_name, 'role' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PartyRole" 
WHERE "PartyRole".role IS NULL

UNION ALL

SELECT 'PartyRole' AS table_name, 'role' AS column_name, 'enum' AS constraint_type, id AS record_id, role AS invalid_value 
FROM "PartyRole" 
WHERE "PartyRole".role IS NOT NULL AND ("PartyRole".role NOT IN ('Accountant', 'AgentLender', 'AllocationAgent', 'ArrangingBroker', 'BarrierDeterminationAgent', 'BeneficialOwner', 'Beneficiary', 'BookingParty', 'Borrower', 'Buyer', 'BuyerDecisionMaker', 'Chargor', 'ClearingClient', 'ClearingExceptionParty', 'ClearingFirm', 'ClearingOrganization', 'Client', 'ClientDecisionMaker', 'ConfirmationPlatform', 'ContractualParty', 'CounterPartyAffiliate', 'CounterPartyUltimateParent', 'Counterparty', 'CreditSupportProvider', 'Custodian', 'DataSubmitter', 'DeterminingParty', 'DisputingParty', 'DocumentRepository', 'ExecutingBroker', 'ExecutingEntity', 'ExecutionAgent', 'ExecutionFacility', 'Guarantor', 'HedgingParty', 'Lender', 'MarginAffiliate', 'OrderTransmitter', 'Pledgor', 'PrimeBroker', 'PriorTradeRepository', 'PTRRServiceProvider', 'PublicationVenue', 'ReportingParty', 'ReportingPartyAffiliate', 'ReportingPartyUltimateParent', 'Seller', 'SellerDecisionMaker', 'SecuredParty', 'SettlementAgent', 'TradeRepository', 'TradeSource', 'TradingManager', 'TradingPartner', 'TripartyAgent', 'ThirdPartyCustodian'))

UNION ALL

SELECT 'TelephoneNumber' AS table_name, 'telephoneNumberType' AS column_name, 'enum' AS constraint_type, id AS record_id, "telephoneNumberType" AS invalid_value 
FROM "TelephoneNumber" 
WHERE "TelephoneNumber"."telephoneNumberType" IS NOT NULL AND ("TelephoneNumber"."telephoneNumberType" NOT IN ('Work', 'Mobile', 'Fax', 'Personal'))

UNION ALL

SELECT 'TelephoneNumber' AS table_name, 'number' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TelephoneNumber" 
WHERE "TelephoneNumber".number IS NULL

UNION ALL

SELECT 'AncillaryEntity' AS table_name, 'ancillaryParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "ancillaryParty" AS invalid_value 
FROM "AncillaryEntity" 
WHERE "AncillaryEntity"."ancillaryParty" IS NOT NULL AND ("AncillaryEntity"."ancillaryParty" NOT IN ('DisruptionEventsDeterminingParty', 'ExtraordinaryDividendsParty', 'PredeterminedClearingOrganizationParty', 'ExerciseNoticeReceiverPartyManual', 'ExerciseNoticeReceiverPartyOptionalEarlyTermination', 'ExerciseNoticeReceiverPartyCancelableProvision', 'ExerciseNoticeReceiverPartyExtendibleProvision', 'CalculationAgentIndependent', 'CalculationAgentOptionalEarlyTermination', 'CalculationAgentMandatoryEarlyTermination', 'CalculationAgentFallback'))

UNION ALL

SELECT 'BusinessEvent' AS table_name, 'intent' AS column_name, 'enum' AS constraint_type, id AS record_id, intent AS invalid_value 
FROM "BusinessEvent" 
WHERE "BusinessEvent".intent IS NOT NULL AND ("BusinessEvent".intent NOT IN ('Allocation', 'CashFlow', 'Clearing', 'Compression', 'ContractFormation', 'ContractTermsAmendment', 'CorporateActionAdjustment', 'CreditEvent', 'Decrease', 'EarlyTerminationProvision', 'Increase', 'IndexTransition', 'NotionalReset', 'NotionalStep', 'Novation', 'ObservationRecord', 'OptionExercise', 'OptionalExtension', 'OptionalCancellation', 'PortfolioRebalancing', 'PrincipalExchange', 'Reallocation', 'Repurchase'))

UNION ALL

SELECT 'BusinessEvent' AS table_name, 'corporateActionIntent' AS column_name, 'enum' AS constraint_type, id AS record_id, "corporateActionIntent" AS invalid_value 
FROM "BusinessEvent" 
WHERE "BusinessEvent"."corporateActionIntent" IS NOT NULL AND ("BusinessEvent"."corporateActionIntent" NOT IN ('CashDividend', 'StockDividend', 'StockSplit', 'ReverseStockSplit', 'SpinOff', 'Merger', 'Delisting', 'StockNameChange', 'StockIdentifierChange', 'RightsIssue', 'Takeover', 'StockReclassification', 'BonusIssue', 'ClassAction', 'EarlyRedemption', 'Liquidation', 'BankruptcyOrInsolvency', 'IssuerNationalization', 'Relisting', 'BespokeEvent'))

UNION ALL

SELECT 'CounterpartyPositionBusinessEvent' AS table_name, 'intent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CounterpartyPositionBusinessEvent" 
WHERE "CounterpartyPositionBusinessEvent".intent IS NULL

UNION ALL

SELECT 'CounterpartyPositionBusinessEvent' AS table_name, 'intent' AS column_name, 'enum' AS constraint_type, id AS record_id, intent AS invalid_value 
FROM "CounterpartyPositionBusinessEvent" 
WHERE "CounterpartyPositionBusinessEvent".intent IS NOT NULL AND ("CounterpartyPositionBusinessEvent".intent NOT IN ('PositionCreation', 'CorporateActionAdjustment', 'Decrease', 'Increase', 'Transfer', 'OptionExercise', 'Valuation'))

UNION ALL

SELECT 'CounterpartyPositionBusinessEvent' AS table_name, 'corporateActionIntent' AS column_name, 'enum' AS constraint_type, id AS record_id, "corporateActionIntent" AS invalid_value 
FROM "CounterpartyPositionBusinessEvent" 
WHERE "CounterpartyPositionBusinessEvent"."corporateActionIntent" IS NOT NULL AND ("CounterpartyPositionBusinessEvent"."corporateActionIntent" NOT IN ('CashDividend', 'StockDividend', 'StockSplit', 'ReverseStockSplit', 'SpinOff', 'Merger', 'Delisting', 'StockNameChange', 'StockIdentifierChange', 'RightsIssue', 'Takeover', 'StockReclassification', 'BonusIssue', 'ClassAction', 'EarlyRedemption', 'Liquidation', 'BankruptcyOrInsolvency', 'IssuerNationalization', 'Relisting', 'BespokeEvent'))

UNION ALL

SELECT 'ObservationInstruction' AS table_name, 'observationEvent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ObservationInstruction" 
WHERE "ObservationInstruction"."observationEvent" IS NULL

UNION ALL

SELECT 'ValuationInstruction' AS table_name, 'valuation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ValuationInstruction" 
WHERE "ValuationInstruction".valuation IS NULL

UNION ALL

SELECT 'ValuationInstruction' AS table_name, 'replace' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ValuationInstruction" 
WHERE "ValuationInstruction"."replace" IS NULL

UNION ALL

SELECT 'ExecutionInstruction' AS table_name, 'product' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExecutionInstruction" 
WHERE "ExecutionInstruction".product IS NULL

UNION ALL

SELECT 'ExecutionInstruction' AS table_name, 'priceQuantity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExecutionInstruction" 
WHERE "ExecutionInstruction"."priceQuantity" IS NULL

UNION ALL

SELECT 'ExecutionInstruction' AS table_name, 'counterparty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExecutionInstruction" 
WHERE "ExecutionInstruction".counterparty IS NULL

UNION ALL

SELECT 'ExecutionInstruction' AS table_name, 'parties' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExecutionInstruction" 
WHERE "ExecutionInstruction".parties IS NULL

UNION ALL

SELECT 'ExecutionInstruction' AS table_name, 'executionDetails' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExecutionInstruction" 
WHERE "ExecutionInstruction"."executionDetails" IS NULL

UNION ALL

SELECT 'ExecutionInstruction' AS table_name, 'tradeDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExecutionInstruction" 
WHERE "ExecutionInstruction"."tradeDate" IS NULL

UNION ALL

SELECT 'ExecutionInstruction' AS table_name, 'tradeIdentifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExecutionInstruction" 
WHERE "ExecutionInstruction"."tradeIdentifier" IS NULL

UNION ALL

SELECT 'ExerciseInstruction' AS table_name, 'exerciseQuantity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExerciseInstruction" 
WHERE "ExerciseInstruction"."exerciseQuantity" IS NULL

UNION ALL

SELECT 'ResetInstruction' AS table_name, 'payout' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ResetInstruction" 
WHERE "ResetInstruction".payout IS NULL

UNION ALL

SELECT 'ResetInstruction' AS table_name, 'resetDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ResetInstruction" 
WHERE "ResetInstruction"."resetDate" IS NULL

UNION ALL

SELECT 'CalculateTransferInstruction' AS table_name, 'tradeState' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculateTransferInstruction" 
WHERE "CalculateTransferInstruction"."tradeState" IS NULL

UNION ALL

SELECT 'CalculateTransferInstruction' AS table_name, 'payout' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculateTransferInstruction" 
WHERE "CalculateTransferInstruction".payout IS NULL

UNION ALL

SELECT 'QuantityChangeInstruction' AS table_name, 'change' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "QuantityChangeInstruction" 
WHERE "QuantityChangeInstruction".change IS NULL

UNION ALL

SELECT 'QuantityChangeInstruction' AS table_name, 'direction' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "QuantityChangeInstruction" 
WHERE "QuantityChangeInstruction".direction IS NULL

UNION ALL

SELECT 'QuantityChangeInstruction' AS table_name, 'direction' AS column_name, 'enum' AS constraint_type, id AS record_id, direction AS invalid_value 
FROM "QuantityChangeInstruction" 
WHERE "QuantityChangeInstruction".direction IS NOT NULL AND ("QuantityChangeInstruction".direction NOT IN ('Increase', 'Decrease', 'Replace'))

UNION ALL

SELECT 'IndexTransitionInstruction' AS table_name, 'priceQuantity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IndexTransitionInstruction" 
WHERE "IndexTransitionInstruction"."priceQuantity" IS NULL

UNION ALL

SELECT 'IndexTransitionInstruction' AS table_name, 'effectiveDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IndexTransitionInstruction" 
WHERE "IndexTransitionInstruction"."effectiveDate" IS NULL

UNION ALL

SELECT 'TermsChangeInstruction' AS table_name, 'adjustment' AS column_name, 'enum' AS constraint_type, id AS record_id, adjustment AS invalid_value 
FROM "TermsChangeInstruction" 
WHERE "TermsChangeInstruction".adjustment IS NOT NULL AND ("TermsChangeInstruction".adjustment NOT IN ('Execution', 'PortfolioRebalancing', 'Standard'))

UNION ALL

SELECT 'SplitInstruction' AS table_name, 'breakdown' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SplitInstruction" 
WHERE "SplitInstruction".breakdown IS NULL

UNION ALL

SELECT 'PartyChangeInstruction' AS table_name, 'counterparty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PartyChangeInstruction" 
WHERE "PartyChangeInstruction".counterparty IS NULL

UNION ALL

SELECT 'PartyChangeInstruction' AS table_name, 'tradeId' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PartyChangeInstruction" 
WHERE "PartyChangeInstruction"."tradeId" IS NULL

UNION ALL

SELECT 'TradeState' AS table_name, 'trade' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TradeState" 
WHERE "TradeState".trade IS NULL

UNION ALL

SELECT 'CounterpartyPositionState' AS table_name, 'counterpartyPosition' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CounterpartyPositionState" 
WHERE "CounterpartyPositionState"."counterpartyPosition" IS NULL

UNION ALL

SELECT 'Reset' AS table_name, 'resetValue' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Reset" 
WHERE "Reset"."resetValue" IS NULL

UNION ALL

SELECT 'Reset' AS table_name, 'resetDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Reset" 
WHERE "Reset"."resetDate" IS NULL

UNION ALL

SELECT 'Reset' AS table_name, 'observations' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Reset" 
WHERE "Reset".observations IS NULL

UNION ALL

SELECT 'State' AS table_name, 'positionState' AS column_name, 'enum' AS constraint_type, id AS record_id, "positionState" AS invalid_value 
FROM "State" 
WHERE "State"."positionState" IS NOT NULL AND ("State"."positionState" NOT IN ('Executed', 'Formed', 'Settled', 'Cancelled', 'Closed'))

UNION ALL

SELECT 'TransferState' AS table_name, 'transfer' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TransferState" 
WHERE "TransferState".transfer IS NULL

UNION ALL

SELECT 'TransferState' AS table_name, 'transferStatus' AS column_name, 'enum' AS constraint_type, id AS record_id, "transferStatus" AS invalid_value 
FROM "TransferState" 
WHERE "TransferState"."transferStatus" IS NOT NULL AND ("TransferState"."transferStatus" NOT IN ('Disputed', 'Instructed', 'Pending', 'Settled', 'Netted'))

UNION ALL

SELECT 'UnscheduledTransfer' AS table_name, 'transferType' AS column_name, 'enum' AS constraint_type, id AS record_id, "transferType" AS invalid_value 
FROM "UnscheduledTransfer" 
WHERE "UnscheduledTransfer"."transferType" IS NOT NULL AND ("UnscheduledTransfer"."transferType" NOT IN ('Recall', 'Return', 'Assignment', 'BrokerageCommission', 'Increase', 'Novation', 'PartialTermination', 'Premium', 'Renegotiation', 'Termination', 'Upfront', 'CreditEvent', 'CorporateAction'))

UNION ALL

SELECT 'UnscheduledTransfer' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "UnscheduledTransfer" 
WHERE "UnscheduledTransfer"."payerReceiver" IS NULL

UNION ALL

SELECT 'UnscheduledTransfer' AS table_name, 'quantity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "UnscheduledTransfer" 
WHERE "UnscheduledTransfer".quantity IS NULL

UNION ALL

SELECT 'UnscheduledTransfer' AS table_name, 'asset' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "UnscheduledTransfer" 
WHERE "UnscheduledTransfer".asset IS NULL

UNION ALL

SELECT 'UnscheduledTransfer' AS table_name, 'settlementDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "UnscheduledTransfer" 
WHERE "UnscheduledTransfer"."settlementDate" IS NULL

UNION ALL

SELECT 'ScheduledTransfer' AS table_name, 'transferType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ScheduledTransfer" 
WHERE "ScheduledTransfer"."transferType" IS NULL

UNION ALL

SELECT 'ScheduledTransfer' AS table_name, 'transferType' AS column_name, 'enum' AS constraint_type, id AS record_id, "transferType" AS invalid_value 
FROM "ScheduledTransfer" 
WHERE "ScheduledTransfer"."transferType" IS NOT NULL AND ("ScheduledTransfer"."transferType" NOT IN ('CorporateAction', 'Coupon', 'CreditEvent', 'DividendReturn', 'Exercise', 'FixedRateReturn', 'FloatingRateReturn', 'FractionalAmount', 'InterestReturn', 'NetInterest', 'Performance', 'Principal'))

UNION ALL

SELECT 'ScheduledTransfer' AS table_name, 'corporateActionTransferType' AS column_name, 'enum' AS constraint_type, id AS record_id, "corporateActionTransferType" AS invalid_value 
FROM "ScheduledTransfer" 
WHERE "ScheduledTransfer"."corporateActionTransferType" IS NOT NULL AND ("ScheduledTransfer"."corporateActionTransferType" NOT IN ('CashDividend', 'StockDividend', 'StockSplit', 'ReverseStockSplit', 'SpinOff', 'Merger', 'Delisting', 'StockNameChange', 'StockIdentifierChange', 'RightsIssue', 'Takeover', 'StockReclassification', 'BonusIssue', 'ClassAction', 'EarlyRedemption', 'Liquidation', 'BankruptcyOrInsolvency', 'IssuerNationalization', 'Relisting', 'BespokeEvent'))

UNION ALL

SELECT 'ScheduledTransfer' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ScheduledTransfer" 
WHERE "ScheduledTransfer"."payerReceiver" IS NULL

UNION ALL

SELECT 'ScheduledTransfer' AS table_name, 'quantity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ScheduledTransfer" 
WHERE "ScheduledTransfer".quantity IS NULL

UNION ALL

SELECT 'ScheduledTransfer' AS table_name, 'asset' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ScheduledTransfer" 
WHERE "ScheduledTransfer".asset IS NULL

UNION ALL

SELECT 'ScheduledTransfer' AS table_name, 'settlementDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ScheduledTransfer" 
WHERE "ScheduledTransfer"."settlementDate" IS NULL

UNION ALL

SELECT 'TransferBase' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TransferBase" 
WHERE "TransferBase"."payerReceiver" IS NULL

UNION ALL

SELECT 'TransferBase' AS table_name, 'quantity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TransferBase" 
WHERE "TransferBase".quantity IS NULL

UNION ALL

SELECT 'TransferBase' AS table_name, 'asset' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TransferBase" 
WHERE "TransferBase".asset IS NULL

UNION ALL

SELECT 'TransferBase' AS table_name, 'settlementDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TransferBase" 
WHERE "TransferBase"."settlementDate" IS NULL

UNION ALL

SELECT 'TradeIdentifier' AS table_name, 'identifierType' AS column_name, 'enum' AS constraint_type, id AS record_id, "identifierType" AS invalid_value 
FROM "TradeIdentifier" 
WHERE "TradeIdentifier"."identifierType" IS NOT NULL AND ("TradeIdentifier"."identifierType" NOT IN ('UniqueTransactionIdentifier', 'UniqueSwapIdentifier'))

UNION ALL

SELECT 'TradeIdentifier' AS table_name, 'assignedIdentifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TradeIdentifier" 
WHERE "TradeIdentifier"."assignedIdentifier" IS NULL

UNION ALL

SELECT 'PositionIdentifier' AS table_name, 'identifierType' AS column_name, 'enum' AS constraint_type, id AS record_id, "identifierType" AS invalid_value 
FROM "PositionIdentifier" 
WHERE "PositionIdentifier"."identifierType" IS NOT NULL AND ("PositionIdentifier"."identifierType" NOT IN ('UniqueTransactionIdentifier', 'UniqueSwapIdentifier'))

UNION ALL

SELECT 'PositionIdentifier' AS table_name, 'assignedIdentifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PositionIdentifier" 
WHERE "PositionIdentifier"."assignedIdentifier" IS NULL

UNION ALL

SELECT 'Valuation' AS table_name, 'amount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Valuation" 
WHERE "Valuation".amount IS NULL

UNION ALL

SELECT 'Valuation' AS table_name, 'timestamp' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Valuation" 
WHERE "Valuation".timestamp IS NULL

UNION ALL

SELECT 'Valuation' AS table_name, 'method' AS column_name, 'enum' AS constraint_type, id AS record_id, method AS invalid_value 
FROM "Valuation" 
WHERE "Valuation".method IS NOT NULL AND ("Valuation".method NOT IN ('MarkToMarket', 'MarkToModel'))

UNION ALL

SELECT 'Valuation' AS table_name, 'source' AS column_name, 'enum' AS constraint_type, id AS record_id, source AS invalid_value 
FROM "Valuation" 
WHERE "Valuation".source IS NOT NULL AND ("Valuation".source NOT IN ('CentralCounterparty'))

UNION ALL

SELECT 'Valuation' AS table_name, 'scope' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Valuation" 
WHERE "Valuation".scope IS NULL

UNION ALL

SELECT 'Valuation' AS table_name, 'scope' AS column_name, 'enum' AS constraint_type, id AS record_id, scope AS invalid_value 
FROM "Valuation" 
WHERE "Valuation".scope IS NOT NULL AND ("Valuation".scope NOT IN ('Collateral', 'Trade'))

UNION ALL

SELECT 'Valuation' AS table_name, 'valuationTiming' AS column_name, 'enum' AS constraint_type, id AS record_id, "valuationTiming" AS invalid_value 
FROM "Valuation" 
WHERE "Valuation"."valuationTiming" IS NOT NULL AND ("Valuation"."valuationTiming" NOT IN ('ClosingPrice', 'OpeningPrice'))

UNION ALL

SELECT 'Trade' AS table_name, 'tradeIdentifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Trade" 
WHERE "Trade"."tradeIdentifier" IS NULL

UNION ALL

SELECT 'Trade' AS table_name, 'tradeDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Trade" 
WHERE "Trade"."tradeDate" IS NULL

UNION ALL

SELECT 'Trade' AS table_name, 'product' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Trade" 
WHERE "Trade".product IS NULL

UNION ALL

SELECT 'Trade' AS table_name, 'tradeLot' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Trade" 
WHERE "Trade"."tradeLot" IS NULL

UNION ALL

SELECT 'Trade' AS table_name, 'counterparty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Trade" 
WHERE "Trade".counterparty IS NULL

UNION ALL

SELECT 'Trade' AS table_name, 'adjustment' AS column_name, 'enum' AS constraint_type, id AS record_id, adjustment AS invalid_value 
FROM "Trade" 
WHERE "Trade".adjustment IS NOT NULL AND ("Trade".adjustment NOT IN ('Execution', 'PortfolioRebalancing', 'Standard'))

UNION ALL

SELECT 'ExecutionDetails' AS table_name, 'executionType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExecutionDetails" 
WHERE "ExecutionDetails"."executionType" IS NULL

UNION ALL

SELECT 'ExecutionDetails' AS table_name, 'executionType' AS column_name, 'enum' AS constraint_type, id AS record_id, "executionType" AS invalid_value 
FROM "ExecutionDetails" 
WHERE "ExecutionDetails"."executionType" IS NOT NULL AND ("ExecutionDetails"."executionType" NOT IN ('Electronic', 'OffFacility', 'OnVenue'))

UNION ALL

SELECT 'ContractDetails' AS table_name, 'governingLaw' AS column_name, 'enum' AS constraint_type, id AS record_id, "governingLaw" AS invalid_value 
FROM "ContractDetails" 
WHERE "ContractDetails"."governingLaw" IS NOT NULL AND ("ContractDetails"."governingLaw" NOT IN ('AsSpecifiedInMasterAgreement', 'BE', 'CAAB', 'CABC', 'CAMN', 'CAON', 'CAQC', 'DE', 'FR', 'GBEN', 'GBGY', 'GBIM', 'GBJY', 'GBSC', 'IE', 'JP', 'LU', 'RelatedMasterAgreement', 'USCA', 'USDE', 'USIL', 'USNY'))

UNION ALL

SELECT 'StockSplitInstruction' AS table_name, 'adjustmentRatio' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "StockSplitInstruction" 
WHERE "StockSplitInstruction"."adjustmentRatio" IS NULL

UNION ALL

SELECT 'StockSplitInstruction' AS table_name, 'effectiveDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "StockSplitInstruction" 
WHERE "StockSplitInstruction"."effectiveDate" IS NULL

UNION ALL

SELECT 'CreditEvent' AS table_name, 'creditEventType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditEvent" 
WHERE "CreditEvent"."creditEventType" IS NULL

UNION ALL

SELECT 'CreditEvent' AS table_name, 'creditEventType' AS column_name, 'enum' AS constraint_type, id AS record_id, "creditEventType" AS invalid_value 
FROM "CreditEvent" 
WHERE "CreditEvent"."creditEventType" IS NOT NULL AND ("CreditEvent"."creditEventType" NOT IN ('Bankruptcy', 'DistressedRatingsDowngrade', 'FailureToPay', 'FailureToPayInterest', 'FailureToPayPrincipal', 'GovernmentalIntervention', 'ImpliedWritedown', 'MaturityExtension', 'ObligationAcceleration', 'ObligationDefault', 'RepudiationMoratorium', 'Restructuring', 'Writedown'))

UNION ALL

SELECT 'CreditEvent' AS table_name, 'eventDeterminationDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditEvent" 
WHERE "CreditEvent"."eventDeterminationDate" IS NULL

UNION ALL

SELECT 'CreditEvent' AS table_name, 'referenceInformation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditEvent" 
WHERE "CreditEvent"."referenceInformation" IS NULL

UNION ALL

SELECT 'CorporateAction' AS table_name, 'corporateActionType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CorporateAction" 
WHERE "CorporateAction"."corporateActionType" IS NULL

UNION ALL

SELECT 'CorporateAction' AS table_name, 'corporateActionType' AS column_name, 'enum' AS constraint_type, id AS record_id, "corporateActionType" AS invalid_value 
FROM "CorporateAction" 
WHERE "CorporateAction"."corporateActionType" IS NOT NULL AND ("CorporateAction"."corporateActionType" NOT IN ('CashDividend', 'StockDividend', 'StockSplit', 'ReverseStockSplit', 'SpinOff', 'Merger', 'Delisting', 'StockNameChange', 'StockIdentifierChange', 'RightsIssue', 'Takeover', 'StockReclassification', 'BonusIssue', 'ClassAction', 'EarlyRedemption', 'Liquidation', 'BankruptcyOrInsolvency', 'IssuerNationalization', 'Relisting', 'BespokeEvent'))

UNION ALL

SELECT 'CorporateAction' AS table_name, 'exDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CorporateAction" 
WHERE "CorporateAction"."exDate" IS NULL

UNION ALL

SELECT 'CorporateAction' AS table_name, 'payDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CorporateAction" 
WHERE "CorporateAction"."payDate" IS NULL

UNION ALL

SELECT 'CorporateAction' AS table_name, 'underlier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CorporateAction" 
WHERE "CorporateAction".underlier IS NULL

UNION ALL

SELECT 'AdjustmentFactor' AS table_name, 'value' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AdjustmentFactor" 
WHERE "AdjustmentFactor".value IS NULL

UNION ALL

SELECT 'AccrualFactor' AS table_name, 'value' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AccrualFactor" 
WHERE "AccrualFactor".value IS NULL

UNION ALL

SELECT 'AccrualFactorCalculationTerms' AS table_name, 'tenorTillMaturity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AccrualFactorCalculationTerms" 
WHERE "AccrualFactorCalculationTerms"."tenorTillMaturity" IS NULL

UNION ALL

SELECT 'AccrualFactorCalculationTerms' AS table_name, 'dayCountFraction' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AccrualFactorCalculationTerms" 
WHERE "AccrualFactorCalculationTerms"."dayCountFraction" IS NULL

UNION ALL

SELECT 'AccrualFactorCalculationTerms' AS table_name, 'dayCountFraction' AS column_name, 'enum' AS constraint_type, id AS record_id, "dayCountFraction" AS invalid_value 
FROM "AccrualFactorCalculationTerms" 
WHERE "AccrualFactorCalculationTerms"."dayCountFraction" IS NOT NULL AND ("AccrualFactorCalculationTerms"."dayCountFraction" NOT IN ('ACT_360', 'ACT_365L', 'ACT_364', 'ACT_365_FIXED', 'ACT_ACT_AFB', 'ACT_ACT_ICMA', 'ACT_ACT_ISDA', 'ACT_ACT_ISMA', 'CAL_252', '_1_1', '_30E_360', '_30E_360_ISDA', '_30_360', 'RBA_BOND_BASIS'))

UNION ALL

SELECT 'SpinOff' AS table_name, 'parentSecurity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SpinOff" 
WHERE "SpinOff"."parentSecurity" IS NULL

UNION ALL

SELECT 'SpinOff' AS table_name, 'parentSecurityPrice' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SpinOff" 
WHERE "SpinOff"."parentSecurityPrice" IS NULL

UNION ALL

SELECT 'SpinOff' AS table_name, 'childSecurity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SpinOff" 
WHERE "SpinOff"."childSecurity" IS NULL

UNION ALL

SELECT 'SpinOff' AS table_name, 'childSecurityPrice' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SpinOff" 
WHERE "SpinOff"."childSecurityPrice" IS NULL

UNION ALL

SELECT 'Merger' AS table_name, 'purchaserSecurity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Merger" 
WHERE "Merger"."purchaserSecurity" IS NULL

UNION ALL

SELECT 'Merger' AS table_name, 'purchaserSecurityPrice' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Merger" 
WHERE "Merger"."purchaserSecurityPrice" IS NULL

UNION ALL

SELECT 'Merger' AS table_name, 'acquiredSecurity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Merger" 
WHERE "Merger"."acquiredSecurity" IS NULL

UNION ALL

SELECT 'Merger' AS table_name, 'acquiredSecurityPrice' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Merger" 
WHERE "Merger"."acquiredSecurityPrice" IS NULL

UNION ALL

SELECT 'ClearingInstruction' AS table_name, 'alphaContract' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ClearingInstruction" 
WHERE "ClearingInstruction"."alphaContract" IS NULL

UNION ALL

SELECT 'ClearingInstruction' AS table_name, 'clearingParty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ClearingInstruction" 
WHERE "ClearingInstruction"."clearingParty" IS NULL

UNION ALL

SELECT 'ClearingInstruction' AS table_name, 'party1' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ClearingInstruction" 
WHERE "ClearingInstruction".party1 IS NULL

UNION ALL

SELECT 'ClearingInstruction' AS table_name, 'party2' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ClearingInstruction" 
WHERE "ClearingInstruction".party2 IS NULL

UNION ALL

SELECT 'ExerciseEvent' AS table_name, 'adjustedExerciseDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExerciseEvent" 
WHERE "ExerciseEvent"."adjustedExerciseDate" IS NULL

UNION ALL

SELECT 'ExerciseEvent' AS table_name, 'adjustedRelevantSwapEffectiveDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExerciseEvent" 
WHERE "ExerciseEvent"."adjustedRelevantSwapEffectiveDate" IS NULL

UNION ALL

SELECT 'ReturnInstruction' AS table_name, 'quantity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ReturnInstruction" 
WHERE "ReturnInstruction".quantity IS NULL

UNION ALL

SELECT 'SecurityLendingInvoice' AS table_name, 'sendingParty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecurityLendingInvoice" 
WHERE "SecurityLendingInvoice"."sendingParty" IS NULL

UNION ALL

SELECT 'SecurityLendingInvoice' AS table_name, 'receivingParty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecurityLendingInvoice" 
WHERE "SecurityLendingInvoice"."receivingParty" IS NULL

UNION ALL

SELECT 'SecurityLendingInvoice' AS table_name, 'billingStartDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecurityLendingInvoice" 
WHERE "SecurityLendingInvoice"."billingStartDate" IS NULL

UNION ALL

SELECT 'SecurityLendingInvoice' AS table_name, 'billingEndDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecurityLendingInvoice" 
WHERE "SecurityLendingInvoice"."billingEndDate" IS NULL

UNION ALL

SELECT 'SecurityLendingInvoice' AS table_name, 'billingRecord' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecurityLendingInvoice" 
WHERE "SecurityLendingInvoice"."billingRecord" IS NULL

UNION ALL

SELECT 'SecurityLendingInvoice' AS table_name, 'billingSummary' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecurityLendingInvoice" 
WHERE "SecurityLendingInvoice"."billingSummary" IS NULL

UNION ALL

SELECT 'BillingInstruction' AS table_name, 'sendingParty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingInstruction" 
WHERE "BillingInstruction"."sendingParty" IS NULL

UNION ALL

SELECT 'BillingInstruction' AS table_name, 'receivingParty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingInstruction" 
WHERE "BillingInstruction"."receivingParty" IS NULL

UNION ALL

SELECT 'BillingInstruction' AS table_name, 'billingStartDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingInstruction" 
WHERE "BillingInstruction"."billingStartDate" IS NULL

UNION ALL

SELECT 'BillingInstruction' AS table_name, 'billingEndDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingInstruction" 
WHERE "BillingInstruction"."billingEndDate" IS NULL

UNION ALL

SELECT 'BillingInstruction' AS table_name, 'billingRecordInstruction' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingInstruction" 
WHERE "BillingInstruction"."billingRecordInstruction" IS NULL

UNION ALL

SELECT 'BillingRecordInstruction' AS table_name, 'tradeState' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingRecordInstruction" 
WHERE "BillingRecordInstruction"."tradeState" IS NULL

UNION ALL

SELECT 'BillingRecordInstruction' AS table_name, 'observation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingRecordInstruction" 
WHERE "BillingRecordInstruction".observation IS NULL

UNION ALL

SELECT 'BillingRecordInstruction' AS table_name, 'recordStartDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingRecordInstruction" 
WHERE "BillingRecordInstruction"."recordStartDate" IS NULL

UNION ALL

SELECT 'BillingRecordInstruction' AS table_name, 'recordEndDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingRecordInstruction" 
WHERE "BillingRecordInstruction"."recordEndDate" IS NULL

UNION ALL

SELECT 'BillingRecordInstruction' AS table_name, 'settlementDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingRecordInstruction" 
WHERE "BillingRecordInstruction"."settlementDate" IS NULL

UNION ALL

SELECT 'BillingSummaryInstruction' AS table_name, 'summaryAmountType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingSummaryInstruction" 
WHERE "BillingSummaryInstruction"."summaryAmountType" IS NULL

UNION ALL

SELECT 'BillingSummaryInstruction' AS table_name, 'summaryAmountType' AS column_name, 'enum' AS constraint_type, id AS record_id, "summaryAmountType" AS invalid_value 
FROM "BillingSummaryInstruction" 
WHERE "BillingSummaryInstruction"."summaryAmountType" IS NOT NULL AND ("BillingSummaryInstruction"."summaryAmountType" NOT IN ('AccountTotal', 'GrandTotal', 'ParentTotal'))

UNION ALL

SELECT 'BillingRecord' AS table_name, 'tradeState' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingRecord" 
WHERE "BillingRecord"."tradeState" IS NULL

UNION ALL

SELECT 'BillingRecord' AS table_name, 'recordTransfer' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingRecord" 
WHERE "BillingRecord"."recordTransfer" IS NULL

UNION ALL

SELECT 'BillingRecord' AS table_name, 'recordStartDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingRecord" 
WHERE "BillingRecord"."recordStartDate" IS NULL

UNION ALL

SELECT 'BillingRecord' AS table_name, 'recordEndDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingRecord" 
WHERE "BillingRecord"."recordEndDate" IS NULL

UNION ALL

SELECT 'BillingSummary' AS table_name, 'summaryAmountType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BillingSummary" 
WHERE "BillingSummary"."summaryAmountType" IS NULL

UNION ALL

SELECT 'BillingSummary' AS table_name, 'summaryAmountType' AS column_name, 'enum' AS constraint_type, id AS record_id, "summaryAmountType" AS invalid_value 
FROM "BillingSummary" 
WHERE "BillingSummary"."summaryAmountType" IS NOT NULL AND ("BillingSummary"."summaryAmountType" NOT IN ('AccountTotal', 'GrandTotal', 'ParentTotal'))

UNION ALL

SELECT 'TradePricingReport' AS table_name, 'trade' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TradePricingReport" 
WHERE "TradePricingReport".trade IS NULL

UNION ALL

SELECT 'TradePricingReport' AS table_name, 'pricingTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TradePricingReport" 
WHERE "TradePricingReport"."pricingTime" IS NULL

UNION ALL

SELECT 'TradePricingReport' AS table_name, 'discountingIndex' AS column_name, 'enum' AS constraint_type, id AS record_id, "discountingIndex" AS invalid_value 
FROM "TradePricingReport" 
WHERE "TradePricingReport"."discountingIndex" IS NOT NULL AND ("TradePricingReport"."discountingIndex" NOT IN ('AED_EBOR_Reuters', 'AED_EIBOR', 'AUD_AONIA', 'AUD_AONIA_OIS_Compound_1', 'AUD_AONIA_OIS_COMPOUND', 'AUD_AONIA_OIS_COMPOUND_SwapMarker', 'AUD_BBR_AUBBSW', 'AUD_BBR_BBSW', 'AUD_BBR_BBSW_Bloomberg', 'AUD_BBR_BBSY__BID_', 'AUD_BBR_ISDC', 'AUD_BBSW', 'AUD_BBSW_Quarterly_Swap_Rate_ICAP', 'AUD_BBSW_Semi_Annual_Swap_Rate_ICAP', 'AUD_BBSY_Bid', 'AUD_LIBOR_BBA', 'AUD_LIBOR_BBA_Bloomberg', 'AUD_LIBOR_Reference_Banks', 'AUD_Quarterly_Swap_Rate_ICAP', 'AUD_Quarterly_Swap_Rate_ICAP_Reference_Banks', 'AUD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'AUD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'AUD_Semi_annual_Swap_Rate_ICAP', 'AUD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'AUD_Swap_Rate_Reuters', 'BRL_CDI', 'CAD_BA_CDOR', 'CAD_BA_CDOR_Bloomberg', 'CAD_BA_ISDD', 'CAD_BA_Reference_Banks', 'CAD_BA_Reuters', 'CAD_BA_Telerate', 'CAD_CDOR', 'CAD_CORRA', 'CAD_CORRA_CanDeal_TMX_Term', 'CAD_CORRA_Compounded_Index', 'CAD_CORRA_OIS_Compound_1', 'CAD_CORRA_OIS_COMPOUND', 'CAD_ISDA_Swap_Rate', 'CAD_LIBOR_BBA', 'CAD_LIBOR_BBA_Bloomberg', 'CAD_LIBOR_BBA_SwapMarker', 'CAD_LIBOR_Reference_Banks', 'CAD_REPO_CORRA', 'CAD_TBILL_ISDD', 'CAD_TBILL_Reference_Banks', 'CAD_TBILL_Reuters', 'CAD_TBILL_Telerate', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_6M_LIBORSWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_Annual_Swap_Rate', 'CHF_Annual_Swap_Rate_11_00_ICAP', 'CHF_Annual_Swap_Rate_Reference_Banks', 'CHF_Basis_Swap_3m_vs_6m_LIBOR_11_00_ICAP', 'CHF_ISDAFIX_Swap_Rate', 'CHF_LIBOR', 'CHF_LIBOR_BBA', 'CHF_LIBOR_BBA_Bloomberg', 'CHF_LIBOR_ISDA', 'CHF_LIBOR_Reference_Banks', 'CHF_OIS_11_00_ICAP', 'CHF_SARON', 'CHF_SARON_Average_12M', 'CHF_SARON_Average_1M', 'CHF_SARON_Average_1W', 'CHF_SARON_Average_2M', 'CHF_SARON_Average_3M', 'CHF_SARON_Average_6M', 'CHF_SARON_Average_9M', 'CHF_SARON_Compounded_Index', 'CHF_SARON_OIS_Compound_1', 'CHF_SARON_OIS_COMPOUND', 'CHF_TOIS_OIS_COMPOUND', 'CHF_USD_Basis_Swaps_11_00_ICAP', 'CL_CLICP_Bloomberg', 'CLP_ICP', 'CLP_TNA', 'CNH_HIBOR', 'CNH_HIBOR_Reference_Banks', 'CNH_HIBOR_TMA', 'CNY_7_Repo_Compounding_Date', 'CNY_CNREPOFIX_CFXS_Reuters', 'CNY_Deposit_Rate', 'CNY_Fixing_Repo_Rate', 'CNY_LPR', 'CNY_PBOCB_Reuters', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION_Reference_Banks', 'CNY_Quarterly_7D_Repo_NDS_Rate_Tradition', 'CNY_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'CNY_Semi_Annual_Swap_Rate_Reference_Banks', 'CNY_SHIBOR', 'CNY_SHIBOR_OIS_Compound', 'CNY_Shibor_OIS_Compounding', 'CNY_SHIBOR_Reuters', 'COP_IBR_OIS_Compound_1', 'COP_IBR_OIS_COMPOUND', 'CZK_Annual_Swap_Rate_11_00_BGCANTOR', 'CZK_Annual_Swap_Rate_Reference_Banks', 'CZK_CZEONIA', 'CZK_CZEONIA_OIS_Compound', 'CZK_PRIBOR', 'CZK_PRIBOR_PRBO', 'CZK_PRIBOR_Reference_Banks', 'DKK_CIBOR', 'DKK_CIBOR2', 'DKK_CIBOR2_Bloomberg', 'DKK_CIBOR2_DKNA13', 'DKK_CIBOR_DKNA13', 'DKK_CIBOR_DKNA13_Bloomberg', 'DKK_CIBOR_Reference_Banks', 'DKK_CITA', 'DKK_CITA_DKNA14_COMPOUND', 'DKK_DESTR', 'DKK_DESTR_Compounded_Index', 'DKK_DESTR_OIS_Compound', 'DKK_DKKOIS_OIS_COMPOUND', 'DKK_Tom_Next_OIS_Compound', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_Annual_Swap_Rate_10_00', 'EUR_Annual_Swap_Rate_10_00_BGCANTOR', 'EUR_Annual_Swap_Rate_10_00_Bloomberg', 'EUR_Annual_Swap_Rate_10_00_ICAP', 'EUR_Annual_Swap_Rate_10_00_SwapMarker', 'EUR_Annual_Swap_Rate_10_00_TRADITION', 'EUR_Annual_Swap_Rate_11_00', 'EUR_Annual_Swap_Rate_11_00_Bloomberg', 'EUR_Annual_Swap_Rate_11_00_ICAP', 'EUR_Annual_Swap_Rate_11_00_SwapMarker', 'EUR_Annual_Swap_Rate_3_Month', 'EUR_Annual_Swap_Rate_3_Month_SwapMarker', 'EUR_Annual_Swap_Rate_4_15_TRADITION', 'EUR_Annual_Swap_Rate_Reference_Banks', 'EUR_Basis_Swap_EONIA_vs_3m_EUR_IBOR_Swap_Rates_A_360_10_00_ICAP', 'EUR_CNO_TEC10', 'EUR_EONIA', 'EUR_EONIA_AVERAGE_1', 'EUR_EONIA_Average', 'EUR_EONIA_OIS_10_00_BGCANTOR', 'EUR_EONIA_OIS_10_00_ICAP', 'EUR_EONIA_OIS_10_00_TRADITION', 'EUR_EONIA_OIS_11_00_ICAP', 'EUR_EONIA_OIS_4_15_TRADITION', 'EUR_EONIA_OIS_Compound_1', 'EUR_EONIA_OIS_COMPOUND', 'EUR_EONIA_OIS_COMPOUND_Bloomberg', 'EUR_EONIA_Swap_Index', 'EUR_EURIBOR', 'EUR_EURIBOR_Act_365', 'EUR_EURIBOR_Act_365_Bloomberg', 'EUR_EURIBOR_Annual_Bond_Swap_vs_1m_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_1m_vs_3m_Euribor_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_3m_vs_6m_11_00_ICAP', 'EUR_EURIBOR_ICE_Swap_Rate_11_00', 'EUR_EURIBOR_ICE_Swap_Rate_12_00', 'EUR_EURIBOR_Reference_Banks', 'EUR_EURIBOR_Reuters', 'EUR_EURIBOR_Telerate', 'EUR_EURONIA_OIS_Compound_1', 'EUR_EURONIA_OIS_COMPOUND', 'EUR_EuroSTR', 'EUR_EuroSTR_Average_12M', 'EUR_EuroSTR_Average_1M', 'EUR_EuroSTR_Average_1W', 'EUR_EuroSTR_Average_3M', 'EUR_EuroSTR_Average_6M', 'EUR_EuroSTR_COMPOUND', 'EUR_EuroSTR_Compounded_Index', 'EUR_EuroSTR_FTSE_Term', 'EUR_EuroSTR_ICE_Compounded_Index', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_5D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_5D_Lag', 'EUR_EuroSTR_ICE_Swap_Rate', 'EUR_EuroSTR_OIS_Compound', 'EUR_EuroSTR_Term', 'EUR_ISDA_EURIBOR_Swap_Rate_11_00', 'EUR_ISDA_EURIBOR_Swap_Rate_12_00', 'EUR_ISDA_LIBOR_Swap_Rate_10_00', 'EUR_ISDA_LIBOR_Swap_Rate_11_00', 'EUR_LIBOR', 'EUR_LIBOR_BBA', 'EUR_LIBOR_BBA_Bloomberg', 'EUR_LIBOR_Reference_Banks', 'EUR_TAM_CDC', 'EUR_TEC10_CNO', 'EUR_TEC10_CNO_SwapMarker', 'EUR_TEC10_Reference_Banks', 'EUR_TEC5_CNO', 'EUR_TEC5_CNO_SwapMarker', 'EUR_TEC5_Reference_Banks', 'EUR_TMM_CDC_COMPOUND', 'EUR_USD_Basis_Swaps_11_00_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'GBP_ISDA_Swap_Rate', 'GBP_LIBOR', 'GBP_LIBOR_BBA', 'GBP_LIBOR_BBA_Bloomberg', 'GBP_LIBOR_ICE_Swap_Rate', 'GBP_LIBOR_ISDA', 'GBP_LIBOR_Reference_Banks', 'GBP_RONIA', 'GBP_RONIA_OIS_Compound', 'GBP_Semi_Annual_Swap_Rate', 'GBP_Semi_Annual_Swap_Rate_11_00_ICAP', 'GBP_Semi_Annual_Swap_Rate_11_00_TRADITION', 'GBP_Semi_Annual_Swap_Rate_4_15_TRADITION', 'GBP_Semi_Annual_Swap_Rate_Reference_Banks', 'GBP_Semi_Annual_Swap_Rate_SwapMarker26', 'GBP_SONIA', 'GBP_SONIA_COMPOUND', 'GBP_SONIA_Compounded_Index', 'GBP_SONIA_FTSE_Term', 'GBP_SONIA_ICE_Compounded_Index', 'GBP_SONIA_ICE_Compounded_Index_0_Floor', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_5D_Lag', 'GBP_SONIA_ICE_Compounded_Index_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_5D_Lag', 'GBP_SONIA_ICE_Swap_Rate', 'GBP_SONIA_ICE_Term', 'GBP_SONIA_OIS_11_00_ICAP', 'GBP_SONIA_OIS_11_00_TRADITION', 'GBP_SONIA_OIS_4_15_TRADITION', 'GBP_SONIA_OIS_Compound', 'GBP_SONIA_Swap_Rate', 'GBP_UK_Base_Rate', 'GBP_USD_Basis_Swaps_11_00_ICAP', 'GBP_WMBA_RONIA_COMPOUND', 'GBP_WMBA_SONIA_COMPOUND', 'GRD_ATHIBOR_ATHIBOR', 'GRD_ATHIBOR_Reference_Banks', 'GRD_ATHIBOR_Telerate', 'GRD_ATHIMID_Reference_Banks', 'GRD_ATHIMID_Reuters', 'HKD_HIBOR', 'HKD_HIBOR_HIBOR_', 'HKD_HIBOR_HIBOR_Bloomberg', 'HKD_HIBOR_HKAB', 'HKD_HIBOR_HKAB_Bloomberg', 'HKD_HIBOR_ISDC', 'HKD_HIBOR_Reference_Banks', 'HKD_HONIA', 'HKD_HONIA_OIS_Compound', 'HKD_HONIX_OIS_COMPOUND', 'HKD_ISDA_Swap_Rate_11_00', 'HKD_ISDA_Swap_Rate_4_00', 'HKD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_11_00_TRADITION', 'HKD_Quarterly_Annual_Swap_Rate_4_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'HKD_Quarterly_Quarterly_Swap_Rate_11_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_4_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_Reference_Banks', 'HUF_BUBOR', 'HUF_BUBOR_Reference_Banks', 'HUF_BUBOR_Reuters', 'HUF_HUFONIA', 'HUF_HUFONIA_OIS_Compound', 'IDR_IDMA_Bloomberg', 'IDR_IDRFIX', 'IDR_INDONIA', 'IDR_INDONIA_OIS_Compound', 'IDR_JIBOR', 'IDR_JIBOR_Reuters', 'IDR_SBI_Reuters', 'IDR_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'IDR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'IDR_Semi_Annual_Swap_Rate_Reference_Banks', 'IDR_SOR_Reference_Banks', 'IDR_SOR_Reuters', 'IDR_SOR_Telerate', 'ILS_SHIR', 'ILS_SHIR_OIS_Compound', 'ILS_TELBOR', 'ILS_TELBOR01_Reuters', 'ILS_TELBOR_Reference_Banks', 'INR_BMK', 'INR_CMT', 'INR_FBIL_MIBOR_OIS_COMPOUND', 'INR_INBMK_REUTERS', 'INR_MIBOR', 'INR_MIBOR_OIS', 'INR_MIBOR_OIS_Compound_1', 'INR_MIBOR_OIS_COMPOUND', 'INR_MIFOR', 'INR_MIOIS', 'INR_MITOR_OIS_COMPOUND', 'INR_Modified_MIFOR', 'INR_Reference_Banks', 'INR_Semi_Annual_Swap_Rate_11_30_BGCANTOR', 'INR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'INR_Semi_Annual_Swap_Rate_Reference_Banks', 'INR_SORR', 'INR_SORR_OIS_Compound', 'ISK_REIBOR', 'ISK_REIBOR_Reference_Banks', 'ISK_REIBOR_Reuters', 'JPY_Annual_Swap_Rate_11_00_TRADITION', 'JPY_Annual_Swap_Rate_3_00_TRADITION', 'JPY_BBSF_Bloomberg_10_00', 'JPY_BBSF_Bloomberg_15_00', 'JPY_Euroyen_TIBOR', 'JPY_ISDA_Swap_Rate_10_00', 'JPY_ISDA_Swap_Rate_15_00', 'JPY_LIBOR', 'JPY_LIBOR_BBA', 'JPY_LIBOR_BBA_Bloomberg', 'JPY_LIBOR_FRASETT', 'JPY_LIBOR_ISDA', 'JPY_LIBOR_Reference_Banks', 'JPY_LIBOR_TSR_10_00', 'JPY_LIBOR_TSR_15_00', 'JPY_LTPR_MHBK', 'JPY_LTPR_MHCB', 'JPY_LTPR_TBC', 'JPY_MUTANCALL_TONAR', 'JPY_OIS_11_00_ICAP', 'JPY_OIS_11_00_TRADITION', 'JPY_OIS_3_00_TRADITION', 'JPY_Quoting_Banks_LIBOR', 'JPY_STPR_Quoting_Banks', 'JPY_TIBOR', 'JPY_TIBOR_17096', 'JPY_TIBOR_17097', 'JPY_TIBOR_DTIBOR01', 'JPY_TIBOR_TIBM', 'JPY_TIBOR_TIBM__10_Banks_', 'JPY_TIBOR_TIBM__5_Banks_', 'JPY_TIBOR_TIBM__All_Banks_', 'JPY_TIBOR_TIBM__All_Banks__Bloomberg', 'JPY_TIBOR_TIBM_Reference_Banks', 'JPY_TIBOR_ZTIBOR', 'JPY_TONA', 'JPY_TONA_Average_180D', 'JPY_TONA_Average_30D', 'JPY_TONA_Average_90D', 'JPY_TONA_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index_0_Floor', 'JPY_TONA_ICE_Compounded_Index_0_Floor_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_0_Floor_5D_Lag', 'JPY_TONA_ICE_Compounded_Index_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_5D_Lag', 'JPY_TONA_OIS_Compound_1', 'JPY_TONA_OIS_COMPOUND', 'JPY_TONA_TSR_10_00', 'JPY_TONA_TSR_15_00', 'JPY_TORF_QUICK', 'JPY_TSR_Reference_Banks', 'JPY_TSR_Reuters_10_00', 'JPY_TSR_Reuters_15_00', 'JPY_TSR_Telerate_10_00', 'JPY_TSR_Telerate_15_00', 'JPY_USD_Basis_Swaps_11_00_ICAP', 'KRW_Bond_3222', 'KRW_CD_3220', 'KRW_CD_91D', 'KRW_CD_KSDA_Bloomberg', 'KRW_KOFR', 'KRW_KOFR_OIS_Compound', 'KRW_Quarterly_Annual_Swap_Rate_3_30_ICAP', 'MXN_TIIE', 'MXN_TIIE_Banxico', 'MXN_TIIE_Banxico_Bloomberg', 'MXN_TIIE_Banxico_Reference_Banks', 'MXN_TIIE_ON', 'MXN_TIIE_ON_OIS_Compound', 'MXN_TIIE_Reference_Banks', 'MYR_KLIBOR', 'MYR_KLIBOR_BNM', 'MYR_KLIBOR_Reference_Banks', 'MYR_MYOR', 'MYR_MYOR_OIS_Compound', 'MYR_Quarterly_Swap_Rate_11_00_TRADITION', 'MYR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'NOK_NIBOR', 'NOK_NIBOR_NIBR', 'NOK_NIBOR_NIBR_Bloomberg', 'NOK_NIBOR_NIBR_Reference_Banks', 'NOK_NIBOR_OIBOR', 'NOK_NIBOR_Reference_Banks', 'NOK_NOWA', 'NOK_NOWA_OIS_Compound', 'NZD_BBR_BID', 'NZD_BBR_FRA', 'NZD_BBR_ISDC', 'NZD_BBR_Reference_Banks', 'NZD_BBR_Telerate', 'NZD_BKBM_Bid', 'NZD_BKBM_FRA', 'NZD_BKBM_FRA_Swap_Rate_ICAP', 'NZD_NZIONA', 'NZD_NZIONA_OIS_Compound_1', 'NZD_NZIONA_OIS_COMPOUND', 'NZD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'NZD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'NZD_Swap_Rate_ICAP', 'NZD_Swap_Rate_ICAP_Reference_Banks', 'PHP_ORR', 'PHP_PHIREF', 'PHP_PHIREF_BAP', 'PHP_PHIREF_Bloomberg', 'PHP_PHIREF_Reference_Banks', 'PHP_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'PHP_Semi_Annual_Swap_Rate_Reference_Banks', 'PLN_POLONIA', 'PLN_POLONIA_OIS_Compound_1', 'PLN_POLONIA_OIS_COMPOUND', 'PLN_POLSTR', 'PLN_POLSTR_OIS_Compound', 'PLN_WIBID', 'PLN_WIBOR', 'PLN_WIBOR_Reference_Banks', 'PLN_WIBOR_WIBO', 'PLN_WIRON', 'PLN_WIRON_OIS_Compound', 'PLZ_WIBOR_Reference_Banks', 'PLZ_WIBOR_WIBO', 'REPOFUNDS_RATE_FRANCE_OIS_COMPOUND', 'REPOFUNDS_RATE_GERMANY_OIS_COMPOUND', 'REPOFUNDS_RATE_ITALY_OIS_COMPOUND', 'RON_Annual_Swap_Rate_11_00_BGCANTOR', 'RON_Annual_Swap_Rate_Reference_Banks', 'RON_RBOR_Reuters', 'RON_ROBID', 'RON_ROBOR', 'RUB_Annual_Swap_Rate_11_00_BGCANTOR', 'RUB_Annual_Swap_Rate_12_45_TRADITION', 'RUB_Annual_Swap_Rate_4_15_TRADITION', 'RUB_Annual_Swap_Rate_Reference_Banks', 'RUB_Annual_Swap_Rate_TRADITION_Reference_Banks', 'RUB_Key_Rate_CBRF', 'RUB_MosPrime', 'RUB_MOSPRIME_NFEA', 'RUB_MOSPRIME_Reference_Banks', 'RUB_RUONIA', 'RUB_RUONIA_OIS_Compound_1', 'RUB_RUONIA_OIS_COMPOUND', 'SAR_SAIBOR', 'SAR_SRIOR_Reference_Banks', 'SAR_SRIOR_SUAA', 'SEK_Annual_Swap_Rate', 'SEK_Annual_Swap_Rate_SESWFI', 'SEK_SIOR_OIS_COMPOUND', 'SEK_STIBOR', 'SEK_STIBOR_Bloomberg', 'SEK_STIBOR_OIS_Compound', 'SEK_STIBOR_Reference_Banks', 'SEK_STIBOR_SIDE', 'SEK_SWESTR', 'SEK_SWESTR_Average_1M', 'SEK_SWESTR_Average_1W', 'SEK_SWESTR_Average_2M', 'SEK_SWESTR_Average_3M', 'SEK_SWESTR_Average_6M', 'SEK_SWESTR_Compounded_Index', 'SEK_SWESTR_OIS_Compound', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'SGD_Semi_Annual_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_TRADITION', 'SGD_Semi_Annual_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_ICAP', 'SGD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'SGD_SIBOR', 'SGD_SIBOR_Reference_Banks', 'SGD_SIBOR_Reuters', 'SGD_SIBOR_Telerate', 'SGD_SONAR_OIS_COMPOUND', 'SGD_SONAR_OIS_VWAP_COMPOUND', 'SGD_SOR', 'SGD_SORA', 'SGD_SORA_COMPOUND', 'SGD_SORA_OIS_Compound', 'SGD_SOR_Reference_Banks', 'SGD_SOR_Reuters', 'SGD_SOR_Telerate', 'SGD_SOR_VWAP', 'SGD_SOR_VWAP_Reference_Banks', 'SKK_BRIBOR_Bloomberg', 'SKK_BRIBOR_BRBO', 'SKK_BRIBOR_NBSK07', 'SKK_BRIBOR_Reference_Banks', 'THB_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'THB_Semi_Annual_Swap_Rate_Reference_Banks', 'THB_SOR_Reference_Banks', 'THB_SOR_Reuters', 'THB_SOR_Telerate', 'THB_THBFIX', 'THB_THBFIX_Reference_Banks', 'THB_THBFIX_Reuters', 'THB_THOR', 'THB_THOR_COMPOUND', 'THB_THOR_OIS_Compound', 'TRY_Annual_Swap_Rate_11_00_TRADITION', 'TRY_Annual_Swap_Rate_11_15_BGCANTOR', 'TRY_Annual_Swap_Rate_Reference_Banks', 'TRY_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'TRY_TLREF', 'TRY_TLREF_OIS_Compound_1', 'TRY_TLREF_OIS_COMPOUND', 'TRY_TRLIBOR', 'TRY_TRYIBOR_Reference_Banks', 'TRY_TRYIBOR_Reuters', 'TWD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'TWD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'TWD_Reference_Dealers', 'TWD_Reuters_6165', 'TWD_TAIBIR01', 'TWD_TAIBIR02', 'TWD_TAIBOR', 'TWD_TAIBOR_Bloomberg', 'TWD_TAIBOR_Reuters', 'TWD_Telerate_6165', 'TWD_TWCPBA', 'UK_Base_Rate', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_AMERIBOR', 'USD_AMERIBOR_Average_30D', 'USD_AMERIBOR_Average_90D', 'USD_AMERIBOR_Term', 'USD_AMERIBOR_Term_Structure', 'USD_Annual_Swap_Rate_11_00_BGCANTOR', 'USD_Annual_Swap_Rate_11_00_TRADITION', 'USD_Annual_Swap_Rate_4_00_TRADITION', 'USD_AXI_Term', 'USD_BA_H_15', 'USD_BA_Reference_Dealers', 'USD_BMA_Municipal_Swap_Index', 'USD_BSBY', 'USD_CD_H_15', 'USD_CD_Reference_Dealers', 'USD_CMS_Reference_Banks', 'USD_CMS_Reference_Banks_ICAP_SwapPX', 'USD_CMS_Reuters', 'USD_CMS_Telerate', 'USD_CMT', 'USD_CMT_Average_1W', 'USD_CMT_T7051', 'USD_CMT_T7052', 'USD_COF11_FHLBSF', 'USD_COF11_Reuters', 'USD_COF11_Telerate', 'USD_COFI', 'USD_CP_H_15', 'USD_CP_Money_Market_Yield', 'USD_CP_Reference_Dealers', 'USD_CRITR', 'USD_Federal_Funds', 'USD_Federal_Funds_H_15', 'USD_Federal_Funds_H_15_Bloomberg', 'USD_Federal_Funds_H_15_OIS_COMPOUND', 'USD_Federal_Funds_OIS_Compound', 'USD_Federal_Funds_Reference_Dealers', 'USD_FFCB_DISCO', 'USD_FXI_Term', 'USD_ISDAFIX3_Swap_Rate', 'USD_ISDAFIX3_Swap_Rate_3_00', 'USD_ISDA_Swap_Rate', 'USD_ISDA_Swap_Rate_3_00', 'USD_LIBOR', 'USD_LIBOR_BBA', 'USD_LIBOR_BBA_Bloomberg', 'USD_LIBOR_ICE_Swap_Rate_11_00', 'USD_LIBOR_ICE_Swap_Rate_15_00', 'USD_LIBOR_ISDA', 'USD_LIBOR_LIBO', 'USD_LIBOR_Reference_Banks', 'USD_Municipal_Swap_Index', 'USD_Municipal_Swap_Libor_Ratio_11_00_ICAP', 'USD_Municipal_Swap_Rate_11_00_ICAP', 'USD_OIS_11_00_BGCANTOR', 'USD_OIS_11_00_LON_ICAP', 'USD_OIS_11_00_NY_ICAP', 'USD_OIS_11_00_TRADITION', 'USD_OIS_3_00_BGCANTOR', 'USD_OIS_3_00_NY_ICAP', 'USD_OIS_4_00_TRADITION', 'USD_Overnight_Bank_Funding_Rate', 'USD_Prime', 'USD_Prime_H_15', 'USD_Prime_Reference_Banks', 'USD_S_P_Index_High_Grade', 'USD_SandP_Index_High_Grade', 'USD_SIBOR_Reference_Banks', 'USD_SIBOR_SIBO', 'USD_SIFMA_Municipal_Swap_Index', 'USD_SOFR', 'USD_SOFR_Average_180D', 'USD_SOFR_Average_30D', 'USD_SOFR_Average_90D', 'USD_SOFR_CME_Term', 'USD_SOFR_COMPOUND', 'USD_SOFR_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index_0_Floor', 'USD_SOFR_ICE_Compounded_Index_0_Floor_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_0_Floor_5D_Lag', 'USD_SOFR_ICE_Compounded_Index_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_5D_Lag', 'USD_SOFR_ICE_Swap_Rate', 'USD_SOFR_ICE_Swap_Rate_Spreads', 'USD_SOFR_ICE_Term', 'USD_SOFR_OIS_Compound', 'USD_Swap_Rate_BCMP1', 'USD_TBILL_Auction_High_Rate', 'USD_TBILL_H_15', 'USD_TBILL_H_15_Bloomberg', 'USD_TBILL_Secondary_Market', 'USD_TBILL_Secondary_Market_Bond_Equivalent_Yield', 'USD_TIBOR_ISDC', 'USD_TIBOR_Reference_Banks', 'USD_Treasury_19901_3_00_ICAP', 'USD_Treasury_Rate_BCMP1', 'USD_Treasury_Rate_ICAP_BrokerTec', 'USD_Treasury_Rate_SwapMarker100', 'USD_Treasury_Rate_SwapMarker99', 'USD_Treasury_Rate_T19901', 'USD_Treasury_Rate_T500', 'VND_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'VND_Semi_Annual_Swap_Rate_Reference_Banks', 'ZAR_DEPOSIT_Reference_Banks', 'ZAR_DEPOSIT_SAFEX', 'ZAR_JIBAR', 'ZAR_JIBAR_Reference_Banks', 'ZAR_JIBAR_SAFEX', 'ZAR_Prime_Average_1', 'ZAR_PRIME_AVERAGE', 'ZAR_PRIME_AVERAGE_Reference_Banks', 'ZAR_Quarterly_Swap_Rate_1_00_TRADITION', 'ZAR_Quarterly_Swap_Rate_5_30_TRADITION', 'ZAR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'ZAR_ZARONIA', 'ZAR_ZARONIA_OIS_Compound'))

UNION ALL

SELECT 'MarginCallBase' AS table_name, 'instructionType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallBase" 
WHERE "MarginCallBase"."instructionType" IS NULL

UNION ALL

SELECT 'MarginCallBase' AS table_name, 'callAgreementType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallBase" 
WHERE "MarginCallBase"."callAgreementType" IS NULL

UNION ALL

SELECT 'MarginCallBase' AS table_name, 'regMarginType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallBase" 
WHERE "MarginCallBase"."regMarginType" IS NULL

UNION ALL

SELECT 'MarginCallBase' AS table_name, 'regMarginType' AS column_name, 'enum' AS constraint_type, id AS record_id, "regMarginType" AS invalid_value 
FROM "MarginCallBase" 
WHERE "MarginCallBase"."regMarginType" IS NOT NULL AND ("MarginCallBase"."regMarginType" NOT IN ('VM', 'RegIM', 'NonRegIM'))

UNION ALL

SELECT 'MarginCallBase' AS table_name, 'regIMRole' AS column_name, 'enum' AS constraint_type, id AS record_id, "regIMRole" AS invalid_value 
FROM "MarginCallBase" 
WHERE "MarginCallBase"."regIMRole" IS NOT NULL AND ("MarginCallBase"."regIMRole" NOT IN ('Pledgor', 'Secured'))

UNION ALL

SELECT 'Exposure' AS table_name, 'tradePortfolio' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Exposure" 
WHERE "Exposure"."tradePortfolio" IS NULL

UNION ALL

SELECT 'Exposure' AS table_name, 'aggregateValue' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Exposure" 
WHERE "Exposure"."aggregateValue" IS NULL

UNION ALL

SELECT 'Exposure' AS table_name, 'valuationDateTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Exposure" 
WHERE "Exposure"."valuationDateTime" IS NULL

UNION ALL

SELECT 'MarginCallExposure' AS table_name, 'overallExposure' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallExposure" 
WHERE "MarginCallExposure"."overallExposure" IS NULL

UNION ALL

SELECT 'MarginCallExposure' AS table_name, 'instructionType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallExposure" 
WHERE "MarginCallExposure"."instructionType" IS NULL

UNION ALL

SELECT 'MarginCallExposure' AS table_name, 'callAgreementType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallExposure" 
WHERE "MarginCallExposure"."callAgreementType" IS NULL

UNION ALL

SELECT 'MarginCallExposure' AS table_name, 'regMarginType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallExposure" 
WHERE "MarginCallExposure"."regMarginType" IS NULL

UNION ALL

SELECT 'MarginCallExposure' AS table_name, 'regMarginType' AS column_name, 'enum' AS constraint_type, id AS record_id, "regMarginType" AS invalid_value 
FROM "MarginCallExposure" 
WHERE "MarginCallExposure"."regMarginType" IS NOT NULL AND ("MarginCallExposure"."regMarginType" NOT IN ('VM', 'RegIM', 'NonRegIM'))

UNION ALL

SELECT 'MarginCallExposure' AS table_name, 'regIMRole' AS column_name, 'enum' AS constraint_type, id AS record_id, "regIMRole" AS invalid_value 
FROM "MarginCallExposure" 
WHERE "MarginCallExposure"."regIMRole" IS NOT NULL AND ("MarginCallExposure"."regIMRole" NOT IN ('Pledgor', 'Secured'))

UNION ALL

SELECT 'CollateralBalance' AS table_name, 'collateralBalanceStatus' AS column_name, 'enum' AS constraint_type, id AS record_id, "collateralBalanceStatus" AS invalid_value 
FROM "CollateralBalance" 
WHERE "CollateralBalance"."collateralBalanceStatus" IS NOT NULL AND ("CollateralBalance"."collateralBalanceStatus" NOT IN ('FullAmount', 'SettledAmount', 'InTransitAmount'))

UNION ALL

SELECT 'CollateralBalance' AS table_name, 'haircutIndicator' AS column_name, 'enum' AS constraint_type, id AS record_id, "haircutIndicator" AS invalid_value 
FROM "CollateralBalance" 
WHERE "CollateralBalance"."haircutIndicator" IS NOT NULL AND ("CollateralBalance"."haircutIndicator" NOT IN ('PreHaircut', 'PostHaircut'))

UNION ALL

SELECT 'CollateralBalance' AS table_name, 'amountBaseCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralBalance" 
WHERE "CollateralBalance"."amountBaseCurrency" IS NULL

UNION ALL

SELECT 'CollateralBalance' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralBalance" 
WHERE "CollateralBalance"."payerReceiver" IS NULL

UNION ALL

SELECT 'CollateralPosition' AS table_name, 'collateralPositionStatus' AS column_name, 'enum' AS constraint_type, id AS record_id, "collateralPositionStatus" AS invalid_value 
FROM "CollateralPosition" 
WHERE "CollateralPosition"."collateralPositionStatus" IS NOT NULL AND ("CollateralPosition"."collateralPositionStatus" NOT IN ('FullAmount', 'SettledAmount', 'InTransitAmount'))

UNION ALL

SELECT 'CollateralPosition' AS table_name, 'priceQuantity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralPosition" 
WHERE "CollateralPosition"."priceQuantity" IS NULL

UNION ALL

SELECT 'MarginCallIssuance' AS table_name, 'callAmountInBaseCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallIssuance" 
WHERE "MarginCallIssuance"."callAmountInBaseCurrency" IS NULL

UNION ALL

SELECT 'MarginCallIssuance' AS table_name, 'instructionType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallIssuance" 
WHERE "MarginCallIssuance"."instructionType" IS NULL

UNION ALL

SELECT 'MarginCallIssuance' AS table_name, 'callAgreementType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallIssuance" 
WHERE "MarginCallIssuance"."callAgreementType" IS NULL

UNION ALL

SELECT 'MarginCallIssuance' AS table_name, 'regMarginType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallIssuance" 
WHERE "MarginCallIssuance"."regMarginType" IS NULL

UNION ALL

SELECT 'MarginCallIssuance' AS table_name, 'regMarginType' AS column_name, 'enum' AS constraint_type, id AS record_id, "regMarginType" AS invalid_value 
FROM "MarginCallIssuance" 
WHERE "MarginCallIssuance"."regMarginType" IS NOT NULL AND ("MarginCallIssuance"."regMarginType" NOT IN ('VM', 'RegIM', 'NonRegIM'))

UNION ALL

SELECT 'MarginCallIssuance' AS table_name, 'regIMRole' AS column_name, 'enum' AS constraint_type, id AS record_id, "regIMRole" AS invalid_value 
FROM "MarginCallIssuance" 
WHERE "MarginCallIssuance"."regIMRole" IS NOT NULL AND ("MarginCallIssuance"."regIMRole" NOT IN ('Pledgor', 'Secured'))

UNION ALL

SELECT 'MarginCallInstructionType' AS table_name, 'callType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallInstructionType" 
WHERE "MarginCallInstructionType"."callType" IS NULL

UNION ALL

SELECT 'MarginCallInstructionType' AS table_name, 'callType' AS column_name, 'enum' AS constraint_type, id AS record_id, "callType" AS invalid_value 
FROM "MarginCallInstructionType" 
WHERE "MarginCallInstructionType"."callType" IS NOT NULL AND ("MarginCallInstructionType"."callType" NOT IN ('MarginCall', 'Notification', 'ExpectedCall'))

UNION ALL

SELECT 'MarginCallResponseAction' AS table_name, 'collateralPositionComponent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallResponseAction" 
WHERE "MarginCallResponseAction"."collateralPositionComponent" IS NULL

UNION ALL

SELECT 'MarginCallResponseAction' AS table_name, 'marginCallAction' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallResponseAction" 
WHERE "MarginCallResponseAction"."marginCallAction" IS NULL

UNION ALL

SELECT 'MarginCallResponseAction' AS table_name, 'marginCallAction' AS column_name, 'enum' AS constraint_type, id AS record_id, "marginCallAction" AS invalid_value 
FROM "MarginCallResponseAction" 
WHERE "MarginCallResponseAction"."marginCallAction" IS NOT NULL AND ("MarginCallResponseAction"."marginCallAction" NOT IN ('Delivery', 'Return'))

UNION ALL

SELECT 'MarginCallResponse' AS table_name, 'marginCallResponseAction' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallResponse" 
WHERE "MarginCallResponse"."marginCallResponseAction" IS NULL

UNION ALL

SELECT 'MarginCallResponse' AS table_name, 'marginResponseType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallResponse" 
WHERE "MarginCallResponse"."marginResponseType" IS NULL

UNION ALL

SELECT 'MarginCallResponse' AS table_name, 'marginResponseType' AS column_name, 'enum' AS constraint_type, id AS record_id, "marginResponseType" AS invalid_value 
FROM "MarginCallResponse" 
WHERE "MarginCallResponse"."marginResponseType" IS NOT NULL AND ("MarginCallResponse"."marginResponseType" NOT IN ('AgreeinFull', 'PartiallyAgree', 'Dispute'))

UNION ALL

SELECT 'MarginCallResponse' AS table_name, 'agreedAmountBaseCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallResponse" 
WHERE "MarginCallResponse"."agreedAmountBaseCurrency" IS NULL

UNION ALL

SELECT 'MarginCallResponse' AS table_name, 'instructionType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallResponse" 
WHERE "MarginCallResponse"."instructionType" IS NULL

UNION ALL

SELECT 'MarginCallResponse' AS table_name, 'callAgreementType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallResponse" 
WHERE "MarginCallResponse"."callAgreementType" IS NULL

UNION ALL

SELECT 'MarginCallResponse' AS table_name, 'regMarginType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginCallResponse" 
WHERE "MarginCallResponse"."regMarginType" IS NULL

UNION ALL

SELECT 'MarginCallResponse' AS table_name, 'regMarginType' AS column_name, 'enum' AS constraint_type, id AS record_id, "regMarginType" AS invalid_value 
FROM "MarginCallResponse" 
WHERE "MarginCallResponse"."regMarginType" IS NOT NULL AND ("MarginCallResponse"."regMarginType" NOT IN ('VM', 'RegIM', 'NonRegIM'))

UNION ALL

SELECT 'MarginCallResponse' AS table_name, 'regIMRole' AS column_name, 'enum' AS constraint_type, id AS record_id, "regIMRole" AS invalid_value 
FROM "MarginCallResponse" 
WHERE "MarginCallResponse"."regIMRole" IS NOT NULL AND ("MarginCallResponse"."regIMRole" NOT IN ('Pledgor', 'Secured'))

UNION ALL

SELECT 'ClosedState' AS table_name, 'state' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ClosedState" 
WHERE "ClosedState".state IS NULL

UNION ALL

SELECT 'ClosedState' AS table_name, 'state' AS column_name, 'enum' AS constraint_type, id AS record_id, state AS invalid_value 
FROM "ClosedState" 
WHERE "ClosedState".state IS NOT NULL AND ("ClosedState".state NOT IN ('Allocated', 'Cancelled', 'Exercised', 'Expired', 'Matured', 'Novated', 'Terminated'))

UNION ALL

SELECT 'ClosedState' AS table_name, 'activityDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ClosedState" 
WHERE "ClosedState"."activityDate" IS NULL

UNION ALL

SELECT 'CounterpartyPosition' AS table_name, 'positionBase' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CounterpartyPosition" 
WHERE "CounterpartyPosition"."positionBase" IS NULL

UNION ALL

SELECT 'PositionBase' AS table_name, 'priceQuantity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PositionBase" 
WHERE "PositionBase"."priceQuantity" IS NULL

UNION ALL

SELECT 'Position' AS table_name, 'priceQuantity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Position" 
WHERE "Position"."priceQuantity" IS NULL

UNION ALL

SELECT 'PortfolioState' AS table_name, 'lineage' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PortfolioState" 
WHERE "PortfolioState".lineage IS NULL

UNION ALL

SELECT 'AggregationParameters' AS table_name, 'dateTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AggregationParameters" 
WHERE "AggregationParameters"."dateTime" IS NULL

UNION ALL

SELECT 'AggregationParameters' AS table_name, 'positionStatus' AS column_name, 'enum' AS constraint_type, id AS record_id, "positionStatus" AS invalid_value 
FROM "AggregationParameters" 
WHERE "AggregationParameters"."positionStatus" IS NOT NULL AND ("AggregationParameters"."positionStatus" NOT IN ('Executed', 'Formed', 'Settled', 'Cancelled', 'Closed'))

UNION ALL

SELECT 'Portfolio' AS table_name, 'aggregationParameters' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Portfolio" 
WHERE "Portfolio"."aggregationParameters" IS NULL

UNION ALL

SELECT 'Portfolio' AS table_name, 'portfolioState' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Portfolio" 
WHERE "Portfolio"."portfolioState" IS NULL

UNION ALL

SELECT 'InventoryRecord' AS table_name, 'identifer' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InventoryRecord" 
WHERE "InventoryRecord".identifer IS NULL

UNION ALL

SELECT 'InventoryRecord' AS table_name, 'security' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InventoryRecord" 
WHERE "InventoryRecord".security IS NULL

UNION ALL

SELECT 'AvailableInventory' AS table_name, 'availableInventoryType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AvailableInventory" 
WHERE "AvailableInventory"."availableInventoryType" IS NULL

UNION ALL

SELECT 'AvailableInventory' AS table_name, 'availableInventoryType' AS column_name, 'enum' AS constraint_type, id AS record_id, "availableInventoryType" AS invalid_value 
FROM "AvailableInventory" 
WHERE "AvailableInventory"."availableInventoryType" IS NOT NULL AND ("AvailableInventory"."availableInventoryType" NOT IN ('AvailableToLend', 'RequestToBorrow'))

UNION ALL

SELECT 'AvailableInventoryRecord' AS table_name, 'identifer' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AvailableInventoryRecord" 
WHERE "AvailableInventoryRecord".identifer IS NULL

UNION ALL

SELECT 'AvailableInventoryRecord' AS table_name, 'security' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AvailableInventoryRecord" 
WHERE "AvailableInventoryRecord".security IS NULL

UNION ALL

SELECT 'SecurityLocate' AS table_name, 'availableInventoryType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecurityLocate" 
WHERE "SecurityLocate"."availableInventoryType" IS NULL

UNION ALL

SELECT 'SecurityLocate' AS table_name, 'availableInventoryType' AS column_name, 'enum' AS constraint_type, id AS record_id, "availableInventoryType" AS invalid_value 
FROM "SecurityLocate" 
WHERE "SecurityLocate"."availableInventoryType" IS NOT NULL AND ("SecurityLocate"."availableInventoryType" NOT IN ('AvailableToLend', 'RequestToBorrow'))

UNION ALL

SELECT 'CreditLimitInformation' AS table_name, 'limitApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditLimitInformation" 
WHERE "CreditLimitInformation"."limitApplicable" IS NULL

UNION ALL

SELECT 'CustomisedWorkflow' AS table_name, 'itemName' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CustomisedWorkflow" 
WHERE "CustomisedWorkflow"."itemName" IS NULL

UNION ALL

SELECT 'CustomisedWorkflow' AS table_name, 'itemValue' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CustomisedWorkflow" 
WHERE "CustomisedWorkflow"."itemValue" IS NULL

UNION ALL

SELECT 'WorkflowStepApproval' AS table_name, 'approved' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "WorkflowStepApproval" 
WHERE "WorkflowStepApproval".approved IS NULL

UNION ALL

SELECT 'WorkflowStepApproval' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "WorkflowStepApproval" 
WHERE "WorkflowStepApproval".party IS NULL

UNION ALL

SELECT 'WorkflowStepApproval' AS table_name, 'timestamp' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "WorkflowStepApproval" 
WHERE "WorkflowStepApproval".timestamp IS NULL

UNION ALL

SELECT 'WorkflowStep' AS table_name, 'timestamp' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "WorkflowStep" 
WHERE "WorkflowStep".timestamp IS NULL

UNION ALL

SELECT 'WorkflowStep' AS table_name, 'eventIdentifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "WorkflowStep" 
WHERE "WorkflowStep"."eventIdentifier" IS NULL

UNION ALL

SELECT 'WorkflowStep' AS table_name, 'action' AS column_name, 'enum' AS constraint_type, id AS record_id, action AS invalid_value 
FROM "WorkflowStep" 
WHERE "WorkflowStep".action IS NOT NULL AND ("WorkflowStep".action NOT IN ('New', 'Correct', 'Cancel'))

UNION ALL

SELECT 'Workflow' AS table_name, 'steps' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Workflow" 
WHERE "Workflow".steps IS NULL

UNION ALL

SELECT 'EventInstruction' AS table_name, 'intent' AS column_name, 'enum' AS constraint_type, id AS record_id, intent AS invalid_value 
FROM "EventInstruction" 
WHERE "EventInstruction".intent IS NOT NULL AND ("EventInstruction".intent NOT IN ('Allocation', 'CashFlow', 'Clearing', 'Compression', 'ContractFormation', 'ContractTermsAmendment', 'CorporateActionAdjustment', 'CreditEvent', 'Decrease', 'EarlyTerminationProvision', 'Increase', 'IndexTransition', 'NotionalReset', 'NotionalStep', 'Novation', 'ObservationRecord', 'OptionExercise', 'OptionalExtension', 'OptionalCancellation', 'PortfolioRebalancing', 'PrincipalExchange', 'Reallocation', 'Repurchase'))

UNION ALL

SELECT 'EventInstruction' AS table_name, 'corporateActionIntent' AS column_name, 'enum' AS constraint_type, id AS record_id, "corporateActionIntent" AS invalid_value 
FROM "EventInstruction" 
WHERE "EventInstruction"."corporateActionIntent" IS NOT NULL AND ("EventInstruction"."corporateActionIntent" NOT IN ('CashDividend', 'StockDividend', 'StockSplit', 'ReverseStockSplit', 'SpinOff', 'Merger', 'Delisting', 'StockNameChange', 'StockIdentifierChange', 'RightsIssue', 'Takeover', 'StockReclassification', 'BonusIssue', 'ClassAction', 'EarlyRedemption', 'Liquidation', 'BankruptcyOrInsolvency', 'IssuerNationalization', 'Relisting', 'BespokeEvent'))

UNION ALL

SELECT 'EventTimestamp' AS table_name, 'dateTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EventTimestamp" 
WHERE "EventTimestamp"."dateTime" IS NULL

UNION ALL

SELECT 'EventTimestamp' AS table_name, 'qualification' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EventTimestamp" 
WHERE "EventTimestamp".qualification IS NULL

UNION ALL

SELECT 'EventTimestamp' AS table_name, 'qualification' AS column_name, 'enum' AS constraint_type, id AS record_id, qualification AS invalid_value 
FROM "EventTimestamp" 
WHERE "EventTimestamp".qualification IS NOT NULL AND ("EventTimestamp".qualification NOT IN ('clearingDateTime', 'clearingConfirmationDateTime', 'clearingReceiptDateTime', 'clearingSubmissionDateTime', 'confirmationDateTime', 'eventCreationDateTime', 'eventExpirationDateTime', 'eventProcessingDateTime', 'eventSentDateTime', 'eventSubmittedDateTime', 'executionDateTime', 'transactionCreationDateTime'))

UNION ALL

SELECT 'WorkflowState' AS table_name, 'workflowStatus' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "WorkflowState" 
WHERE "WorkflowState"."workflowStatus" IS NULL

UNION ALL

SELECT 'WorkflowState' AS table_name, 'workflowStatus' AS column_name, 'enum' AS constraint_type, id AS record_id, "workflowStatus" AS invalid_value 
FROM "WorkflowState" 
WHERE "WorkflowState"."workflowStatus" IS NOT NULL AND ("WorkflowState"."workflowStatus" NOT IN ('Accepted', 'Alleged', 'Amended', 'Cancelled', 'Certain', 'Cleared', 'Pending', 'Rejected', 'Submitted', 'Terminated', 'Uncertain', 'Unconfirmed', 'Affirmed', 'Confirmed'))

UNION ALL

SELECT 'WorkflowState' AS table_name, 'warehouseIdentity' AS column_name, 'enum' AS constraint_type, id AS record_id, "warehouseIdentity" AS invalid_value 
FROM "WorkflowState" 
WHERE "WorkflowState"."warehouseIdentity" IS NOT NULL AND ("WorkflowState"."warehouseIdentity" NOT IN ('DTCC_TIW_Gold'))

UNION ALL

SELECT 'LimitApplicable' AS table_name, 'limitType' AS column_name, 'enum' AS constraint_type, id AS record_id, "limitType" AS invalid_value 
FROM "LimitApplicable" 
WHERE "LimitApplicable"."limitType" IS NOT NULL AND ("LimitApplicable"."limitType" NOT IN ('CS01', 'DV01', 'IM', 'Notional', 'NPV', 'PV01'))

UNION ALL

SELECT 'LimitApplicableExtended' AS table_name, 'limitLevel' AS column_name, 'enum' AS constraint_type, id AS record_id, "limitLevel" AS invalid_value 
FROM "LimitApplicableExtended" 
WHERE "LimitApplicableExtended"."limitLevel" IS NOT NULL AND ("LimitApplicableExtended"."limitLevel" NOT IN ('Account', 'Customer', 'House'))

UNION ALL

SELECT 'LimitApplicableExtended' AS table_name, 'limitType' AS column_name, 'enum' AS constraint_type, id AS record_id, "limitType" AS invalid_value 
FROM "LimitApplicableExtended" 
WHERE "LimitApplicableExtended"."limitType" IS NOT NULL AND ("LimitApplicableExtended"."limitType" NOT IN ('CS01', 'DV01', 'IM', 'Notional', 'NPV', 'PV01'))

UNION ALL

SELECT 'MessageInformation' AS table_name, 'messageId' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MessageInformation" 
WHERE "MessageInformation"."messageId" IS NULL

UNION ALL

SELECT 'PartyCustomisedWorkflow' AS table_name, 'customisedWorkflow' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PartyCustomisedWorkflow" 
WHERE "PartyCustomisedWorkflow"."customisedWorkflow" IS NULL

UNION ALL

SELECT 'Velocity' AS table_name, 'period' AS column_name, 'enum' AS constraint_type, id AS record_id, period AS invalid_value 
FROM "Velocity" 
WHERE "Velocity".period IS NOT NULL AND ("Velocity".period NOT IN ('Hour', 'Minute', 'Second'))

UNION ALL

SELECT 'ContractualMatrix' AS table_name, 'matrixType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ContractualMatrix" 
WHERE "ContractualMatrix"."matrixType" IS NULL

UNION ALL

SELECT 'ContractualMatrix' AS table_name, 'matrixType' AS column_name, 'enum' AS constraint_type, id AS record_id, "matrixType" AS invalid_value 
FROM "ContractualMatrix" 
WHERE "ContractualMatrix"."matrixType" IS NOT NULL AND ("ContractualMatrix"."matrixType" NOT IN ('CreditDerivativesPhysicalSettlementMatrix', 'EquityDerivativesMatrix', 'SettlementMatrix'))

UNION ALL

SELECT 'ContractualMatrix' AS table_name, 'matrixTerm' AS column_name, 'enum' AS constraint_type, id AS record_id, "matrixTerm" AS invalid_value 
FROM "ContractualMatrix" 
WHERE "ContractualMatrix"."matrixTerm" IS NOT NULL AND ("ContractualMatrix"."matrixTerm" NOT IN ('AsiaCorporate', 'AsiaFinancialCorporate', 'AsiaSovereign', 'AustraliaCorporate', 'AustraliaFinancialCorporate', 'AustraliaSovereign', 'EmergingEuropeanAndMiddleEasternSovereign', 'EmergingEuropeanCorporate', 'EmergingEuropeanCorporateLPN', 'EmergingEuropeanFinancialCorporate', 'EmergingEuropeanFinancialCorporateLPN', 'EuropeanCoCoFinancialCorporate', 'EuropeanCorporate', 'EuropeanFinancialCorporate', 'EuropeanSeniorNonPreferredFinancialCorporate', 'IVS1OpenMarkets', 'JapanCorporate', 'JapanFinancialCorporate', 'JapanSovereign', 'LatinAmericaCorporate', 'LatinAmericaCorporateBond', 'LatinAmericaCorporateBondOrLoan', 'LatinAmericaFinancialCorporateBond', 'LatinAmericaFinancialCorporateBondOrLoan', 'LatinAmericaSovereign', 'NewZealandCorporate', 'NewZealandFinancialCorporate', 'NewZealandSovereign', 'NorthAmericanCorporate', 'NorthAmericanFinancialCorporate', 'SingaporeCorporate', 'SingaporeFinancialCorporate', 'SingaporeSovereign', 'StandardAsiaCorporate', 'StandardAsiaFinancialCorporate', 'StandardAsiaSovereign', 'StandardAustraliaCorporate', 'StandardAustraliaFinancialCorporate', 'StandardAustraliaSovereign', 'StandardEmergingEuropeanAndMiddleEasternSovereign', 'StandardEmergingEuropeanCorporate', 'StandardEmergingEuropeanCorporateLPN', 'StandardEmergingEuropeanFinancialCorporate', 'StandardEmergingEuropeanFinancialCorporateLPN', 'StandardEuropeanCoCoFinancialCorporate', 'StandardEuropeanCorporate', 'StandardEuropeanFinancialCorporate', 'StandardEuropeanSeniorNonPreferredFinancialCorporate', 'StandardJapanCorporate', 'StandardJapanFinancialCorporate', 'StandardJapanSovereign', 'StandardLatinAmericaCorporateBond', 'StandardLatinAmericaCorporateBondOrLoan', 'StandardLatinAmericaFinancialCorporateBond', 'StandardLatinAmericaFinancialCorporateBondOrLoan', 'StandardLatinAmericaSovereign', 'StandardNewZealandCorporate', 'StandardNewZealandFinancialCorporate', 'StandardNewZealandSovereign', 'StandardNorthAmericanCorporate', 'StandardNorthAmericanFinancialCorporate', 'StandardSingaporeCorporate', 'StandardSingaporeFinancialCorporate', 'StandardSingaporeSovereign', 'StandardSubordinatedEuropeanInsuranceCorporate', 'StandardSukukFinancialCorporate', 'StandardUSMunicipalFullFaithAndCredit', 'StandardUSMunicipalGeneralFund', 'StandardUSMunicipalRevenue', 'StandardWesternEuropeanSovereign', 'SubordinatedEuropeanInsuranceCorporate', 'SukukCorporate', 'SukukFinancialCorporate', 'SukukSovereign', 'USMunicipalFullFaithAndCredit', 'USMunicipalGeneralFund', 'USMunicipalRevenue', 'WesternEuropeanSovereign'))

UNION ALL

SELECT 'ContractualTermsSupplement' AS table_name, 'contractualTermsSupplementType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ContractualTermsSupplement" 
WHERE "ContractualTermsSupplement"."contractualTermsSupplementType" IS NULL

UNION ALL

SELECT 'ContractualTermsSupplement' AS table_name, 'contractualTermsSupplementType' AS column_name, 'enum' AS constraint_type, id AS record_id, "contractualTermsSupplementType" AS invalid_value 
FROM "ContractualTermsSupplement" 
WHERE "ContractualTermsSupplement"."contractualTermsSupplementType" IS NOT NULL AND ("ContractualTermsSupplement"."contractualTermsSupplementType" NOT IN ('ABX', 'ABXTranche', 'CDSonLeveragedLoans', 'CDSonMBS', 'CDX', 'CDXEmergingMarkets', 'CDXEmergingMarketsDiversified', 'CDXSwaption', 'CDXTranche', 'CMBX', 'EuropeanCMBS', 'EuropeanRMBS', 'IOS', 'ISDA1999CreditConvertibleExchangeableAccretingObligations', 'ISDA1999CreditRestructuring', 'ISDA1999CreditSuccessorAndCreditEvents', 'ISDA2003AdditionalProvisionsLPN', 'ISDA2003ContingentCreditSpreadTransaction', 'ISDA2003Credit2005MatrixSupplement', 'ISDA2003CreditArgentineRepublic', 'ISDA2003CreditAuctionSupplement', 'ISDA2003CreditMay2003', 'ISDA2003CreditMonolineInsurers', 'ISDA2003CreditMonolineInsurers2005', 'ISDA2003CreditRepublicOfHungary', 'ISDA2003CreditRepublicOfHungary2005', 'ISDA2003CreditRussianFederation', 'ISDA2003CreditUSMunicipals', 'ISDA2003STMicroelectronicsNV', 'ISDA2007FullLookthroughDepositoryReceiptSupplement', 'ISDA2007PartialLookthroughDepositoryReceiptSupplement', 'ISDACreditMonolineInsurers', 'ISDADeliveryRestrictions', 'ISDAFixedRecovery', 'ISDALPNReferenceEntities', 'ISDAMarch2004EquityCanadianSupplement', 'ISDARecoveryLock', 'ISDASecuredDeliverableObligationCharacteristic', 'LCDX', 'LCDXTranche', 'MBX', 'MCDX', 'PO', 'PrimeX', 'StandardCDXTranche', 'StandardLCDS', 'StandardLCDSBullet', 'StandardLCDXBullet', 'StandardLCDXBulletTranche', 'StandardiTraxxEuropeTranche', 'SyndicatedSecuredLoanCDS', 'TRX', 'TRX_II', 'iTraxxAsiaExJapan', 'iTraxxAsiaExJapanSwaption', 'iTraxxAsiaExJapanTranche', 'iTraxxAustralia', 'iTraxxAustraliaSwaption', 'iTraxxAustraliaTranche', 'iTraxxCJ', 'iTraxxCJTranche', 'iTraxxEurope', 'iTraxxEuropeDealer', 'iTraxxEuropeNonDealer', 'iTraxxEuropeSwaption', 'iTraxxEuropeTranche', 'iTraxxJapan', 'iTraxxJapanSwaption', 'iTraxxJapanTranche', 'iTraxxLevX', 'iTraxxSDI75Dealer', 'iTraxxSDI75NonDealer', 'iTraxxSovX'))

UNION ALL

SELECT 'OtherAgreement' AS table_name, 'otherAgreementType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "OtherAgreement" 
WHERE "OtherAgreement"."otherAgreementType" IS NULL

UNION ALL

SELECT 'Resource' AS table_name, 'resourceId' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Resource" 
WHERE "Resource"."resourceId" IS NULL

UNION ALL

SELECT 'Resource' AS table_name, 'resourceType' AS column_name, 'enum' AS constraint_type, id AS record_id, "resourceType" AS invalid_value 
FROM "Resource" 
WHERE "Resource"."resourceType" IS NOT NULL AND ("Resource"."resourceType" NOT IN ('Confirmation', 'SupplementalMaterialEconomicTerms', 'TermSheet'))

UNION ALL

SELECT 'ResourceLength' AS table_name, 'lengthUnit' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ResourceLength" 
WHERE "ResourceLength"."lengthUnit" IS NULL

UNION ALL

SELECT 'ResourceLength' AS table_name, 'lengthUnit' AS column_name, 'enum' AS constraint_type, id AS record_id, "lengthUnit" AS invalid_value 
FROM "ResourceLength" 
WHERE "ResourceLength"."lengthUnit" IS NOT NULL AND ("ResourceLength"."lengthUnit" NOT IN ('Pages', 'TimeUnit'))

UNION ALL

SELECT 'ResourceLength' AS table_name, 'lengthValue' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ResourceLength" 
WHERE "ResourceLength"."lengthValue" IS NULL

UNION ALL

SELECT 'AgreementTerms' AS table_name, 'agreement' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AgreementTerms" 
WHERE "AgreementTerms".agreement IS NULL

UNION ALL

SELECT 'AgreementTerms' AS table_name, 'counterparty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AgreementTerms" 
WHERE "AgreementTerms".counterparty IS NULL

UNION ALL

SELECT 'LegalAgreement' AS table_name, 'legalAgreementIdentification' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegalAgreement" 
WHERE "LegalAgreement"."legalAgreementIdentification" IS NULL

UNION ALL

SELECT 'LegalAgreement' AS table_name, 'contractualParty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegalAgreement" 
WHERE "LegalAgreement"."contractualParty" IS NULL

UNION ALL

SELECT 'LegalAgreementBase' AS table_name, 'legalAgreementIdentification' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegalAgreementBase" 
WHERE "LegalAgreementBase"."legalAgreementIdentification" IS NULL

UNION ALL

SELECT 'LegalAgreementBase' AS table_name, 'contractualParty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegalAgreementBase" 
WHERE "LegalAgreementBase"."contractualParty" IS NULL

UNION ALL

SELECT 'LegalAgreementIdentification' AS table_name, 'governingLaw' AS column_name, 'enum' AS constraint_type, id AS record_id, "governingLaw" AS invalid_value 
FROM "LegalAgreementIdentification" 
WHERE "LegalAgreementIdentification"."governingLaw" IS NOT NULL AND ("LegalAgreementIdentification"."governingLaw" NOT IN ('AsSpecifiedInMasterAgreement', 'BE', 'CAAB', 'CABC', 'CAMN', 'CAON', 'CAQC', 'DE', 'FR', 'GBEN', 'GBGY', 'GBIM', 'GBJY', 'GBSC', 'IE', 'JP', 'LU', 'RelatedMasterAgreement', 'USCA', 'USDE', 'USIL', 'USNY'))

UNION ALL

SELECT 'LegalAgreementIdentification' AS table_name, 'agreementName' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegalAgreementIdentification" 
WHERE "LegalAgreementIdentification"."agreementName" IS NULL

UNION ALL

SELECT 'LegalAgreementIdentification' AS table_name, 'publisher' AS column_name, 'enum' AS constraint_type, id AS record_id, publisher AS invalid_value 
FROM "LegalAgreementIdentification" 
WHERE "LegalAgreementIdentification".publisher IS NOT NULL AND ("LegalAgreementIdentification".publisher NOT IN ('AFB', 'BNYM', 'ISDAClearstream', 'EMTA', 'TheFXCommittee', 'ISDAEuroclear', 'ISDA', 'ISLA', 'JPMorgan', 'ICMA'))

UNION ALL

SELECT 'AgreementName' AS table_name, 'agreementType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AgreementName" 
WHERE "AgreementName"."agreementType" IS NULL

UNION ALL

SELECT 'AgreementName' AS table_name, 'agreementType' AS column_name, 'enum' AS constraint_type, id AS record_id, "agreementType" AS invalid_value 
FROM "AgreementName" 
WHERE "AgreementName"."agreementType" IS NOT NULL AND ("AgreementName"."agreementType" NOT IN ('BrokerConfirmation', 'Confirmation', 'CreditSupportAgreement', 'MasterAgreement', 'MasterConfirmation', 'SecurityAgreement', 'Other'))

UNION ALL

SELECT 'AgreementName' AS table_name, 'creditSupportAgreementType' AS column_name, 'enum' AS constraint_type, id AS record_id, "creditSupportAgreementType" AS invalid_value 
FROM "AgreementName" 
WHERE "AgreementName"."creditSupportAgreementType" IS NOT NULL AND ("AgreementName"."creditSupportAgreementType" NOT IN ('CreditSupportDeed', 'CreditSupportAnnex', 'CollateralTransferAgreement'))

UNION ALL

SELECT 'AgreementName' AS table_name, 'creditSupportAgreementMarginType' AS column_name, 'enum' AS constraint_type, id AS record_id, "creditSupportAgreementMarginType" AS invalid_value 
FROM "AgreementName" 
WHERE "AgreementName"."creditSupportAgreementMarginType" IS NOT NULL AND ("AgreementName"."creditSupportAgreementMarginType" NOT IN ('VariationMargin', 'InitialMargin'))

UNION ALL

SELECT 'AgreementName' AS table_name, 'contractualDefinitionsType' AS column_name, 'enum' AS constraint_type, id AS record_id, "contractualDefinitionsType" AS invalid_value 
FROM "AgreementName" 
WHERE "AgreementName"."contractualDefinitionsType" IS NOT NULL AND ("AgreementName"."contractualDefinitionsType" NOT IN ('ISDA1991InterestRate', 'ISDA1993CommodityDerivatives', 'ISDA1996EquityDerivatives', 'ISDA1997Bullion', 'ISDA1997GovernmentBondOption', 'ISDA1998FxAndCurrencyOption', 'ISDA1999CreditDerivatives', 'ISDA2000', 'ISDA2002EquityDerivatives', 'ISDA2003CreditDerivatives', 'ISDA2004Novation', 'ISDA2005Commodity', 'ISDA2006', 'ISDA2006InflationDerivatives', 'ISDA2008InflationDerivatives', 'ISDA2011EquityDerivatives', 'ISDA2014CreditDerivatives', 'ISDA2021InterestRateDerivatives', 'ISDA2022VerifiedCarbonCredit', 'ISDA2023DigitalAssetDerivatives'))

UNION ALL

SELECT 'AgreementName' AS table_name, 'masterAgreementType' AS column_name, 'enum' AS constraint_type, id AS record_id, "masterAgreementType" AS invalid_value 
FROM "AgreementName" 
WHERE "AgreementName"."masterAgreementType" IS NOT NULL AND ("AgreementName"."masterAgreementType" NOT IN ('AFB', 'Bespoke', 'CMA', 'CMOF', 'EEIPower', 'EFETElectricity', 'EFETGas', 'EMA', 'FBF', 'GasEDI', 'German', 'GMRA', 'GMSLA', 'GTMA', 'ICOM', 'IETA_ERPA', 'IETA_ETMA', 'IETA_IETMA', 'IFEMA', 'IFEOMA', 'ISDAMaster', 'ISDAFIA_CDEA', 'ISDAIIFM_TMA', 'JSCC', 'LBMA', 'LEAP', 'MCPSA', 'NAESBGas', 'NBP', 'RussianDerivatives', 'RussianRepo', 'SCoTA', 'Swiss', 'TTF', 'ZBT'))

UNION ALL

SELECT 'AgreementName' AS table_name, 'masterConfirmationType' AS column_name, 'enum' AS constraint_type, id AS record_id, "masterConfirmationType" AS invalid_value 
FROM "AgreementName" 
WHERE "AgreementName"."masterConfirmationType" IS NOT NULL AND ("AgreementName"."masterConfirmationType" NOT IN ('_2003CreditIndex', '_2004EquityEuropeanInterdealer', '_2005VarianceSwapEuropeanInterdealer', '_2006DividendSwapEuropean', '_2006DividendSwapEuropeanInterdealer', '_2014CreditAsia', '_2014CreditAsiaFinancial', '_2014CreditAustraliaNewZealand', '_2014CreditAustraliaNewZealandFinancial', '_2014CreditEuropean', '_2014CreditEuropeanCoCoFinancial', '_2014CreditEuropeanFinancial', '_2014CreditJapan', '_2014CreditJapanFinancial', '_2014CreditNorthAmerican', '_2014CreditNorthAmericanFinancial', '_2014CreditSingapore', '_2014CreditSingaporeFinancial', '_2014CreditSovereignAsia', '_2014CreditSovereignEmergingEuropeanAndMiddleEastern', '_2014CreditSovereignJapan', '_2014CreditSovereignLatinAmerican', '_2014CreditSovereignWesternEuropean', '_2014StandardCreditAsia', '_2014StandardCreditAsiaFinancial', '_2014StandardCreditAustraliaNewZealand', '_2014StandardCreditAustraliaNewZealandFinancial', '_2014StandardCreditEuropean', '_2014StandardCreditEuropeanCoCoFinancial', '_2014StandardCreditEuropeanFinancial', '_2014StandardCreditJapan', '_2014StandardCreditJapanFinancial', '_2014StandardCreditNorthAmerican', '_2014StandardCreditNorthAmericanFinancial', '_2014StandardCreditSingapore', '_2014StandardCreditSingaporeFinancial', '_2014StandardCreditSovereignAsia', '_2014StandardCreditSovereignEmergingEuropeanAndMiddleEastern', '_2014StandardCreditSovereignJapan', '_2014StandardCreditSovereignLatinAmerican', '_2014StandardCreditSovereignWesternEuropean', 'DJ_CDX_EM', 'DJ_CDX_EM_DIV', 'DJ_CDX_NA', 'DJ_iTraxx_Europe', 'EquityAmericas', 'EquityAsia', 'EquityEuropean', 'ISDA1999Credit', 'ISDA2003CreditAsia', 'ISDA2003CreditAustraliaNewZealand', 'ISDA2003CreditEuropean', 'ISDA2003CreditJapan', 'ISDA2003CreditNorthAmerican', 'ISDA2003CreditSingapore', 'ISDA2003CreditSovereignAsia', 'ISDA2003CreditSovereignCentralAndEasternEurope', 'ISDA2003CreditSovereignJapan', 'ISDA2003CreditSovereignLatinAmerica', 'ISDA2003CreditSovereignMiddleEast', 'ISDA2003CreditSovereignWesternEurope', 'ISDA2003StandardCreditAsia', 'ISDA2003StandardCreditAustraliaNewZealand', 'ISDA2003StandardCreditEuropean', 'ISDA2003StandardCreditJapan', 'ISDA2003StandardCreditNorthAmerican', 'ISDA2003StandardCreditSingapore', 'ISDA2004CreditSovereignAsia', 'ISDA2004CreditSovereignEmergingEuropeanAndMiddleEastern', 'ISDA2004CreditSovereignJapan', 'ISDA2004CreditSovereignLatinAmerican', 'ISDA2004CreditSovereignWesternEuropean', 'ISDA2004EquityAmericasInterdealer', 'ISDA2004EquityAmericasInterdealerRev1', 'ISDA2004StandardCreditSovereignAsia', 'ISDA2004StandardCreditSovereignEmergingEuropeanAndMiddleEastern', 'ISDA2004StandardCreditSovereignJapan', 'ISDA2004StandardCreditSovereignLatinAmerican', 'ISDA2004StandardCreditSovereignWesternEuropean', 'ISDA2005EquityAsiaExcludingJapanInterdealer', 'ISDA2005EquityAsiaExcludingJapanInterdealerRev2', 'ISDA2005EquityJapaneseInterdealer', 'ISDA2006VarianceSwapJapanese', 'ISDA2006VarianceSwapJapaneseInterdealer', 'ISDA2007EquityEuropean', 'ISDA2007VarianceSwapAmericas', 'ISDA2007VarianceSwapAsiaExcludingJapan', 'ISDA2007VarianceSwapAsiaExcludingJapanRev1', 'ISDA2007VarianceSwapAsiaExcludingJapanRev2', 'ISDA2007VarianceSwapEuropean', 'ISDA2007VarianceSwapEuropeanRev1', 'ISDA2008DividendSwapJapan', 'ISDA2008DividendSwapJapaneseRev1', 'ISDA2008EquityAmericas', 'ISDA2008EquityAsiaExcludingJapan', 'ISDA2008EquityAsiaExcludingJapanRev1', 'ISDA2008EquityJapan', 'ISDA2009EquityAmericas', 'ISDA2009EquityEuropeanInterdealer', 'ISDA2009EquityPanAsia', 'ISDA2010EquityEMEAInterdealer', 'ISDA2013VolatilitySwapAmericas', 'ISDA2013VolatilitySwapAsiaExcludingJapan', 'ISDA2013VolatilitySwapEuropean', 'ISDA2013VolatilitySwapJapanese'))

UNION ALL

SELECT 'AgreementName' AS table_name, 'masterConfirmationAnnexType' AS column_name, 'enum' AS constraint_type, id AS record_id, "masterConfirmationAnnexType" AS invalid_value 
FROM "AgreementName" 
WHERE "AgreementName"."masterConfirmationAnnexType" IS NOT NULL AND ("AgreementName"."masterConfirmationAnnexType" NOT IN ('ISDA2004IndexVarianceSwapAmericasInterdealer', 'ISDA2004ShareVarianceSwapAmericasInterdealer', 'ISDA2007DispersionVarianceSwapEuropean', 'ISDA2007EquityFinanceSwapEuropean', 'ISDA2007IndexVarianceSwapAmericasInterdealer', 'ISDA2007ShareVarianceSwapAmericasInterdealer', 'ISDA2007VarianceOptionEuropean', 'ISDA2008EquityFinanceSwapAsiaExcludingJapan', 'ISDA2008EquityFinanceSwapAsiaExcludingJapanRev1', 'ISDA2008EquityOptionAsiaExcludingJapan', 'ISDA2008EquityOptionAsiaExcludingJapanRev1', 'ISDA2008EquityOptionJapan', 'ISDA2009ClosedMarketsOptionsAsiaExcludingJapan', 'ISDA2009EquityEuropeanInterdealerSS', 'ISDA2009EquityEuropeanIS', 'ISDA2009IndexShareOptionAmericas', 'ISDA2009IndexSwapEuropeanInterdealer', 'ISDA2009IndexSwapPanAsiaInterdealer', 'ISDA2009ShareSwapPanAsia', 'ISDA2010FairValueShareSwapEuropeanInterdealer', 'ISDA2010IndexShareOptionEMEAInterdealer'))

UNION ALL

SELECT 'AgreementName' AS table_name, 'brokerConfirmationType' AS column_name, 'enum' AS constraint_type, id AS record_id, "brokerConfirmationType" AS invalid_value 
FROM "AgreementName" 
WHERE "AgreementName"."brokerConfirmationType" IS NOT NULL AND ("AgreementName"."brokerConfirmationType" NOT IN ('ABX', 'AsiaCorporate', 'AsiaSovereign', 'AustraliaCorporate', 'AustraliaSovereign', 'CDSonLeveragedLoans', 'CDSonMBS', 'CDXEmergingMarkets', 'CDXEmergingMarketsDiversified', 'CDXSwaption', 'CDXTranche', 'CMBX', 'DJ_CDX_EM_', 'DJ_CDX_NA', 'EmergingEuropeanAndMiddleEasternSovereign', 'EmergingEuropeanCorporate', 'EmergingEuropeanCorporateLPN', 'EuropeanCMBS', 'EuropeanCorporate', 'EuropeanRMBS', 'JapanCorporate', 'JapanSovereign', 'LatinAmericaCorporate', 'LatinAmericaCorporateBond', 'LatinAmericaCorporateBondOrLoan', 'LatinAmericaSovereign', 'MBX', 'MCDX', 'NewZealandCorporate', 'NewZealandSovereign', 'NorthAmericanCorporate', 'PO', 'SingaporeCorporate', 'SingaporeSovereign', 'StandardAsiaCorporate', 'StandardAsiaSovereign', 'StandardAustraliaCorporate', 'StandardAustraliaSovereign', 'StandardCDXTranche', 'StandardEmergingEuropeanAndMiddleEasternSovereign', 'StandardEmergingEuropeanCorporate', 'StandardEmergingEuropeanCorporateLPN', 'StandardEuropeanCorporate', 'StandardJapanCorporate', 'StandardJapanSovereign', 'StandardLCDS', 'StandardLCDSBullet', 'StandardLCDXBullet', 'StandardLCDXBulletTranche', 'StandardLatinAmericaCorporateBond', 'StandardLatinAmericaCorporateBondOrLoan', 'StandardLatinAmericaSovereign', 'StandardNewZealandCorporate', 'StandardNewZealandSovereign', 'StandardNorthAmericanCorporate', 'StandardSingaporeCorporate', 'StandardSingaporeSovereign', 'StandardSubordinatedEuropeanInsuranceCorporate', 'StandardWesternEuropeanSovereign', 'StandardiTraxxEuropeTranche', 'SubordinatedEuropeanInsuranceCorporate', 'SukukCorporate', 'SukukSovereign', 'SyndicatedSecuredLoanCDS', 'TRX', 'TRX_II', 'USMunicipalFullFaithAndCredit', 'USMunicipalGeneralFund', 'USMunicipalRevenue', 'WesternEuropeanSovereign', 'iTraxxAsiaExJapan', 'iTraxxAsiaExJapanSwaption', 'iTraxxAsiaExJapanTranche', 'iTraxxAustralia', 'iTraxxAustraliaSwaption', 'iTraxxAustraliaTranche', 'iTraxxCJ', 'iTraxxCJTranche', 'iTraxxEurope', 'iTraxxEuropeSwaption', 'iTraxxEuropeTranche', 'iTraxxJapan', 'iTraxxJapanSwaption', 'iTraxxJapanTranche', 'iTraxxLevX', 'iTraxxSDI75', 'iTraxxSovX'))

UNION ALL

SELECT 'UmbrellaAgreement' AS table_name, 'agreementSet' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "UmbrellaAgreement" 
WHERE "UmbrellaAgreement"."agreementSet" IS NULL

UNION ALL

SELECT 'UmbrellaAgreementParty' AS table_name, 'actingAs' AS column_name, 'enum' AS constraint_type, id AS record_id, "actingAs" AS invalid_value 
FROM "UmbrellaAgreementParty" 
WHERE "UmbrellaAgreementParty"."actingAs" IS NOT NULL AND ("UmbrellaAgreementParty"."actingAs" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'UmbrellaAgreementParty' AS table_name, 'partyRole' AS column_name, 'enum' AS constraint_type, id AS record_id, "partyRole" AS invalid_value 
FROM "UmbrellaAgreementParty" 
WHERE "UmbrellaAgreementParty"."partyRole" IS NOT NULL AND ("UmbrellaAgreementParty"."partyRole" NOT IN ('Agent', 'InvestmentManager', 'Principal', 'SubAccount', 'Sleeve'))

UNION ALL

SELECT 'NonLegalEntity' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "NonLegalEntity" 
WHERE "NonLegalEntity".identifier IS NULL

UNION ALL

SELECT 'NonLegalEntity' AS table_name, 'identifierType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "NonLegalEntity" 
WHERE "NonLegalEntity"."identifierType" IS NULL

UNION ALL

SELECT 'UmbrellaAgreementSet' AS table_name, 'agreement' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "UmbrellaAgreementSet" 
WHERE "UmbrellaAgreementSet".agreement IS NULL

UNION ALL

SELECT 'UmbrellaAgreementSet' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "UmbrellaAgreementSet" 
WHERE "UmbrellaAgreementSet".party IS NULL

UNION ALL

SELECT 'ContactInformationElection' AS table_name, 'partyReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ContactInformationElection" 
WHERE "ContactInformationElection"."partyReference" IS NULL

UNION ALL

SELECT 'ContactInformationElection' AS table_name, 'partyReference' AS column_name, 'enum' AS constraint_type, id AS record_id, "partyReference" AS invalid_value 
FROM "ContactInformationElection" 
WHERE "ContactInformationElection"."partyReference" IS NOT NULL AND ("ContactInformationElection"."partyReference" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'NoticeInformationElection' AS table_name, 'partyReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "NoticeInformationElection" 
WHERE "NoticeInformationElection"."partyReference" IS NULL

UNION ALL

SELECT 'NoticeInformationElection' AS table_name, 'partyReference' AS column_name, 'enum' AS constraint_type, id AS record_id, "partyReference" AS invalid_value 
FROM "NoticeInformationElection" 
WHERE "NoticeInformationElection"."partyReference" IS NOT NULL AND ("NoticeInformationElection"."partyReference" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'TransferInformationElection' AS table_name, 'partyReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TransferInformationElection" 
WHERE "TransferInformationElection"."partyReference" IS NULL

UNION ALL

SELECT 'TransferInformationElection' AS table_name, 'partyReference' AS column_name, 'enum' AS constraint_type, id AS record_id, "partyReference" AS invalid_value 
FROM "TransferInformationElection" 
WHERE "TransferInformationElection"."partyReference" IS NOT NULL AND ("TransferInformationElection"."partyReference" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'OtherAgreementTerms' AS table_name, 'isSpecified' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "OtherAgreementTerms" 
WHERE "OtherAgreementTerms"."isSpecified" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementInitialMarginElections' AS table_name, 'regime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementInitialMarginElections" 
WHERE "CreditSupportAgreementInitialMarginElections".regime IS NULL

UNION ALL

SELECT 'CreditSupportAgreementInitialMarginElections' AS table_name, 'oneWayProvisions' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementInitialMarginElections" 
WHERE "CreditSupportAgreementInitialMarginElections"."oneWayProvisions" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementInitialMarginElections' AS table_name, 'sensitivityMethodologies' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementInitialMarginElections" 
WHERE "CreditSupportAgreementInitialMarginElections"."sensitivityMethodologies" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementInitialMarginElections' AS table_name, 'postingObligations' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementInitialMarginElections" 
WHERE "CreditSupportAgreementInitialMarginElections"."postingObligations" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementInitialMarginElections' AS table_name, 'rightsEvents' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementInitialMarginElections" 
WHERE "CreditSupportAgreementInitialMarginElections"."rightsEvents" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementInitialMarginElections' AS table_name, 'terminationCurrencyAmendment' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementInitialMarginElections" 
WHERE "CreditSupportAgreementInitialMarginElections"."terminationCurrencyAmendment" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementInitialMarginElections' AS table_name, 'minimumTransferAmountAmendment' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementInitialMarginElections" 
WHERE "CreditSupportAgreementInitialMarginElections"."minimumTransferAmountAmendment" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementInitialMarginElections' AS table_name, 'processAgent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementInitialMarginElections" 
WHERE "CreditSupportAgreementInitialMarginElections"."processAgent" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementInitialMarginElections' AS table_name, 'trustSchemeAddendum' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementInitialMarginElections" 
WHERE "CreditSupportAgreementInitialMarginElections"."trustSchemeAddendum" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementInitialMarginElections' AS table_name, 'creditSupportObligations' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementInitialMarginElections" 
WHERE "CreditSupportAgreementInitialMarginElections"."creditSupportObligations" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementInitialMarginElections' AS table_name, 'calculationAndTiming' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementInitialMarginElections" 
WHERE "CreditSupportAgreementInitialMarginElections"."calculationAndTiming" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementInitialMarginElections' AS table_name, 'baseAndEligibleCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementInitialMarginElections" 
WHERE "CreditSupportAgreementInitialMarginElections"."baseAndEligibleCurrency" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementInitialMarginElections' AS table_name, 'disputeResolution' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementInitialMarginElections" 
WHERE "CreditSupportAgreementInitialMarginElections"."disputeResolution" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementInitialMarginElections' AS table_name, 'finalReturns' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementInitialMarginElections" 
WHERE "CreditSupportAgreementInitialMarginElections"."finalReturns" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementVariationMarginElections' AS table_name, 'coveredTransactions' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementVariationMarginElections" 
WHERE "CreditSupportAgreementVariationMarginElections"."coveredTransactions" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementVariationMarginElections' AS table_name, 'creditSupportOffsets' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementVariationMarginElections" 
WHERE "CreditSupportAgreementVariationMarginElections"."creditSupportOffsets" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementVariationMarginElections' AS table_name, 'securityInterestForObligations' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementVariationMarginElections" 
WHERE "CreditSupportAgreementVariationMarginElections"."securityInterestForObligations" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementVariationMarginElections' AS table_name, 'creditSupportObligations' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementVariationMarginElections" 
WHERE "CreditSupportAgreementVariationMarginElections"."creditSupportObligations" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementVariationMarginElections' AS table_name, 'calculationAndTiming' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementVariationMarginElections" 
WHERE "CreditSupportAgreementVariationMarginElections"."calculationAndTiming" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementVariationMarginElections' AS table_name, 'baseAndEligibleCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementVariationMarginElections" 
WHERE "CreditSupportAgreementVariationMarginElections"."baseAndEligibleCurrency" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementVariationMarginElections' AS table_name, 'disputeResolution' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementVariationMarginElections" 
WHERE "CreditSupportAgreementVariationMarginElections"."disputeResolution" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementVariationMarginElections' AS table_name, 'finalReturns' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementVariationMarginElections" 
WHERE "CreditSupportAgreementVariationMarginElections"."finalReturns" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementLegacyElections' AS table_name, 'creditSupportObligations' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementLegacyElections" 
WHERE "CreditSupportAgreementLegacyElections"."creditSupportObligations" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementLegacyElections' AS table_name, 'calculationAndTiming' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementLegacyElections" 
WHERE "CreditSupportAgreementLegacyElections"."calculationAndTiming" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementLegacyElections' AS table_name, 'baseAndEligibleCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementLegacyElections" 
WHERE "CreditSupportAgreementLegacyElections"."baseAndEligibleCurrency" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementLegacyElections' AS table_name, 'disputeResolution' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementLegacyElections" 
WHERE "CreditSupportAgreementLegacyElections"."disputeResolution" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementLegacyElections' AS table_name, 'finalReturns' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementLegacyElections" 
WHERE "CreditSupportAgreementLegacyElections"."finalReturns" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementElectionsBase' AS table_name, 'baseAndEligibleCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementElectionsBase" 
WHERE "CreditSupportAgreementElectionsBase"."baseAndEligibleCurrency" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementElectionsBase' AS table_name, 'disputeResolution' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementElectionsBase" 
WHERE "CreditSupportAgreementElectionsBase"."disputeResolution" IS NULL

UNION ALL

SELECT 'CreditSupportAgreementElectionsBase' AS table_name, 'finalReturns' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAgreementElectionsBase" 
WHERE "CreditSupportAgreementElectionsBase"."finalReturns" IS NULL

UNION ALL

SELECT 'CollateralTransferAgreementElections' AS table_name, 'regime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralTransferAgreementElections" 
WHERE "CollateralTransferAgreementElections".regime IS NULL

UNION ALL

SELECT 'CollateralTransferAgreementElections' AS table_name, 'oneWayProvisions' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralTransferAgreementElections" 
WHERE "CollateralTransferAgreementElections"."oneWayProvisions" IS NULL

UNION ALL

SELECT 'CollateralTransferAgreementElections' AS table_name, 'sensitivityMethodologies' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralTransferAgreementElections" 
WHERE "CollateralTransferAgreementElections"."sensitivityMethodologies" IS NULL

UNION ALL

SELECT 'CollateralTransferAgreementElections' AS table_name, 'postingObligations' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralTransferAgreementElections" 
WHERE "CollateralTransferAgreementElections"."postingObligations" IS NULL

UNION ALL

SELECT 'CollateralTransferAgreementElections' AS table_name, 'baseAndEligibleCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralTransferAgreementElections" 
WHERE "CollateralTransferAgreementElections"."baseAndEligibleCurrency" IS NULL

UNION ALL

SELECT 'CollateralTransferAgreementElections' AS table_name, 'creditSupportObligations' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralTransferAgreementElections" 
WHERE "CollateralTransferAgreementElections"."creditSupportObligations" IS NULL

UNION ALL

SELECT 'CollateralTransferAgreementElections' AS table_name, 'calculationAndTiming' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralTransferAgreementElections" 
WHERE "CollateralTransferAgreementElections"."calculationAndTiming" IS NULL

UNION ALL

SELECT 'CollateralTransferAgreementElections' AS table_name, 'disputeResolution' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralTransferAgreementElections" 
WHERE "CollateralTransferAgreementElections"."disputeResolution" IS NULL

UNION ALL

SELECT 'CollateralTransferAgreementElections' AS table_name, 'terminationCurrencyAmendment' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralTransferAgreementElections" 
WHERE "CollateralTransferAgreementElections"."terminationCurrencyAmendment" IS NULL

UNION ALL

SELECT 'CollateralTransferAgreementElections' AS table_name, 'minimumTransferAmountAmendment' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralTransferAgreementElections" 
WHERE "CollateralTransferAgreementElections"."minimumTransferAmountAmendment" IS NULL

UNION ALL

SELECT 'PostedCreditSupportItem' AS table_name, 'cashOrSecurityValue' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PostedCreditSupportItem" 
WHERE "PostedCreditSupportItem"."cashOrSecurityValue" IS NULL

UNION ALL

SELECT 'PostedCreditSupportItem' AS table_name, 'haircutPercentage' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PostedCreditSupportItem" 
WHERE "PostedCreditSupportItem"."haircutPercentage" IS NULL

UNION ALL

SELECT 'PostedCreditSupportItem' AS table_name, 'disputedCashOrSecurityValue' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PostedCreditSupportItem" 
WHERE "PostedCreditSupportItem"."disputedCashOrSecurityValue" IS NULL

UNION ALL

SELECT 'AdditionalRepresentation' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AdditionalRepresentation" 
WHERE "AdditionalRepresentation"."partyElection" IS NULL

UNION ALL

SELECT 'AdditionalRepresentationElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AdditionalRepresentationElection" 
WHERE "AdditionalRepresentationElection".party IS NULL

UNION ALL

SELECT 'AdditionalRepresentationElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "AdditionalRepresentationElection" 
WHERE "AdditionalRepresentationElection".party IS NOT NULL AND ("AdditionalRepresentationElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'AdditionalRepresentationElection' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AdditionalRepresentationElection" 
WHERE "AdditionalRepresentationElection"."isApplicable" IS NULL

UNION ALL

SELECT 'AdditionalRightsEvent' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AdditionalRightsEvent" 
WHERE "AdditionalRightsEvent"."isApplicable" IS NULL

UNION ALL

SELECT 'AdditionalTerminationEvent' AS table_name, 'name' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AdditionalTerminationEvent" 
WHERE "AdditionalTerminationEvent".name IS NULL

UNION ALL

SELECT 'AdditionalTerminationEvent' AS table_name, 'applicableParty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AdditionalTerminationEvent" 
WHERE "AdditionalTerminationEvent"."applicableParty" IS NULL

UNION ALL

SELECT 'AdditionalTerminationEvent' AS table_name, 'applicableParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "applicableParty" AS invalid_value 
FROM "AdditionalTerminationEvent" 
WHERE "AdditionalTerminationEvent"."applicableParty" IS NOT NULL AND ("AdditionalTerminationEvent"."applicableParty" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'AdditionalType' AS table_name, 'standardValue' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AdditionalType" 
WHERE "AdditionalType"."standardValue" IS NULL

UNION ALL

SELECT 'AdditionalType' AS table_name, 'standardValue' AS column_name, 'enum' AS constraint_type, id AS record_id, "standardValue" AS invalid_value 
FROM "AdditionalType" 
WHERE "AdditionalType"."standardValue" IS NOT NULL AND ("AdditionalType"."standardValue" NOT IN ('NotApplicable', 'EquityOptionOrIndexOption', 'Other'))

UNION ALL

SELECT 'AmendmentEffectiveDate' AS table_name, 'specificDate' AS column_name, 'enum' AS constraint_type, id AS record_id, "specificDate" AS invalid_value 
FROM "AmendmentEffectiveDate" 
WHERE "AmendmentEffectiveDate"."specificDate" IS NOT NULL AND ("AmendmentEffectiveDate"."specificDate" NOT IN ('AnnexDate', 'DeedDate', 'AgreementDate', 'AmendmentEffectiveDate'))

UNION ALL

SELECT 'ApplicableRegime' AS table_name, 'regime' AS column_name, 'enum' AS constraint_type, id AS record_id, regime AS invalid_value 
FROM "ApplicableRegime" 
WHERE "ApplicableRegime".regime IS NOT NULL AND ("ApplicableRegime".regime NOT IN ('AustraliaMarginRules', 'CanadaMarginRules', 'CFTC_MarginRules', 'EMIR_MarginRules', 'HongKongMarginRules', 'JapanMarginRules', 'US_PrudentialMarginRules', 'SEC_MarginRules', 'SingaporeMarginRules', 'SwitzerlandMarginRules', 'BrazilMarginRules', 'UnitedKingdomMarginRules', 'SouthAfricaMarginRules', 'SouthKoreaMarginRules', 'HongKongSFCMarginRules'))

UNION ALL

SELECT 'ApplicableRegime' AS table_name, 'regimeTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ApplicableRegime" 
WHERE "ApplicableRegime"."regimeTerms" IS NULL

UNION ALL

SELECT 'ApplicableRegime' AS table_name, 'additionalType' AS column_name, 'enum' AS constraint_type, id AS record_id, "additionalType" AS invalid_value 
FROM "ApplicableRegime" 
WHERE "ApplicableRegime"."additionalType" IS NOT NULL AND ("ApplicableRegime"."additionalType" NOT IN ('NotApplicable', 'EquityOptionOrIndexOption', 'Other'))

UNION ALL

SELECT 'AppropriatedCollateralValuation' AS table_name, 'isSpecified' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AppropriatedCollateralValuation" 
WHERE "AppropriatedCollateralValuation"."isSpecified" IS NULL

UNION ALL

SELECT 'BespokeCalculationDate' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BespokeCalculationDate" 
WHERE "BespokeCalculationDate"."isApplicable" IS NULL

UNION ALL

SELECT 'BespokeCalculationTime' AS table_name, 'asCalculationAgent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BespokeCalculationTime" 
WHERE "BespokeCalculationTime"."asCalculationAgent" IS NULL

UNION ALL

SELECT 'BespokeTransferTiming' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BespokeTransferTiming" 
WHERE "BespokeTransferTiming"."isApplicable" IS NULL

UNION ALL

SELECT 'CalculationAgentTerms' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "CalculationAgentTerms" 
WHERE "CalculationAgentTerms".party IS NOT NULL AND ("CalculationAgentTerms".party NOT IN ('Party1', 'Party2', 'PartyMakingDemand'))

UNION ALL

SELECT 'CalculationAndTimingLegacy' AS table_name, 'valuationDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationAndTimingLegacy" 
WHERE "CalculationAndTimingLegacy"."valuationDate" IS NULL

UNION ALL

SELECT 'CalculationAndTimingLegacy' AS table_name, 'valuationTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationAndTimingLegacy" 
WHERE "CalculationAndTimingLegacy"."valuationTime" IS NULL

UNION ALL

SELECT 'CalculationAndTimingLegacy' AS table_name, 'valuationAgent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationAndTimingLegacy" 
WHERE "CalculationAndTimingLegacy"."valuationAgent" IS NULL

UNION ALL

SELECT 'CalculationAndTimingLegacy' AS table_name, 'notificationTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationAndTimingLegacy" 
WHERE "CalculationAndTimingLegacy"."notificationTime" IS NULL

UNION ALL

SELECT 'CalculationAndTimingVariationMargin' AS table_name, 'valuationDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationAndTimingVariationMargin" 
WHERE "CalculationAndTimingVariationMargin"."valuationDate" IS NULL

UNION ALL

SELECT 'CalculationAndTimingVariationMargin' AS table_name, 'valuationTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationAndTimingVariationMargin" 
WHERE "CalculationAndTimingVariationMargin"."valuationTime" IS NULL

UNION ALL

SELECT 'CalculationAndTimingVariationMargin' AS table_name, 'valuationAgent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationAndTimingVariationMargin" 
WHERE "CalculationAndTimingVariationMargin"."valuationAgent" IS NULL

UNION ALL

SELECT 'CalculationAndTimingVariationMargin' AS table_name, 'valuationDateLocation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationAndTimingVariationMargin" 
WHERE "CalculationAndTimingVariationMargin"."valuationDateLocation" IS NULL

UNION ALL

SELECT 'CalculationAndTimingVariationMargin' AS table_name, 'notificationTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationAndTimingVariationMargin" 
WHERE "CalculationAndTimingVariationMargin"."notificationTime" IS NULL

UNION ALL

SELECT 'CalculationAndTimingInitialMargin' AS table_name, 'calculationAgentTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationAndTimingInitialMargin" 
WHERE "CalculationAndTimingInitialMargin"."calculationAgentTerms" IS NULL

UNION ALL

SELECT 'CalculationAndTimingInitialMargin' AS table_name, 'calculationDateLocation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationAndTimingInitialMargin" 
WHERE "CalculationAndTimingInitialMargin"."calculationDateLocation" IS NULL

UNION ALL

SELECT 'CalculationAndTimingInitialMargin' AS table_name, 'notificationTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationAndTimingInitialMargin" 
WHERE "CalculationAndTimingInitialMargin"."notificationTime" IS NULL

UNION ALL

SELECT 'CalculationAndTimingCollateralTransferAgreement' AS table_name, 'notificationTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationAndTimingCollateralTransferAgreement" 
WHERE "CalculationAndTimingCollateralTransferAgreement"."notificationTime" IS NULL

UNION ALL

SELECT 'CalculationAndTimingBase' AS table_name, 'notificationTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationAndTimingBase" 
WHERE "CalculationAndTimingBase"."notificationTime" IS NULL

UNION ALL

SELECT 'CalculationCurrencyElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationCurrencyElection" 
WHERE "CalculationCurrencyElection".party IS NULL

UNION ALL

SELECT 'CalculationCurrencyElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "CalculationCurrencyElection" 
WHERE "CalculationCurrencyElection".party IS NOT NULL AND ("CalculationCurrencyElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'CalculationCurrencyElection' AS table_name, 'isBaseCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationCurrencyElection" 
WHERE "CalculationCurrencyElection"."isBaseCurrency" IS NULL

UNION ALL

SELECT 'ValuationCalculationDateLocation' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ValuationCalculationDateLocation" 
WHERE "ValuationCalculationDateLocation"."partyElection" IS NULL

UNION ALL

SELECT 'ValuationCalculationDateLocationElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ValuationCalculationDateLocationElection" 
WHERE "ValuationCalculationDateLocationElection".party IS NULL

UNION ALL

SELECT 'ValuationCalculationDateLocationElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "ValuationCalculationDateLocationElection" 
WHERE "ValuationCalculationDateLocationElection".party IS NOT NULL AND ("ValuationCalculationDateLocationElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'CollateralAccessBreach' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralAccessBreach" 
WHERE "CollateralAccessBreach"."isApplicable" IS NULL

UNION ALL

SELECT 'CollateralManagementAgreement' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralManagementAgreement" 
WHERE "CollateralManagementAgreement"."partyElection" IS NULL

UNION ALL

SELECT 'CollateralManagementAgreementElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralManagementAgreementElection" 
WHERE "CollateralManagementAgreementElection".party IS NULL

UNION ALL

SELECT 'CollateralManagementAgreementElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "CollateralManagementAgreementElection" 
WHERE "CollateralManagementAgreementElection".party IS NOT NULL AND ("CollateralManagementAgreementElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'CollateralManagementAgreementElection' AS table_name, 'collateralManagementAgreement' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralManagementAgreementElection" 
WHERE "CollateralManagementAgreementElection"."collateralManagementAgreement" IS NULL

UNION ALL

SELECT 'CollateralRounding' AS table_name, 'deliveryAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralRounding" 
WHERE "CollateralRounding"."deliveryAmount" IS NULL

UNION ALL

SELECT 'CollateralRounding' AS table_name, 'deliveryDirection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralRounding" 
WHERE "CollateralRounding"."deliveryDirection" IS NULL

UNION ALL

SELECT 'CollateralRounding' AS table_name, 'deliveryDirection' AS column_name, 'enum' AS constraint_type, id AS record_id, "deliveryDirection" AS invalid_value 
FROM "CollateralRounding" 
WHERE "CollateralRounding"."deliveryDirection" IS NOT NULL AND ("CollateralRounding"."deliveryDirection" NOT IN ('Down', 'Up'))

UNION ALL

SELECT 'CollateralRounding' AS table_name, 'returnAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralRounding" 
WHERE "CollateralRounding"."returnAmount" IS NULL

UNION ALL

SELECT 'CollateralRounding' AS table_name, 'returnDirection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralRounding" 
WHERE "CollateralRounding"."returnDirection" IS NULL

UNION ALL

SELECT 'CollateralRounding' AS table_name, 'returnDirection' AS column_name, 'enum' AS constraint_type, id AS record_id, "returnDirection" AS invalid_value 
FROM "CollateralRounding" 
WHERE "CollateralRounding"."returnDirection" IS NOT NULL AND ("CollateralRounding"."returnDirection" NOT IN ('Down', 'Up'))

UNION ALL

SELECT 'CollateralRounding' AS table_name, 'currency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralRounding" 
WHERE "CollateralRounding".currency IS NULL

UNION ALL

SELECT 'CollateralRounding' AS table_name, 'currency' AS column_name, 'enum' AS constraint_type, id AS record_id, currency AS invalid_value 
FROM "CollateralRounding" 
WHERE "CollateralRounding".currency IS NOT NULL AND ("CollateralRounding".currency NOT IN ('AED', 'AFN', 'ALL', 'AMD', 'AOA', 'ARS', 'AUD', 'AWG', 'AZN', 'BAM', 'BBD', 'BDT', 'BHD', 'BIF', 'BMD', 'BND', 'BOB', 'BOV', 'BRL', 'BSD', 'BTN', 'BWP', 'BYN', 'BZD', 'CAD', 'CDF', 'CHE', 'CHF', 'CHW', 'CLF', 'CLP', 'CNY', 'COP', 'COU', 'CRC', 'CUP', 'CVE', 'CZK', 'DJF', 'DKK', 'DOP', 'DZD', 'EGP', 'ERN', 'ETB', 'EUR', 'FJD', 'FKP', 'GBP', 'GEL', 'GHS', 'GIP', 'GMD', 'GNF', 'GTQ', 'GYD', 'HKD', 'HNL', 'HTG', 'HUF', 'IDR', 'ILS', 'INR', 'IQD', 'IRR', 'ISK', 'JMD', 'JOD', 'JPY', 'KES', 'KGS', 'KHR', 'KMF', 'KPW', 'KRW', 'KWD', 'KYD', 'KZT', 'LAK', 'LBP', 'LKR', 'LRD', 'LSL', 'LYD', 'MAD', 'MDL', 'MGA', 'MKD', 'MMK', 'MNT', 'MOP', 'MRU', 'MUR', 'MVR', 'MWK', 'MXN', 'MXV', 'MYR', 'MZN', 'NAD', 'NGN', 'NIO', 'NOK', 'NPR', 'NZD', 'OMR', 'PAB', 'PEN', 'PGK', 'PHP', 'PKR', 'PLN', 'PYG', 'QAR', 'RON', 'RSD', 'RUB', 'RWF', 'SAR', 'SBD', 'SCR', 'SDG', 'SEK', 'SGD', 'SHP', 'SLE', 'SOS', 'SRD', 'SSP', 'STN', 'SVC', 'SYP', 'SZL', 'THB', 'TJS', 'TMT', 'TND', 'TOP', 'TRY', 'TTD', 'TWD', 'TZS', 'UAH', 'UGX', 'USD', 'USN', 'UYI', 'UYU', 'UYW', 'UZS', 'VED', 'VES', 'VND', 'VUV', 'WST', 'XAD', 'XAF', 'XAG', 'XAU', 'XBA', 'XBB', 'XBC', 'XBD', 'XCD', 'XCG', 'XDR', 'XOF', 'XPD', 'XPF', 'XPT', 'XSU', 'XTS', 'XUA', 'XXX', 'YER', 'ZAR', 'ZMW', 'ZWG'))

UNION ALL

SELECT 'ConditionsPrecedent' AS table_name, 'conditionsPrecedentElection' AS column_name, 'enum' AS constraint_type, id AS record_id, "conditionsPrecedentElection" AS invalid_value 
FROM "ConditionsPrecedent" 
WHERE "ConditionsPrecedent"."conditionsPrecedentElection" IS NOT NULL AND ("ConditionsPrecedent"."conditionsPrecedentElection" NOT IN ('Applicable', 'NotApplicable', 'Other'))

UNION ALL

SELECT 'ControlAgreement' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ControlAgreement" 
WHERE "ControlAgreement"."partyElection" IS NULL

UNION ALL

SELECT 'ControlAgreementElections' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ControlAgreementElections" 
WHERE "ControlAgreementElections".party IS NULL

UNION ALL

SELECT 'ControlAgreementElections' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "ControlAgreementElections" 
WHERE "ControlAgreementElections".party IS NOT NULL AND ("ControlAgreementElections".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'ControlAgreementElections' AS table_name, 'controlAgreementAsCsd' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ControlAgreementElections" 
WHERE "ControlAgreementElections"."controlAgreementAsCsd" IS NULL

UNION ALL

SELECT 'ControlAgreementNecEvent' AS table_name, 'controlAgreementNecEventElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ControlAgreementNecEvent" 
WHERE "ControlAgreementNecEvent"."controlAgreementNecEventElection" IS NULL

UNION ALL

SELECT 'ControlAgreementNecEventElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ControlAgreementNecEventElection" 
WHERE "ControlAgreementNecEventElection".party IS NULL

UNION ALL

SELECT 'ControlAgreementNecEventElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "ControlAgreementNecEventElection" 
WHERE "ControlAgreementNecEventElection".party IS NOT NULL AND ("ControlAgreementNecEventElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'ControlAgreementNecEventElection' AS table_name, 'necEvent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ControlAgreementNecEventElection" 
WHERE "ControlAgreementNecEventElection"."necEvent" IS NULL

UNION ALL

SELECT 'Custodian' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Custodian" 
WHERE "Custodian"."partyElection" IS NULL

UNION ALL

SELECT 'CustodianElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CustodianElection" 
WHERE "CustodianElection".party IS NULL

UNION ALL

SELECT 'CustodianElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "CustodianElection" 
WHERE "CustodianElection".party IS NOT NULL AND ("CustodianElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'CustodianElection' AS table_name, 'legacyVMCustodian' AS column_name, 'enum' AS constraint_type, id AS record_id, "legacyVMCustodian" AS invalid_value 
FROM "CustodianElection" 
WHERE "CustodianElection"."legacyVMCustodian" IS NOT NULL AND ("CustodianElection"."legacyVMCustodian" NOT IN ('NotApplicable', 'NamedEntity', 'AsAdvised1to2', 'AsAdvised2to1', 'Party1toParty2', 'Party2toParty1'))

UNION ALL

SELECT 'CustodianEvent' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CustodianEvent" 
WHERE "CustodianEvent"."isApplicable" IS NULL

UNION ALL

SELECT 'CustodianEventEndDate' AS table_name, 'daysAfterCustodianEvent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CustodianEventEndDate" 
WHERE "CustodianEventEndDate"."daysAfterCustodianEvent" IS NULL

UNION ALL

SELECT 'CustodianEventEndDate' AS table_name, 'releaseDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CustodianEventEndDate" 
WHERE "CustodianEventEndDate"."releaseDate" IS NULL

UNION ALL

SELECT 'CustodianEventEndDate' AS table_name, 'dateOfTimelyStatement' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CustodianEventEndDate" 
WHERE "CustodianEventEndDate"."dateOfTimelyStatement" IS NULL

UNION ALL

SELECT 'CustodianRisk' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CustodianRisk" 
WHERE "CustodianRisk"."partyElection" IS NULL

UNION ALL

SELECT 'CustodianRiskElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "CustodianRiskElection" 
WHERE "CustodianRiskElection".party IS NOT NULL AND ("CustodianRiskElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'CustodianRiskElection' AS table_name, 'isSpecified' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CustodianRiskElection" 
WHERE "CustodianRiskElection"."isSpecified" IS NULL

UNION ALL

SELECT 'ElectiveAmountElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ElectiveAmountElection" 
WHERE "ElectiveAmountElection".party IS NULL

UNION ALL

SELECT 'ElectiveAmountElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "ElectiveAmountElection" 
WHERE "ElectiveAmountElection".party IS NOT NULL AND ("ElectiveAmountElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'ElectiveAmountElection' AS table_name, 'electiveAmount' AS column_name, 'enum' AS constraint_type, id AS record_id, "electiveAmount" AS invalid_value 
FROM "ElectiveAmountElection" 
WHERE "ElectiveAmountElection"."electiveAmount" IS NOT NULL AND ("ElectiveAmountElection"."electiveAmount" NOT IN ('Zero', 'Unlimited'))

UNION ALL

SELECT 'EnforcementEvent' AS table_name, 'earlyTerminationDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EnforcementEvent" 
WHERE "EnforcementEvent"."earlyTerminationDate" IS NULL

UNION ALL

SELECT 'ExecutionLanguage' AS table_name, 'standardLanguage' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExecutionLanguage" 
WHERE "ExecutionLanguage"."standardLanguage" IS NULL

UNION ALL

SELECT 'ExecutionLocation' AS table_name, 'executionLocation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExecutionLocation" 
WHERE "ExecutionLocation"."executionLocation" IS NULL

UNION ALL

SELECT 'ExecutionLocation' AS table_name, 'executionLocation' AS column_name, 'enum' AS constraint_type, id AS record_id, "executionLocation" AS invalid_value 
FROM "ExecutionLocation" 
WHERE "ExecutionLocation"."executionLocation" IS NOT NULL AND ("ExecutionLocation"."executionLocation" NOT IN ('ExecutedOutsideBelgium', 'ExecutedInBelgium', 'OtherLocation'))

UNION ALL

SELECT 'ExecutionTerms' AS table_name, 'executionLanguage' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExecutionTerms" 
WHERE "ExecutionTerms"."executionLanguage" IS NULL

UNION ALL

SELECT 'ExecutionTerms' AS table_name, 'executionLocation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExecutionTerms" 
WHERE "ExecutionTerms"."executionLocation" IS NULL

UNION ALL

SELECT 'FrenchLawAddendum' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FrenchLawAddendum" 
WHERE "FrenchLawAddendum"."isApplicable" IS NULL

UNION ALL

SELECT 'FrenchLawAddendumElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FrenchLawAddendumElection" 
WHERE "FrenchLawAddendumElection".party IS NULL

UNION ALL

SELECT 'FrenchLawAddendumElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "FrenchLawAddendumElection" 
WHERE "FrenchLawAddendumElection".party IS NOT NULL AND ("FrenchLawAddendumElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'FrenchLawAddendumElection' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FrenchLawAddendumElection" 
WHERE "FrenchLawAddendumElection"."isApplicable" IS NULL

UNION ALL

SELECT 'FxHaircutCurrency' AS table_name, 'isTerminationCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxHaircutCurrency" 
WHERE "FxHaircutCurrency"."isTerminationCurrency" IS NULL

UNION ALL

SELECT 'GeneralSimmElections' AS table_name, 'simmCalculationCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "GeneralSimmElections" 
WHERE "GeneralSimmElections"."simmCalculationCurrency" IS NULL

UNION ALL

SELECT 'HoldingAndUsingPostedCollateral' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "HoldingAndUsingPostedCollateral" 
WHERE "HoldingAndUsingPostedCollateral"."partyElection" IS NULL

UNION ALL

SELECT 'HoldingAndUsingPostedCollateralElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "HoldingAndUsingPostedCollateralElection" 
WHERE "HoldingAndUsingPostedCollateralElection".party IS NULL

UNION ALL

SELECT 'HoldingAndUsingPostedCollateralElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "HoldingAndUsingPostedCollateralElection" 
WHERE "HoldingAndUsingPostedCollateralElection".party IS NOT NULL AND ("HoldingAndUsingPostedCollateralElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'HoldingAndUsingPostedCollateralElection' AS table_name, 'eligibilityToHoldCollateral' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "HoldingAndUsingPostedCollateralElection" 
WHERE "HoldingAndUsingPostedCollateralElection"."eligibilityToHoldCollateral" IS NULL

UNION ALL

SELECT 'HoldingAndUsingPostedCollateralElection' AS table_name, 'useOfPostedCollateral' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "HoldingAndUsingPostedCollateralElection" 
WHERE "HoldingAndUsingPostedCollateralElection"."useOfPostedCollateral" IS NULL

UNION ALL

SELECT 'IneligibleCreditSupport' AS table_name, 'specifiedParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "specifiedParty" AS invalid_value 
FROM "IneligibleCreditSupport" 
WHERE "IneligibleCreditSupport"."specifiedParty" IS NOT NULL AND ("IneligibleCreditSupport"."specifiedParty" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'InterestAdjustment' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InterestAdjustment" 
WHERE "InterestAdjustment"."isApplicable" IS NULL

UNION ALL

SELECT 'InterestAdjustment' AS table_name, 'periodicity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InterestAdjustment" 
WHERE "InterestAdjustment".periodicity IS NULL

UNION ALL

SELECT 'InterestAdjustmentPeriodicity' AS table_name, 'standardElection' AS column_name, 'enum' AS constraint_type, id AS record_id, "standardElection" AS invalid_value 
FROM "InterestAdjustmentPeriodicity" 
WHERE "InterestAdjustmentPeriodicity"."standardElection" IS NOT NULL AND ("InterestAdjustmentPeriodicity"."standardElection" NOT IN ('LastLocalBusinessDayOfMonth', 'EachDay'))

UNION ALL

SELECT 'InterestAmount' AS table_name, 'returnAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InterestAmount" 
WHERE "InterestAmount"."returnAmount" IS NULL

UNION ALL

SELECT 'InterestAmount' AS table_name, 'deliveryAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InterestAmount" 
WHERE "InterestAmount"."deliveryAmount" IS NULL

UNION ALL

SELECT 'JapaneseSecuritiesProvisions' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "JapaneseSecuritiesProvisions" 
WHERE "JapaneseSecuritiesProvisions"."isApplicable" IS NULL

UNION ALL

SELECT 'MarginApproach' AS table_name, 'marginApproach' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MarginApproach" 
WHERE "MarginApproach"."marginApproach" IS NULL

UNION ALL

SELECT 'MarginApproach' AS table_name, 'marginApproach' AS column_name, 'enum' AS constraint_type, id AS record_id, "marginApproach" AS invalid_value 
FROM "MarginApproach" 
WHERE "MarginApproach"."marginApproach" IS NOT NULL AND ("MarginApproach"."marginApproach" NOT IN ('Distinct', 'Allocated', 'GreaterOf'))

UNION ALL

SELECT 'MinimumTransferAmountAmendment' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MinimumTransferAmountAmendment" 
WHERE "MinimumTransferAmountAmendment"."isApplicable" IS NULL

UNION ALL

SELECT 'NotificationTime' AS table_name, 'partyElections' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "NotificationTime" 
WHERE "NotificationTime"."partyElections" IS NULL

UNION ALL

SELECT 'NotificationTimeElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "NotificationTimeElection" 
WHERE "NotificationTimeElection".party IS NULL

UNION ALL

SELECT 'NotificationTimeElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "NotificationTimeElection" 
WHERE "NotificationTimeElection".party IS NOT NULL AND ("NotificationTimeElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'OneWayProvisions' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "OneWayProvisions" 
WHERE "OneWayProvisions"."isApplicable" IS NULL

UNION ALL

SELECT 'OneWayProvisions' AS table_name, 'postingParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "postingParty" AS invalid_value 
FROM "OneWayProvisions" 
WHERE "OneWayProvisions"."postingParty" IS NOT NULL AND ("OneWayProvisions"."postingParty" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'PartyAgreementIdentifier' AS table_name, 'partyReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PartyAgreementIdentifier" 
WHERE "PartyAgreementIdentifier"."partyReference" IS NULL

UNION ALL

SELECT 'PartyAgreementIdentifier' AS table_name, 'documentIdentifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PartyAgreementIdentifier" 
WHERE "PartyAgreementIdentifier"."documentIdentifier" IS NULL

UNION ALL

SELECT 'PostingObligations' AS table_name, 'securityProvider' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PostingObligations" 
WHERE "PostingObligations"."securityProvider" IS NULL

UNION ALL

SELECT 'PostingObligations' AS table_name, 'securityProvider' AS column_name, 'enum' AS constraint_type, id AS record_id, "securityProvider" AS invalid_value 
FROM "PostingObligations" 
WHERE "PostingObligations"."securityProvider" IS NOT NULL AND ("PostingObligations"."securityProvider" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'PostingObligations' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PostingObligations" 
WHERE "PostingObligations"."partyElection" IS NULL

UNION ALL

SELECT 'PostingObligationsElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PostingObligationsElection" 
WHERE "PostingObligationsElection".party IS NULL

UNION ALL

SELECT 'PostingObligationsElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "PostingObligationsElection" 
WHERE "PostingObligationsElection".party IS NOT NULL AND ("PostingObligationsElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'PostingObligationsElection' AS table_name, 'asPermitted' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PostingObligationsElection" 
WHERE "PostingObligationsElection"."asPermitted" IS NULL

UNION ALL

SELECT 'ProcessAgent' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ProcessAgent" 
WHERE "ProcessAgent"."partyElection" IS NULL

UNION ALL

SELECT 'ProcessAgentElection' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ProcessAgentElection" 
WHERE "ProcessAgentElection"."isApplicable" IS NULL

UNION ALL

SELECT 'ProcessAgentElection' AS table_name, 'partyReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ProcessAgentElection" 
WHERE "ProcessAgentElection"."partyReference" IS NULL

UNION ALL

SELECT 'ProcessAgentElection' AS table_name, 'partyReference' AS column_name, 'enum' AS constraint_type, id AS record_id, "partyReference" AS invalid_value 
FROM "ProcessAgentElection" 
WHERE "ProcessAgentElection"."partyReference" IS NOT NULL AND ("ProcessAgentElection"."partyReference" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'RecalculationOfValue' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RecalculationOfValue" 
WHERE "RecalculationOfValue"."partyElection" IS NULL

UNION ALL

SELECT 'RecalculationOfValueElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RecalculationOfValueElection" 
WHERE "RecalculationOfValueElection".party IS NULL

UNION ALL

SELECT 'RecalculationOfValueElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "RecalculationOfValueElection" 
WHERE "RecalculationOfValueElection".party IS NOT NULL AND ("RecalculationOfValueElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'RecalculationOfValueElection' AS table_name, 'recalculationOfValueElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RecalculationOfValueElection" 
WHERE "RecalculationOfValueElection"."recalculationOfValueElection" IS NULL

UNION ALL

SELECT 'RecalculationOfValueElection' AS table_name, 'recalculationOfValueElection' AS column_name, 'enum' AS constraint_type, id AS record_id, "recalculationOfValueElection" AS invalid_value 
FROM "RecalculationOfValueElection" 
WHERE "RecalculationOfValueElection"."recalculationOfValueElection" IS NOT NULL AND ("RecalculationOfValueElection"."recalculationOfValueElection" NOT IN ('ConsulationProcedure', 'OtherRegulatoryCSAProcedure', 'NotApplicable', 'Specified'))

UNION ALL

SELECT 'Regime' AS table_name, 'applicableRegime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Regime" 
WHERE "Regime"."applicableRegime" IS NULL

UNION ALL

SELECT 'RegimeTerms' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RegimeTerms" 
WHERE "RegimeTerms".party IS NULL

UNION ALL

SELECT 'RegimeTerms' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "RegimeTerms" 
WHERE "RegimeTerms".party IS NOT NULL AND ("RegimeTerms".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'RegimeTerms' AS table_name, 'isApplicable' AS column_name, 'enum' AS constraint_type, id AS record_id, "isApplicable" AS invalid_value 
FROM "RegimeTerms" 
WHERE "RegimeTerms"."isApplicable" IS NOT NULL AND ("RegimeTerms"."isApplicable" NOT IN ('Applicable', 'NotApplicable', 'Other'))

UNION ALL

SELECT 'PledgeeRepresentativeRider' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PledgeeRepresentativeRider" 
WHERE "PledgeeRepresentativeRider"."isApplicable" IS NULL

UNION ALL

SELECT 'PledgeeRepresentativeRider' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "PledgeeRepresentativeRider" 
WHERE "PledgeeRepresentativeRider".party IS NOT NULL AND ("PledgeeRepresentativeRider".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'PledgeeRepresentativeRider' AS table_name, 'representativeEvent' AS column_name, 'enum' AS constraint_type, id AS record_id, "representativeEvent" AS invalid_value 
FROM "PledgeeRepresentativeRider" 
WHERE "PledgeeRepresentativeRider"."representativeEvent" IS NOT NULL AND ("PledgeeRepresentativeRider"."representativeEvent" NOT IN ('Applicable', 'NotApplicable', 'Other'))

UNION ALL

SELECT 'RetrospectiveEffect' AS table_name, 'standardisedException' AS column_name, 'enum' AS constraint_type, id AS record_id, "standardisedException" AS invalid_value 
FROM "RetrospectiveEffect" 
WHERE "RetrospectiveEffect"."standardisedException" IS NOT NULL AND ("RetrospectiveEffect"."standardisedException" NOT IN ('Applicable', 'NotApplicable', 'Other'))

UNION ALL

SELECT 'RightsEvents' AS table_name, 'securityTakerRightsEvent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RightsEvents" 
WHERE "RightsEvents"."securityTakerRightsEvent" IS NULL

UNION ALL

SELECT 'RightsEvents' AS table_name, 'securityProviderRightsEvent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RightsEvents" 
WHERE "RightsEvents"."securityProviderRightsEvent" IS NULL

UNION ALL

SELECT 'SecuredPartyRightsEvent' AS table_name, 'earlyTerminationDateOptionalLanguage' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecuredPartyRightsEvent" 
WHERE "SecuredPartyRightsEvent"."earlyTerminationDateOptionalLanguage" IS NULL

UNION ALL

SELECT 'SecuredPartyRightsEventElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecuredPartyRightsEventElection" 
WHERE "SecuredPartyRightsEventElection".party IS NULL

UNION ALL

SELECT 'SecuredPartyRightsEventElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "SecuredPartyRightsEventElection" 
WHERE "SecuredPartyRightsEventElection".party IS NOT NULL AND ("SecuredPartyRightsEventElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'SecuredPartyRightsEventElection' AS table_name, 'rightsEvent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecuredPartyRightsEventElection" 
WHERE "SecuredPartyRightsEventElection"."rightsEvent" IS NULL

UNION ALL

SELECT 'SecurityProviderRightsEvent' AS table_name, 'includeCoolingOffLanguage' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecurityProviderRightsEvent" 
WHERE "SecurityProviderRightsEvent"."includeCoolingOffLanguage" IS NULL

UNION ALL

SELECT 'SecurityProviderRightsEventElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecurityProviderRightsEventElection" 
WHERE "SecurityProviderRightsEventElection".party IS NULL

UNION ALL

SELECT 'SecurityProviderRightsEventElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "SecurityProviderRightsEventElection" 
WHERE "SecurityProviderRightsEventElection".party IS NOT NULL AND ("SecurityProviderRightsEventElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'SecurityProviderRightsEventElection' AS table_name, 'rightsEvent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecurityProviderRightsEventElection" 
WHERE "SecurityProviderRightsEventElection"."rightsEvent" IS NULL

UNION ALL

SELECT 'SensitivityMethodologies' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SensitivityMethodologies" 
WHERE "SensitivityMethodologies"."partyElection" IS NULL

UNION ALL

SELECT 'SensitivityMethodologiesPartyElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SensitivityMethodologiesPartyElection" 
WHERE "SensitivityMethodologiesPartyElection".party IS NULL

UNION ALL

SELECT 'SensitivityMethodologiesPartyElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "SensitivityMethodologiesPartyElection" 
WHERE "SensitivityMethodologiesPartyElection".party IS NOT NULL AND ("SensitivityMethodologiesPartyElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'SensitivityMethodologiesPartyElection' AS table_name, 'sensitivityToEquity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SensitivityMethodologiesPartyElection" 
WHERE "SensitivityMethodologiesPartyElection"."sensitivityToEquity" IS NULL

UNION ALL

SELECT 'SensitivityMethodologiesPartyElection' AS table_name, 'sensitivityToCommodity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SensitivityMethodologiesPartyElection" 
WHERE "SensitivityMethodologiesPartyElection"."sensitivityToCommodity" IS NULL

UNION ALL

SELECT 'SensitivityToEquity' AS table_name, 'sensitivityToIndices' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SensitivityToEquity" 
WHERE "SensitivityToEquity"."sensitivityToIndices" IS NULL

UNION ALL

SELECT 'SensitivityToEquity' AS table_name, 'sensitivityToFunds' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SensitivityToEquity" 
WHERE "SensitivityToEquity"."sensitivityToFunds" IS NULL

UNION ALL

SELECT 'SensitivityToEquity' AS table_name, 'sensitivityToETFs' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SensitivityToEquity" 
WHERE "SensitivityToEquity"."sensitivityToETFs" IS NULL

UNION ALL

SELECT 'SensitivityMethodology' AS table_name, 'specifiedMethodology' AS column_name, 'enum' AS constraint_type, id AS record_id, "specifiedMethodology" AS invalid_value 
FROM "SensitivityMethodology" 
WHERE "SensitivityMethodology"."specifiedMethodology" IS NOT NULL AND ("SensitivityMethodology"."specifiedMethodology" NOT IN ('Alternative', 'Standard'))

UNION ALL

SELECT 'SimmCalculationCurrency' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SimmCalculationCurrency" 
WHERE "SimmCalculationCurrency"."partyElection" IS NULL

UNION ALL

SELECT 'SimmException' AS table_name, 'standardisedException' AS column_name, 'enum' AS constraint_type, id AS record_id, "standardisedException" AS invalid_value 
FROM "SimmException" 
WHERE "SimmException"."standardisedException" IS NOT NULL AND ("SimmException"."standardisedException" NOT IN ('Applicable', 'NotApplicable', 'Other'))

UNION ALL

SELECT 'SimmException' AS table_name, 'simmExceptionApplicable' AS column_name, 'enum' AS constraint_type, id AS record_id, "simmExceptionApplicable" AS invalid_value 
FROM "SimmException" 
WHERE "SimmException"."simmExceptionApplicable" IS NOT NULL AND ("SimmException"."simmExceptionApplicable" NOT IN ('FallBackToMandatoryMethod', 'MandatoryMethod', 'OtherMethod'))

UNION ALL

SELECT 'SimmVersion' AS table_name, 'partyVersion' AS column_name, 'enum' AS constraint_type, id AS record_id, "partyVersion" AS invalid_value 
FROM "SimmVersion" 
WHERE "SimmVersion"."partyVersion" IS NOT NULL AND ("SimmVersion"."partyVersion" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'SubstitutedRegime' AS table_name, 'regime' AS column_name, 'enum' AS constraint_type, id AS record_id, regime AS invalid_value 
FROM "SubstitutedRegime" 
WHERE "SubstitutedRegime".regime IS NOT NULL AND ("SubstitutedRegime".regime NOT IN ('AustraliaMarginRules', 'CanadaMarginRules', 'CFTC_MarginRules', 'EMIR_MarginRules', 'HongKongMarginRules', 'JapanMarginRules', 'US_PrudentialMarginRules', 'SEC_MarginRules', 'SingaporeMarginRules', 'SwitzerlandMarginRules', 'BrazilMarginRules', 'UnitedKingdomMarginRules', 'SouthAfricaMarginRules', 'SouthKoreaMarginRules', 'HongKongSFCMarginRules'))

UNION ALL

SELECT 'SubstitutedRegime' AS table_name, 'regimeTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SubstitutedRegime" 
WHERE "SubstitutedRegime"."regimeTerms" IS NULL

UNION ALL

SELECT 'SubstitutedRegimeTerms' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SubstitutedRegimeTerms" 
WHERE "SubstitutedRegimeTerms".party IS NULL

UNION ALL

SELECT 'SubstitutedRegimeTerms' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "SubstitutedRegimeTerms" 
WHERE "SubstitutedRegimeTerms".party IS NOT NULL AND ("SubstitutedRegimeTerms".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'SubstitutedRegimeTerms' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SubstitutedRegimeTerms" 
WHERE "SubstitutedRegimeTerms"."isApplicable" IS NULL

UNION ALL

SELECT 'SubstitutionPartyElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SubstitutionPartyElection" 
WHERE "SubstitutionPartyElection".party IS NULL

UNION ALL

SELECT 'SubstitutionPartyElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "SubstitutionPartyElection" 
WHERE "SubstitutionPartyElection".party IS NOT NULL AND ("SubstitutionPartyElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'SubstitutionPartyElection' AS table_name, 'needsConsent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SubstitutionPartyElection" 
WHERE "SubstitutionPartyElection"."needsConsent" IS NULL

UNION ALL

SELECT 'SubstitutionPartyElection' AS table_name, 'legacyConsent' AS column_name, 'enum' AS constraint_type, id AS record_id, "legacyConsent" AS invalid_value 
FROM "SubstitutionPartyElection" 
WHERE "SubstitutionPartyElection"."legacyConsent" IS NOT NULL AND ("SubstitutionPartyElection"."legacyConsent" NOT IN ('ConsentRequired', 'NoConsent', 'ConsentRequiredNoDelay', 'TimesAdjusted', 'NoticeConditions', 'CostsApportioned'))

UNION ALL

SELECT 'TerminationCurrencyAmendment' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TerminationCurrencyAmendment" 
WHERE "TerminationCurrencyAmendment"."isApplicable" IS NULL

UNION ALL

SELECT 'TerminationCurrencyElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TerminationCurrencyElection" 
WHERE "TerminationCurrencyElection".party IS NULL

UNION ALL

SELECT 'TerminationCurrencyElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "TerminationCurrencyElection" 
WHERE "TerminationCurrencyElection".party IS NOT NULL AND ("TerminationCurrencyElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'TerminationCurrencyElection' AS table_name, 'isSpecified' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TerminationCurrencyElection" 
WHERE "TerminationCurrencyElection"."isSpecified" IS NULL

UNION ALL

SELECT 'AdditionalObligations' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AdditionalObligations" 
WHERE "AdditionalObligations".party IS NULL

UNION ALL

SELECT 'AdditionalObligations' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "AdditionalObligations" 
WHERE "AdditionalObligations".party IS NOT NULL AND ("AdditionalObligations".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'AdditionalObligations' AS table_name, 'additionalObligations' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AdditionalObligations" 
WHERE "AdditionalObligations"."additionalObligations" IS NULL

UNION ALL

SELECT 'BaseAndEligibleCurrency' AS table_name, 'baseCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BaseAndEligibleCurrency" 
WHERE "BaseAndEligibleCurrency"."baseCurrency" IS NULL

UNION ALL

SELECT 'BaseAndEligibleCurrency' AS table_name, 'baseCurrency' AS column_name, 'enum' AS constraint_type, id AS record_id, "baseCurrency" AS invalid_value 
FROM "BaseAndEligibleCurrency" 
WHERE "BaseAndEligibleCurrency"."baseCurrency" IS NOT NULL AND ("BaseAndEligibleCurrency"."baseCurrency" NOT IN ('AED', 'AFN', 'ALL', 'AMD', 'AOA', 'ARS', 'AUD', 'AWG', 'AZN', 'BAM', 'BBD', 'BDT', 'BHD', 'BIF', 'BMD', 'BND', 'BOB', 'BOV', 'BRL', 'BSD', 'BTN', 'BWP', 'BYN', 'BZD', 'CAD', 'CDF', 'CHE', 'CHF', 'CHW', 'CLF', 'CLP', 'CNY', 'COP', 'COU', 'CRC', 'CUP', 'CVE', 'CZK', 'DJF', 'DKK', 'DOP', 'DZD', 'EGP', 'ERN', 'ETB', 'EUR', 'FJD', 'FKP', 'GBP', 'GEL', 'GHS', 'GIP', 'GMD', 'GNF', 'GTQ', 'GYD', 'HKD', 'HNL', 'HTG', 'HUF', 'IDR', 'ILS', 'INR', 'IQD', 'IRR', 'ISK', 'JMD', 'JOD', 'JPY', 'KES', 'KGS', 'KHR', 'KMF', 'KPW', 'KRW', 'KWD', 'KYD', 'KZT', 'LAK', 'LBP', 'LKR', 'LRD', 'LSL', 'LYD', 'MAD', 'MDL', 'MGA', 'MKD', 'MMK', 'MNT', 'MOP', 'MRU', 'MUR', 'MVR', 'MWK', 'MXN', 'MXV', 'MYR', 'MZN', 'NAD', 'NGN', 'NIO', 'NOK', 'NPR', 'NZD', 'OMR', 'PAB', 'PEN', 'PGK', 'PHP', 'PKR', 'PLN', 'PYG', 'QAR', 'RON', 'RSD', 'RUB', 'RWF', 'SAR', 'SBD', 'SCR', 'SDG', 'SEK', 'SGD', 'SHP', 'SLE', 'SOS', 'SRD', 'SSP', 'STN', 'SVC', 'SYP', 'SZL', 'THB', 'TJS', 'TMT', 'TND', 'TOP', 'TRY', 'TTD', 'TWD', 'TZS', 'UAH', 'UGX', 'USD', 'USN', 'UYI', 'UYU', 'UYW', 'UZS', 'VED', 'VES', 'VND', 'VUV', 'WST', 'XAD', 'XAF', 'XAG', 'XAU', 'XBA', 'XBB', 'XBC', 'XBD', 'XCD', 'XCG', 'XDR', 'XOF', 'XPD', 'XPF', 'XPT', 'XSU', 'XTS', 'XUA', 'XXX', 'YER', 'ZAR', 'ZMW', 'ZWG'))

UNION ALL

SELECT 'BaseAndEligibleCurrency' AS table_name, 'baseCurrencyTerminationCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BaseAndEligibleCurrency" 
WHERE "BaseAndEligibleCurrency"."baseCurrencyTerminationCurrency" IS NULL

UNION ALL

SELECT 'BaseAndEligibleCurrency' AS table_name, 'eligibleCurrency' AS column_name, 'enum' AS constraint_type, id AS record_id, "eligibleCurrency" AS invalid_value 
FROM "BaseAndEligibleCurrency" 
WHERE "BaseAndEligibleCurrency"."eligibleCurrency" IS NOT NULL AND ("BaseAndEligibleCurrency"."eligibleCurrency" NOT IN ('AED', 'AFN', 'ALL', 'AMD', 'AOA', 'ARS', 'AUD', 'AWG', 'AZN', 'BAM', 'BBD', 'BDT', 'BHD', 'BIF', 'BMD', 'BND', 'BOB', 'BOV', 'BRL', 'BSD', 'BTN', 'BWP', 'BYN', 'BZD', 'CAD', 'CDF', 'CHE', 'CHF', 'CHW', 'CLF', 'CLP', 'CNY', 'COP', 'COU', 'CRC', 'CUP', 'CVE', 'CZK', 'DJF', 'DKK', 'DOP', 'DZD', 'EGP', 'ERN', 'ETB', 'EUR', 'FJD', 'FKP', 'GBP', 'GEL', 'GHS', 'GIP', 'GMD', 'GNF', 'GTQ', 'GYD', 'HKD', 'HNL', 'HTG', 'HUF', 'IDR', 'ILS', 'INR', 'IQD', 'IRR', 'ISK', 'JMD', 'JOD', 'JPY', 'KES', 'KGS', 'KHR', 'KMF', 'KPW', 'KRW', 'KWD', 'KYD', 'KZT', 'LAK', 'LBP', 'LKR', 'LRD', 'LSL', 'LYD', 'MAD', 'MDL', 'MGA', 'MKD', 'MMK', 'MNT', 'MOP', 'MRU', 'MUR', 'MVR', 'MWK', 'MXN', 'MXV', 'MYR', 'MZN', 'NAD', 'NGN', 'NIO', 'NOK', 'NPR', 'NZD', 'OMR', 'PAB', 'PEN', 'PGK', 'PHP', 'PKR', 'PLN', 'PYG', 'QAR', 'RON', 'RSD', 'RUB', 'RWF', 'SAR', 'SBD', 'SCR', 'SDG', 'SEK', 'SGD', 'SHP', 'SLE', 'SOS', 'SRD', 'SSP', 'STN', 'SVC', 'SYP', 'SZL', 'THB', 'TJS', 'TMT', 'TND', 'TOP', 'TRY', 'TTD', 'TWD', 'TZS', 'UAH', 'UGX', 'USD', 'USN', 'UYI', 'UYU', 'UYW', 'UZS', 'VED', 'VES', 'VND', 'VUV', 'WST', 'XAD', 'XAF', 'XAG', 'XAU', 'XBA', 'XBB', 'XBC', 'XBD', 'XCD', 'XCG', 'XDR', 'XOF', 'XPD', 'XPF', 'XPT', 'XSU', 'XTS', 'XUA', 'XXX', 'YER', 'ZAR', 'ZMW', 'ZWG'))

UNION ALL

SELECT 'BaseAndEligibleCurrency' AS table_name, 'eligibleCurrencyInclBaseCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BaseAndEligibleCurrency" 
WHERE "BaseAndEligibleCurrency"."eligibleCurrencyInclBaseCurrency" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsBase' AS table_name, 'deliveryAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsBase" 
WHERE "CreditSupportObligationsBase"."deliveryAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsBase' AS table_name, 'returnAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsBase" 
WHERE "CreditSupportObligationsBase"."returnAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsBase' AS table_name, 'minimumTransferAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsBase" 
WHERE "CreditSupportObligationsBase"."minimumTransferAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsLegacy' AS table_name, 'threshold' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsLegacy" 
WHERE "CreditSupportObligationsLegacy".threshold IS NULL

UNION ALL

SELECT 'CreditSupportObligationsLegacy' AS table_name, 'rounding' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsLegacy" 
WHERE "CreditSupportObligationsLegacy".rounding IS NULL

UNION ALL

SELECT 'CreditSupportObligationsLegacy' AS table_name, 'independentAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsLegacy" 
WHERE "CreditSupportObligationsLegacy"."independentAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsLegacy' AS table_name, 'creditSupportAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsLegacy" 
WHERE "CreditSupportObligationsLegacy"."creditSupportAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsLegacy' AS table_name, 'eligibleCreditSupport' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsLegacy" 
WHERE "CreditSupportObligationsLegacy"."eligibleCreditSupport" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsLegacy' AS table_name, 'deliveryAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsLegacy" 
WHERE "CreditSupportObligationsLegacy"."deliveryAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsLegacy' AS table_name, 'returnAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsLegacy" 
WHERE "CreditSupportObligationsLegacy"."returnAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsLegacy' AS table_name, 'minimumTransferAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsLegacy" 
WHERE "CreditSupportObligationsLegacy"."minimumTransferAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsInitialMargin' AS table_name, 'marginApproach' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsInitialMargin" 
WHERE "CreditSupportObligationsInitialMargin"."marginApproach" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsInitialMargin' AS table_name, 'rounding' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsInitialMargin" 
WHERE "CreditSupportObligationsInitialMargin".rounding IS NULL

UNION ALL

SELECT 'CreditSupportObligationsInitialMargin' AS table_name, 'threshold' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsInitialMargin" 
WHERE "CreditSupportObligationsInitialMargin".threshold IS NULL

UNION ALL

SELECT 'CreditSupportObligationsInitialMargin' AS table_name, 'creditSupportAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsInitialMargin" 
WHERE "CreditSupportObligationsInitialMargin"."creditSupportAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsInitialMargin' AS table_name, 'deliveryAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsInitialMargin" 
WHERE "CreditSupportObligationsInitialMargin"."deliveryAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsInitialMargin' AS table_name, 'returnAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsInitialMargin" 
WHERE "CreditSupportObligationsInitialMargin"."returnAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsInitialMargin' AS table_name, 'minimumTransferAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsInitialMargin" 
WHERE "CreditSupportObligationsInitialMargin"."minimumTransferAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsCollateralTransferAgreement' AS table_name, 'marginApproach' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsCollateralTransferAgreement" 
WHERE "CreditSupportObligationsCollateralTransferAgreement"."marginApproach" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsCollateralTransferAgreement' AS table_name, 'threshold' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsCollateralTransferAgreement" 
WHERE "CreditSupportObligationsCollateralTransferAgreement".threshold IS NULL

UNION ALL

SELECT 'CreditSupportObligationsCollateralTransferAgreement' AS table_name, 'creditSupportAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsCollateralTransferAgreement" 
WHERE "CreditSupportObligationsCollateralTransferAgreement"."creditSupportAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsCollateralTransferAgreement' AS table_name, 'deliveryAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsCollateralTransferAgreement" 
WHERE "CreditSupportObligationsCollateralTransferAgreement"."deliveryAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsCollateralTransferAgreement' AS table_name, 'returnAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsCollateralTransferAgreement" 
WHERE "CreditSupportObligationsCollateralTransferAgreement"."returnAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsCollateralTransferAgreement' AS table_name, 'minimumTransferAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsCollateralTransferAgreement" 
WHERE "CreditSupportObligationsCollateralTransferAgreement"."minimumTransferAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsVariationMargin' AS table_name, 'rounding' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsVariationMargin" 
WHERE "CreditSupportObligationsVariationMargin".rounding IS NULL

UNION ALL

SELECT 'CreditSupportObligationsVariationMargin' AS table_name, 'eligibleCreditSupport' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsVariationMargin" 
WHERE "CreditSupportObligationsVariationMargin"."eligibleCreditSupport" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsVariationMargin' AS table_name, 'deliveryAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsVariationMargin" 
WHERE "CreditSupportObligationsVariationMargin"."deliveryAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsVariationMargin' AS table_name, 'returnAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsVariationMargin" 
WHERE "CreditSupportObligationsVariationMargin"."returnAmount" IS NULL

UNION ALL

SELECT 'CreditSupportObligationsVariationMargin' AS table_name, 'minimumTransferAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportObligationsVariationMargin" 
WHERE "CreditSupportObligationsVariationMargin"."minimumTransferAmount" IS NULL

UNION ALL

SELECT 'EligibleCreditSupport' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EligibleCreditSupport" 
WHERE "EligibleCreditSupport"."partyElection" IS NULL

UNION ALL

SELECT 'EligibleCollateralElection' AS table_name, 'otherEligibleSupport' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EligibleCollateralElection" 
WHERE "EligibleCollateralElection"."otherEligibleSupport" IS NULL

UNION ALL

SELECT 'EligibleCollateralElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EligibleCollateralElection" 
WHERE "EligibleCollateralElection".party IS NULL

UNION ALL

SELECT 'EligibleCollateralElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "EligibleCollateralElection" 
WHERE "EligibleCollateralElection".party IS NOT NULL AND ("EligibleCollateralElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'EligibleCollateralElection' AS table_name, 'asPermitted' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EligibleCollateralElection" 
WHERE "EligibleCollateralElection"."asPermitted" IS NULL

UNION ALL

SELECT 'SecurityInterestForObligations' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecurityInterestForObligations" 
WHERE "SecurityInterestForObligations".party IS NULL

UNION ALL

SELECT 'SecurityInterestForObligations' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "SecurityInterestForObligations" 
WHERE "SecurityInterestForObligations".party IS NOT NULL AND ("SecurityInterestForObligations".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'SecurityInterestForObligations' AS table_name, 'obligations' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecurityInterestForObligations" 
WHERE "SecurityInterestForObligations".obligations IS NULL

UNION ALL

SELECT 'SecurityInterestForObligations' AS table_name, 'obligations' AS column_name, 'enum' AS constraint_type, id AS record_id, obligations AS invalid_value 
FROM "SecurityInterestForObligations" 
WHERE "SecurityInterestForObligations".obligations IS NOT NULL AND ("SecurityInterestForObligations".obligations NOT IN ('NotApplicable', 'AllObligationsOfPartyA', 'AllObligationsOfPartyB', 'Other'))

UNION ALL

SELECT 'SecurityInterestForObligations' AS table_name, 'obligee' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SecurityInterestForObligations" 
WHERE "SecurityInterestForObligations".obligee IS NULL

UNION ALL

SELECT 'SecurityInterestForObligations' AS table_name, 'obligee' AS column_name, 'enum' AS constraint_type, id AS record_id, obligee AS invalid_value 
FROM "SecurityInterestForObligations" 
WHERE "SecurityInterestForObligations".obligee IS NOT NULL AND ("SecurityInterestForObligations".obligee NOT IN ('PartyA', 'PartyAOrAffiliate', 'PartyB', 'PartyBOrAffiliate', 'Other'))

UNION ALL

SELECT 'SinglePostingParty' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "SinglePostingParty" 
WHERE "SinglePostingParty".party IS NOT NULL AND ("SinglePostingParty".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'Threshold' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Threshold" 
WHERE "Threshold"."partyElection" IS NULL

UNION ALL

SELECT 'ThresholdMinimumTransferAmountBase' AS table_name, 'zeroEvent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ThresholdMinimumTransferAmountBase" 
WHERE "ThresholdMinimumTransferAmountBase"."zeroEvent" IS NULL

UNION ALL

SELECT 'ThresholdMinimumTransferAmountBase' AS table_name, 'event' AS column_name, 'enum' AS constraint_type, id AS record_id, event AS invalid_value 
FROM "ThresholdMinimumTransferAmountBase" 
WHERE "ThresholdMinimumTransferAmountBase".event IS NOT NULL AND ("ThresholdMinimumTransferAmountBase".event NOT IN ('EventOfDefault', 'TerminationEvent', 'TerminationEventAllAffectedTransactions', 'PotentialEventOfDefault', 'AdditionalTerminationEvent', 'Other'))

UNION ALL

SELECT 'ThresholdElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ThresholdElection" 
WHERE "ThresholdElection".party IS NULL

UNION ALL

SELECT 'ThresholdElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "ThresholdElection" 
WHERE "ThresholdElection".party IS NOT NULL AND ("ThresholdElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'ThresholdRatingsBased' AS table_name, 'currency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ThresholdRatingsBased" 
WHERE "ThresholdRatingsBased".currency IS NULL

UNION ALL

SELECT 'ThresholdRatingsBased' AS table_name, 'currency' AS column_name, 'enum' AS constraint_type, id AS record_id, currency AS invalid_value 
FROM "ThresholdRatingsBased" 
WHERE "ThresholdRatingsBased".currency IS NOT NULL AND ("ThresholdRatingsBased".currency NOT IN ('AED', 'AFN', 'ALL', 'AMD', 'AOA', 'ARS', 'AUD', 'AWG', 'AZN', 'BAM', 'BBD', 'BDT', 'BHD', 'BIF', 'BMD', 'BND', 'BOB', 'BOV', 'BRL', 'BSD', 'BTN', 'BWP', 'BYN', 'BZD', 'CAD', 'CDF', 'CHE', 'CHF', 'CHW', 'CLF', 'CLP', 'CNY', 'COP', 'COU', 'CRC', 'CUP', 'CVE', 'CZK', 'DJF', 'DKK', 'DOP', 'DZD', 'EGP', 'ERN', 'ETB', 'EUR', 'FJD', 'FKP', 'GBP', 'GEL', 'GHS', 'GIP', 'GMD', 'GNF', 'GTQ', 'GYD', 'HKD', 'HNL', 'HTG', 'HUF', 'IDR', 'ILS', 'INR', 'IQD', 'IRR', 'ISK', 'JMD', 'JOD', 'JPY', 'KES', 'KGS', 'KHR', 'KMF', 'KPW', 'KRW', 'KWD', 'KYD', 'KZT', 'LAK', 'LBP', 'LKR', 'LRD', 'LSL', 'LYD', 'MAD', 'MDL', 'MGA', 'MKD', 'MMK', 'MNT', 'MOP', 'MRU', 'MUR', 'MVR', 'MWK', 'MXN', 'MXV', 'MYR', 'MZN', 'NAD', 'NGN', 'NIO', 'NOK', 'NPR', 'NZD', 'OMR', 'PAB', 'PEN', 'PGK', 'PHP', 'PKR', 'PLN', 'PYG', 'QAR', 'RON', 'RSD', 'RUB', 'RWF', 'SAR', 'SBD', 'SCR', 'SDG', 'SEK', 'SGD', 'SHP', 'SLE', 'SOS', 'SRD', 'SSP', 'STN', 'SVC', 'SYP', 'SZL', 'THB', 'TJS', 'TMT', 'TND', 'TOP', 'TRY', 'TTD', 'TWD', 'TZS', 'UAH', 'UGX', 'USD', 'USN', 'UYI', 'UYU', 'UYW', 'UZS', 'VED', 'VES', 'VND', 'VUV', 'WST', 'XAD', 'XAF', 'XAG', 'XAU', 'XBA', 'XBB', 'XBC', 'XBD', 'XCD', 'XCG', 'XDR', 'XOF', 'XPD', 'XPF', 'XPT', 'XSU', 'XTS', 'XUA', 'XXX', 'YER', 'ZAR', 'ZMW', 'ZWG'))

UNION ALL

SELECT 'ThresholdRatingsBased' AS table_name, 'ratingType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ThresholdRatingsBased" 
WHERE "ThresholdRatingsBased"."ratingType" IS NULL

UNION ALL

SELECT 'ThresholdRatingsBased' AS table_name, 'ratingType' AS column_name, 'enum' AS constraint_type, id AS record_id, "ratingType" AS invalid_value 
FROM "ThresholdRatingsBased" 
WHERE "ThresholdRatingsBased"."ratingType" IS NOT NULL AND ("ThresholdRatingsBased"."ratingType" NOT IN ('LongTerm', 'ShortTerm'))

UNION ALL

SELECT 'ThresholdRatingsBased' AS table_name, 'ratedParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "ratedParty" AS invalid_value 
FROM "ThresholdRatingsBased" 
WHERE "ThresholdRatingsBased"."ratedParty" IS NOT NULL AND ("ThresholdRatingsBased"."ratedParty" NOT IN ('Party', 'CreditSupportProvider', 'NamedEntity', 'PartyOrCreditSupportProvider', 'NamedAffiliate', 'AllAffiliates'))

UNION ALL

SELECT 'ThresholdRatingsBased' AS table_name, 'compare' AS column_name, 'enum' AS constraint_type, id AS record_id, compare AS invalid_value 
FROM "ThresholdRatingsBased" 
WHERE "ThresholdRatingsBased".compare IS NOT NULL AND ("ThresholdRatingsBased".compare NOT IN ('Lowest', 'Highest', 'ReferenceAgency', 'Average', 'SecondBest', 'Other'))

UNION ALL

SELECT 'ThresholdRatingsBased' AS table_name, 'noRating' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ThresholdRatingsBased" 
WHERE "ThresholdRatingsBased"."noRating" IS NULL

UNION ALL

SELECT 'ThresholdRatingsBased' AS table_name, 'notRatedBy' AS column_name, 'enum' AS constraint_type, id AS record_id, "notRatedBy" AS invalid_value 
FROM "ThresholdRatingsBased" 
WHERE "ThresholdRatingsBased"."notRatedBy" IS NOT NULL AND ("ThresholdRatingsBased"."notRatedBy" NOT IN ('All', 'One', 'Two'))

UNION ALL

SELECT 'ThresholdRatingsBased' AS table_name, 'numberOfRatingAgencies' AS column_name, 'enum' AS constraint_type, id AS record_id, "numberOfRatingAgencies" AS invalid_value 
FROM "ThresholdRatingsBased" 
WHERE "ThresholdRatingsBased"."numberOfRatingAgencies" IS NOT NULL AND ("ThresholdRatingsBased"."numberOfRatingAgencies" NOT IN ('All', 'AnyOne', 'AnyTwo', 'Other'))

UNION ALL

SELECT 'ThresholdRatingsBased' AS table_name, 'zeroEvent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ThresholdRatingsBased" 
WHERE "ThresholdRatingsBased"."zeroEvent" IS NULL

UNION ALL

SELECT 'ThresholdRatingsBased' AS table_name, 'event' AS column_name, 'enum' AS constraint_type, id AS record_id, event AS invalid_value 
FROM "ThresholdRatingsBased" 
WHERE "ThresholdRatingsBased".event IS NOT NULL AND ("ThresholdRatingsBased".event NOT IN ('EventOfDefault', 'TerminationEvent', 'TerminationEventAllAffectedTransactions', 'PotentialEventOfDefault', 'AdditionalTerminationEvent', 'Other'))

UNION ALL

SELECT 'CSAThresholdVariableSet' AS table_name, 'name' AS column_name, 'enum' AS constraint_type, id AS record_id, name AS invalid_value 
FROM "CSAThresholdVariableSet" 
WHERE "CSAThresholdVariableSet".name IS NOT NULL AND ("CSAThresholdVariableSet".name NOT IN ('AMBest', 'CBRS', 'DBRS', 'Fitch', 'Japanagency', 'Moodys', 'RatingAndInvestmentInformation', 'StandardAndPoors'))

UNION ALL

SELECT 'MinimumTransferAmount' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MinimumTransferAmount" 
WHERE "MinimumTransferAmount"."partyElection" IS NULL

UNION ALL

SELECT 'MinimumTransferAmountElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MinimumTransferAmountElection" 
WHERE "MinimumTransferAmountElection".party IS NULL

UNION ALL

SELECT 'MinimumTransferAmountElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "MinimumTransferAmountElection" 
WHERE "MinimumTransferAmountElection".party IS NOT NULL AND ("MinimumTransferAmountElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'ThresholdMinimumTransferAmountFixedAmount' AS table_name, 'amount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ThresholdMinimumTransferAmountFixedAmount" 
WHERE "ThresholdMinimumTransferAmountFixedAmount".amount IS NULL

UNION ALL

SELECT 'ThresholdMinimumTransferAmountFixedAmount' AS table_name, 'zeroEvent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ThresholdMinimumTransferAmountFixedAmount" 
WHERE "ThresholdMinimumTransferAmountFixedAmount"."zeroEvent" IS NULL

UNION ALL

SELECT 'ThresholdMinimumTransferAmountFixedAmount' AS table_name, 'event' AS column_name, 'enum' AS constraint_type, id AS record_id, event AS invalid_value 
FROM "ThresholdMinimumTransferAmountFixedAmount" 
WHERE "ThresholdMinimumTransferAmountFixedAmount".event IS NOT NULL AND ("ThresholdMinimumTransferAmountFixedAmount".event NOT IN ('EventOfDefault', 'TerminationEvent', 'TerminationEventAllAffectedTransactions', 'PotentialEventOfDefault', 'AdditionalTerminationEvent', 'Other'))

UNION ALL

SELECT 'MinimumTransferAmountRatingsBased' AS table_name, 'currency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MinimumTransferAmountRatingsBased" 
WHERE "MinimumTransferAmountRatingsBased".currency IS NULL

UNION ALL

SELECT 'MinimumTransferAmountRatingsBased' AS table_name, 'currency' AS column_name, 'enum' AS constraint_type, id AS record_id, currency AS invalid_value 
FROM "MinimumTransferAmountRatingsBased" 
WHERE "MinimumTransferAmountRatingsBased".currency IS NOT NULL AND ("MinimumTransferAmountRatingsBased".currency NOT IN ('AED', 'AFN', 'ALL', 'AMD', 'AOA', 'ARS', 'AUD', 'AWG', 'AZN', 'BAM', 'BBD', 'BDT', 'BHD', 'BIF', 'BMD', 'BND', 'BOB', 'BOV', 'BRL', 'BSD', 'BTN', 'BWP', 'BYN', 'BZD', 'CAD', 'CDF', 'CHE', 'CHF', 'CHW', 'CLF', 'CLP', 'CNY', 'COP', 'COU', 'CRC', 'CUP', 'CVE', 'CZK', 'DJF', 'DKK', 'DOP', 'DZD', 'EGP', 'ERN', 'ETB', 'EUR', 'FJD', 'FKP', 'GBP', 'GEL', 'GHS', 'GIP', 'GMD', 'GNF', 'GTQ', 'GYD', 'HKD', 'HNL', 'HTG', 'HUF', 'IDR', 'ILS', 'INR', 'IQD', 'IRR', 'ISK', 'JMD', 'JOD', 'JPY', 'KES', 'KGS', 'KHR', 'KMF', 'KPW', 'KRW', 'KWD', 'KYD', 'KZT', 'LAK', 'LBP', 'LKR', 'LRD', 'LSL', 'LYD', 'MAD', 'MDL', 'MGA', 'MKD', 'MMK', 'MNT', 'MOP', 'MRU', 'MUR', 'MVR', 'MWK', 'MXN', 'MXV', 'MYR', 'MZN', 'NAD', 'NGN', 'NIO', 'NOK', 'NPR', 'NZD', 'OMR', 'PAB', 'PEN', 'PGK', 'PHP', 'PKR', 'PLN', 'PYG', 'QAR', 'RON', 'RSD', 'RUB', 'RWF', 'SAR', 'SBD', 'SCR', 'SDG', 'SEK', 'SGD', 'SHP', 'SLE', 'SOS', 'SRD', 'SSP', 'STN', 'SVC', 'SYP', 'SZL', 'THB', 'TJS', 'TMT', 'TND', 'TOP', 'TRY', 'TTD', 'TWD', 'TZS', 'UAH', 'UGX', 'USD', 'USN', 'UYI', 'UYU', 'UYW', 'UZS', 'VED', 'VES', 'VND', 'VUV', 'WST', 'XAD', 'XAF', 'XAG', 'XAU', 'XBA', 'XBB', 'XBC', 'XBD', 'XCD', 'XCG', 'XDR', 'XOF', 'XPD', 'XPF', 'XPT', 'XSU', 'XTS', 'XUA', 'XXX', 'YER', 'ZAR', 'ZMW', 'ZWG'))

UNION ALL

SELECT 'MinimumTransferAmountRatingsBased' AS table_name, 'ratingType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MinimumTransferAmountRatingsBased" 
WHERE "MinimumTransferAmountRatingsBased"."ratingType" IS NULL

UNION ALL

SELECT 'MinimumTransferAmountRatingsBased' AS table_name, 'ratingType' AS column_name, 'enum' AS constraint_type, id AS record_id, "ratingType" AS invalid_value 
FROM "MinimumTransferAmountRatingsBased" 
WHERE "MinimumTransferAmountRatingsBased"."ratingType" IS NOT NULL AND ("MinimumTransferAmountRatingsBased"."ratingType" NOT IN ('LongTerm', 'ShortTerm'))

UNION ALL

SELECT 'MinimumTransferAmountRatingsBased' AS table_name, 'ratedParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "ratedParty" AS invalid_value 
FROM "MinimumTransferAmountRatingsBased" 
WHERE "MinimumTransferAmountRatingsBased"."ratedParty" IS NOT NULL AND ("MinimumTransferAmountRatingsBased"."ratedParty" NOT IN ('Party', 'CreditSupportProvider', 'NamedEntity', 'PartyOrCreditSupportProvider', 'NamedAffiliate', 'AllAffiliates'))

UNION ALL

SELECT 'MinimumTransferAmountRatingsBased' AS table_name, 'compare' AS column_name, 'enum' AS constraint_type, id AS record_id, compare AS invalid_value 
FROM "MinimumTransferAmountRatingsBased" 
WHERE "MinimumTransferAmountRatingsBased".compare IS NOT NULL AND ("MinimumTransferAmountRatingsBased".compare NOT IN ('Lowest', 'Highest', 'ReferenceAgency', 'Average', 'SecondBest', 'Other'))

UNION ALL

SELECT 'MinimumTransferAmountRatingsBased' AS table_name, 'noRating' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MinimumTransferAmountRatingsBased" 
WHERE "MinimumTransferAmountRatingsBased"."noRating" IS NULL

UNION ALL

SELECT 'MinimumTransferAmountRatingsBased' AS table_name, 'notRatedBy' AS column_name, 'enum' AS constraint_type, id AS record_id, "notRatedBy" AS invalid_value 
FROM "MinimumTransferAmountRatingsBased" 
WHERE "MinimumTransferAmountRatingsBased"."notRatedBy" IS NOT NULL AND ("MinimumTransferAmountRatingsBased"."notRatedBy" NOT IN ('All', 'One', 'Two'))

UNION ALL

SELECT 'MinimumTransferAmountRatingsBased' AS table_name, 'numberOfRatingAgencies' AS column_name, 'enum' AS constraint_type, id AS record_id, "numberOfRatingAgencies" AS invalid_value 
FROM "MinimumTransferAmountRatingsBased" 
WHERE "MinimumTransferAmountRatingsBased"."numberOfRatingAgencies" IS NOT NULL AND ("MinimumTransferAmountRatingsBased"."numberOfRatingAgencies" NOT IN ('All', 'AnyOne', 'AnyTwo', 'Other'))

UNION ALL

SELECT 'MinimumTransferAmountRatingsBased' AS table_name, 'zeroEvent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MinimumTransferAmountRatingsBased" 
WHERE "MinimumTransferAmountRatingsBased"."zeroEvent" IS NULL

UNION ALL

SELECT 'MinimumTransferAmountRatingsBased' AS table_name, 'event' AS column_name, 'enum' AS constraint_type, id AS record_id, event AS invalid_value 
FROM "MinimumTransferAmountRatingsBased" 
WHERE "MinimumTransferAmountRatingsBased".event IS NOT NULL AND ("MinimumTransferAmountRatingsBased".event NOT IN ('EventOfDefault', 'TerminationEvent', 'TerminationEventAllAffectedTransactions', 'PotentialEventOfDefault', 'AdditionalTerminationEvent', 'Other'))

UNION ALL

SELECT 'CSAMinimumTransferAmountVariableSet' AS table_name, 'name' AS column_name, 'enum' AS constraint_type, id AS record_id, name AS invalid_value 
FROM "CSAMinimumTransferAmountVariableSet" 
WHERE "CSAMinimumTransferAmountVariableSet".name IS NOT NULL AND ("CSAMinimumTransferAmountVariableSet".name NOT IN ('AMBest', 'CBRS', 'DBRS', 'Fitch', 'Japanagency', 'Moodys', 'RatingAndInvestmentInformation', 'StandardAndPoors'))

UNION ALL

SELECT 'CSADeliveryAmount' AS table_name, 'deliveryAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CSADeliveryAmount" 
WHERE "CSADeliveryAmount"."deliveryAmount" IS NULL

UNION ALL

SELECT 'CSADeliveryAmount' AS table_name, 'deliveryAmount' AS column_name, 'enum' AS constraint_type, id AS record_id, "deliveryAmount" AS invalid_value 
FROM "CSADeliveryAmount" 
WHERE "CSADeliveryAmount"."deliveryAmount" IS NOT NULL AND ("CSADeliveryAmount"."deliveryAmount" NOT IN ('Standard', 'NonStandardRatings', 'NonStandardOther'))

UNION ALL

SELECT 'CSAReturnAmount' AS table_name, 'returnAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CSAReturnAmount" 
WHERE "CSAReturnAmount"."returnAmount" IS NULL

UNION ALL

SELECT 'CSAReturnAmount' AS table_name, 'returnAmount' AS column_name, 'enum' AS constraint_type, id AS record_id, "returnAmount" AS invalid_value 
FROM "CSAReturnAmount" 
WHERE "CSAReturnAmount"."returnAmount" IS NOT NULL AND ("CSAReturnAmount"."returnAmount" NOT IN ('Standard', 'NonStandardRatings', 'NonStandardOther'))

UNION ALL

SELECT 'ValuationTime' AS table_name, 'day' AS column_name, 'enum' AS constraint_type, id AS record_id, day AS invalid_value 
FROM "ValuationTime" 
WHERE "ValuationTime".day IS NOT NULL AND ("ValuationTime".day NOT IN ('PreviousLocalBusinessDay', 'PreviousLocalBusinessDayMarket', 'PreviousLocalBusinessDayCityOfAgent', 'ValuationDate', 'AsSelected'))

UNION ALL

SELECT 'ValuationTime' AS table_name, 'time' AS column_name, 'enum' AS constraint_type, id AS record_id, time AS invalid_value 
FROM "ValuationTime" 
WHERE "ValuationTime".time IS NOT NULL AND ("ValuationTime".time NOT IN ('CloseOfBusiness', 'SpecificTime', 'AsSelected'))

UNION ALL

SELECT 'CSAValuationDate' AS table_name, 'date' AS column_name, 'enum' AS constraint_type, id AS record_id, date AS invalid_value 
FROM "CSAValuationDate" 
WHERE "CSAValuationDate".date IS NOT NULL AND ("CSAValuationDate".date NOT IN ('Each', 'Last', 'Secondlast', 'Thirdlast', 'Fourthlast', 'CalendarDay', 'AsSelected'))

UNION ALL

SELECT 'CSAValuationDate' AS table_name, 'day' AS column_name, 'enum' AS constraint_type, id AS record_id, day AS invalid_value 
FROM "CSAValuationDate" 
WHERE "CSAValuationDate".day IS NOT NULL AND ("CSAValuationDate".day NOT IN ('LocalBusinessDay', 'CalendarDay', 'NewYorkBankingDay'))

UNION ALL

SELECT 'CSAValuationDate' AS table_name, 'frequency' AS column_name, 'enum' AS constraint_type, id AS record_id, frequency AS invalid_value 
FROM "CSAValuationDate" 
WHERE "CSAValuationDate".frequency IS NOT NULL AND ("CSAValuationDate".frequency NOT IN ('Daily', 'Weekly', 'Fortnightly', 'Monthly', 'AsAgreed', 'AsSelected'))

UNION ALL

SELECT 'ValuationAgent' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "ValuationAgent" 
WHERE "ValuationAgent".party IS NOT NULL AND ("ValuationAgent".party NOT IN ('Party1', 'Party2', 'PartyMakingDemand'))

UNION ALL

SELECT 'ValuationAgent' AS table_name, 'valuationAgent' AS column_name, 'enum' AS constraint_type, id AS record_id, "valuationAgent" AS invalid_value 
FROM "ValuationAgent" 
WHERE "ValuationAgent"."valuationAgent" IS NOT NULL AND ("ValuationAgent"."valuationAgent" NOT IN ('SoleValuationAgent', 'SwitchUponDefault', 'SwitchUponFailureToPerform', 'FixedPartyForDisputes'))

UNION ALL

SELECT 'LegacyExposureScopeElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegacyExposureScopeElection" 
WHERE "LegacyExposureScopeElection".party IS NULL

UNION ALL

SELECT 'LegacyExposureScopeElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "LegacyExposureScopeElection" 
WHERE "LegacyExposureScopeElection".party IS NOT NULL AND ("LegacyExposureScopeElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'LegacyExposureScopeElection' AS table_name, 'excludedTransactions' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegacyExposureScopeElection" 
WHERE "LegacyExposureScopeElection"."excludedTransactions" IS NULL

UNION ALL

SELECT 'ExcludedProducts' AS table_name, 'product' AS column_name, 'enum' AS constraint_type, id AS record_id, product AS invalid_value 
FROM "ExcludedProducts" 
WHERE "ExcludedProducts".product IS NOT NULL AND ("ExcludedProducts".product NOT IN ('FXTransactions', 'FXSettlementDate', 'CurrencyOptionTransactions'))

UNION ALL

SELECT 'ExcludedProducts' AS table_name, 'excluded' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExcludedProducts" 
WHERE "ExcludedProducts".excluded IS NULL

UNION ALL

SELECT 'CreditSupportAmount' AS table_name, 'creditSupportAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportAmount" 
WHERE "CreditSupportAmount"."creditSupportAmount" IS NULL

UNION ALL

SELECT 'CreditSupportAmount' AS table_name, 'creditSupportAmount' AS column_name, 'enum' AS constraint_type, id AS record_id, "creditSupportAmount" AS invalid_value 
FROM "CreditSupportAmount" 
WHERE "CreditSupportAmount"."creditSupportAmount" IS NOT NULL AND ("CreditSupportAmount"."creditSupportAmount" NOT IN ('Standard', 'IAFloorGIA', 'IAFloorGIATIA', 'NonStandardRatings', 'NonStandardOther'))

UNION ALL

SELECT 'LegacyResolutionAlternative' AS table_name, 'resolutionAlternative' AS column_name, 'enum' AS constraint_type, id AS record_id, "resolutionAlternative" AS invalid_value 
FROM "LegacyResolutionAlternative" 
WHERE "LegacyResolutionAlternative"."resolutionAlternative" IS NOT NULL AND ("LegacyResolutionAlternative"."resolutionAlternative" NOT IN ('NoAlternative', 'SplitDifference', 'AdditionalConditions'))

UNION ALL

SELECT 'ResolutionValue' AS table_name, 'cash' AS column_name, 'enum' AS constraint_type, id AS record_id, cash AS invalid_value 
FROM "ResolutionValue" 
WHERE "ResolutionValue".cash IS NOT NULL AND ("ResolutionValue".cash NOT IN ('CashAmount', 'CashPercentage', 'CashPercentageLessHaircut', 'Other'))

UNION ALL

SELECT 'ResolutionValue' AS table_name, 'securities' AS column_name, 'enum' AS constraint_type, id AS record_id, securities AS invalid_value 
FROM "ResolutionValue" 
WHERE "ResolutionValue".securities IS NOT NULL AND ("ResolutionValue".securities NOT IN ('BidPricePercentage', 'BidPricePercentageLessHaircut', 'MidPricePercentage', 'MidPricePercentageLessHaircut', 'Other'))

UNION ALL

SELECT 'TransferSettlementTiming' AS table_name, 'cashCollateralTransferSettlementTime' AS column_name, 'enum' AS constraint_type, id AS record_id, "cashCollateralTransferSettlementTime" AS invalid_value 
FROM "TransferSettlementTiming" 
WHERE "TransferSettlementTiming"."cashCollateralTransferSettlementTime" IS NOT NULL AND ("TransferSettlementTiming"."cashCollateralTransferSettlementTime" NOT IN ('Same', 'Next', 'FirstLBD', 'SecondLBD', 'Other'))

UNION ALL

SELECT 'TransferSettlementTiming' AS table_name, 'securititesCollateralTransferSettlementTime' AS column_name, 'enum' AS constraint_type, id AS record_id, "securititesCollateralTransferSettlementTime" AS invalid_value 
FROM "TransferSettlementTiming" 
WHERE "TransferSettlementTiming"."securititesCollateralTransferSettlementTime" IS NOT NULL AND ("TransferSettlementTiming"."securititesCollateralTransferSettlementTime" NOT IN ('Same', 'Next', 'FirstDay', 'SecondDay', 'ThirdDay', 'Other'))

UNION ALL

SELECT 'CollateralValueMethod' AS table_name, 'cashCollateral' AS column_name, 'enum' AS constraint_type, id AS record_id, "cashCollateral" AS invalid_value 
FROM "CollateralValueMethod" 
WHERE "CollateralValueMethod"."cashCollateral" IS NOT NULL AND ("CollateralValueMethod"."cashCollateral" NOT IN ('CashAmount', 'CashPercentage', 'CashPercentageLessHaircut', 'Other'))

UNION ALL

SELECT 'CollateralValueMethod' AS table_name, 'securitiesCollateral' AS column_name, 'enum' AS constraint_type, id AS record_id, "securitiesCollateral" AS invalid_value 
FROM "CollateralValueMethod" 
WHERE "CollateralValueMethod"."securitiesCollateral" IS NOT NULL AND ("CollateralValueMethod"."securitiesCollateral" NOT IN ('BidPricePercentage', 'BidPricePercentageLessHaircut', 'MidPricePercentage', 'MidPricePercentageLessHaircut', 'Other'))

UNION ALL

SELECT 'CreditSupportDocument' AS table_name, 'creditSupportDocumentElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportDocument" 
WHERE "CreditSupportDocument"."creditSupportDocumentElection" IS NULL

UNION ALL

SELECT 'CreditSupportDocumentElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportDocumentElection" 
WHERE "CreditSupportDocumentElection".party IS NULL

UNION ALL

SELECT 'CreditSupportDocumentElection' AS table_name, 'creditSupportDocumentTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportDocumentElection" 
WHERE "CreditSupportDocumentElection"."creditSupportDocumentTerms" IS NULL

UNION ALL

SELECT 'CreditSupportDocumentElection' AS table_name, 'creditSupportDocumentTerms' AS column_name, 'enum' AS constraint_type, id AS record_id, "creditSupportDocumentTerms" AS invalid_value 
FROM "CreditSupportDocumentElection" 
WHERE "CreditSupportDocumentElection"."creditSupportDocumentTerms" IS NOT NULL AND ("CreditSupportDocumentElection"."creditSupportDocumentTerms" NOT IN ('Specified', 'Any', 'None'))

UNION ALL

SELECT 'CreditSupportProvider' AS table_name, 'creditSupportProviderElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportProvider" 
WHERE "CreditSupportProvider"."creditSupportProviderElection" IS NULL

UNION ALL

SELECT 'CreditSupportProviderElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportProviderElection" 
WHERE "CreditSupportProviderElection".party IS NULL

UNION ALL

SELECT 'CreditSupportProviderElection' AS table_name, 'creditSupportProviderTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditSupportProviderElection" 
WHERE "CreditSupportProviderElection"."creditSupportProviderTerms" IS NULL

UNION ALL

SELECT 'CreditSupportProviderElection' AS table_name, 'creditSupportProviderTerms' AS column_name, 'enum' AS constraint_type, id AS record_id, "creditSupportProviderTerms" AS invalid_value 
FROM "CreditSupportProviderElection" 
WHERE "CreditSupportProviderElection"."creditSupportProviderTerms" IS NOT NULL AND ("CreditSupportProviderElection"."creditSupportProviderTerms" NOT IN ('Specified', 'Any', 'None'))

UNION ALL

SELECT 'SpecifiedConditionOrAccessCondition' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SpecifiedConditionOrAccessCondition" 
WHERE "SpecifiedConditionOrAccessCondition"."isApplicable" IS NULL

UNION ALL

SELECT 'SpecifiedOrAccessConditionPartyElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SpecifiedOrAccessConditionPartyElection" 
WHERE "SpecifiedOrAccessConditionPartyElection".party IS NULL

UNION ALL

SELECT 'SpecifiedOrAccessConditionPartyElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "SpecifiedOrAccessConditionPartyElection" 
WHERE "SpecifiedOrAccessConditionPartyElection".party IS NOT NULL AND ("SpecifiedOrAccessConditionPartyElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'SpecifiedOrAccessConditionPartyElection' AS table_name, 'specifiedOrAccessCondition' AS column_name, 'enum' AS constraint_type, id AS record_id, "specifiedOrAccessCondition" AS invalid_value 
FROM "SpecifiedOrAccessConditionPartyElection" 
WHERE "SpecifiedOrAccessConditionPartyElection"."specifiedOrAccessCondition" IS NOT NULL AND ("SpecifiedOrAccessConditionPartyElection"."specifiedOrAccessCondition" NOT IN ('Illegality', 'TaxEvent', 'TaxEventUponMerger', 'CreditEventUponMerger', 'AdditionalTerminationEvents', 'ForceMajeureEvent', 'PotentialTerminationEvents'))

UNION ALL

SELECT 'SpecifiedOrAccessConditionPartyElection' AS table_name, 'additionalTerminationEvent' AS column_name, 'enum' AS constraint_type, id AS record_id, "additionalTerminationEvent" AS invalid_value 
FROM "SpecifiedOrAccessConditionPartyElection" 
WHERE "SpecifiedOrAccessConditionPartyElection"."additionalTerminationEvent" IS NOT NULL AND ("SpecifiedOrAccessConditionPartyElection"."additionalTerminationEvent" NOT IN ('FailureToNotifyNAV', 'InvestmentAdvisor', 'KeyPersons', 'NAVDeclineTrigger', 'NAVFloor', 'OperativeDocs', 'RatingsDowngradeOrWithdrawalParty1', 'RatingsDowngradeOrWithdrawalParty2', 'AsApplicable', 'AsSpecified'))

UNION ALL

SELECT 'LegacyIndependentAmount' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegacyIndependentAmount" 
WHERE "LegacyIndependentAmount"."partyElection" IS NULL

UNION ALL

SELECT 'LegacyIndependentAmountParty' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegacyIndependentAmountParty" 
WHERE "LegacyIndependentAmountParty".party IS NULL

UNION ALL

SELECT 'LegacyIndependentAmountParty' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "LegacyIndependentAmountParty" 
WHERE "LegacyIndependentAmountParty".party IS NOT NULL AND ("LegacyIndependentAmountParty".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'LegacyIndependentAmountParty' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegacyIndependentAmountParty" 
WHERE "LegacyIndependentAmountParty"."isApplicable" IS NULL

UNION ALL

SELECT 'IndependentAmountRatings' AS table_name, 'compare' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IndependentAmountRatings" 
WHERE "IndependentAmountRatings".compare IS NULL

UNION ALL

SELECT 'IndependentAmountRatings' AS table_name, 'compare' AS column_name, 'enum' AS constraint_type, id AS record_id, compare AS invalid_value 
FROM "IndependentAmountRatings" 
WHERE "IndependentAmountRatings".compare IS NOT NULL AND ("IndependentAmountRatings".compare NOT IN ('Compare'))

UNION ALL

SELECT 'IndependentAmountRatings' AS table_name, 'ratedParty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IndependentAmountRatings" 
WHERE "IndependentAmountRatings"."ratedParty" IS NULL

UNION ALL

SELECT 'IndependentAmountRatings' AS table_name, 'ratedParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "ratedParty" AS invalid_value 
FROM "IndependentAmountRatings" 
WHERE "IndependentAmountRatings"."ratedParty" IS NOT NULL AND ("IndependentAmountRatings"."ratedParty" NOT IN ('Party', 'CreditSupportProvider', 'NamedEntity', 'PartyOrCreditSupportProvider', 'NamedAffiliate', 'AllAffiliates'))

UNION ALL

SELECT 'IndependentAmountRatings' AS table_name, 'ratingType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IndependentAmountRatings" 
WHERE "IndependentAmountRatings"."ratingType" IS NULL

UNION ALL

SELECT 'IndependentAmountRatings' AS table_name, 'ratingType' AS column_name, 'enum' AS constraint_type, id AS record_id, "ratingType" AS invalid_value 
FROM "IndependentAmountRatings" 
WHERE "IndependentAmountRatings"."ratingType" IS NOT NULL AND ("IndependentAmountRatings"."ratingType" NOT IN ('LongTerm', 'ShortTerm'))

UNION ALL

SELECT 'LegacyIndependentAmountRatingsBased' AS table_name, 'variableSet' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegacyIndependentAmountRatingsBased" 
WHERE "LegacyIndependentAmountRatingsBased"."variableSet" IS NULL

UNION ALL

SELECT 'LegacyIndependentAmountRatingsBased' AS table_name, 'compare' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegacyIndependentAmountRatingsBased" 
WHERE "LegacyIndependentAmountRatingsBased".compare IS NULL

UNION ALL

SELECT 'LegacyIndependentAmountRatingsBased' AS table_name, 'compare' AS column_name, 'enum' AS constraint_type, id AS record_id, compare AS invalid_value 
FROM "LegacyIndependentAmountRatingsBased" 
WHERE "LegacyIndependentAmountRatingsBased".compare IS NOT NULL AND ("LegacyIndependentAmountRatingsBased".compare NOT IN ('Compare'))

UNION ALL

SELECT 'LegacyIndependentAmountRatingsBased' AS table_name, 'ratedParty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegacyIndependentAmountRatingsBased" 
WHERE "LegacyIndependentAmountRatingsBased"."ratedParty" IS NULL

UNION ALL

SELECT 'LegacyIndependentAmountRatingsBased' AS table_name, 'ratedParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "ratedParty" AS invalid_value 
FROM "LegacyIndependentAmountRatingsBased" 
WHERE "LegacyIndependentAmountRatingsBased"."ratedParty" IS NOT NULL AND ("LegacyIndependentAmountRatingsBased"."ratedParty" NOT IN ('Party', 'CreditSupportProvider', 'NamedEntity', 'PartyOrCreditSupportProvider', 'NamedAffiliate', 'AllAffiliates'))

UNION ALL

SELECT 'LegacyIndependentAmountRatingsBased' AS table_name, 'ratingType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegacyIndependentAmountRatingsBased" 
WHERE "LegacyIndependentAmountRatingsBased"."ratingType" IS NULL

UNION ALL

SELECT 'LegacyIndependentAmountRatingsBased' AS table_name, 'ratingType' AS column_name, 'enum' AS constraint_type, id AS record_id, "ratingType" AS invalid_value 
FROM "LegacyIndependentAmountRatingsBased" 
WHERE "LegacyIndependentAmountRatingsBased"."ratingType" IS NOT NULL AND ("LegacyIndependentAmountRatingsBased"."ratingType" NOT IN ('LongTerm', 'ShortTerm'))

UNION ALL

SELECT 'RatingAgencyAmount' AS table_name, 'ratingVariableSet' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RatingAgencyAmount" 
WHERE "RatingAgencyAmount"."ratingVariableSet" IS NULL

UNION ALL

SELECT 'LegacyIndependentAmountRatingsXExposure' AS table_name, 'compare' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegacyIndependentAmountRatingsXExposure" 
WHERE "LegacyIndependentAmountRatingsXExposure".compare IS NULL

UNION ALL

SELECT 'LegacyIndependentAmountRatingsXExposure' AS table_name, 'compare' AS column_name, 'enum' AS constraint_type, id AS record_id, compare AS invalid_value 
FROM "LegacyIndependentAmountRatingsXExposure" 
WHERE "LegacyIndependentAmountRatingsXExposure".compare IS NOT NULL AND ("LegacyIndependentAmountRatingsXExposure".compare NOT IN ('Compare'))

UNION ALL

SELECT 'LegacyIndependentAmountRatingsXExposure' AS table_name, 'ratedParty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegacyIndependentAmountRatingsXExposure" 
WHERE "LegacyIndependentAmountRatingsXExposure"."ratedParty" IS NULL

UNION ALL

SELECT 'LegacyIndependentAmountRatingsXExposure' AS table_name, 'ratedParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "ratedParty" AS invalid_value 
FROM "LegacyIndependentAmountRatingsXExposure" 
WHERE "LegacyIndependentAmountRatingsXExposure"."ratedParty" IS NOT NULL AND ("LegacyIndependentAmountRatingsXExposure"."ratedParty" NOT IN ('Party', 'CreditSupportProvider', 'NamedEntity', 'PartyOrCreditSupportProvider', 'NamedAffiliate', 'AllAffiliates'))

UNION ALL

SELECT 'LegacyIndependentAmountRatingsXExposure' AS table_name, 'ratingType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LegacyIndependentAmountRatingsXExposure" 
WHERE "LegacyIndependentAmountRatingsXExposure"."ratingType" IS NULL

UNION ALL

SELECT 'LegacyIndependentAmountRatingsXExposure' AS table_name, 'ratingType' AS column_name, 'enum' AS constraint_type, id AS record_id, "ratingType" AS invalid_value 
FROM "LegacyIndependentAmountRatingsXExposure" 
WHERE "LegacyIndependentAmountRatingsXExposure"."ratingType" IS NOT NULL AND ("LegacyIndependentAmountRatingsXExposure"."ratingType" NOT IN ('LongTerm', 'ShortTerm'))

UNION ALL

SELECT 'RatingMultiplier' AS table_name, 'ratingVariableSet' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RatingMultiplier" 
WHERE "RatingMultiplier"."ratingVariableSet" IS NULL

UNION ALL

SELECT 'RatingMultiplier' AS table_name, 'exposureMultiplier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RatingMultiplier" 
WHERE "RatingMultiplier"."exposureMultiplier" IS NULL

UNION ALL

SELECT 'DirectionRatingMultiplier' AS table_name, 'variableSet' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DirectionRatingMultiplier" 
WHERE "DirectionRatingMultiplier"."variableSet" IS NULL

UNION ALL

SELECT 'DirectionRatingMultiplier' AS table_name, 'exposureMultiplier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DirectionRatingMultiplier" 
WHERE "DirectionRatingMultiplier"."exposureMultiplier" IS NULL

UNION ALL

SELECT 'AllDirectionRating' AS table_name, 'allDirectionRating' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AllDirectionRating" 
WHERE "AllDirectionRating"."allDirectionRating" IS NULL

UNION ALL

SELECT 'AnyDirectionRating' AS table_name, 'anyDirectionRating' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AnyDirectionRating" 
WHERE "AnyDirectionRating"."anyDirectionRating" IS NULL

UNION ALL

SELECT 'DirectionRating' AS table_name, 'direction' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DirectionRating" 
WHERE "DirectionRating".direction IS NULL

UNION ALL

SELECT 'DirectionRating' AS table_name, 'direction' AS column_name, 'enum' AS constraint_type, id AS record_id, direction AS invalid_value 
FROM "DirectionRating" 
WHERE "DirectionRating".direction IS NOT NULL AND ("DirectionRating".direction NOT IN ('GreaterThan', 'GreaterThanOrEquals', 'Equals', 'LessThanOrEquals', 'LessThan'))

UNION ALL

SELECT 'DirectionRating' AS table_name, 'agency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DirectionRating" 
WHERE "DirectionRating".agency IS NULL

UNION ALL

SELECT 'DirectionRating' AS table_name, 'agency' AS column_name, 'enum' AS constraint_type, id AS record_id, agency AS invalid_value 
FROM "DirectionRating" 
WHERE "DirectionRating".agency IS NOT NULL AND ("DirectionRating".agency NOT IN ('AMBest', 'CBRS', 'DBRS', 'Fitch', 'Japanagency', 'Moodys', 'RatingAndInvestmentInformation', 'StandardAndPoors'))

UNION ALL

SELECT 'DirectionRating' AS table_name, 'notation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DirectionRating" 
WHERE "DirectionRating".notation IS NULL

UNION ALL

SELECT 'DirectionRating' AS table_name, 'outlook' AS column_name, 'enum' AS constraint_type, id AS record_id, outlook AS invalid_value 
FROM "DirectionRating" 
WHERE "DirectionRating".outlook IS NOT NULL AND ("DirectionRating".outlook NOT IN ('Positive', 'Negative', 'Stable', 'Developing'))

UNION ALL

SELECT 'DirectionRating' AS table_name, 'creditWatch' AS column_name, 'enum' AS constraint_type, id AS record_id, "creditWatch" AS invalid_value 
FROM "DirectionRating" 
WHERE "DirectionRating"."creditWatch" IS NOT NULL AND ("DirectionRating"."creditWatch" NOT IN ('Positive', 'Negative', 'Developing'))

UNION ALL

SELECT 'EligibilityToHoldCollateral' AS table_name, 'custodianEligibility' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EligibilityToHoldCollateral" 
WHERE "EligibilityToHoldCollateral"."custodianEligibility" IS NULL

UNION ALL

SELECT 'AllEligibilityToHoldCollateralCriteria' AS table_name, 'allCriteria' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AllEligibilityToHoldCollateralCriteria" 
WHERE "AllEligibilityToHoldCollateralCriteria"."allCriteria" IS NULL

UNION ALL

SELECT 'AnyEligibilityToHoldCollateralCriteria' AS table_name, 'anyCriteria' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AnyEligibilityToHoldCollateralCriteria" 
WHERE "AnyEligibilityToHoldCollateralCriteria"."anyCriteria" IS NULL

UNION ALL

SELECT 'RatingAgencyValue' AS table_name, 'ratingType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RatingAgencyValue" 
WHERE "RatingAgencyValue"."ratingType" IS NULL

UNION ALL

SELECT 'RatingAgencyValue' AS table_name, 'ratingType' AS column_name, 'enum' AS constraint_type, id AS record_id, "ratingType" AS invalid_value 
FROM "RatingAgencyValue" 
WHERE "RatingAgencyValue"."ratingType" IS NOT NULL AND ("RatingAgencyValue"."ratingType" NOT IN ('LongTerm', 'ShortTerm'))

UNION ALL

SELECT 'RatingAgencyValue' AS table_name, 'agency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RatingAgencyValue" 
WHERE "RatingAgencyValue".agency IS NULL

UNION ALL

SELECT 'RatingAgencyValue' AS table_name, 'agency' AS column_name, 'enum' AS constraint_type, id AS record_id, agency AS invalid_value 
FROM "RatingAgencyValue" 
WHERE "RatingAgencyValue".agency IS NOT NULL AND ("RatingAgencyValue".agency NOT IN ('AMBest', 'CBRS', 'DBRS', 'Fitch', 'Japanagency', 'Moodys', 'RatingAndInvestmentInformation', 'StandardAndPoors'))

UNION ALL

SELECT 'RatingAgencyValue' AS table_name, 'notation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RatingAgencyValue" 
WHERE "RatingAgencyValue".notation IS NULL

UNION ALL

SELECT 'RatingAgencyValue' AS table_name, 'outlook' AS column_name, 'enum' AS constraint_type, id AS record_id, outlook AS invalid_value 
FROM "RatingAgencyValue" 
WHERE "RatingAgencyValue".outlook IS NOT NULL AND ("RatingAgencyValue".outlook NOT IN ('Positive', 'Negative', 'Stable', 'Developing'))

UNION ALL

SELECT 'RatingAgencyValue' AS table_name, 'creditWatch' AS column_name, 'enum' AS constraint_type, id AS record_id, "creditWatch" AS invalid_value 
FROM "RatingAgencyValue" 
WHERE "RatingAgencyValue"."creditWatch" IS NOT NULL AND ("RatingAgencyValue"."creditWatch" NOT IN ('Positive', 'Negative', 'Developing'))

UNION ALL

SELECT 'DemandsAndNotices' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DemandsAndNotices" 
WHERE "DemandsAndNotices"."partyElection" IS NULL

UNION ALL

SELECT 'DemandsAndNotices' AS table_name, 'deemedEffectiveNextLBD' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DemandsAndNotices" 
WHERE "DemandsAndNotices"."deemedEffectiveNextLBD" IS NULL

UNION ALL

SELECT 'AddressesForTransfer' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AddressesForTransfer" 
WHERE "AddressesForTransfer"."partyElection" IS NULL

UNION ALL

SELECT 'MasterAgreementSchedule' AS table_name, 'clause' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MasterAgreementSchedule" 
WHERE "MasterAgreementSchedule".clause IS NULL

UNION ALL

SELECT 'MasterAgreementClause' AS table_name, 'identifer' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MasterAgreementClause" 
WHERE "MasterAgreementClause".identifer IS NULL

UNION ALL

SELECT 'MasterAgreementClause' AS table_name, 'identifer' AS column_name, 'enum' AS constraint_type, id AS record_id, identifer AS invalid_value 
FROM "MasterAgreementClause" 
WHERE "MasterAgreementClause".identifer IS NOT NULL AND ("MasterAgreementClause".identifer NOT IN ('ISLA_GMSLA_001', 'ISLA_GMSLA_002', 'ISLA_GMSLA_003', 'ISLA_GMSLA_004', 'ISLA_GMSLA_005', 'ISLA_GMSLA_006', 'ISLA_GMSLA_007', 'ISLA_GMSLA_008', 'ISLA_GMSLA_009', 'ISLA_GMSLA_010', 'ISLA_GMSLA_011', 'ISLA_GMSLA_012', 'ISLA_GMSLA_013', 'ISLA_GMSLA_014', 'ISLA_GMSLA_015', 'ISLA_GMSLA_016', 'ISLA_GMSLA_017', 'ISLA_GMSLA_018', 'ISLA_GMSLA_019', 'ISLA_GMSLA_020', 'ISLA_GMSLA_021', 'ISLA_GMSLA_022', 'ISLA_GMSLA_023', 'ISLA_GMSLA_024', 'ISLA_GMSLA_025', 'ISLA_GMSLA_026', 'ISLA_GMSLA_027', 'ISLA_GMSLA_028', 'ISLA_GMSLA_029', 'ISLA_GMSLA_030', 'ISLA_GMSLA_031', 'ISLA_GMSLA_032', 'ISLA_GMSLA_033', 'ISLA_GMSLA_034', 'ISLA_GMSLA_035', 'ISLA_GMSLA_036', 'ISLA_GMSLA_037', 'ISLA_GMSLA_038', 'ISLA_GMSLA_039', 'ISLA_GMSLA_040', 'ISLA_GMSLA_041', 'ISLA_GMSLA_042', 'ISLA_GMSLA_043', 'ISLA_GMSLA_044', 'ISLA_GMSLA_045', 'ISLA_GMSLA_046', 'ISLA_GMSLA_047', 'ISLA_GMSLA_048', 'ISLA_GMSLA_049', 'ISLA_GMSLA_050', 'ISLA_GMSLA_051', 'ISLA_GMSLA_052', 'ISLA_GMSLA_053', 'ISLA_GMSLA_054', 'ISLA_GMSLA_055', 'ISLA_GMSLA_056'))

UNION ALL

SELECT 'MasterAgreementClause' AS table_name, 'counterparty' AS column_name, 'enum' AS constraint_type, id AS record_id, counterparty AS invalid_value 
FROM "MasterAgreementClause" 
WHERE "MasterAgreementClause".counterparty IS NOT NULL AND ("MasterAgreementClause".counterparty NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'MasterAgreementClause' AS table_name, 'otherParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "otherParty" AS invalid_value 
FROM "MasterAgreementClause" 
WHERE "MasterAgreementClause"."otherParty" IS NOT NULL AND ("MasterAgreementClause"."otherParty" NOT IN ('Accountant', 'AgentLender', 'AllocationAgent', 'ArrangingBroker', 'BarrierDeterminationAgent', 'BeneficialOwner', 'Beneficiary', 'BookingParty', 'Borrower', 'Buyer', 'BuyerDecisionMaker', 'Chargor', 'ClearingClient', 'ClearingExceptionParty', 'ClearingFirm', 'ClearingOrganization', 'Client', 'ClientDecisionMaker', 'ConfirmationPlatform', 'ContractualParty', 'CounterPartyAffiliate', 'CounterPartyUltimateParent', 'Counterparty', 'CreditSupportProvider', 'Custodian', 'DataSubmitter', 'DeterminingParty', 'DisputingParty', 'DocumentRepository', 'ExecutingBroker', 'ExecutingEntity', 'ExecutionAgent', 'ExecutionFacility', 'Guarantor', 'HedgingParty', 'Lender', 'MarginAffiliate', 'OrderTransmitter', 'Pledgor', 'PrimeBroker', 'PriorTradeRepository', 'PTRRServiceProvider', 'PublicationVenue', 'ReportingParty', 'ReportingPartyAffiliate', 'ReportingPartyUltimateParent', 'Seller', 'SellerDecisionMaker', 'SecuredParty', 'SettlementAgent', 'TradeRepository', 'TradeSource', 'TradingManager', 'TradingPartner', 'TripartyAgent', 'ThirdPartyCustodian'))

UNION ALL

SELECT 'MasterAgreementClause' AS table_name, 'variant' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MasterAgreementClause" 
WHERE "MasterAgreementClause".variant IS NULL

UNION ALL

SELECT 'MasterAgreementClauseVariant' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MasterAgreementClauseVariant" 
WHERE "MasterAgreementClauseVariant".identifier IS NULL

UNION ALL

SELECT 'MasterAgreementClauseVariant' AS table_name, 'identifier' AS column_name, 'enum' AS constraint_type, id AS record_id, identifier AS invalid_value 
FROM "MasterAgreementClauseVariant" 
WHERE "MasterAgreementClauseVariant".identifier IS NOT NULL AND ("MasterAgreementClauseVariant".identifier NOT IN ('ISLA_GMSLA_001_01', 'ISLA_GMSLA_001_02', 'ISLA_GMSLA_002_01', 'ISLA_GMSLA_002_02', 'ISLA_GMSLA_002_03', 'ISLA_GMSLA_003_01', 'ISLA_GMSLA_003_02', 'ISLA_GMSLA_004_01', 'ISLA_GMSLA_004_02', 'ISLA_GMSLA_004_03', 'ISLA_GMSLA_005_01', 'ISLA_GMSLA_005_02', 'ISLA_GMSLA_006_01', 'ISLA_GMSLA_006_02', 'ISLA_GMSLA_006_03', 'ISLA_GMSLA_006_04', 'ISLA_GMSLA_006_05', 'ISLA_GMSLA_007_01', 'ISLA_GMSLA_007_02', 'ISLA_GMSLA_008_01', 'ISLA_GMSLA_008_02', 'ISLA_GMSLA_008_03', 'ISLA_GMSLA_008_04', 'ISLA_GMSLA_009_01', 'ISLA_GMSLA_009_02', 'ISLA_GMSLA_009_03', 'ISLA_GMSLA_009_04', 'ISLA_GMSLA_010_01', 'ISLA_GMSLA_010_02', 'ISLA_GMSLA_011_01', 'ISLA_GMSLA_011_02', 'ISLA_GMSLA_011_03', 'ISLA_GMSLA_012_01', 'ISLA_GMSLA_012_02', 'ISLA_GMSLA_012_03', 'ISLA_GMSLA_013_01', 'ISLA_GMSLA_013_02', 'ISLA_GMSLA_013_03', 'ISLA_GMSLA_013_04', 'ISLA_GMSLA_013_05', 'ISLA_GMSLA_013_06', 'ISLA_GMSLA_014_01', 'ISLA_GMSLA_014_02', 'ISLA_GMSLA_014_03', 'ISLA_GMSLA_014_04', 'ISLA_GMSLA_014_05', 'ISLA_GMSLA_015_01', 'ISLA_GMSLA_015_02', 'ISLA_GMSLA_016_01', 'ISLA_GMSLA_016_02', 'ISLA_GMSLA_016_03', 'ISLA_GMSLA_016_04', 'ISLA_GMSLA_016_05', 'ISLA_GMSLA_016_06', 'ISLA_GMSLA_017_01', 'ISLA_GMSLA_017_02', 'ISLA_GMSLA_017_03', 'ISLA_GMSLA_018_01', 'ISLA_GMSLA_018_02', 'ISLA_GMSLA_018_03', 'ISLA_GMSLA_019_01', 'ISLA_GMSLA_019_02', 'ISLA_GMSLA_019_03', 'ISLA_GMSLA_020_01', 'ISLA_GMSLA_020_02', 'ISLA_GMSLA_021_01', 'ISLA_GMSLA_021_02', 'ISLA_GMSLA_021_03', 'ISLA_GMSLA_021_04', 'ISLA_GMSLA_021_05', 'ISLA_GMSLA_022_01', 'ISLA_GMSLA_022_02', 'ISLA_GMSLA_023_01', 'ISLA_GMSLA_023_02', 'ISLA_GMSLA_024_01', 'ISLA_GMSLA_024_02', 'ISLA_GMSLA_024_03', 'ISLA_GMSLA_025_01', 'ISLA_GMSLA_025_02', 'ISLA_GMSLA_025_03', 'ISLA_GMSLA_025_04', 'ISLA_GMSLA_026_01', 'ISLA_GMSLA_026_02', 'ISLA_GMSLA_026_03', 'ISLA_GMSLA_027_01', 'ISLA_GMSLA_027_02', 'ISLA_GMSLA_028_01', 'ISLA_GMSLA_028_02', 'ISLA_GMSLA_028_03', 'ISLA_GMSLA_028_04', 'ISLA_GMSLA_028_05', 'ISLA_GMSLA_029_01', 'ISLA_GMSLA_029_02', 'ISLA_GMSLA_029_03', 'ISLA_GMSLA_030_01', 'ISLA_GMSLA_030_02', 'ISLA_GMSLA_030_03', 'ISLA_GMSLA_030_04', 'ISLA_GMSLA_031_01', 'ISLA_GMSLA_031_02', 'ISLA_GMSLA_031_03', 'ISLA_GMSLA_031_04', 'ISLA_GMSLA_031_05', 'ISLA_GMSLA_032_01', 'ISLA_GMSLA_032_02', 'ISLA_GMSLA_032_03', 'ISLA_GMSLA_033_01', 'ISLA_GMSLA_033_02', 'ISLA_GMSLA_033_03', 'ISLA_GMSLA_034_01', 'ISLA_GMSLA_034_02', 'ISLA_GMSLA_034_03', 'ISLA_GMSLA_034_04', 'ISLA_GMSLA_035_01', 'ISLA_GMSLA_035_02', 'ISLA_GMSLA_036_01', 'ISLA_GMSLA_036_02', 'ISLA_GMSLA_036_03', 'ISLA_GMSLA_036_04', 'ISLA_GMSLA_037_01', 'ISLA_GMSLA_037_02', 'ISLA_GMSLA_037_03', 'ISLA_GMSLA_038_01', 'ISLA_GMSLA_038_02', 'ISLA_GMSLA_038_03', 'ISLA_GMSLA_038_04', 'ISLA_GMSLA_039_01', 'ISLA_GMSLA_039_02', 'ISLA_GMSLA_039_03', 'ISLA_GMSLA_040_01', 'ISLA_GMSLA_040_02', 'ISLA_GMSLA_040_03', 'ISLA_GMSLA_041_01', 'ISLA_GMSLA_041_02', 'ISLA_GMSLA_041_03', 'ISLA_GMSLA_042_01', 'ISLA_GMSLA_042_02', 'ISLA_GMSLA_042_03', 'ISLA_GMSLA_043_01', 'ISLA_GMSLA_043_02', 'ISLA_GMSLA_044_01', 'ISLA_GMSLA_044_02', 'ISLA_GMSLA_044_03', 'ISLA_GMSLA_044_04', 'ISLA_GMSLA_045_01', 'ISLA_GMSLA_045_02', 'ISLA_GMSLA_045_03', 'ISLA_GMSLA_045_04', 'ISLA_GMSLA_046_01', 'ISLA_GMSLA_046_02', 'ISLA_GMSLA_047_01', 'ISLA_GMSLA_047_02', 'ISLA_GMSLA_048_01', 'ISLA_GMSLA_048_02', 'ISLA_GMSLA_049_01', 'ISLA_GMSLA_049_02', 'ISLA_GMSLA_050_01', 'ISLA_GMSLA_050_02', 'ISLA_GMSLA_051_01', 'ISLA_GMSLA_051_02', 'ISLA_GMSLA_051_03', 'ISLA_GMSLA_052_01', 'ISLA_GMSLA_052_02', 'ISLA_GMSLA_053_01', 'ISLA_GMSLA_053_02', 'ISLA_GMSLA_054_01', 'ISLA_GMSLA_054_02', 'ISLA_GMSLA_054_03', 'ISLA_GMSLA_054_04', 'ISLA_GMSLA_055_01', 'ISLA_GMSLA_056_01', 'ISLA_GMSLA_056_02'))

UNION ALL

SELECT 'MasterAgreementClauseVariant' AS table_name, 'counterparty' AS column_name, 'enum' AS constraint_type, id AS record_id, counterparty AS invalid_value 
FROM "MasterAgreementClauseVariant" 
WHERE "MasterAgreementClauseVariant".counterparty IS NOT NULL AND ("MasterAgreementClauseVariant".counterparty NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'MasterAgreementClauseVariant' AS table_name, 'otherParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "otherParty" AS invalid_value 
FROM "MasterAgreementClauseVariant" 
WHERE "MasterAgreementClauseVariant"."otherParty" IS NOT NULL AND ("MasterAgreementClauseVariant"."otherParty" NOT IN ('Accountant', 'AgentLender', 'AllocationAgent', 'ArrangingBroker', 'BarrierDeterminationAgent', 'BeneficialOwner', 'Beneficiary', 'BookingParty', 'Borrower', 'Buyer', 'BuyerDecisionMaker', 'Chargor', 'ClearingClient', 'ClearingExceptionParty', 'ClearingFirm', 'ClearingOrganization', 'Client', 'ClientDecisionMaker', 'ConfirmationPlatform', 'ContractualParty', 'CounterPartyAffiliate', 'CounterPartyUltimateParent', 'Counterparty', 'CreditSupportProvider', 'Custodian', 'DataSubmitter', 'DeterminingParty', 'DisputingParty', 'DocumentRepository', 'ExecutingBroker', 'ExecutingEntity', 'ExecutionAgent', 'ExecutionFacility', 'Guarantor', 'HedgingParty', 'Lender', 'MarginAffiliate', 'OrderTransmitter', 'Pledgor', 'PrimeBroker', 'PriorTradeRepository', 'PTRRServiceProvider', 'PublicationVenue', 'ReportingParty', 'ReportingPartyAffiliate', 'ReportingPartyUltimateParent', 'Seller', 'SellerDecisionMaker', 'SecuredParty', 'SettlementAgent', 'TradeRepository', 'TradeSource', 'TradingManager', 'TradingPartner', 'TripartyAgent', 'ThirdPartyCustodian'))

UNION ALL

SELECT 'MasterAgreement' AS table_name, 'automaticEarlyTermination' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MasterAgreement" 
WHERE "MasterAgreement"."automaticEarlyTermination" IS NULL

UNION ALL

SELECT 'MasterAgreement' AS table_name, 'terminationCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MasterAgreement" 
WHERE "MasterAgreement"."terminationCurrency" IS NULL

UNION ALL

SELECT 'MasterAgreement' AS table_name, 'addressForNotices' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MasterAgreement" 
WHERE "MasterAgreement"."addressForNotices" IS NULL

UNION ALL

SELECT 'MasterAgreement' AS table_name, 'nonContractualObligations' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MasterAgreement" 
WHERE "MasterAgreement"."nonContractualObligations" IS NULL

UNION ALL

SELECT 'MasterAgreement' AS table_name, 'creditSupportDocument' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MasterAgreement" 
WHERE "MasterAgreement"."creditSupportDocument" IS NULL

UNION ALL

SELECT 'MasterAgreement' AS table_name, 'creditSupportProvider' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MasterAgreement" 
WHERE "MasterAgreement"."creditSupportProvider" IS NULL

UNION ALL

SELECT 'MasterAgreement' AS table_name, 'specifiedEntities' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MasterAgreement" 
WHERE "MasterAgreement"."specifiedEntities" IS NULL

UNION ALL

SELECT 'AutomaticEarlyTermination' AS table_name, 'fallbackAET' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AutomaticEarlyTermination" 
WHERE "AutomaticEarlyTermination"."fallbackAET" IS NULL

UNION ALL

SELECT 'AutomaticEarlyTermination' AS table_name, 'indemnity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AutomaticEarlyTermination" 
WHERE "AutomaticEarlyTermination".indemnity IS NULL

UNION ALL

SELECT 'AutomaticEarlyTerminationElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AutomaticEarlyTerminationElection" 
WHERE "AutomaticEarlyTerminationElection".party IS NULL

UNION ALL

SELECT 'AutomaticEarlyTerminationElection' AS table_name, 'isApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AutomaticEarlyTerminationElection" 
WHERE "AutomaticEarlyTerminationElection"."isApplicable" IS NULL

UNION ALL

SELECT 'PartyOptionTerminationCurrency' AS table_name, 'terminationCurrencyCondition' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PartyOptionTerminationCurrency" 
WHERE "PartyOptionTerminationCurrency"."terminationCurrencyCondition" IS NULL

UNION ALL

SELECT 'PartyOptionTerminationCurrency' AS table_name, 'terminationCurrencyCondition' AS column_name, 'enum' AS constraint_type, id AS record_id, "terminationCurrencyCondition" AS invalid_value 
FROM "PartyOptionTerminationCurrency" 
WHERE "PartyOptionTerminationCurrency"."terminationCurrencyCondition" IS NOT NULL AND ("PartyOptionTerminationCurrency"."terminationCurrencyCondition" NOT IN ('PaymentsDue', 'FreelyAvailable', 'PaymentsDueAndFreelyAvailable', 'Specified'))

UNION ALL

SELECT 'PartyTerminationCurrencySelection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PartyTerminationCurrencySelection" 
WHERE "PartyTerminationCurrencySelection".party IS NULL

UNION ALL

SELECT 'PartyTerminationCurrencySelection' AS table_name, 'statedPartyCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PartyTerminationCurrencySelection" 
WHERE "PartyTerminationCurrencySelection"."statedPartyCurrency" IS NULL

UNION ALL

SELECT 'SpecifiedEntities' AS table_name, 'specifiedEntityClause' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SpecifiedEntities" 
WHERE "SpecifiedEntities"."specifiedEntityClause" IS NULL

UNION ALL

SELECT 'SpecifiedEntities' AS table_name, 'specifiedEntityClause' AS column_name, 'enum' AS constraint_type, id AS record_id, "specifiedEntityClause" AS invalid_value 
FROM "SpecifiedEntities" 
WHERE "SpecifiedEntities"."specifiedEntityClause" IS NOT NULL AND ("SpecifiedEntities"."specifiedEntityClause" NOT IN ('DefaultUnderSpecifiedTransaction', 'CrossDefault', 'Bankruptcy', 'CreditEventUponMerger'))

UNION ALL

SELECT 'SpecifiedEntities' AS table_name, 'specifiedEntity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SpecifiedEntities" 
WHERE "SpecifiedEntities"."specifiedEntity" IS NULL

UNION ALL

SELECT 'SpecifiedEntity' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SpecifiedEntity" 
WHERE "SpecifiedEntity".party IS NULL

UNION ALL

SELECT 'SpecifiedEntity' AS table_name, 'specifiedEntityTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SpecifiedEntity" 
WHERE "SpecifiedEntity"."specifiedEntityTerms" IS NULL

UNION ALL

SELECT 'SpecifiedEntity' AS table_name, 'specifiedEntityTerms' AS column_name, 'enum' AS constraint_type, id AS record_id, "specifiedEntityTerms" AS invalid_value 
FROM "SpecifiedEntity" 
WHERE "SpecifiedEntity"."specifiedEntityTerms" IS NOT NULL AND ("SpecifiedEntity"."specifiedEntityTerms" NOT IN ('None', 'AnyAffiliate', 'NamedSpecifiedEntity', 'MaterialSubsidiary', 'OtherSpecifiedEntity'))

UNION ALL

SELECT 'GlobalMasterSecuritiesLendingAgreement' AS table_name, 'collateral' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "GlobalMasterSecuritiesLendingAgreement" 
WHERE "GlobalMasterSecuritiesLendingAgreement".collateral IS NULL

UNION ALL

SELECT 'GlobalMasterSecuritiesLendingAgreement' AS table_name, 'baseCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "GlobalMasterSecuritiesLendingAgreement" 
WHERE "GlobalMasterSecuritiesLendingAgreement"."baseCurrency" IS NULL

UNION ALL

SELECT 'GlobalMasterSecuritiesLendingAgreement' AS table_name, 'eventsOfDefault' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "GlobalMasterSecuritiesLendingAgreement" 
WHERE "GlobalMasterSecuritiesLendingAgreement"."eventsOfDefault" IS NULL

UNION ALL

SELECT 'CollateralSpecification' AS table_name, 'standardDefinitionOfMarketValueUsed' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralSpecification" 
WHERE "CollateralSpecification"."standardDefinitionOfMarketValueUsed" IS NULL

UNION ALL

SELECT 'CollateralSpecification' AS table_name, 'aggregation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralSpecification" 
WHERE "CollateralSpecification".aggregation IS NULL

UNION ALL

SELECT 'CollateralSpecification' AS table_name, 'nettingObligationsApply' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralSpecification" 
WHERE "CollateralSpecification"."nettingObligationsApply" IS NULL

UNION ALL

SELECT 'CollateralSpecification' AS table_name, 'nettingObligationsApply' AS column_name, 'enum' AS constraint_type, id AS record_id, "nettingObligationsApply" AS invalid_value 
FROM "CollateralSpecification" 
WHERE "CollateralSpecification"."nettingObligationsApply" IS NOT NULL AND ("CollateralSpecification"."nettingObligationsApply" NOT IN ('Applicable', 'NotApplicable', 'NotSpecified'))

UNION ALL

SELECT 'CollateralSpecification' AS table_name, 'failureToDevliverIndemnityApplies' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralSpecification" 
WHERE "CollateralSpecification"."failureToDevliverIndemnityApplies" IS NULL

UNION ALL

SELECT 'CollateralSpecification' AS table_name, 'failureToDevliverIndemnityApplies' AS column_name, 'enum' AS constraint_type, id AS record_id, "failureToDevliverIndemnityApplies" AS invalid_value 
FROM "CollateralSpecification" 
WHERE "CollateralSpecification"."failureToDevliverIndemnityApplies" IS NOT NULL AND ("CollateralSpecification"."failureToDevliverIndemnityApplies" NOT IN ('Applicable', 'NotApplicable', 'NotSpecified'))

UNION ALL

SELECT 'CollateralSpecification' AS table_name, 'notificationTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralSpecification" 
WHERE "CollateralSpecification"."notificationTime" IS NULL

UNION ALL

SELECT 'BaseCurrency' AS table_name, 'baseCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BaseCurrency" 
WHERE "BaseCurrency"."baseCurrency" IS NULL

UNION ALL

SELECT 'BaseCurrency' AS table_name, 'baseCurrency' AS column_name, 'enum' AS constraint_type, id AS record_id, "baseCurrency" AS invalid_value 
FROM "BaseCurrency" 
WHERE "BaseCurrency"."baseCurrency" IS NOT NULL AND ("BaseCurrency"."baseCurrency" NOT IN ('CNH', 'CNT', 'GGP', 'IMP', 'JEP', 'KID', 'MCF', 'SML', 'VAL'))

UNION ALL

SELECT 'BaseCurrency' AS table_name, 'baseCurrencyIfOriginalNotFreelyConvertible' AS column_name, 'enum' AS constraint_type, id AS record_id, "baseCurrencyIfOriginalNotFreelyConvertible" AS invalid_value 
FROM "BaseCurrency" 
WHERE "BaseCurrency"."baseCurrencyIfOriginalNotFreelyConvertible" IS NOT NULL AND ("BaseCurrency"."baseCurrencyIfOriginalNotFreelyConvertible" NOT IN ('CNH', 'CNT', 'GGP', 'IMP', 'JEP', 'KID', 'MCF', 'SML', 'VAL'))

UNION ALL

SELECT 'EventsOfDefaultElection' AS table_name, 'party' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EventsOfDefaultElection" 
WHERE "EventsOfDefaultElection".party IS NULL

UNION ALL

SELECT 'EventsOfDefaultElection' AS table_name, 'party' AS column_name, 'enum' AS constraint_type, id AS record_id, party AS invalid_value 
FROM "EventsOfDefaultElection" 
WHERE "EventsOfDefaultElection".party IS NOT NULL AND ("EventsOfDefaultElection".party NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'EventsOfDefaultElection' AS table_name, 'automaticEarlyTerminationApplies' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EventsOfDefaultElection" 
WHERE "EventsOfDefaultElection"."automaticEarlyTerminationApplies" IS NULL

UNION ALL

SELECT 'EventsOfDefaultElection' AS table_name, 'automaticEarlyTerminationApplies' AS column_name, 'enum' AS constraint_type, id AS record_id, "automaticEarlyTerminationApplies" AS invalid_value 
FROM "EventsOfDefaultElection" 
WHERE "EventsOfDefaultElection"."automaticEarlyTerminationApplies" IS NOT NULL AND ("EventsOfDefaultElection"."automaticEarlyTerminationApplies" NOT IN ('Applicable', 'NotApplicable', 'NotSpecified'))

UNION ALL

SELECT 'EventsOfDefaultElection' AS table_name, 'existingLoans' AS column_name, 'enum' AS constraint_type, id AS record_id, "existingLoans" AS invalid_value 
FROM "EventsOfDefaultElection" 
WHERE "EventsOfDefaultElection"."existingLoans" IS NOT NULL AND ("EventsOfDefaultElection"."existingLoans" NOT IN ('Applicable', 'NotApplicable', 'NotSpecified'))

UNION ALL

SELECT 'EventsOfDefaultElection' AS table_name, 'automation' AS column_name, 'enum' AS constraint_type, id AS record_id, automation AS invalid_value 
FROM "EventsOfDefaultElection" 
WHERE "EventsOfDefaultElection".automation IS NOT NULL AND ("EventsOfDefaultElection".automation NOT IN ('Applicable', 'NotApplicable', 'NotSpecified'))

UNION ALL

SELECT 'EventsOfDefaultElection' AS table_name, 'automaticEarlyTerminationSpecifiedSeparatelyForEachPrinciple' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EventsOfDefaultElection" 
WHERE "EventsOfDefaultElection"."automaticEarlyTerminationSpecifiedSeparatelyForEachPrinciple" IS NULL

UNION ALL

SELECT 'EventsOfDefaultElection' AS table_name, 'automaticEarlyTerminationRequiredDueToSystemOfLaw' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EventsOfDefaultElection" 
WHERE "EventsOfDefaultElection"."automaticEarlyTerminationRequiredDueToSystemOfLaw" IS NULL

UNION ALL

SELECT 'EventsOfDefaultElection' AS table_name, 'automaticEarlyTerminationInModifiedForm' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EventsOfDefaultElection" 
WHERE "EventsOfDefaultElection"."automaticEarlyTerminationInModifiedForm" IS NULL

UNION ALL

SELECT 'EventsOfDefault' AS table_name, 'partyElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EventsOfDefault" 
WHERE "EventsOfDefault"."partyElection" IS NULL

UNION ALL

SELECT 'Aggregation' AS table_name, 'aggregationType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Aggregation" 
WHERE "Aggregation"."aggregationType" IS NULL

UNION ALL

SELECT 'Aggregation' AS table_name, 'aggregationType' AS column_name, 'enum' AS constraint_type, id AS record_id, "aggregationType" AS invalid_value 
FROM "Aggregation" 
WHERE "Aggregation"."aggregationType" IS NOT NULL AND ("Aggregation"."aggregationType" NOT IN ('Aggregated', 'LoanByLoan', 'AggregatedAndLoanByLoan', 'NotSpecified'))

UNION ALL

SELECT 'Aggregation' AS table_name, 'loansCanBeGrouped' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Aggregation" 
WHERE "Aggregation"."loansCanBeGrouped" IS NULL

UNION ALL

SELECT 'EquityAdditionalTerms' AS table_name, 'determinationTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EquityAdditionalTerms" 
WHERE "EquityAdditionalTerms"."determinationTerms" IS NULL

UNION ALL

SELECT 'UnderlierSubstitutionProvision' AS table_name, 'whoMaySubstitute' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "UnderlierSubstitutionProvision" 
WHERE "UnderlierSubstitutionProvision"."whoMaySubstitute" IS NULL

UNION ALL

SELECT 'UnderlierSubstitutionProvision' AS table_name, 'whoMaySubstitute' AS column_name, 'enum' AS constraint_type, id AS record_id, "whoMaySubstitute" AS invalid_value 
FROM "UnderlierSubstitutionProvision" 
WHERE "UnderlierSubstitutionProvision"."whoMaySubstitute" IS NOT NULL AND ("UnderlierSubstitutionProvision"."whoMaySubstitute" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'UnderlierSubstitutionProvision' AS table_name, 'disputingParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "disputingParty" AS invalid_value 
FROM "UnderlierSubstitutionProvision" 
WHERE "UnderlierSubstitutionProvision"."disputingParty" IS NOT NULL AND ("UnderlierSubstitutionProvision"."disputingParty" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'ExtraordinaryEvents' AS table_name, 'nationalizationOrInsolvency' AS column_name, 'enum' AS constraint_type, id AS record_id, "nationalizationOrInsolvency" AS invalid_value 
FROM "ExtraordinaryEvents" 
WHERE "ExtraordinaryEvents"."nationalizationOrInsolvency" IS NOT NULL AND ("ExtraordinaryEvents"."nationalizationOrInsolvency" NOT IN ('NegotiatedCloseout', 'CancellationAndPayment'))

UNION ALL

SELECT 'ExtraordinaryEvents' AS table_name, 'delisting' AS column_name, 'enum' AS constraint_type, id AS record_id, delisting AS invalid_value 
FROM "ExtraordinaryEvents" 
WHERE "ExtraordinaryEvents".delisting IS NOT NULL AND ("ExtraordinaryEvents".delisting NOT IN ('NegotiatedCloseout', 'CancellationAndPayment'))

UNION ALL

SELECT 'AdditionalDisruptionEvents' AS table_name, 'determiningParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "determiningParty" AS invalid_value 
FROM "AdditionalDisruptionEvents" 
WHERE "AdditionalDisruptionEvents"."determiningParty" IS NOT NULL AND ("AdditionalDisruptionEvents"."determiningParty" NOT IN ('DisruptionEventsDeterminingParty', 'ExtraordinaryDividendsParty', 'PredeterminedClearingOrganizationParty', 'ExerciseNoticeReceiverPartyManual', 'ExerciseNoticeReceiverPartyOptionalEarlyTermination', 'ExerciseNoticeReceiverPartyCancelableProvision', 'ExerciseNoticeReceiverPartyExtendibleProvision', 'CalculationAgentIndependent', 'CalculationAgentOptionalEarlyTermination', 'CalculationAgentMandatoryEarlyTermination', 'CalculationAgentFallback'))

UNION ALL

SELECT 'BrokerConfirmation' AS table_name, 'brokerConfirmationType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BrokerConfirmation" 
WHERE "BrokerConfirmation"."brokerConfirmationType" IS NULL

UNION ALL

SELECT 'BrokerConfirmation' AS table_name, 'brokerConfirmationType' AS column_name, 'enum' AS constraint_type, id AS record_id, "brokerConfirmationType" AS invalid_value 
FROM "BrokerConfirmation" 
WHERE "BrokerConfirmation"."brokerConfirmationType" IS NOT NULL AND ("BrokerConfirmation"."brokerConfirmationType" NOT IN ('ABX', 'AsiaCorporate', 'AsiaSovereign', 'AustraliaCorporate', 'AustraliaSovereign', 'CDSonLeveragedLoans', 'CDSonMBS', 'CDXEmergingMarkets', 'CDXEmergingMarketsDiversified', 'CDXSwaption', 'CDXTranche', 'CMBX', 'DJ_CDX_EM_', 'DJ_CDX_NA', 'EmergingEuropeanAndMiddleEasternSovereign', 'EmergingEuropeanCorporate', 'EmergingEuropeanCorporateLPN', 'EuropeanCMBS', 'EuropeanCorporate', 'EuropeanRMBS', 'JapanCorporate', 'JapanSovereign', 'LatinAmericaCorporate', 'LatinAmericaCorporateBond', 'LatinAmericaCorporateBondOrLoan', 'LatinAmericaSovereign', 'MBX', 'MCDX', 'NewZealandCorporate', 'NewZealandSovereign', 'NorthAmericanCorporate', 'PO', 'SingaporeCorporate', 'SingaporeSovereign', 'StandardAsiaCorporate', 'StandardAsiaSovereign', 'StandardAustraliaCorporate', 'StandardAustraliaSovereign', 'StandardCDXTranche', 'StandardEmergingEuropeanAndMiddleEasternSovereign', 'StandardEmergingEuropeanCorporate', 'StandardEmergingEuropeanCorporateLPN', 'StandardEuropeanCorporate', 'StandardJapanCorporate', 'StandardJapanSovereign', 'StandardLCDS', 'StandardLCDSBullet', 'StandardLCDXBullet', 'StandardLCDXBulletTranche', 'StandardLatinAmericaCorporateBond', 'StandardLatinAmericaCorporateBondOrLoan', 'StandardLatinAmericaSovereign', 'StandardNewZealandCorporate', 'StandardNewZealandSovereign', 'StandardNorthAmericanCorporate', 'StandardSingaporeCorporate', 'StandardSingaporeSovereign', 'StandardSubordinatedEuropeanInsuranceCorporate', 'StandardWesternEuropeanSovereign', 'StandardiTraxxEuropeTranche', 'SubordinatedEuropeanInsuranceCorporate', 'SukukCorporate', 'SukukSovereign', 'SyndicatedSecuredLoanCDS', 'TRX', 'TRX_II', 'USMunicipalFullFaithAndCredit', 'USMunicipalGeneralFund', 'USMunicipalRevenue', 'WesternEuropeanSovereign', 'iTraxxAsiaExJapan', 'iTraxxAsiaExJapanSwaption', 'iTraxxAsiaExJapanTranche', 'iTraxxAustralia', 'iTraxxAustraliaSwaption', 'iTraxxAustraliaTranche', 'iTraxxCJ', 'iTraxxCJTranche', 'iTraxxEurope', 'iTraxxEuropeSwaption', 'iTraxxEuropeTranche', 'iTraxxJapan', 'iTraxxJapanSwaption', 'iTraxxJapanTranche', 'iTraxxLevX', 'iTraxxSDI75', 'iTraxxSovX'))

UNION ALL

SELECT 'EquitySwapMasterConfirmation2018' AS table_name, 'typeOfSwapElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EquitySwapMasterConfirmation2018" 
WHERE "EquitySwapMasterConfirmation2018"."typeOfSwapElection" IS NULL

UNION ALL

SELECT 'EquitySwapMasterConfirmation2018' AS table_name, 'typeOfSwapElection' AS column_name, 'enum' AS constraint_type, id AS record_id, "typeOfSwapElection" AS invalid_value 
FROM "EquitySwapMasterConfirmation2018" 
WHERE "EquitySwapMasterConfirmation2018"."typeOfSwapElection" IS NOT NULL AND ("EquitySwapMasterConfirmation2018"."typeOfSwapElection" NOT IN ('Price', 'Total'))

UNION ALL

SELECT 'EquitySwapMasterConfirmation2018' AS table_name, 'pricingMethodElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EquitySwapMasterConfirmation2018" 
WHERE "EquitySwapMasterConfirmation2018"."pricingMethodElection" IS NULL

UNION ALL

SELECT 'EquitySwapMasterConfirmation2018' AS table_name, 'linearInterpolationElection' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EquitySwapMasterConfirmation2018" 
WHERE "EquitySwapMasterConfirmation2018"."linearInterpolationElection" IS NULL

UNION ALL

SELECT 'EquitySwapMasterConfirmation2018' AS table_name, 'linearInterpolationElection' AS column_name, 'enum' AS constraint_type, id AS record_id, "linearInterpolationElection" AS invalid_value 
FROM "EquitySwapMasterConfirmation2018" 
WHERE "EquitySwapMasterConfirmation2018"."linearInterpolationElection" IS NOT NULL AND ("EquitySwapMasterConfirmation2018"."linearInterpolationElection" NOT IN ('Linear', 'LinearZeroYield', 'None'))

UNION ALL

SELECT 'EquitySwapMasterConfirmation2018' AS table_name, 'settlementTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EquitySwapMasterConfirmation2018" 
WHERE "EquitySwapMasterConfirmation2018"."settlementTerms" IS NULL

UNION ALL

SELECT 'EquitySwapMasterConfirmation2018' AS table_name, 'valuationDates' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EquitySwapMasterConfirmation2018" 
WHERE "EquitySwapMasterConfirmation2018"."valuationDates" IS NULL

UNION ALL

SELECT 'EquitySwapMasterConfirmation2018' AS table_name, 'equityCashSettlementDates' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EquitySwapMasterConfirmation2018" 
WHERE "EquitySwapMasterConfirmation2018"."equityCashSettlementDates" IS NULL

UNION ALL

SELECT 'Representations' AS table_name, 'nonReliance' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Representations" 
WHERE "Representations"."nonReliance" IS NULL

UNION ALL

SELECT 'Representations' AS table_name, 'agreementsRegardingHedging' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Representations" 
WHERE "Representations"."agreementsRegardingHedging" IS NULL

UNION ALL

SELECT 'IndexAdjustmentEvents' AS table_name, 'indexModification' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IndexAdjustmentEvents" 
WHERE "IndexAdjustmentEvents"."indexModification" IS NULL

UNION ALL

SELECT 'IndexAdjustmentEvents' AS table_name, 'indexModification' AS column_name, 'enum' AS constraint_type, id AS record_id, "indexModification" AS invalid_value 
FROM "IndexAdjustmentEvents" 
WHERE "IndexAdjustmentEvents"."indexModification" IS NOT NULL AND ("IndexAdjustmentEvents"."indexModification" NOT IN ('CalculationAgentAdjustment', 'NegotiatedCloseOut', 'CancellationAndPayment', 'RelatedExchange'))

UNION ALL

SELECT 'IndexAdjustmentEvents' AS table_name, 'indexCancellation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IndexAdjustmentEvents" 
WHERE "IndexAdjustmentEvents"."indexCancellation" IS NULL

UNION ALL

SELECT 'IndexAdjustmentEvents' AS table_name, 'indexCancellation' AS column_name, 'enum' AS constraint_type, id AS record_id, "indexCancellation" AS invalid_value 
FROM "IndexAdjustmentEvents" 
WHERE "IndexAdjustmentEvents"."indexCancellation" IS NOT NULL AND ("IndexAdjustmentEvents"."indexCancellation" NOT IN ('CalculationAgentAdjustment', 'NegotiatedCloseOut', 'CancellationAndPayment', 'RelatedExchange'))

UNION ALL

SELECT 'IndexAdjustmentEvents' AS table_name, 'indexDisruption' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IndexAdjustmentEvents" 
WHERE "IndexAdjustmentEvents"."indexDisruption" IS NULL

UNION ALL

SELECT 'IndexAdjustmentEvents' AS table_name, 'indexDisruption' AS column_name, 'enum' AS constraint_type, id AS record_id, "indexDisruption" AS invalid_value 
FROM "IndexAdjustmentEvents" 
WHERE "IndexAdjustmentEvents"."indexDisruption" IS NOT NULL AND ("IndexAdjustmentEvents"."indexDisruption" NOT IN ('CalculationAgentAdjustment', 'NegotiatedCloseOut', 'CancellationAndPayment', 'RelatedExchange'))

UNION ALL

SELECT 'DeterminationRolesAndTerms' AS table_name, 'determinationRole' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DeterminationRolesAndTerms" 
WHERE "DeterminationRolesAndTerms"."determinationRole" IS NULL

UNION ALL

SELECT 'DeterminationRolesAndTerms' AS table_name, 'determinationRole' AS column_name, 'enum' AS constraint_type, id AS record_id, "determinationRole" AS invalid_value 
FROM "DeterminationRolesAndTerms" 
WHERE "DeterminationRolesAndTerms"."determinationRole" IS NOT NULL AND ("DeterminationRolesAndTerms"."determinationRole" NOT IN ('CalculationAgent', 'HedgingParty', 'DeterminingParty'))

UNION ALL

SELECT 'DeterminationRolesAndTerms' AS table_name, 'whoToDetermine' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DeterminationRolesAndTerms" 
WHERE "DeterminationRolesAndTerms"."whoToDetermine" IS NULL

UNION ALL

SELECT 'DeterminationRolesAndTerms' AS table_name, 'whoToDetermine' AS column_name, 'enum' AS constraint_type, id AS record_id, "whoToDetermine" AS invalid_value 
FROM "DeterminationRolesAndTerms" 
WHERE "DeterminationRolesAndTerms"."whoToDetermine" IS NOT NULL AND ("DeterminationRolesAndTerms"."whoToDetermine" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'DeterminationRolesAndTerms' AS table_name, 'disputingParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "disputingParty" AS invalid_value 
FROM "DeterminationRolesAndTerms" 
WHERE "DeterminationRolesAndTerms"."disputingParty" IS NOT NULL AND ("DeterminationRolesAndTerms"."disputingParty" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'EquityCorporateEvents' AS table_name, 'shareForShare' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EquityCorporateEvents" 
WHERE "EquityCorporateEvents"."shareForShare" IS NULL

UNION ALL

SELECT 'EquityCorporateEvents' AS table_name, 'shareForShare' AS column_name, 'enum' AS constraint_type, id AS record_id, "shareForShare" AS invalid_value 
FROM "EquityCorporateEvents" 
WHERE "EquityCorporateEvents"."shareForShare" IS NOT NULL AND ("EquityCorporateEvents"."shareForShare" NOT IN ('AlternativeObligation', 'CancellationAndPayment', 'OptionsExchange', 'CalculationAgent', 'ModifiedCalculationAgent', 'PartialCancellationAndPayment', 'Component'))

UNION ALL

SELECT 'EquityCorporateEvents' AS table_name, 'shareForOther' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EquityCorporateEvents" 
WHERE "EquityCorporateEvents"."shareForOther" IS NULL

UNION ALL

SELECT 'EquityCorporateEvents' AS table_name, 'shareForOther' AS column_name, 'enum' AS constraint_type, id AS record_id, "shareForOther" AS invalid_value 
FROM "EquityCorporateEvents" 
WHERE "EquityCorporateEvents"."shareForOther" IS NOT NULL AND ("EquityCorporateEvents"."shareForOther" NOT IN ('AlternativeObligation', 'CancellationAndPayment', 'OptionsExchange', 'CalculationAgent', 'ModifiedCalculationAgent', 'PartialCancellationAndPayment', 'Component'))

UNION ALL

SELECT 'EquityCorporateEvents' AS table_name, 'shareForCombined' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EquityCorporateEvents" 
WHERE "EquityCorporateEvents"."shareForCombined" IS NULL

UNION ALL

SELECT 'EquityCorporateEvents' AS table_name, 'shareForCombined' AS column_name, 'enum' AS constraint_type, id AS record_id, "shareForCombined" AS invalid_value 
FROM "EquityCorporateEvents" 
WHERE "EquityCorporateEvents"."shareForCombined" IS NOT NULL AND ("EquityCorporateEvents"."shareForCombined" NOT IN ('AlternativeObligation', 'CancellationAndPayment', 'OptionsExchange', 'CalculationAgent', 'ModifiedCalculationAgent', 'PartialCancellationAndPayment', 'Component'))

UNION ALL

SELECT 'FxDisruptionEvents' AS table_name, 'illegalityOrImpossibility' AS column_name, 'enum' AS constraint_type, id AS record_id, "illegalityOrImpossibility" AS invalid_value 
FROM "FxDisruptionEvents" 
WHERE "FxDisruptionEvents"."illegalityOrImpossibility" IS NOT NULL AND ("FxDisruptionEvents"."illegalityOrImpossibility" NOT IN ('ToBeTreatedAsDisruptionEvent', 'ToBeTreatedAsIllegalityOrImpossibility'))

UNION ALL

SELECT 'FxDisruptionEvents' AS table_name, 'forceMajeureOrActOfSState' AS column_name, 'enum' AS constraint_type, id AS record_id, "forceMajeureOrActOfSState" AS invalid_value 
FROM "FxDisruptionEvents" 
WHERE "FxDisruptionEvents"."forceMajeureOrActOfSState" IS NOT NULL AND ("FxDisruptionEvents"."forceMajeureOrActOfSState" NOT IN ('ToBeTreatedAsDisruptionEvent', 'ToBeTreatedAsForceMajeureOrActOfSState'))

UNION ALL

SELECT 'GovernmentalAuthorityDefault' AS table_name, 'governmentalAuthorityDefaultIsApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "GovernmentalAuthorityDefault" 
WHERE "GovernmentalAuthorityDefault"."governmentalAuthorityDefaultIsApplicable" IS NULL

UNION ALL

SELECT 'GovernmentalAuthorityDefault' AS table_name, 'localSubstituteProvisionType' AS column_name, 'enum' AS constraint_type, id AS record_id, "localSubstituteProvisionType" AS invalid_value 
FROM "GovernmentalAuthorityDefault" 
WHERE "GovernmentalAuthorityDefault"."localSubstituteProvisionType" IS NOT NULL AND ("GovernmentalAuthorityDefault"."localSubstituteProvisionType" NOT IN ('LocalAssetSubstituteGross', 'LocalAssetSubstituteNet', 'LocalCurrencySubstitute'))

UNION ALL

SELECT 'GovernmentalAuthorityDefault' AS table_name, 'specifiedValue' AS column_name, 'enum' AS constraint_type, id AS record_id, "specifiedValue" AS invalid_value 
FROM "GovernmentalAuthorityDefault" 
WHERE "GovernmentalAuthorityDefault"."specifiedValue" IS NOT NULL AND ("GovernmentalAuthorityDefault"."specifiedValue" NOT IN ('OutstandingPrincipalBalance', 'StatedPrincipalBalance', 'FaceValue', 'MarketValue'))

UNION ALL

SELECT 'Illiquidity' AS table_name, 'illiquidityIsApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Illiquidity" 
WHERE "Illiquidity"."illiquidityIsApplicable" IS NULL

UNION ALL

SELECT 'MaterialChangeInCircumstance' AS table_name, 'materialChangeInCircumstanceIsApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MaterialChangeInCircumstance" 
WHERE "MaterialChangeInCircumstance"."materialChangeInCircumstanceIsApplicable" IS NULL

UNION ALL

SELECT 'Nationalization' AS table_name, 'nationalizationIsApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Nationalization" 
WHERE "Nationalization"."nationalizationIsApplicable" IS NULL

UNION ALL

SELECT 'PriceMateriality' AS table_name, 'priceMaterialityIsApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PriceMateriality" 
WHERE "PriceMateriality"."priceMaterialityIsApplicable" IS NULL

UNION ALL

SELECT 'FxPriceSourceDisruption' AS table_name, 'priceSourceDisruptionIsApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxPriceSourceDisruption" 
WHERE "FxPriceSourceDisruption"."priceSourceDisruptionIsApplicable" IS NULL

UNION ALL

SELECT 'FxBenchmarkObligationDefault' AS table_name, 'benchmarkObligationDefaultIsApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxBenchmarkObligationDefault" 
WHERE "FxBenchmarkObligationDefault"."benchmarkObligationDefaultIsApplicable" IS NULL

UNION ALL

SELECT 'FxBenchmarkObligationDefault' AS table_name, 'localSubstituteProvisionType' AS column_name, 'enum' AS constraint_type, id AS record_id, "localSubstituteProvisionType" AS invalid_value 
FROM "FxBenchmarkObligationDefault" 
WHERE "FxBenchmarkObligationDefault"."localSubstituteProvisionType" IS NOT NULL AND ("FxBenchmarkObligationDefault"."localSubstituteProvisionType" NOT IN ('LocalAssetSubstituteGross', 'LocalAssetSubstituteNet', 'LocalCurrencySubstitute'))

UNION ALL

SELECT 'FxBenchmarkObligationDefault' AS table_name, 'specifiedValue' AS column_name, 'enum' AS constraint_type, id AS record_id, "specifiedValue" AS invalid_value 
FROM "FxBenchmarkObligationDefault" 
WHERE "FxBenchmarkObligationDefault"."specifiedValue" IS NOT NULL AND ("FxBenchmarkObligationDefault"."specifiedValue" NOT IN ('OutstandingPrincipalBalance', 'StatedPrincipalBalance', 'FaceValue', 'MarketValue'))

UNION ALL

SELECT 'FxDualExchangeRate' AS table_name, 'dualExchangeRateIsApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxDualExchangeRate" 
WHERE "FxDualExchangeRate"."dualExchangeRateIsApplicable" IS NULL

UNION ALL

SELECT 'GeneralInconvertibility' AS table_name, 'generalInconvertibilityIsApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "GeneralInconvertibility" 
WHERE "GeneralInconvertibility"."generalInconvertibilityIsApplicable" IS NULL

UNION ALL

SELECT 'GeneralInconvertibility' AS table_name, 'localSubstituteProvisionType' AS column_name, 'enum' AS constraint_type, id AS record_id, "localSubstituteProvisionType" AS invalid_value 
FROM "GeneralInconvertibility" 
WHERE "GeneralInconvertibility"."localSubstituteProvisionType" IS NOT NULL AND ("GeneralInconvertibility"."localSubstituteProvisionType" NOT IN ('LocalAssetSubstituteGross', 'LocalAssetSubstituteNet', 'LocalCurrencySubstitute'))

UNION ALL

SELECT 'GeneralNonTransferability' AS table_name, 'generalNonTransferabilityIsApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "GeneralNonTransferability" 
WHERE "GeneralNonTransferability"."generalNonTransferabilityIsApplicable" IS NULL

UNION ALL

SELECT 'GeneralNonTransferability' AS table_name, 'localSubstituteProvisionType' AS column_name, 'enum' AS constraint_type, id AS record_id, "localSubstituteProvisionType" AS invalid_value 
FROM "GeneralNonTransferability" 
WHERE "GeneralNonTransferability"."localSubstituteProvisionType" IS NOT NULL AND ("GeneralNonTransferability"."localSubstituteProvisionType" NOT IN ('LocalAssetSubstituteGross', 'LocalAssetSubstituteNet', 'LocalCurrencySubstitute'))

UNION ALL

SELECT 'SpecificInconvertibility' AS table_name, 'specificInconvertibilityIsApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SpecificInconvertibility" 
WHERE "SpecificInconvertibility"."specificInconvertibilityIsApplicable" IS NULL

UNION ALL

SELECT 'SpecificInconvertibility' AS table_name, 'localSubstituteProvisionType' AS column_name, 'enum' AS constraint_type, id AS record_id, "localSubstituteProvisionType" AS invalid_value 
FROM "SpecificInconvertibility" 
WHERE "SpecificInconvertibility"."localSubstituteProvisionType" IS NOT NULL AND ("SpecificInconvertibility"."localSubstituteProvisionType" NOT IN ('LocalAssetSubstituteGross', 'LocalAssetSubstituteNet', 'LocalCurrencySubstitute'))

UNION ALL

SELECT 'SpecificNonTransferability' AS table_name, 'specificNonTransferabilityIsApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SpecificNonTransferability" 
WHERE "SpecificNonTransferability"."specificNonTransferabilityIsApplicable" IS NULL

UNION ALL

SELECT 'SpecificNonTransferability' AS table_name, 'localSubstituteProvisionType' AS column_name, 'enum' AS constraint_type, id AS record_id, "localSubstituteProvisionType" AS invalid_value 
FROM "SpecificNonTransferability" 
WHERE "SpecificNonTransferability"."localSubstituteProvisionType" IS NOT NULL AND ("SpecificNonTransferability"."localSubstituteProvisionType" NOT IN ('LocalAssetSubstituteGross', 'LocalAssetSubstituteNet', 'LocalCurrencySubstitute'))

UNION ALL

SELECT 'EscrowArrangement' AS table_name, 'escrowArrangementIsApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EscrowArrangement" 
WHERE "EscrowArrangement"."escrowArrangementIsApplicable" IS NULL

UNION ALL

SELECT 'EventCurrency' AS table_name, 'eventCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EventCurrency" 
WHERE "EventCurrency"."eventCurrency" IS NULL

UNION ALL

SELECT 'NonDeliverableSubstitute' AS table_name, 'nonDeliverableSubstituteIsApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "NonDeliverableSubstitute" 
WHERE "NonDeliverableSubstitute"."nonDeliverableSubstituteIsApplicable" IS NULL

UNION ALL

SELECT 'StandardizedSchedule' AS table_name, 'assetClass' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "StandardizedSchedule" 
WHERE "StandardizedSchedule"."assetClass" IS NULL

UNION ALL

SELECT 'StandardizedSchedule' AS table_name, 'assetClass' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetClass" AS invalid_value 
FROM "StandardizedSchedule" 
WHERE "StandardizedSchedule"."assetClass" IS NOT NULL AND ("StandardizedSchedule"."assetClass" NOT IN ('InterestRates', 'Credit', 'ForeignExchange', 'Equity', 'Commodity'))

UNION ALL

SELECT 'StandardizedSchedule' AS table_name, 'productClass' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "StandardizedSchedule" 
WHERE "StandardizedSchedule"."productClass" IS NULL

UNION ALL

SELECT 'StandardizedSchedule' AS table_name, 'productClass' AS column_name, 'enum' AS constraint_type, id AS record_id, "productClass" AS invalid_value 
FROM "StandardizedSchedule" 
WHERE "StandardizedSchedule"."productClass" IS NOT NULL AND ("StandardizedSchedule"."productClass" NOT IN ('Swap', 'CrossCurrencySwap', 'Swaption', 'SwaptionStraddle', 'SwapWithCallableBermudanRightToEnterExitSwaps', 'IRExoticSwapWithAnExoticCouponAgainstAFloatingLeg', 'Option', 'ForwardRateAgreement', 'SingleNameCreditDefaultSwap', 'IndexCDS', 'IndexTranche', 'CreditNthToDefault', 'CreditTotalReturnSwapOnABond', 'DeliverableSwap', 'NonDeliverableCrossCurrencySwap', 'DeliverableForward', 'NonDeliverableForward', 'DeliverableOption', 'NonDeliverableOption', 'VarianceSwap', 'VolatilitySwap', 'CorrelationSwap', 'Forward', 'DividendSwap', 'DeliverableOptionF', 'ContractForDifference', 'SwapsAndPortfolioSwaps', 'FixedFloatSwap', 'BasisSwap'))

UNION ALL

SELECT 'StandardizedSchedule' AS table_name, 'notional' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "StandardizedSchedule" 
WHERE "StandardizedSchedule".notional IS NULL

UNION ALL

SELECT 'StandardizedSchedule' AS table_name, 'notionalCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "StandardizedSchedule" 
WHERE "StandardizedSchedule"."notionalCurrency" IS NULL

UNION ALL

SELECT 'StandardizedScheduleTradeInfo' AS table_name, 'assetClass' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetClass" AS invalid_value 
FROM "StandardizedScheduleTradeInfo" 
WHERE "StandardizedScheduleTradeInfo"."assetClass" IS NOT NULL AND ("StandardizedScheduleTradeInfo"."assetClass" NOT IN ('InterestRates', 'Credit', 'ForeignExchange', 'Equity', 'Commodity'))

UNION ALL

SELECT 'StandardizedScheduleTradeInfo' AS table_name, 'productClass' AS column_name, 'enum' AS constraint_type, id AS record_id, "productClass" AS invalid_value 
FROM "StandardizedScheduleTradeInfo" 
WHERE "StandardizedScheduleTradeInfo"."productClass" IS NOT NULL AND ("StandardizedScheduleTradeInfo"."productClass" NOT IN ('Swap', 'CrossCurrencySwap', 'Swaption', 'SwaptionStraddle', 'SwapWithCallableBermudanRightToEnterExitSwaps', 'IRExoticSwapWithAnExoticCouponAgainstAFloatingLeg', 'Option', 'ForwardRateAgreement', 'SingleNameCreditDefaultSwap', 'IndexCDS', 'IndexTranche', 'CreditNthToDefault', 'CreditTotalReturnSwapOnABond', 'DeliverableSwap', 'NonDeliverableCrossCurrencySwap', 'DeliverableForward', 'NonDeliverableForward', 'DeliverableOption', 'NonDeliverableOption', 'VarianceSwap', 'VolatilitySwap', 'CorrelationSwap', 'Forward', 'DividendSwap', 'DeliverableOptionF', 'ContractForDifference', 'SwapsAndPortfolioSwaps', 'FixedFloatSwap', 'BasisSwap'))

UNION ALL

SELECT 'StandardizedScheduleInitialMargin' AS table_name, 'netInitialMargin' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "StandardizedScheduleInitialMargin" 
WHERE "StandardizedScheduleInitialMargin"."netInitialMargin" IS NULL

UNION ALL

SELECT 'IndexBase' AS table_name, 'assetClass' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetClass" AS invalid_value 
FROM "IndexBase" 
WHERE "IndexBase"."assetClass" IS NOT NULL AND ("IndexBase"."assetClass" NOT IN ('Commodity', 'Credit', 'Equity', 'ForeignExchange', 'InterestRate', 'MoneyMarket'))

UNION ALL

SELECT 'IndexBase' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IndexBase" 
WHERE "IndexBase".identifier IS NULL

UNION ALL

SELECT 'IndexBase' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IndexBase" 
WHERE "IndexBase"."assetType" IS NULL

UNION ALL

SELECT 'IndexBase' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "IndexBase" 
WHERE "IndexBase"."assetType" IS NOT NULL AND ("IndexBase"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'FloatingRateIndex' AS table_name, 'floatingRateIndex' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingRateIndex" 
WHERE "FloatingRateIndex"."floatingRateIndex" IS NULL

UNION ALL

SELECT 'FloatingRateIndex' AS table_name, 'floatingRateIndex' AS column_name, 'enum' AS constraint_type, id AS record_id, "floatingRateIndex" AS invalid_value 
FROM "FloatingRateIndex" 
WHERE "FloatingRateIndex"."floatingRateIndex" IS NOT NULL AND ("FloatingRateIndex"."floatingRateIndex" NOT IN ('AED_EBOR_Reuters', 'AED_EIBOR', 'AUD_AONIA', 'AUD_AONIA_OIS_Compound_1', 'AUD_AONIA_OIS_COMPOUND', 'AUD_AONIA_OIS_COMPOUND_SwapMarker', 'AUD_BBR_AUBBSW', 'AUD_BBR_BBSW', 'AUD_BBR_BBSW_Bloomberg', 'AUD_BBR_BBSY__BID_', 'AUD_BBR_ISDC', 'AUD_BBSW', 'AUD_BBSW_Quarterly_Swap_Rate_ICAP', 'AUD_BBSW_Semi_Annual_Swap_Rate_ICAP', 'AUD_BBSY_Bid', 'AUD_LIBOR_BBA', 'AUD_LIBOR_BBA_Bloomberg', 'AUD_LIBOR_Reference_Banks', 'AUD_Quarterly_Swap_Rate_ICAP', 'AUD_Quarterly_Swap_Rate_ICAP_Reference_Banks', 'AUD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'AUD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'AUD_Semi_annual_Swap_Rate_ICAP', 'AUD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'AUD_Swap_Rate_Reuters', 'BRL_CDI', 'CAD_BA_CDOR', 'CAD_BA_CDOR_Bloomberg', 'CAD_BA_ISDD', 'CAD_BA_Reference_Banks', 'CAD_BA_Reuters', 'CAD_BA_Telerate', 'CAD_CDOR', 'CAD_CORRA', 'CAD_CORRA_CanDeal_TMX_Term', 'CAD_CORRA_Compounded_Index', 'CAD_CORRA_OIS_Compound_1', 'CAD_CORRA_OIS_COMPOUND', 'CAD_ISDA_Swap_Rate', 'CAD_LIBOR_BBA', 'CAD_LIBOR_BBA_Bloomberg', 'CAD_LIBOR_BBA_SwapMarker', 'CAD_LIBOR_Reference_Banks', 'CAD_REPO_CORRA', 'CAD_TBILL_ISDD', 'CAD_TBILL_Reference_Banks', 'CAD_TBILL_Reuters', 'CAD_TBILL_Telerate', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_6M_LIBORSWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_Annual_Swap_Rate', 'CHF_Annual_Swap_Rate_11_00_ICAP', 'CHF_Annual_Swap_Rate_Reference_Banks', 'CHF_Basis_Swap_3m_vs_6m_LIBOR_11_00_ICAP', 'CHF_ISDAFIX_Swap_Rate', 'CHF_LIBOR', 'CHF_LIBOR_BBA', 'CHF_LIBOR_BBA_Bloomberg', 'CHF_LIBOR_ISDA', 'CHF_LIBOR_Reference_Banks', 'CHF_OIS_11_00_ICAP', 'CHF_SARON', 'CHF_SARON_Average_12M', 'CHF_SARON_Average_1M', 'CHF_SARON_Average_1W', 'CHF_SARON_Average_2M', 'CHF_SARON_Average_3M', 'CHF_SARON_Average_6M', 'CHF_SARON_Average_9M', 'CHF_SARON_Compounded_Index', 'CHF_SARON_OIS_Compound_1', 'CHF_SARON_OIS_COMPOUND', 'CHF_TOIS_OIS_COMPOUND', 'CHF_USD_Basis_Swaps_11_00_ICAP', 'CL_CLICP_Bloomberg', 'CLP_ICP', 'CLP_TNA', 'CNH_HIBOR', 'CNH_HIBOR_Reference_Banks', 'CNH_HIBOR_TMA', 'CNY_7_Repo_Compounding_Date', 'CNY_CNREPOFIX_CFXS_Reuters', 'CNY_Deposit_Rate', 'CNY_Fixing_Repo_Rate', 'CNY_LPR', 'CNY_PBOCB_Reuters', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION_Reference_Banks', 'CNY_Quarterly_7D_Repo_NDS_Rate_Tradition', 'CNY_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'CNY_Semi_Annual_Swap_Rate_Reference_Banks', 'CNY_SHIBOR', 'CNY_SHIBOR_OIS_Compound', 'CNY_Shibor_OIS_Compounding', 'CNY_SHIBOR_Reuters', 'COP_IBR_OIS_Compound_1', 'COP_IBR_OIS_COMPOUND', 'CZK_Annual_Swap_Rate_11_00_BGCANTOR', 'CZK_Annual_Swap_Rate_Reference_Banks', 'CZK_CZEONIA', 'CZK_CZEONIA_OIS_Compound', 'CZK_PRIBOR', 'CZK_PRIBOR_PRBO', 'CZK_PRIBOR_Reference_Banks', 'DKK_CIBOR', 'DKK_CIBOR2', 'DKK_CIBOR2_Bloomberg', 'DKK_CIBOR2_DKNA13', 'DKK_CIBOR_DKNA13', 'DKK_CIBOR_DKNA13_Bloomberg', 'DKK_CIBOR_Reference_Banks', 'DKK_CITA', 'DKK_CITA_DKNA14_COMPOUND', 'DKK_DESTR', 'DKK_DESTR_Compounded_Index', 'DKK_DESTR_OIS_Compound', 'DKK_DKKOIS_OIS_COMPOUND', 'DKK_Tom_Next_OIS_Compound', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_Annual_Swap_Rate_10_00', 'EUR_Annual_Swap_Rate_10_00_BGCANTOR', 'EUR_Annual_Swap_Rate_10_00_Bloomberg', 'EUR_Annual_Swap_Rate_10_00_ICAP', 'EUR_Annual_Swap_Rate_10_00_SwapMarker', 'EUR_Annual_Swap_Rate_10_00_TRADITION', 'EUR_Annual_Swap_Rate_11_00', 'EUR_Annual_Swap_Rate_11_00_Bloomberg', 'EUR_Annual_Swap_Rate_11_00_ICAP', 'EUR_Annual_Swap_Rate_11_00_SwapMarker', 'EUR_Annual_Swap_Rate_3_Month', 'EUR_Annual_Swap_Rate_3_Month_SwapMarker', 'EUR_Annual_Swap_Rate_4_15_TRADITION', 'EUR_Annual_Swap_Rate_Reference_Banks', 'EUR_Basis_Swap_EONIA_vs_3m_EUR_IBOR_Swap_Rates_A_360_10_00_ICAP', 'EUR_CNO_TEC10', 'EUR_EONIA', 'EUR_EONIA_AVERAGE_1', 'EUR_EONIA_Average', 'EUR_EONIA_OIS_10_00_BGCANTOR', 'EUR_EONIA_OIS_10_00_ICAP', 'EUR_EONIA_OIS_10_00_TRADITION', 'EUR_EONIA_OIS_11_00_ICAP', 'EUR_EONIA_OIS_4_15_TRADITION', 'EUR_EONIA_OIS_Compound_1', 'EUR_EONIA_OIS_COMPOUND', 'EUR_EONIA_OIS_COMPOUND_Bloomberg', 'EUR_EONIA_Swap_Index', 'EUR_EURIBOR', 'EUR_EURIBOR_Act_365', 'EUR_EURIBOR_Act_365_Bloomberg', 'EUR_EURIBOR_Annual_Bond_Swap_vs_1m_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_1m_vs_3m_Euribor_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_3m_vs_6m_11_00_ICAP', 'EUR_EURIBOR_ICE_Swap_Rate_11_00', 'EUR_EURIBOR_ICE_Swap_Rate_12_00', 'EUR_EURIBOR_Reference_Banks', 'EUR_EURIBOR_Reuters', 'EUR_EURIBOR_Telerate', 'EUR_EURONIA_OIS_Compound_1', 'EUR_EURONIA_OIS_COMPOUND', 'EUR_EuroSTR', 'EUR_EuroSTR_Average_12M', 'EUR_EuroSTR_Average_1M', 'EUR_EuroSTR_Average_1W', 'EUR_EuroSTR_Average_3M', 'EUR_EuroSTR_Average_6M', 'EUR_EuroSTR_COMPOUND', 'EUR_EuroSTR_Compounded_Index', 'EUR_EuroSTR_FTSE_Term', 'EUR_EuroSTR_ICE_Compounded_Index', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_5D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_5D_Lag', 'EUR_EuroSTR_ICE_Swap_Rate', 'EUR_EuroSTR_OIS_Compound', 'EUR_EuroSTR_Term', 'EUR_ISDA_EURIBOR_Swap_Rate_11_00', 'EUR_ISDA_EURIBOR_Swap_Rate_12_00', 'EUR_ISDA_LIBOR_Swap_Rate_10_00', 'EUR_ISDA_LIBOR_Swap_Rate_11_00', 'EUR_LIBOR', 'EUR_LIBOR_BBA', 'EUR_LIBOR_BBA_Bloomberg', 'EUR_LIBOR_Reference_Banks', 'EUR_TAM_CDC', 'EUR_TEC10_CNO', 'EUR_TEC10_CNO_SwapMarker', 'EUR_TEC10_Reference_Banks', 'EUR_TEC5_CNO', 'EUR_TEC5_CNO_SwapMarker', 'EUR_TEC5_Reference_Banks', 'EUR_TMM_CDC_COMPOUND', 'EUR_USD_Basis_Swaps_11_00_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'GBP_ISDA_Swap_Rate', 'GBP_LIBOR', 'GBP_LIBOR_BBA', 'GBP_LIBOR_BBA_Bloomberg', 'GBP_LIBOR_ICE_Swap_Rate', 'GBP_LIBOR_ISDA', 'GBP_LIBOR_Reference_Banks', 'GBP_RONIA', 'GBP_RONIA_OIS_Compound', 'GBP_Semi_Annual_Swap_Rate', 'GBP_Semi_Annual_Swap_Rate_11_00_ICAP', 'GBP_Semi_Annual_Swap_Rate_11_00_TRADITION', 'GBP_Semi_Annual_Swap_Rate_4_15_TRADITION', 'GBP_Semi_Annual_Swap_Rate_Reference_Banks', 'GBP_Semi_Annual_Swap_Rate_SwapMarker26', 'GBP_SONIA', 'GBP_SONIA_COMPOUND', 'GBP_SONIA_Compounded_Index', 'GBP_SONIA_FTSE_Term', 'GBP_SONIA_ICE_Compounded_Index', 'GBP_SONIA_ICE_Compounded_Index_0_Floor', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_5D_Lag', 'GBP_SONIA_ICE_Compounded_Index_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_5D_Lag', 'GBP_SONIA_ICE_Swap_Rate', 'GBP_SONIA_ICE_Term', 'GBP_SONIA_OIS_11_00_ICAP', 'GBP_SONIA_OIS_11_00_TRADITION', 'GBP_SONIA_OIS_4_15_TRADITION', 'GBP_SONIA_OIS_Compound', 'GBP_SONIA_Swap_Rate', 'GBP_UK_Base_Rate', 'GBP_USD_Basis_Swaps_11_00_ICAP', 'GBP_WMBA_RONIA_COMPOUND', 'GBP_WMBA_SONIA_COMPOUND', 'GRD_ATHIBOR_ATHIBOR', 'GRD_ATHIBOR_Reference_Banks', 'GRD_ATHIBOR_Telerate', 'GRD_ATHIMID_Reference_Banks', 'GRD_ATHIMID_Reuters', 'HKD_HIBOR', 'HKD_HIBOR_HIBOR_', 'HKD_HIBOR_HIBOR_Bloomberg', 'HKD_HIBOR_HKAB', 'HKD_HIBOR_HKAB_Bloomberg', 'HKD_HIBOR_ISDC', 'HKD_HIBOR_Reference_Banks', 'HKD_HONIA', 'HKD_HONIA_OIS_Compound', 'HKD_HONIX_OIS_COMPOUND', 'HKD_ISDA_Swap_Rate_11_00', 'HKD_ISDA_Swap_Rate_4_00', 'HKD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_11_00_TRADITION', 'HKD_Quarterly_Annual_Swap_Rate_4_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'HKD_Quarterly_Quarterly_Swap_Rate_11_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_4_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_Reference_Banks', 'HUF_BUBOR', 'HUF_BUBOR_Reference_Banks', 'HUF_BUBOR_Reuters', 'HUF_HUFONIA', 'HUF_HUFONIA_OIS_Compound', 'IDR_IDMA_Bloomberg', 'IDR_IDRFIX', 'IDR_INDONIA', 'IDR_INDONIA_OIS_Compound', 'IDR_JIBOR', 'IDR_JIBOR_Reuters', 'IDR_SBI_Reuters', 'IDR_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'IDR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'IDR_Semi_Annual_Swap_Rate_Reference_Banks', 'IDR_SOR_Reference_Banks', 'IDR_SOR_Reuters', 'IDR_SOR_Telerate', 'ILS_SHIR', 'ILS_SHIR_OIS_Compound', 'ILS_TELBOR', 'ILS_TELBOR01_Reuters', 'ILS_TELBOR_Reference_Banks', 'INR_BMK', 'INR_CMT', 'INR_FBIL_MIBOR_OIS_COMPOUND', 'INR_INBMK_REUTERS', 'INR_MIBOR', 'INR_MIBOR_OIS', 'INR_MIBOR_OIS_Compound_1', 'INR_MIBOR_OIS_COMPOUND', 'INR_MIFOR', 'INR_MIOIS', 'INR_MITOR_OIS_COMPOUND', 'INR_Modified_MIFOR', 'INR_Reference_Banks', 'INR_Semi_Annual_Swap_Rate_11_30_BGCANTOR', 'INR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'INR_Semi_Annual_Swap_Rate_Reference_Banks', 'INR_SORR', 'INR_SORR_OIS_Compound', 'ISK_REIBOR', 'ISK_REIBOR_Reference_Banks', 'ISK_REIBOR_Reuters', 'JPY_Annual_Swap_Rate_11_00_TRADITION', 'JPY_Annual_Swap_Rate_3_00_TRADITION', 'JPY_BBSF_Bloomberg_10_00', 'JPY_BBSF_Bloomberg_15_00', 'JPY_Euroyen_TIBOR', 'JPY_ISDA_Swap_Rate_10_00', 'JPY_ISDA_Swap_Rate_15_00', 'JPY_LIBOR', 'JPY_LIBOR_BBA', 'JPY_LIBOR_BBA_Bloomberg', 'JPY_LIBOR_FRASETT', 'JPY_LIBOR_ISDA', 'JPY_LIBOR_Reference_Banks', 'JPY_LIBOR_TSR_10_00', 'JPY_LIBOR_TSR_15_00', 'JPY_LTPR_MHBK', 'JPY_LTPR_MHCB', 'JPY_LTPR_TBC', 'JPY_MUTANCALL_TONAR', 'JPY_OIS_11_00_ICAP', 'JPY_OIS_11_00_TRADITION', 'JPY_OIS_3_00_TRADITION', 'JPY_Quoting_Banks_LIBOR', 'JPY_STPR_Quoting_Banks', 'JPY_TIBOR', 'JPY_TIBOR_17096', 'JPY_TIBOR_17097', 'JPY_TIBOR_DTIBOR01', 'JPY_TIBOR_TIBM', 'JPY_TIBOR_TIBM__10_Banks_', 'JPY_TIBOR_TIBM__5_Banks_', 'JPY_TIBOR_TIBM__All_Banks_', 'JPY_TIBOR_TIBM__All_Banks__Bloomberg', 'JPY_TIBOR_TIBM_Reference_Banks', 'JPY_TIBOR_ZTIBOR', 'JPY_TONA', 'JPY_TONA_Average_180D', 'JPY_TONA_Average_30D', 'JPY_TONA_Average_90D', 'JPY_TONA_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index_0_Floor', 'JPY_TONA_ICE_Compounded_Index_0_Floor_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_0_Floor_5D_Lag', 'JPY_TONA_ICE_Compounded_Index_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_5D_Lag', 'JPY_TONA_OIS_Compound_1', 'JPY_TONA_OIS_COMPOUND', 'JPY_TONA_TSR_10_00', 'JPY_TONA_TSR_15_00', 'JPY_TORF_QUICK', 'JPY_TSR_Reference_Banks', 'JPY_TSR_Reuters_10_00', 'JPY_TSR_Reuters_15_00', 'JPY_TSR_Telerate_10_00', 'JPY_TSR_Telerate_15_00', 'JPY_USD_Basis_Swaps_11_00_ICAP', 'KRW_Bond_3222', 'KRW_CD_3220', 'KRW_CD_91D', 'KRW_CD_KSDA_Bloomberg', 'KRW_KOFR', 'KRW_KOFR_OIS_Compound', 'KRW_Quarterly_Annual_Swap_Rate_3_30_ICAP', 'MXN_TIIE', 'MXN_TIIE_Banxico', 'MXN_TIIE_Banxico_Bloomberg', 'MXN_TIIE_Banxico_Reference_Banks', 'MXN_TIIE_ON', 'MXN_TIIE_ON_OIS_Compound', 'MXN_TIIE_Reference_Banks', 'MYR_KLIBOR', 'MYR_KLIBOR_BNM', 'MYR_KLIBOR_Reference_Banks', 'MYR_MYOR', 'MYR_MYOR_OIS_Compound', 'MYR_Quarterly_Swap_Rate_11_00_TRADITION', 'MYR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'NOK_NIBOR', 'NOK_NIBOR_NIBR', 'NOK_NIBOR_NIBR_Bloomberg', 'NOK_NIBOR_NIBR_Reference_Banks', 'NOK_NIBOR_OIBOR', 'NOK_NIBOR_Reference_Banks', 'NOK_NOWA', 'NOK_NOWA_OIS_Compound', 'NZD_BBR_BID', 'NZD_BBR_FRA', 'NZD_BBR_ISDC', 'NZD_BBR_Reference_Banks', 'NZD_BBR_Telerate', 'NZD_BKBM_Bid', 'NZD_BKBM_FRA', 'NZD_BKBM_FRA_Swap_Rate_ICAP', 'NZD_NZIONA', 'NZD_NZIONA_OIS_Compound_1', 'NZD_NZIONA_OIS_COMPOUND', 'NZD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'NZD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'NZD_Swap_Rate_ICAP', 'NZD_Swap_Rate_ICAP_Reference_Banks', 'PHP_ORR', 'PHP_PHIREF', 'PHP_PHIREF_BAP', 'PHP_PHIREF_Bloomberg', 'PHP_PHIREF_Reference_Banks', 'PHP_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'PHP_Semi_Annual_Swap_Rate_Reference_Banks', 'PLN_POLONIA', 'PLN_POLONIA_OIS_Compound_1', 'PLN_POLONIA_OIS_COMPOUND', 'PLN_POLSTR', 'PLN_POLSTR_OIS_Compound', 'PLN_WIBID', 'PLN_WIBOR', 'PLN_WIBOR_Reference_Banks', 'PLN_WIBOR_WIBO', 'PLN_WIRON', 'PLN_WIRON_OIS_Compound', 'PLZ_WIBOR_Reference_Banks', 'PLZ_WIBOR_WIBO', 'REPOFUNDS_RATE_FRANCE_OIS_COMPOUND', 'REPOFUNDS_RATE_GERMANY_OIS_COMPOUND', 'REPOFUNDS_RATE_ITALY_OIS_COMPOUND', 'RON_Annual_Swap_Rate_11_00_BGCANTOR', 'RON_Annual_Swap_Rate_Reference_Banks', 'RON_RBOR_Reuters', 'RON_ROBID', 'RON_ROBOR', 'RUB_Annual_Swap_Rate_11_00_BGCANTOR', 'RUB_Annual_Swap_Rate_12_45_TRADITION', 'RUB_Annual_Swap_Rate_4_15_TRADITION', 'RUB_Annual_Swap_Rate_Reference_Banks', 'RUB_Annual_Swap_Rate_TRADITION_Reference_Banks', 'RUB_Key_Rate_CBRF', 'RUB_MosPrime', 'RUB_MOSPRIME_NFEA', 'RUB_MOSPRIME_Reference_Banks', 'RUB_RUONIA', 'RUB_RUONIA_OIS_Compound_1', 'RUB_RUONIA_OIS_COMPOUND', 'SAR_SAIBOR', 'SAR_SRIOR_Reference_Banks', 'SAR_SRIOR_SUAA', 'SEK_Annual_Swap_Rate', 'SEK_Annual_Swap_Rate_SESWFI', 'SEK_SIOR_OIS_COMPOUND', 'SEK_STIBOR', 'SEK_STIBOR_Bloomberg', 'SEK_STIBOR_OIS_Compound', 'SEK_STIBOR_Reference_Banks', 'SEK_STIBOR_SIDE', 'SEK_SWESTR', 'SEK_SWESTR_Average_1M', 'SEK_SWESTR_Average_1W', 'SEK_SWESTR_Average_2M', 'SEK_SWESTR_Average_3M', 'SEK_SWESTR_Average_6M', 'SEK_SWESTR_Compounded_Index', 'SEK_SWESTR_OIS_Compound', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'SGD_Semi_Annual_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_TRADITION', 'SGD_Semi_Annual_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_ICAP', 'SGD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'SGD_SIBOR', 'SGD_SIBOR_Reference_Banks', 'SGD_SIBOR_Reuters', 'SGD_SIBOR_Telerate', 'SGD_SONAR_OIS_COMPOUND', 'SGD_SONAR_OIS_VWAP_COMPOUND', 'SGD_SOR', 'SGD_SORA', 'SGD_SORA_COMPOUND', 'SGD_SORA_OIS_Compound', 'SGD_SOR_Reference_Banks', 'SGD_SOR_Reuters', 'SGD_SOR_Telerate', 'SGD_SOR_VWAP', 'SGD_SOR_VWAP_Reference_Banks', 'SKK_BRIBOR_Bloomberg', 'SKK_BRIBOR_BRBO', 'SKK_BRIBOR_NBSK07', 'SKK_BRIBOR_Reference_Banks', 'THB_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'THB_Semi_Annual_Swap_Rate_Reference_Banks', 'THB_SOR_Reference_Banks', 'THB_SOR_Reuters', 'THB_SOR_Telerate', 'THB_THBFIX', 'THB_THBFIX_Reference_Banks', 'THB_THBFIX_Reuters', 'THB_THOR', 'THB_THOR_COMPOUND', 'THB_THOR_OIS_Compound', 'TRY_Annual_Swap_Rate_11_00_TRADITION', 'TRY_Annual_Swap_Rate_11_15_BGCANTOR', 'TRY_Annual_Swap_Rate_Reference_Banks', 'TRY_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'TRY_TLREF', 'TRY_TLREF_OIS_Compound_1', 'TRY_TLREF_OIS_COMPOUND', 'TRY_TRLIBOR', 'TRY_TRYIBOR_Reference_Banks', 'TRY_TRYIBOR_Reuters', 'TWD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'TWD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'TWD_Reference_Dealers', 'TWD_Reuters_6165', 'TWD_TAIBIR01', 'TWD_TAIBIR02', 'TWD_TAIBOR', 'TWD_TAIBOR_Bloomberg', 'TWD_TAIBOR_Reuters', 'TWD_Telerate_6165', 'TWD_TWCPBA', 'UK_Base_Rate', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_AMERIBOR', 'USD_AMERIBOR_Average_30D', 'USD_AMERIBOR_Average_90D', 'USD_AMERIBOR_Term', 'USD_AMERIBOR_Term_Structure', 'USD_Annual_Swap_Rate_11_00_BGCANTOR', 'USD_Annual_Swap_Rate_11_00_TRADITION', 'USD_Annual_Swap_Rate_4_00_TRADITION', 'USD_AXI_Term', 'USD_BA_H_15', 'USD_BA_Reference_Dealers', 'USD_BMA_Municipal_Swap_Index', 'USD_BSBY', 'USD_CD_H_15', 'USD_CD_Reference_Dealers', 'USD_CMS_Reference_Banks', 'USD_CMS_Reference_Banks_ICAP_SwapPX', 'USD_CMS_Reuters', 'USD_CMS_Telerate', 'USD_CMT', 'USD_CMT_Average_1W', 'USD_CMT_T7051', 'USD_CMT_T7052', 'USD_COF11_FHLBSF', 'USD_COF11_Reuters', 'USD_COF11_Telerate', 'USD_COFI', 'USD_CP_H_15', 'USD_CP_Money_Market_Yield', 'USD_CP_Reference_Dealers', 'USD_CRITR', 'USD_Federal_Funds', 'USD_Federal_Funds_H_15', 'USD_Federal_Funds_H_15_Bloomberg', 'USD_Federal_Funds_H_15_OIS_COMPOUND', 'USD_Federal_Funds_OIS_Compound', 'USD_Federal_Funds_Reference_Dealers', 'USD_FFCB_DISCO', 'USD_FXI_Term', 'USD_ISDAFIX3_Swap_Rate', 'USD_ISDAFIX3_Swap_Rate_3_00', 'USD_ISDA_Swap_Rate', 'USD_ISDA_Swap_Rate_3_00', 'USD_LIBOR', 'USD_LIBOR_BBA', 'USD_LIBOR_BBA_Bloomberg', 'USD_LIBOR_ICE_Swap_Rate_11_00', 'USD_LIBOR_ICE_Swap_Rate_15_00', 'USD_LIBOR_ISDA', 'USD_LIBOR_LIBO', 'USD_LIBOR_Reference_Banks', 'USD_Municipal_Swap_Index', 'USD_Municipal_Swap_Libor_Ratio_11_00_ICAP', 'USD_Municipal_Swap_Rate_11_00_ICAP', 'USD_OIS_11_00_BGCANTOR', 'USD_OIS_11_00_LON_ICAP', 'USD_OIS_11_00_NY_ICAP', 'USD_OIS_11_00_TRADITION', 'USD_OIS_3_00_BGCANTOR', 'USD_OIS_3_00_NY_ICAP', 'USD_OIS_4_00_TRADITION', 'USD_Overnight_Bank_Funding_Rate', 'USD_Prime', 'USD_Prime_H_15', 'USD_Prime_Reference_Banks', 'USD_S_P_Index_High_Grade', 'USD_SandP_Index_High_Grade', 'USD_SIBOR_Reference_Banks', 'USD_SIBOR_SIBO', 'USD_SIFMA_Municipal_Swap_Index', 'USD_SOFR', 'USD_SOFR_Average_180D', 'USD_SOFR_Average_30D', 'USD_SOFR_Average_90D', 'USD_SOFR_CME_Term', 'USD_SOFR_COMPOUND', 'USD_SOFR_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index_0_Floor', 'USD_SOFR_ICE_Compounded_Index_0_Floor_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_0_Floor_5D_Lag', 'USD_SOFR_ICE_Compounded_Index_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_5D_Lag', 'USD_SOFR_ICE_Swap_Rate', 'USD_SOFR_ICE_Swap_Rate_Spreads', 'USD_SOFR_ICE_Term', 'USD_SOFR_OIS_Compound', 'USD_Swap_Rate_BCMP1', 'USD_TBILL_Auction_High_Rate', 'USD_TBILL_H_15', 'USD_TBILL_H_15_Bloomberg', 'USD_TBILL_Secondary_Market', 'USD_TBILL_Secondary_Market_Bond_Equivalent_Yield', 'USD_TIBOR_ISDC', 'USD_TIBOR_Reference_Banks', 'USD_Treasury_19901_3_00_ICAP', 'USD_Treasury_Rate_BCMP1', 'USD_Treasury_Rate_ICAP_BrokerTec', 'USD_Treasury_Rate_SwapMarker100', 'USD_Treasury_Rate_SwapMarker99', 'USD_Treasury_Rate_T19901', 'USD_Treasury_Rate_T500', 'VND_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'VND_Semi_Annual_Swap_Rate_Reference_Banks', 'ZAR_DEPOSIT_Reference_Banks', 'ZAR_DEPOSIT_SAFEX', 'ZAR_JIBAR', 'ZAR_JIBAR_Reference_Banks', 'ZAR_JIBAR_SAFEX', 'ZAR_Prime_Average_1', 'ZAR_PRIME_AVERAGE', 'ZAR_PRIME_AVERAGE_Reference_Banks', 'ZAR_Quarterly_Swap_Rate_1_00_TRADITION', 'ZAR_Quarterly_Swap_Rate_5_30_TRADITION', 'ZAR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'ZAR_ZARONIA', 'ZAR_ZARONIA_OIS_Compound'))

UNION ALL

SELECT 'FloatingRateIndex' AS table_name, 'assetClass' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetClass" AS invalid_value 
FROM "FloatingRateIndex" 
WHERE "FloatingRateIndex"."assetClass" IS NOT NULL AND ("FloatingRateIndex"."assetClass" NOT IN ('Commodity', 'Credit', 'Equity', 'ForeignExchange', 'InterestRate', 'MoneyMarket'))

UNION ALL

SELECT 'FloatingRateIndex' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingRateIndex" 
WHERE "FloatingRateIndex".identifier IS NULL

UNION ALL

SELECT 'FloatingRateIndex' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingRateIndex" 
WHERE "FloatingRateIndex"."assetType" IS NULL

UNION ALL

SELECT 'FloatingRateIndex' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "FloatingRateIndex" 
WHERE "FloatingRateIndex"."assetType" IS NOT NULL AND ("FloatingRateIndex"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'ForeignExchangeRateIndex' AS table_name, 'quotedCurrencyPair' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ForeignExchangeRateIndex" 
WHERE "ForeignExchangeRateIndex"."quotedCurrencyPair" IS NULL

UNION ALL

SELECT 'ForeignExchangeRateIndex' AS table_name, 'primaryFxSpotRateSource' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ForeignExchangeRateIndex" 
WHERE "ForeignExchangeRateIndex"."primaryFxSpotRateSource" IS NULL

UNION ALL

SELECT 'ForeignExchangeRateIndex' AS table_name, 'assetClass' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetClass" AS invalid_value 
FROM "ForeignExchangeRateIndex" 
WHERE "ForeignExchangeRateIndex"."assetClass" IS NOT NULL AND ("ForeignExchangeRateIndex"."assetClass" NOT IN ('Commodity', 'Credit', 'Equity', 'ForeignExchange', 'InterestRate', 'MoneyMarket'))

UNION ALL

SELECT 'ForeignExchangeRateIndex' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ForeignExchangeRateIndex" 
WHERE "ForeignExchangeRateIndex".identifier IS NULL

UNION ALL

SELECT 'ForeignExchangeRateIndex' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ForeignExchangeRateIndex" 
WHERE "ForeignExchangeRateIndex"."assetType" IS NULL

UNION ALL

SELECT 'ForeignExchangeRateIndex' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "ForeignExchangeRateIndex" 
WHERE "ForeignExchangeRateIndex"."assetType" IS NOT NULL AND ("ForeignExchangeRateIndex"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'InflationIndex' AS table_name, 'inflationRateIndex' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InflationIndex" 
WHERE "InflationIndex"."inflationRateIndex" IS NULL

UNION ALL

SELECT 'InflationIndex' AS table_name, 'inflationRateIndex' AS column_name, 'enum' AS constraint_type, id AS record_id, "inflationRateIndex" AS invalid_value 
FROM "InflationIndex" 
WHERE "InflationIndex"."inflationRateIndex" IS NOT NULL AND ("InflationIndex"."inflationRateIndex" NOT IN ('AUD_CPI', 'AUS_CPI', 'AUS_HICP', 'BLG_CPI_GI', 'BLG_CPI_HI', 'BLG_HICP', 'BRL_IGPM', 'BRL_IPCA', 'CAD_CPI', 'CLP_CPI', 'CNY_CPI', 'CZK_CPI', 'DEK_CPI', 'DEK_HICP', 'DEM_CPI', 'DEM_CPI_NRW', 'DEM_HICP', 'ESP_CPI', 'ESP_HICP', 'ESP_R_CPI', 'ESP_R_HICP', 'EUR_AI_CPI', 'EUR_AI_R_CPI', 'EUR_EXT_CPI', 'EUR_EXT_R_CPI', 'FIN_CPI', 'FIN_HICP', 'FRC_EXT_CPI', 'FRC_HICP', 'GRD_CPI', 'GRD_HICP', 'HKD_CPI', 'HUF_CPI', 'IDR_CPI', 'ILS_CPI', 'IRL_CPI', 'IRL_HICP', 'ISK_CPI', 'ISK_HICP', 'ITL_BC_EXT_CPI', 'ITL_BC_INT_CPI', 'ITL_HICP', 'ITL_WC_EXT_CPI', 'ITL_WC_INT_CPI', 'JPY_CPI_EXF', 'KRW_CPI', 'LUX_CPI', 'LUX_HICP', 'MXN_CPI', 'MXN_UDI', 'MYR_CPI', 'NLG_CPI', 'NLG_HICP', 'NOK_CPI', 'NZD_CPI', 'PER_CPI', 'PLN_CPI', 'POR_CPI', 'POR_HICP', 'RUB_CPI', 'SEK_CPI', 'SGD_CPI', 'SWF_CPI', 'TRY_CPI', 'TWD_CPI', 'UK_CPIH', 'UK_HICP', 'UK_RPI', 'UK_RPIX', 'USA_CPI_U', 'ZAR_CPI', 'ZAR_CPIX'))

UNION ALL

SELECT 'InflationIndex' AS table_name, 'assetClass' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetClass" AS invalid_value 
FROM "InflationIndex" 
WHERE "InflationIndex"."assetClass" IS NOT NULL AND ("InflationIndex"."assetClass" NOT IN ('Commodity', 'Credit', 'Equity', 'ForeignExchange', 'InterestRate', 'MoneyMarket'))

UNION ALL

SELECT 'InflationIndex' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InflationIndex" 
WHERE "InflationIndex".identifier IS NULL

UNION ALL

SELECT 'InflationIndex' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InflationIndex" 
WHERE "InflationIndex"."assetType" IS NULL

UNION ALL

SELECT 'InflationIndex' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "InflationIndex" 
WHERE "InflationIndex"."assetType" IS NOT NULL AND ("InflationIndex"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'CreditIndex' AS table_name, 'indexAnnexSource' AS column_name, 'enum' AS constraint_type, id AS record_id, "indexAnnexSource" AS invalid_value 
FROM "CreditIndex" 
WHERE "CreditIndex"."indexAnnexSource" IS NOT NULL AND ("CreditIndex"."indexAnnexSource" NOT IN ('MasterConfirmation', 'Publisher'))

UNION ALL

SELECT 'CreditIndex' AS table_name, 'seniority' AS column_name, 'enum' AS constraint_type, id AS record_id, seniority AS invalid_value 
FROM "CreditIndex" 
WHERE "CreditIndex".seniority IS NOT NULL AND ("CreditIndex".seniority NOT IN ('Other', 'SeniorLossAbsorbingCapacity', 'SeniorSec', 'SeniorUnSec', 'SubLowerTier2', 'SubTier1', 'SubTier3', 'SubUpperTier2'))

UNION ALL

SELECT 'CreditIndex' AS table_name, 'assetClass' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetClass" AS invalid_value 
FROM "CreditIndex" 
WHERE "CreditIndex"."assetClass" IS NOT NULL AND ("CreditIndex"."assetClass" NOT IN ('Commodity', 'Credit', 'Equity', 'ForeignExchange', 'InterestRate', 'MoneyMarket'))

UNION ALL

SELECT 'CreditIndex' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditIndex" 
WHERE "CreditIndex".identifier IS NULL

UNION ALL

SELECT 'CreditIndex' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditIndex" 
WHERE "CreditIndex"."assetType" IS NULL

UNION ALL

SELECT 'CreditIndex' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "CreditIndex" 
WHERE "CreditIndex"."assetType" IS NOT NULL AND ("CreditIndex"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'EquityIndex' AS table_name, 'assetClass' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetClass" AS invalid_value 
FROM "EquityIndex" 
WHERE "EquityIndex"."assetClass" IS NOT NULL AND ("EquityIndex"."assetClass" NOT IN ('Commodity', 'Credit', 'Equity', 'ForeignExchange', 'InterestRate', 'MoneyMarket'))

UNION ALL

SELECT 'EquityIndex' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EquityIndex" 
WHERE "EquityIndex".identifier IS NULL

UNION ALL

SELECT 'EquityIndex' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EquityIndex" 
WHERE "EquityIndex"."assetType" IS NULL

UNION ALL

SELECT 'EquityIndex' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "EquityIndex" 
WHERE "EquityIndex"."assetType" IS NOT NULL AND ("EquityIndex"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'OtherIndex' AS table_name, 'assetClass' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetClass" AS invalid_value 
FROM "OtherIndex" 
WHERE "OtherIndex"."assetClass" IS NOT NULL AND ("OtherIndex"."assetClass" NOT IN ('Commodity', 'Credit', 'Equity', 'ForeignExchange', 'InterestRate', 'MoneyMarket'))

UNION ALL

SELECT 'OtherIndex' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "OtherIndex" 
WHERE "OtherIndex".identifier IS NULL

UNION ALL

SELECT 'OtherIndex' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "OtherIndex" 
WHERE "OtherIndex"."assetType" IS NULL

UNION ALL

SELECT 'OtherIndex' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "OtherIndex" 
WHERE "OtherIndex"."assetType" IS NOT NULL AND ("OtherIndex"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'PriceComposite' AS table_name, 'baseValue' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PriceComposite" 
WHERE "PriceComposite"."baseValue" IS NULL

UNION ALL

SELECT 'PriceComposite' AS table_name, 'operand' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PriceComposite" 
WHERE "PriceComposite".operand IS NULL

UNION ALL

SELECT 'PriceComposite' AS table_name, 'arithmeticOperator' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PriceComposite" 
WHERE "PriceComposite"."arithmeticOperator" IS NULL

UNION ALL

SELECT 'PriceComposite' AS table_name, 'arithmeticOperator' AS column_name, 'enum' AS constraint_type, id AS record_id, "arithmeticOperator" AS invalid_value 
FROM "PriceComposite" 
WHERE "PriceComposite"."arithmeticOperator" IS NOT NULL AND ("PriceComposite"."arithmeticOperator" NOT IN ('Add', 'Subtract', 'Multiply', 'Divide', 'Max', 'Min'))

UNION ALL

SELECT 'PriceComposite' AS table_name, 'operandType' AS column_name, 'enum' AS constraint_type, id AS record_id, "operandType" AS invalid_value 
FROM "PriceComposite" 
WHERE "PriceComposite"."operandType" IS NOT NULL AND ("PriceComposite"."operandType" NOT IN ('AccruedInterest', 'Commission', 'ForwardPoint'))

UNION ALL

SELECT 'PriceSchedule' AS table_name, 'priceType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PriceSchedule" 
WHERE "PriceSchedule"."priceType" IS NULL

UNION ALL

SELECT 'PriceSchedule' AS table_name, 'priceType' AS column_name, 'enum' AS constraint_type, id AS record_id, "priceType" AS invalid_value 
FROM "PriceSchedule" 
WHERE "PriceSchedule"."priceType" IS NOT NULL AND ("PriceSchedule"."priceType" NOT IN ('AssetPrice', 'Premium', 'Correlation', 'Dividend', 'ExchangeRate', 'InterestRate', 'Variance', 'Volatility'))

UNION ALL

SELECT 'PriceSchedule' AS table_name, 'priceSubType' AS column_name, 'enum' AS constraint_type, id AS record_id, "priceSubType" AS invalid_value 
FROM "PriceSchedule" 
WHERE "PriceSchedule"."priceSubType" IS NOT NULL AND ("PriceSchedule"."priceSubType" NOT IN ('Fee', 'Rebate'))

UNION ALL

SELECT 'PriceSchedule' AS table_name, 'priceExpression' AS column_name, 'enum' AS constraint_type, id AS record_id, "priceExpression" AS invalid_value 
FROM "PriceSchedule" 
WHERE "PriceSchedule"."priceExpression" IS NOT NULL AND ("PriceSchedule"."priceExpression" NOT IN ('AbsoluteTerms', 'PercentageOfNotional', 'ParValueFraction', 'PerOption'))

UNION ALL

SELECT 'PriceSchedule' AS table_name, 'arithmeticOperator' AS column_name, 'enum' AS constraint_type, id AS record_id, "arithmeticOperator" AS invalid_value 
FROM "PriceSchedule" 
WHERE "PriceSchedule"."arithmeticOperator" IS NOT NULL AND ("PriceSchedule"."arithmeticOperator" NOT IN ('Add', 'Subtract', 'Multiply', 'Divide', 'Max', 'Min'))

UNION ALL

SELECT 'PriceSchedule' AS table_name, 'premiumType' AS column_name, 'enum' AS constraint_type, id AS record_id, "premiumType" AS invalid_value 
FROM "PriceSchedule" 
WHERE "PriceSchedule"."premiumType" IS NOT NULL AND ("PriceSchedule"."premiumType" NOT IN ('PrePaid', 'PostPaid', 'Variable', 'Fixed'))

UNION ALL

SELECT 'Price' AS table_name, 'priceType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Price" 
WHERE "Price"."priceType" IS NULL

UNION ALL

SELECT 'Price' AS table_name, 'priceType' AS column_name, 'enum' AS constraint_type, id AS record_id, "priceType" AS invalid_value 
FROM "Price" 
WHERE "Price"."priceType" IS NOT NULL AND ("Price"."priceType" NOT IN ('AssetPrice', 'Premium', 'Correlation', 'Dividend', 'ExchangeRate', 'InterestRate', 'Variance', 'Volatility'))

UNION ALL

SELECT 'Price' AS table_name, 'priceSubType' AS column_name, 'enum' AS constraint_type, id AS record_id, "priceSubType" AS invalid_value 
FROM "Price" 
WHERE "Price"."priceSubType" IS NOT NULL AND ("Price"."priceSubType" NOT IN ('Fee', 'Rebate'))

UNION ALL

SELECT 'Price' AS table_name, 'priceExpression' AS column_name, 'enum' AS constraint_type, id AS record_id, "priceExpression" AS invalid_value 
FROM "Price" 
WHERE "Price"."priceExpression" IS NOT NULL AND ("Price"."priceExpression" NOT IN ('AbsoluteTerms', 'PercentageOfNotional', 'ParValueFraction', 'PerOption'))

UNION ALL

SELECT 'Price' AS table_name, 'arithmeticOperator' AS column_name, 'enum' AS constraint_type, id AS record_id, "arithmeticOperator" AS invalid_value 
FROM "Price" 
WHERE "Price"."arithmeticOperator" IS NOT NULL AND ("Price"."arithmeticOperator" NOT IN ('Add', 'Subtract', 'Multiply', 'Divide', 'Max', 'Min'))

UNION ALL

SELECT 'Price' AS table_name, 'premiumType' AS column_name, 'enum' AS constraint_type, id AS record_id, "premiumType" AS invalid_value 
FROM "Price" 
WHERE "Price"."premiumType" IS NOT NULL AND ("Price"."premiumType" NOT IN ('PrePaid', 'PostPaid', 'Variable', 'Fixed'))

UNION ALL

SELECT 'Basket' AS table_name, 'basketConstituent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Basket" 
WHERE "Basket"."basketConstituent" IS NULL

UNION ALL

SELECT 'Basket' AS table_name, 'identifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Basket" 
WHERE "Basket".identifier IS NULL

UNION ALL

SELECT 'Basket' AS table_name, 'assetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Basket" 
WHERE "Basket"."assetType" IS NULL

UNION ALL

SELECT 'Basket' AS table_name, 'assetType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetType" AS invalid_value 
FROM "Basket" 
WHERE "Basket"."assetType" IS NOT NULL AND ("Basket"."assetType" NOT IN ('Security', 'Cash', 'Commodity', 'ListedDerivative', 'Loan', 'LetterOfCredit', 'Other'))

UNION ALL

SELECT 'InformationSource' AS table_name, 'sourceProvider' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InformationSource" 
WHERE "InformationSource"."sourceProvider" IS NULL

UNION ALL

SELECT 'InformationSource' AS table_name, 'sourceProvider' AS column_name, 'enum' AS constraint_type, id AS record_id, "sourceProvider" AS invalid_value 
FROM "InformationSource" 
WHERE "InformationSource"."sourceProvider" IS NOT NULL AND ("InformationSource"."sourceProvider" NOT IN ('AssocBanksSingapore', 'BancoCentralChile', 'BankOfCanada', 'BankOfEngland', 'BankOfJapan', 'Bloomberg', 'EuroCentralBank', 'FederalReserve', 'FHLBSF', 'ICESWAP', 'ISDA', 'Refinitiv', 'ReserveBankAustralia', 'ReserveBankNewZealand', 'Reuters', 'SAFEX', 'Telerate', 'TOKYOSWAP'))

UNION ALL

SELECT 'QuotedCurrencyPair' AS table_name, 'currency1' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "QuotedCurrencyPair" 
WHERE "QuotedCurrencyPair".currency1 IS NULL

UNION ALL

SELECT 'QuotedCurrencyPair' AS table_name, 'currency2' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "QuotedCurrencyPair" 
WHERE "QuotedCurrencyPair".currency2 IS NULL

UNION ALL

SELECT 'QuotedCurrencyPair' AS table_name, 'quoteBasis' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "QuotedCurrencyPair" 
WHERE "QuotedCurrencyPair"."quoteBasis" IS NULL

UNION ALL

SELECT 'QuotedCurrencyPair' AS table_name, 'quoteBasis' AS column_name, 'enum' AS constraint_type, id AS record_id, "quoteBasis" AS invalid_value 
FROM "QuotedCurrencyPair" 
WHERE "QuotedCurrencyPair"."quoteBasis" IS NOT NULL AND ("QuotedCurrencyPair"."quoteBasis" NOT IN ('Currency1PerCurrency2', 'Currency2PerCurrency1'))

UNION ALL

SELECT 'Curve' AS table_name, 'commodityCurve' AS column_name, 'enum' AS constraint_type, id AS record_id, "commodityCurve" AS invalid_value 
FROM "Curve" 
WHERE "Curve"."commodityCurve" IS NOT NULL AND ("Curve"."commodityCurve" NOT IN ('ALUMINIUM_ALLOY_LME_15_MONTH', 'COAL_CENTRAL_APPALACHIAN_NYMEX', 'COCOA_ICE', 'COFFEE_ARABICA_ICE', 'COFFEE_ROBUSTA_ICE', 'COPPER_COMEX', 'CORN_CBOT', 'COTTON_NO__2_ICE', 'ETHANOL_CBOT', 'FEEDER_CATTLE_CME', 'FROZEN_CONCENTRATED_ORANGE_JUICE_NO__1_ICE', 'GASOLINE_RBOB_NEW_YORK_ICE', 'GASOLINE_RBOB_NEW_YORK_NYMEX', 'GOLD_COMEX', 'HEATING_OIL_NEW_YORK_NYMEX', 'LEAN_HOGS_CME', 'LIVE_CATTLE_CME', 'LUMBER_CME', 'MILK_CLASS_III_CME', 'MILK_NONFAT_DRY_CME', 'NATURAL_GAS_NYMEX', 'NATURAL_GAS_PEPL__TEXOK_MAINLINE__INSIDE_FERC', 'NATURAL_GAS_W__TEXAS__WAHA__INSIDE_FERC', 'OATS_CBOT', 'OIL_WTI_NYMEX', 'PALLADIUM_NYMEX', 'PLATINUM_NYMEX', 'RICE_CBOT', 'SILVER_COMEX', 'SOYBEANS_CBOT', 'SOYBEAN_MEAL_CBOT', 'SOYBEAN_OIL_CBOT', 'SUGAR___11__WORLD__ICE', 'SUGAR___16__US__ICE', 'WHEAT_CBOT', 'WHEAT_HRW_KCBOT', 'WHEAT_RED_SPRING_MGE'))

UNION ALL

SELECT 'InterestRateCurve' AS table_name, 'floatingRateIndex' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InterestRateCurve" 
WHERE "InterestRateCurve"."floatingRateIndex" IS NULL

UNION ALL

SELECT 'InterestRateCurve' AS table_name, 'floatingRateIndex' AS column_name, 'enum' AS constraint_type, id AS record_id, "floatingRateIndex" AS invalid_value 
FROM "InterestRateCurve" 
WHERE "InterestRateCurve"."floatingRateIndex" IS NOT NULL AND ("InterestRateCurve"."floatingRateIndex" NOT IN ('AED_EBOR_Reuters', 'AED_EIBOR', 'AUD_AONIA', 'AUD_AONIA_OIS_Compound_1', 'AUD_AONIA_OIS_COMPOUND', 'AUD_AONIA_OIS_COMPOUND_SwapMarker', 'AUD_BBR_AUBBSW', 'AUD_BBR_BBSW', 'AUD_BBR_BBSW_Bloomberg', 'AUD_BBR_BBSY__BID_', 'AUD_BBR_ISDC', 'AUD_BBSW', 'AUD_BBSW_Quarterly_Swap_Rate_ICAP', 'AUD_BBSW_Semi_Annual_Swap_Rate_ICAP', 'AUD_BBSY_Bid', 'AUD_LIBOR_BBA', 'AUD_LIBOR_BBA_Bloomberg', 'AUD_LIBOR_Reference_Banks', 'AUD_Quarterly_Swap_Rate_ICAP', 'AUD_Quarterly_Swap_Rate_ICAP_Reference_Banks', 'AUD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'AUD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'AUD_Semi_annual_Swap_Rate_ICAP', 'AUD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'AUD_Swap_Rate_Reuters', 'BRL_CDI', 'CAD_BA_CDOR', 'CAD_BA_CDOR_Bloomberg', 'CAD_BA_ISDD', 'CAD_BA_Reference_Banks', 'CAD_BA_Reuters', 'CAD_BA_Telerate', 'CAD_CDOR', 'CAD_CORRA', 'CAD_CORRA_CanDeal_TMX_Term', 'CAD_CORRA_Compounded_Index', 'CAD_CORRA_OIS_Compound_1', 'CAD_CORRA_OIS_COMPOUND', 'CAD_ISDA_Swap_Rate', 'CAD_LIBOR_BBA', 'CAD_LIBOR_BBA_Bloomberg', 'CAD_LIBOR_BBA_SwapMarker', 'CAD_LIBOR_Reference_Banks', 'CAD_REPO_CORRA', 'CAD_TBILL_ISDD', 'CAD_TBILL_Reference_Banks', 'CAD_TBILL_Reuters', 'CAD_TBILL_Telerate', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_6M_LIBORSWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_Annual_Swap_Rate', 'CHF_Annual_Swap_Rate_11_00_ICAP', 'CHF_Annual_Swap_Rate_Reference_Banks', 'CHF_Basis_Swap_3m_vs_6m_LIBOR_11_00_ICAP', 'CHF_ISDAFIX_Swap_Rate', 'CHF_LIBOR', 'CHF_LIBOR_BBA', 'CHF_LIBOR_BBA_Bloomberg', 'CHF_LIBOR_ISDA', 'CHF_LIBOR_Reference_Banks', 'CHF_OIS_11_00_ICAP', 'CHF_SARON', 'CHF_SARON_Average_12M', 'CHF_SARON_Average_1M', 'CHF_SARON_Average_1W', 'CHF_SARON_Average_2M', 'CHF_SARON_Average_3M', 'CHF_SARON_Average_6M', 'CHF_SARON_Average_9M', 'CHF_SARON_Compounded_Index', 'CHF_SARON_OIS_Compound_1', 'CHF_SARON_OIS_COMPOUND', 'CHF_TOIS_OIS_COMPOUND', 'CHF_USD_Basis_Swaps_11_00_ICAP', 'CL_CLICP_Bloomberg', 'CLP_ICP', 'CLP_TNA', 'CNH_HIBOR', 'CNH_HIBOR_Reference_Banks', 'CNH_HIBOR_TMA', 'CNY_7_Repo_Compounding_Date', 'CNY_CNREPOFIX_CFXS_Reuters', 'CNY_Deposit_Rate', 'CNY_Fixing_Repo_Rate', 'CNY_LPR', 'CNY_PBOCB_Reuters', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION_Reference_Banks', 'CNY_Quarterly_7D_Repo_NDS_Rate_Tradition', 'CNY_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'CNY_Semi_Annual_Swap_Rate_Reference_Banks', 'CNY_SHIBOR', 'CNY_SHIBOR_OIS_Compound', 'CNY_Shibor_OIS_Compounding', 'CNY_SHIBOR_Reuters', 'COP_IBR_OIS_Compound_1', 'COP_IBR_OIS_COMPOUND', 'CZK_Annual_Swap_Rate_11_00_BGCANTOR', 'CZK_Annual_Swap_Rate_Reference_Banks', 'CZK_CZEONIA', 'CZK_CZEONIA_OIS_Compound', 'CZK_PRIBOR', 'CZK_PRIBOR_PRBO', 'CZK_PRIBOR_Reference_Banks', 'DKK_CIBOR', 'DKK_CIBOR2', 'DKK_CIBOR2_Bloomberg', 'DKK_CIBOR2_DKNA13', 'DKK_CIBOR_DKNA13', 'DKK_CIBOR_DKNA13_Bloomberg', 'DKK_CIBOR_Reference_Banks', 'DKK_CITA', 'DKK_CITA_DKNA14_COMPOUND', 'DKK_DESTR', 'DKK_DESTR_Compounded_Index', 'DKK_DESTR_OIS_Compound', 'DKK_DKKOIS_OIS_COMPOUND', 'DKK_Tom_Next_OIS_Compound', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_Annual_Swap_Rate_10_00', 'EUR_Annual_Swap_Rate_10_00_BGCANTOR', 'EUR_Annual_Swap_Rate_10_00_Bloomberg', 'EUR_Annual_Swap_Rate_10_00_ICAP', 'EUR_Annual_Swap_Rate_10_00_SwapMarker', 'EUR_Annual_Swap_Rate_10_00_TRADITION', 'EUR_Annual_Swap_Rate_11_00', 'EUR_Annual_Swap_Rate_11_00_Bloomberg', 'EUR_Annual_Swap_Rate_11_00_ICAP', 'EUR_Annual_Swap_Rate_11_00_SwapMarker', 'EUR_Annual_Swap_Rate_3_Month', 'EUR_Annual_Swap_Rate_3_Month_SwapMarker', 'EUR_Annual_Swap_Rate_4_15_TRADITION', 'EUR_Annual_Swap_Rate_Reference_Banks', 'EUR_Basis_Swap_EONIA_vs_3m_EUR_IBOR_Swap_Rates_A_360_10_00_ICAP', 'EUR_CNO_TEC10', 'EUR_EONIA', 'EUR_EONIA_AVERAGE_1', 'EUR_EONIA_Average', 'EUR_EONIA_OIS_10_00_BGCANTOR', 'EUR_EONIA_OIS_10_00_ICAP', 'EUR_EONIA_OIS_10_00_TRADITION', 'EUR_EONIA_OIS_11_00_ICAP', 'EUR_EONIA_OIS_4_15_TRADITION', 'EUR_EONIA_OIS_Compound_1', 'EUR_EONIA_OIS_COMPOUND', 'EUR_EONIA_OIS_COMPOUND_Bloomberg', 'EUR_EONIA_Swap_Index', 'EUR_EURIBOR', 'EUR_EURIBOR_Act_365', 'EUR_EURIBOR_Act_365_Bloomberg', 'EUR_EURIBOR_Annual_Bond_Swap_vs_1m_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_1m_vs_3m_Euribor_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_3m_vs_6m_11_00_ICAP', 'EUR_EURIBOR_ICE_Swap_Rate_11_00', 'EUR_EURIBOR_ICE_Swap_Rate_12_00', 'EUR_EURIBOR_Reference_Banks', 'EUR_EURIBOR_Reuters', 'EUR_EURIBOR_Telerate', 'EUR_EURONIA_OIS_Compound_1', 'EUR_EURONIA_OIS_COMPOUND', 'EUR_EuroSTR', 'EUR_EuroSTR_Average_12M', 'EUR_EuroSTR_Average_1M', 'EUR_EuroSTR_Average_1W', 'EUR_EuroSTR_Average_3M', 'EUR_EuroSTR_Average_6M', 'EUR_EuroSTR_COMPOUND', 'EUR_EuroSTR_Compounded_Index', 'EUR_EuroSTR_FTSE_Term', 'EUR_EuroSTR_ICE_Compounded_Index', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_5D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_5D_Lag', 'EUR_EuroSTR_ICE_Swap_Rate', 'EUR_EuroSTR_OIS_Compound', 'EUR_EuroSTR_Term', 'EUR_ISDA_EURIBOR_Swap_Rate_11_00', 'EUR_ISDA_EURIBOR_Swap_Rate_12_00', 'EUR_ISDA_LIBOR_Swap_Rate_10_00', 'EUR_ISDA_LIBOR_Swap_Rate_11_00', 'EUR_LIBOR', 'EUR_LIBOR_BBA', 'EUR_LIBOR_BBA_Bloomberg', 'EUR_LIBOR_Reference_Banks', 'EUR_TAM_CDC', 'EUR_TEC10_CNO', 'EUR_TEC10_CNO_SwapMarker', 'EUR_TEC10_Reference_Banks', 'EUR_TEC5_CNO', 'EUR_TEC5_CNO_SwapMarker', 'EUR_TEC5_Reference_Banks', 'EUR_TMM_CDC_COMPOUND', 'EUR_USD_Basis_Swaps_11_00_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'GBP_ISDA_Swap_Rate', 'GBP_LIBOR', 'GBP_LIBOR_BBA', 'GBP_LIBOR_BBA_Bloomberg', 'GBP_LIBOR_ICE_Swap_Rate', 'GBP_LIBOR_ISDA', 'GBP_LIBOR_Reference_Banks', 'GBP_RONIA', 'GBP_RONIA_OIS_Compound', 'GBP_Semi_Annual_Swap_Rate', 'GBP_Semi_Annual_Swap_Rate_11_00_ICAP', 'GBP_Semi_Annual_Swap_Rate_11_00_TRADITION', 'GBP_Semi_Annual_Swap_Rate_4_15_TRADITION', 'GBP_Semi_Annual_Swap_Rate_Reference_Banks', 'GBP_Semi_Annual_Swap_Rate_SwapMarker26', 'GBP_SONIA', 'GBP_SONIA_COMPOUND', 'GBP_SONIA_Compounded_Index', 'GBP_SONIA_FTSE_Term', 'GBP_SONIA_ICE_Compounded_Index', 'GBP_SONIA_ICE_Compounded_Index_0_Floor', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_5D_Lag', 'GBP_SONIA_ICE_Compounded_Index_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_5D_Lag', 'GBP_SONIA_ICE_Swap_Rate', 'GBP_SONIA_ICE_Term', 'GBP_SONIA_OIS_11_00_ICAP', 'GBP_SONIA_OIS_11_00_TRADITION', 'GBP_SONIA_OIS_4_15_TRADITION', 'GBP_SONIA_OIS_Compound', 'GBP_SONIA_Swap_Rate', 'GBP_UK_Base_Rate', 'GBP_USD_Basis_Swaps_11_00_ICAP', 'GBP_WMBA_RONIA_COMPOUND', 'GBP_WMBA_SONIA_COMPOUND', 'GRD_ATHIBOR_ATHIBOR', 'GRD_ATHIBOR_Reference_Banks', 'GRD_ATHIBOR_Telerate', 'GRD_ATHIMID_Reference_Banks', 'GRD_ATHIMID_Reuters', 'HKD_HIBOR', 'HKD_HIBOR_HIBOR_', 'HKD_HIBOR_HIBOR_Bloomberg', 'HKD_HIBOR_HKAB', 'HKD_HIBOR_HKAB_Bloomberg', 'HKD_HIBOR_ISDC', 'HKD_HIBOR_Reference_Banks', 'HKD_HONIA', 'HKD_HONIA_OIS_Compound', 'HKD_HONIX_OIS_COMPOUND', 'HKD_ISDA_Swap_Rate_11_00', 'HKD_ISDA_Swap_Rate_4_00', 'HKD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_11_00_TRADITION', 'HKD_Quarterly_Annual_Swap_Rate_4_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'HKD_Quarterly_Quarterly_Swap_Rate_11_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_4_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_Reference_Banks', 'HUF_BUBOR', 'HUF_BUBOR_Reference_Banks', 'HUF_BUBOR_Reuters', 'HUF_HUFONIA', 'HUF_HUFONIA_OIS_Compound', 'IDR_IDMA_Bloomberg', 'IDR_IDRFIX', 'IDR_INDONIA', 'IDR_INDONIA_OIS_Compound', 'IDR_JIBOR', 'IDR_JIBOR_Reuters', 'IDR_SBI_Reuters', 'IDR_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'IDR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'IDR_Semi_Annual_Swap_Rate_Reference_Banks', 'IDR_SOR_Reference_Banks', 'IDR_SOR_Reuters', 'IDR_SOR_Telerate', 'ILS_SHIR', 'ILS_SHIR_OIS_Compound', 'ILS_TELBOR', 'ILS_TELBOR01_Reuters', 'ILS_TELBOR_Reference_Banks', 'INR_BMK', 'INR_CMT', 'INR_FBIL_MIBOR_OIS_COMPOUND', 'INR_INBMK_REUTERS', 'INR_MIBOR', 'INR_MIBOR_OIS', 'INR_MIBOR_OIS_Compound_1', 'INR_MIBOR_OIS_COMPOUND', 'INR_MIFOR', 'INR_MIOIS', 'INR_MITOR_OIS_COMPOUND', 'INR_Modified_MIFOR', 'INR_Reference_Banks', 'INR_Semi_Annual_Swap_Rate_11_30_BGCANTOR', 'INR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'INR_Semi_Annual_Swap_Rate_Reference_Banks', 'INR_SORR', 'INR_SORR_OIS_Compound', 'ISK_REIBOR', 'ISK_REIBOR_Reference_Banks', 'ISK_REIBOR_Reuters', 'JPY_Annual_Swap_Rate_11_00_TRADITION', 'JPY_Annual_Swap_Rate_3_00_TRADITION', 'JPY_BBSF_Bloomberg_10_00', 'JPY_BBSF_Bloomberg_15_00', 'JPY_Euroyen_TIBOR', 'JPY_ISDA_Swap_Rate_10_00', 'JPY_ISDA_Swap_Rate_15_00', 'JPY_LIBOR', 'JPY_LIBOR_BBA', 'JPY_LIBOR_BBA_Bloomberg', 'JPY_LIBOR_FRASETT', 'JPY_LIBOR_ISDA', 'JPY_LIBOR_Reference_Banks', 'JPY_LIBOR_TSR_10_00', 'JPY_LIBOR_TSR_15_00', 'JPY_LTPR_MHBK', 'JPY_LTPR_MHCB', 'JPY_LTPR_TBC', 'JPY_MUTANCALL_TONAR', 'JPY_OIS_11_00_ICAP', 'JPY_OIS_11_00_TRADITION', 'JPY_OIS_3_00_TRADITION', 'JPY_Quoting_Banks_LIBOR', 'JPY_STPR_Quoting_Banks', 'JPY_TIBOR', 'JPY_TIBOR_17096', 'JPY_TIBOR_17097', 'JPY_TIBOR_DTIBOR01', 'JPY_TIBOR_TIBM', 'JPY_TIBOR_TIBM__10_Banks_', 'JPY_TIBOR_TIBM__5_Banks_', 'JPY_TIBOR_TIBM__All_Banks_', 'JPY_TIBOR_TIBM__All_Banks__Bloomberg', 'JPY_TIBOR_TIBM_Reference_Banks', 'JPY_TIBOR_ZTIBOR', 'JPY_TONA', 'JPY_TONA_Average_180D', 'JPY_TONA_Average_30D', 'JPY_TONA_Average_90D', 'JPY_TONA_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index_0_Floor', 'JPY_TONA_ICE_Compounded_Index_0_Floor_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_0_Floor_5D_Lag', 'JPY_TONA_ICE_Compounded_Index_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_5D_Lag', 'JPY_TONA_OIS_Compound_1', 'JPY_TONA_OIS_COMPOUND', 'JPY_TONA_TSR_10_00', 'JPY_TONA_TSR_15_00', 'JPY_TORF_QUICK', 'JPY_TSR_Reference_Banks', 'JPY_TSR_Reuters_10_00', 'JPY_TSR_Reuters_15_00', 'JPY_TSR_Telerate_10_00', 'JPY_TSR_Telerate_15_00', 'JPY_USD_Basis_Swaps_11_00_ICAP', 'KRW_Bond_3222', 'KRW_CD_3220', 'KRW_CD_91D', 'KRW_CD_KSDA_Bloomberg', 'KRW_KOFR', 'KRW_KOFR_OIS_Compound', 'KRW_Quarterly_Annual_Swap_Rate_3_30_ICAP', 'MXN_TIIE', 'MXN_TIIE_Banxico', 'MXN_TIIE_Banxico_Bloomberg', 'MXN_TIIE_Banxico_Reference_Banks', 'MXN_TIIE_ON', 'MXN_TIIE_ON_OIS_Compound', 'MXN_TIIE_Reference_Banks', 'MYR_KLIBOR', 'MYR_KLIBOR_BNM', 'MYR_KLIBOR_Reference_Banks', 'MYR_MYOR', 'MYR_MYOR_OIS_Compound', 'MYR_Quarterly_Swap_Rate_11_00_TRADITION', 'MYR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'NOK_NIBOR', 'NOK_NIBOR_NIBR', 'NOK_NIBOR_NIBR_Bloomberg', 'NOK_NIBOR_NIBR_Reference_Banks', 'NOK_NIBOR_OIBOR', 'NOK_NIBOR_Reference_Banks', 'NOK_NOWA', 'NOK_NOWA_OIS_Compound', 'NZD_BBR_BID', 'NZD_BBR_FRA', 'NZD_BBR_ISDC', 'NZD_BBR_Reference_Banks', 'NZD_BBR_Telerate', 'NZD_BKBM_Bid', 'NZD_BKBM_FRA', 'NZD_BKBM_FRA_Swap_Rate_ICAP', 'NZD_NZIONA', 'NZD_NZIONA_OIS_Compound_1', 'NZD_NZIONA_OIS_COMPOUND', 'NZD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'NZD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'NZD_Swap_Rate_ICAP', 'NZD_Swap_Rate_ICAP_Reference_Banks', 'PHP_ORR', 'PHP_PHIREF', 'PHP_PHIREF_BAP', 'PHP_PHIREF_Bloomberg', 'PHP_PHIREF_Reference_Banks', 'PHP_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'PHP_Semi_Annual_Swap_Rate_Reference_Banks', 'PLN_POLONIA', 'PLN_POLONIA_OIS_Compound_1', 'PLN_POLONIA_OIS_COMPOUND', 'PLN_POLSTR', 'PLN_POLSTR_OIS_Compound', 'PLN_WIBID', 'PLN_WIBOR', 'PLN_WIBOR_Reference_Banks', 'PLN_WIBOR_WIBO', 'PLN_WIRON', 'PLN_WIRON_OIS_Compound', 'PLZ_WIBOR_Reference_Banks', 'PLZ_WIBOR_WIBO', 'REPOFUNDS_RATE_FRANCE_OIS_COMPOUND', 'REPOFUNDS_RATE_GERMANY_OIS_COMPOUND', 'REPOFUNDS_RATE_ITALY_OIS_COMPOUND', 'RON_Annual_Swap_Rate_11_00_BGCANTOR', 'RON_Annual_Swap_Rate_Reference_Banks', 'RON_RBOR_Reuters', 'RON_ROBID', 'RON_ROBOR', 'RUB_Annual_Swap_Rate_11_00_BGCANTOR', 'RUB_Annual_Swap_Rate_12_45_TRADITION', 'RUB_Annual_Swap_Rate_4_15_TRADITION', 'RUB_Annual_Swap_Rate_Reference_Banks', 'RUB_Annual_Swap_Rate_TRADITION_Reference_Banks', 'RUB_Key_Rate_CBRF', 'RUB_MosPrime', 'RUB_MOSPRIME_NFEA', 'RUB_MOSPRIME_Reference_Banks', 'RUB_RUONIA', 'RUB_RUONIA_OIS_Compound_1', 'RUB_RUONIA_OIS_COMPOUND', 'SAR_SAIBOR', 'SAR_SRIOR_Reference_Banks', 'SAR_SRIOR_SUAA', 'SEK_Annual_Swap_Rate', 'SEK_Annual_Swap_Rate_SESWFI', 'SEK_SIOR_OIS_COMPOUND', 'SEK_STIBOR', 'SEK_STIBOR_Bloomberg', 'SEK_STIBOR_OIS_Compound', 'SEK_STIBOR_Reference_Banks', 'SEK_STIBOR_SIDE', 'SEK_SWESTR', 'SEK_SWESTR_Average_1M', 'SEK_SWESTR_Average_1W', 'SEK_SWESTR_Average_2M', 'SEK_SWESTR_Average_3M', 'SEK_SWESTR_Average_6M', 'SEK_SWESTR_Compounded_Index', 'SEK_SWESTR_OIS_Compound', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'SGD_Semi_Annual_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_TRADITION', 'SGD_Semi_Annual_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_ICAP', 'SGD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'SGD_SIBOR', 'SGD_SIBOR_Reference_Banks', 'SGD_SIBOR_Reuters', 'SGD_SIBOR_Telerate', 'SGD_SONAR_OIS_COMPOUND', 'SGD_SONAR_OIS_VWAP_COMPOUND', 'SGD_SOR', 'SGD_SORA', 'SGD_SORA_COMPOUND', 'SGD_SORA_OIS_Compound', 'SGD_SOR_Reference_Banks', 'SGD_SOR_Reuters', 'SGD_SOR_Telerate', 'SGD_SOR_VWAP', 'SGD_SOR_VWAP_Reference_Banks', 'SKK_BRIBOR_Bloomberg', 'SKK_BRIBOR_BRBO', 'SKK_BRIBOR_NBSK07', 'SKK_BRIBOR_Reference_Banks', 'THB_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'THB_Semi_Annual_Swap_Rate_Reference_Banks', 'THB_SOR_Reference_Banks', 'THB_SOR_Reuters', 'THB_SOR_Telerate', 'THB_THBFIX', 'THB_THBFIX_Reference_Banks', 'THB_THBFIX_Reuters', 'THB_THOR', 'THB_THOR_COMPOUND', 'THB_THOR_OIS_Compound', 'TRY_Annual_Swap_Rate_11_00_TRADITION', 'TRY_Annual_Swap_Rate_11_15_BGCANTOR', 'TRY_Annual_Swap_Rate_Reference_Banks', 'TRY_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'TRY_TLREF', 'TRY_TLREF_OIS_Compound_1', 'TRY_TLREF_OIS_COMPOUND', 'TRY_TRLIBOR', 'TRY_TRYIBOR_Reference_Banks', 'TRY_TRYIBOR_Reuters', 'TWD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'TWD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'TWD_Reference_Dealers', 'TWD_Reuters_6165', 'TWD_TAIBIR01', 'TWD_TAIBIR02', 'TWD_TAIBOR', 'TWD_TAIBOR_Bloomberg', 'TWD_TAIBOR_Reuters', 'TWD_Telerate_6165', 'TWD_TWCPBA', 'UK_Base_Rate', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_AMERIBOR', 'USD_AMERIBOR_Average_30D', 'USD_AMERIBOR_Average_90D', 'USD_AMERIBOR_Term', 'USD_AMERIBOR_Term_Structure', 'USD_Annual_Swap_Rate_11_00_BGCANTOR', 'USD_Annual_Swap_Rate_11_00_TRADITION', 'USD_Annual_Swap_Rate_4_00_TRADITION', 'USD_AXI_Term', 'USD_BA_H_15', 'USD_BA_Reference_Dealers', 'USD_BMA_Municipal_Swap_Index', 'USD_BSBY', 'USD_CD_H_15', 'USD_CD_Reference_Dealers', 'USD_CMS_Reference_Banks', 'USD_CMS_Reference_Banks_ICAP_SwapPX', 'USD_CMS_Reuters', 'USD_CMS_Telerate', 'USD_CMT', 'USD_CMT_Average_1W', 'USD_CMT_T7051', 'USD_CMT_T7052', 'USD_COF11_FHLBSF', 'USD_COF11_Reuters', 'USD_COF11_Telerate', 'USD_COFI', 'USD_CP_H_15', 'USD_CP_Money_Market_Yield', 'USD_CP_Reference_Dealers', 'USD_CRITR', 'USD_Federal_Funds', 'USD_Federal_Funds_H_15', 'USD_Federal_Funds_H_15_Bloomberg', 'USD_Federal_Funds_H_15_OIS_COMPOUND', 'USD_Federal_Funds_OIS_Compound', 'USD_Federal_Funds_Reference_Dealers', 'USD_FFCB_DISCO', 'USD_FXI_Term', 'USD_ISDAFIX3_Swap_Rate', 'USD_ISDAFIX3_Swap_Rate_3_00', 'USD_ISDA_Swap_Rate', 'USD_ISDA_Swap_Rate_3_00', 'USD_LIBOR', 'USD_LIBOR_BBA', 'USD_LIBOR_BBA_Bloomberg', 'USD_LIBOR_ICE_Swap_Rate_11_00', 'USD_LIBOR_ICE_Swap_Rate_15_00', 'USD_LIBOR_ISDA', 'USD_LIBOR_LIBO', 'USD_LIBOR_Reference_Banks', 'USD_Municipal_Swap_Index', 'USD_Municipal_Swap_Libor_Ratio_11_00_ICAP', 'USD_Municipal_Swap_Rate_11_00_ICAP', 'USD_OIS_11_00_BGCANTOR', 'USD_OIS_11_00_LON_ICAP', 'USD_OIS_11_00_NY_ICAP', 'USD_OIS_11_00_TRADITION', 'USD_OIS_3_00_BGCANTOR', 'USD_OIS_3_00_NY_ICAP', 'USD_OIS_4_00_TRADITION', 'USD_Overnight_Bank_Funding_Rate', 'USD_Prime', 'USD_Prime_H_15', 'USD_Prime_Reference_Banks', 'USD_S_P_Index_High_Grade', 'USD_SandP_Index_High_Grade', 'USD_SIBOR_Reference_Banks', 'USD_SIBOR_SIBO', 'USD_SIFMA_Municipal_Swap_Index', 'USD_SOFR', 'USD_SOFR_Average_180D', 'USD_SOFR_Average_30D', 'USD_SOFR_Average_90D', 'USD_SOFR_CME_Term', 'USD_SOFR_COMPOUND', 'USD_SOFR_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index_0_Floor', 'USD_SOFR_ICE_Compounded_Index_0_Floor_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_0_Floor_5D_Lag', 'USD_SOFR_ICE_Compounded_Index_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_5D_Lag', 'USD_SOFR_ICE_Swap_Rate', 'USD_SOFR_ICE_Swap_Rate_Spreads', 'USD_SOFR_ICE_Term', 'USD_SOFR_OIS_Compound', 'USD_Swap_Rate_BCMP1', 'USD_TBILL_Auction_High_Rate', 'USD_TBILL_H_15', 'USD_TBILL_H_15_Bloomberg', 'USD_TBILL_Secondary_Market', 'USD_TBILL_Secondary_Market_Bond_Equivalent_Yield', 'USD_TIBOR_ISDC', 'USD_TIBOR_Reference_Banks', 'USD_Treasury_19901_3_00_ICAP', 'USD_Treasury_Rate_BCMP1', 'USD_Treasury_Rate_ICAP_BrokerTec', 'USD_Treasury_Rate_SwapMarker100', 'USD_Treasury_Rate_SwapMarker99', 'USD_Treasury_Rate_T19901', 'USD_Treasury_Rate_T500', 'VND_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'VND_Semi_Annual_Swap_Rate_Reference_Banks', 'ZAR_DEPOSIT_Reference_Banks', 'ZAR_DEPOSIT_SAFEX', 'ZAR_JIBAR', 'ZAR_JIBAR_Reference_Banks', 'ZAR_JIBAR_SAFEX', 'ZAR_Prime_Average_1', 'ZAR_PRIME_AVERAGE', 'ZAR_PRIME_AVERAGE_Reference_Banks', 'ZAR_Quarterly_Swap_Rate_1_00_TRADITION', 'ZAR_Quarterly_Swap_Rate_5_30_TRADITION', 'ZAR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'ZAR_ZARONIA', 'ZAR_ZARONIA_OIS_Compound'))

UNION ALL

SELECT 'InterestRateCurve' AS table_name, 'tenor' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InterestRateCurve" 
WHERE "InterestRateCurve".tenor IS NULL

UNION ALL

SELECT 'TransactedPrice' AS table_name, 'quotationStyle' AS column_name, 'enum' AS constraint_type, id AS record_id, "quotationStyle" AS invalid_value 
FROM "TransactedPrice" 
WHERE "TransactedPrice"."quotationStyle" IS NOT NULL AND ("TransactedPrice"."quotationStyle" NOT IN ('PointsUpFront', 'TradedSpread', 'Price'))

UNION ALL

SELECT 'ReferenceSwapCurve' AS table_name, 'swapUnwindValue' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ReferenceSwapCurve" 
WHERE "ReferenceSwapCurve"."swapUnwindValue" IS NULL

UNION ALL

SELECT 'MakeWholeAmount' AS table_name, 'interpolationMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "interpolationMethod" AS invalid_value 
FROM "MakeWholeAmount" 
WHERE "MakeWholeAmount"."interpolationMethod" IS NOT NULL AND ("MakeWholeAmount"."interpolationMethod" NOT IN ('Linear', 'LinearZeroYield', 'None'))

UNION ALL

SELECT 'MakeWholeAmount' AS table_name, 'earlyCallDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MakeWholeAmount" 
WHERE "MakeWholeAmount"."earlyCallDate" IS NULL

UNION ALL

SELECT 'MakeWholeAmount' AS table_name, 'floatingRateIndex' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MakeWholeAmount" 
WHERE "MakeWholeAmount"."floatingRateIndex" IS NULL

UNION ALL

SELECT 'MakeWholeAmount' AS table_name, 'floatingRateIndex' AS column_name, 'enum' AS constraint_type, id AS record_id, "floatingRateIndex" AS invalid_value 
FROM "MakeWholeAmount" 
WHERE "MakeWholeAmount"."floatingRateIndex" IS NOT NULL AND ("MakeWholeAmount"."floatingRateIndex" NOT IN ('AED_EBOR_Reuters', 'AED_EIBOR', 'AUD_AONIA', 'AUD_AONIA_OIS_Compound_1', 'AUD_AONIA_OIS_COMPOUND', 'AUD_AONIA_OIS_COMPOUND_SwapMarker', 'AUD_BBR_AUBBSW', 'AUD_BBR_BBSW', 'AUD_BBR_BBSW_Bloomberg', 'AUD_BBR_BBSY__BID_', 'AUD_BBR_ISDC', 'AUD_BBSW', 'AUD_BBSW_Quarterly_Swap_Rate_ICAP', 'AUD_BBSW_Semi_Annual_Swap_Rate_ICAP', 'AUD_BBSY_Bid', 'AUD_LIBOR_BBA', 'AUD_LIBOR_BBA_Bloomberg', 'AUD_LIBOR_Reference_Banks', 'AUD_Quarterly_Swap_Rate_ICAP', 'AUD_Quarterly_Swap_Rate_ICAP_Reference_Banks', 'AUD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'AUD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'AUD_Semi_annual_Swap_Rate_ICAP', 'AUD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'AUD_Swap_Rate_Reuters', 'BRL_CDI', 'CAD_BA_CDOR', 'CAD_BA_CDOR_Bloomberg', 'CAD_BA_ISDD', 'CAD_BA_Reference_Banks', 'CAD_BA_Reuters', 'CAD_BA_Telerate', 'CAD_CDOR', 'CAD_CORRA', 'CAD_CORRA_CanDeal_TMX_Term', 'CAD_CORRA_Compounded_Index', 'CAD_CORRA_OIS_Compound_1', 'CAD_CORRA_OIS_COMPOUND', 'CAD_ISDA_Swap_Rate', 'CAD_LIBOR_BBA', 'CAD_LIBOR_BBA_Bloomberg', 'CAD_LIBOR_BBA_SwapMarker', 'CAD_LIBOR_Reference_Banks', 'CAD_REPO_CORRA', 'CAD_TBILL_ISDD', 'CAD_TBILL_Reference_Banks', 'CAD_TBILL_Reuters', 'CAD_TBILL_Telerate', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_6M_LIBORSWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_Annual_Swap_Rate', 'CHF_Annual_Swap_Rate_11_00_ICAP', 'CHF_Annual_Swap_Rate_Reference_Banks', 'CHF_Basis_Swap_3m_vs_6m_LIBOR_11_00_ICAP', 'CHF_ISDAFIX_Swap_Rate', 'CHF_LIBOR', 'CHF_LIBOR_BBA', 'CHF_LIBOR_BBA_Bloomberg', 'CHF_LIBOR_ISDA', 'CHF_LIBOR_Reference_Banks', 'CHF_OIS_11_00_ICAP', 'CHF_SARON', 'CHF_SARON_Average_12M', 'CHF_SARON_Average_1M', 'CHF_SARON_Average_1W', 'CHF_SARON_Average_2M', 'CHF_SARON_Average_3M', 'CHF_SARON_Average_6M', 'CHF_SARON_Average_9M', 'CHF_SARON_Compounded_Index', 'CHF_SARON_OIS_Compound_1', 'CHF_SARON_OIS_COMPOUND', 'CHF_TOIS_OIS_COMPOUND', 'CHF_USD_Basis_Swaps_11_00_ICAP', 'CL_CLICP_Bloomberg', 'CLP_ICP', 'CLP_TNA', 'CNH_HIBOR', 'CNH_HIBOR_Reference_Banks', 'CNH_HIBOR_TMA', 'CNY_7_Repo_Compounding_Date', 'CNY_CNREPOFIX_CFXS_Reuters', 'CNY_Deposit_Rate', 'CNY_Fixing_Repo_Rate', 'CNY_LPR', 'CNY_PBOCB_Reuters', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION_Reference_Banks', 'CNY_Quarterly_7D_Repo_NDS_Rate_Tradition', 'CNY_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'CNY_Semi_Annual_Swap_Rate_Reference_Banks', 'CNY_SHIBOR', 'CNY_SHIBOR_OIS_Compound', 'CNY_Shibor_OIS_Compounding', 'CNY_SHIBOR_Reuters', 'COP_IBR_OIS_Compound_1', 'COP_IBR_OIS_COMPOUND', 'CZK_Annual_Swap_Rate_11_00_BGCANTOR', 'CZK_Annual_Swap_Rate_Reference_Banks', 'CZK_CZEONIA', 'CZK_CZEONIA_OIS_Compound', 'CZK_PRIBOR', 'CZK_PRIBOR_PRBO', 'CZK_PRIBOR_Reference_Banks', 'DKK_CIBOR', 'DKK_CIBOR2', 'DKK_CIBOR2_Bloomberg', 'DKK_CIBOR2_DKNA13', 'DKK_CIBOR_DKNA13', 'DKK_CIBOR_DKNA13_Bloomberg', 'DKK_CIBOR_Reference_Banks', 'DKK_CITA', 'DKK_CITA_DKNA14_COMPOUND', 'DKK_DESTR', 'DKK_DESTR_Compounded_Index', 'DKK_DESTR_OIS_Compound', 'DKK_DKKOIS_OIS_COMPOUND', 'DKK_Tom_Next_OIS_Compound', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_Annual_Swap_Rate_10_00', 'EUR_Annual_Swap_Rate_10_00_BGCANTOR', 'EUR_Annual_Swap_Rate_10_00_Bloomberg', 'EUR_Annual_Swap_Rate_10_00_ICAP', 'EUR_Annual_Swap_Rate_10_00_SwapMarker', 'EUR_Annual_Swap_Rate_10_00_TRADITION', 'EUR_Annual_Swap_Rate_11_00', 'EUR_Annual_Swap_Rate_11_00_Bloomberg', 'EUR_Annual_Swap_Rate_11_00_ICAP', 'EUR_Annual_Swap_Rate_11_00_SwapMarker', 'EUR_Annual_Swap_Rate_3_Month', 'EUR_Annual_Swap_Rate_3_Month_SwapMarker', 'EUR_Annual_Swap_Rate_4_15_TRADITION', 'EUR_Annual_Swap_Rate_Reference_Banks', 'EUR_Basis_Swap_EONIA_vs_3m_EUR_IBOR_Swap_Rates_A_360_10_00_ICAP', 'EUR_CNO_TEC10', 'EUR_EONIA', 'EUR_EONIA_AVERAGE_1', 'EUR_EONIA_Average', 'EUR_EONIA_OIS_10_00_BGCANTOR', 'EUR_EONIA_OIS_10_00_ICAP', 'EUR_EONIA_OIS_10_00_TRADITION', 'EUR_EONIA_OIS_11_00_ICAP', 'EUR_EONIA_OIS_4_15_TRADITION', 'EUR_EONIA_OIS_Compound_1', 'EUR_EONIA_OIS_COMPOUND', 'EUR_EONIA_OIS_COMPOUND_Bloomberg', 'EUR_EONIA_Swap_Index', 'EUR_EURIBOR', 'EUR_EURIBOR_Act_365', 'EUR_EURIBOR_Act_365_Bloomberg', 'EUR_EURIBOR_Annual_Bond_Swap_vs_1m_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_1m_vs_3m_Euribor_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_3m_vs_6m_11_00_ICAP', 'EUR_EURIBOR_ICE_Swap_Rate_11_00', 'EUR_EURIBOR_ICE_Swap_Rate_12_00', 'EUR_EURIBOR_Reference_Banks', 'EUR_EURIBOR_Reuters', 'EUR_EURIBOR_Telerate', 'EUR_EURONIA_OIS_Compound_1', 'EUR_EURONIA_OIS_COMPOUND', 'EUR_EuroSTR', 'EUR_EuroSTR_Average_12M', 'EUR_EuroSTR_Average_1M', 'EUR_EuroSTR_Average_1W', 'EUR_EuroSTR_Average_3M', 'EUR_EuroSTR_Average_6M', 'EUR_EuroSTR_COMPOUND', 'EUR_EuroSTR_Compounded_Index', 'EUR_EuroSTR_FTSE_Term', 'EUR_EuroSTR_ICE_Compounded_Index', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_5D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_5D_Lag', 'EUR_EuroSTR_ICE_Swap_Rate', 'EUR_EuroSTR_OIS_Compound', 'EUR_EuroSTR_Term', 'EUR_ISDA_EURIBOR_Swap_Rate_11_00', 'EUR_ISDA_EURIBOR_Swap_Rate_12_00', 'EUR_ISDA_LIBOR_Swap_Rate_10_00', 'EUR_ISDA_LIBOR_Swap_Rate_11_00', 'EUR_LIBOR', 'EUR_LIBOR_BBA', 'EUR_LIBOR_BBA_Bloomberg', 'EUR_LIBOR_Reference_Banks', 'EUR_TAM_CDC', 'EUR_TEC10_CNO', 'EUR_TEC10_CNO_SwapMarker', 'EUR_TEC10_Reference_Banks', 'EUR_TEC5_CNO', 'EUR_TEC5_CNO_SwapMarker', 'EUR_TEC5_Reference_Banks', 'EUR_TMM_CDC_COMPOUND', 'EUR_USD_Basis_Swaps_11_00_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'GBP_ISDA_Swap_Rate', 'GBP_LIBOR', 'GBP_LIBOR_BBA', 'GBP_LIBOR_BBA_Bloomberg', 'GBP_LIBOR_ICE_Swap_Rate', 'GBP_LIBOR_ISDA', 'GBP_LIBOR_Reference_Banks', 'GBP_RONIA', 'GBP_RONIA_OIS_Compound', 'GBP_Semi_Annual_Swap_Rate', 'GBP_Semi_Annual_Swap_Rate_11_00_ICAP', 'GBP_Semi_Annual_Swap_Rate_11_00_TRADITION', 'GBP_Semi_Annual_Swap_Rate_4_15_TRADITION', 'GBP_Semi_Annual_Swap_Rate_Reference_Banks', 'GBP_Semi_Annual_Swap_Rate_SwapMarker26', 'GBP_SONIA', 'GBP_SONIA_COMPOUND', 'GBP_SONIA_Compounded_Index', 'GBP_SONIA_FTSE_Term', 'GBP_SONIA_ICE_Compounded_Index', 'GBP_SONIA_ICE_Compounded_Index_0_Floor', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_5D_Lag', 'GBP_SONIA_ICE_Compounded_Index_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_5D_Lag', 'GBP_SONIA_ICE_Swap_Rate', 'GBP_SONIA_ICE_Term', 'GBP_SONIA_OIS_11_00_ICAP', 'GBP_SONIA_OIS_11_00_TRADITION', 'GBP_SONIA_OIS_4_15_TRADITION', 'GBP_SONIA_OIS_Compound', 'GBP_SONIA_Swap_Rate', 'GBP_UK_Base_Rate', 'GBP_USD_Basis_Swaps_11_00_ICAP', 'GBP_WMBA_RONIA_COMPOUND', 'GBP_WMBA_SONIA_COMPOUND', 'GRD_ATHIBOR_ATHIBOR', 'GRD_ATHIBOR_Reference_Banks', 'GRD_ATHIBOR_Telerate', 'GRD_ATHIMID_Reference_Banks', 'GRD_ATHIMID_Reuters', 'HKD_HIBOR', 'HKD_HIBOR_HIBOR_', 'HKD_HIBOR_HIBOR_Bloomberg', 'HKD_HIBOR_HKAB', 'HKD_HIBOR_HKAB_Bloomberg', 'HKD_HIBOR_ISDC', 'HKD_HIBOR_Reference_Banks', 'HKD_HONIA', 'HKD_HONIA_OIS_Compound', 'HKD_HONIX_OIS_COMPOUND', 'HKD_ISDA_Swap_Rate_11_00', 'HKD_ISDA_Swap_Rate_4_00', 'HKD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_11_00_TRADITION', 'HKD_Quarterly_Annual_Swap_Rate_4_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'HKD_Quarterly_Quarterly_Swap_Rate_11_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_4_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_Reference_Banks', 'HUF_BUBOR', 'HUF_BUBOR_Reference_Banks', 'HUF_BUBOR_Reuters', 'HUF_HUFONIA', 'HUF_HUFONIA_OIS_Compound', 'IDR_IDMA_Bloomberg', 'IDR_IDRFIX', 'IDR_INDONIA', 'IDR_INDONIA_OIS_Compound', 'IDR_JIBOR', 'IDR_JIBOR_Reuters', 'IDR_SBI_Reuters', 'IDR_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'IDR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'IDR_Semi_Annual_Swap_Rate_Reference_Banks', 'IDR_SOR_Reference_Banks', 'IDR_SOR_Reuters', 'IDR_SOR_Telerate', 'ILS_SHIR', 'ILS_SHIR_OIS_Compound', 'ILS_TELBOR', 'ILS_TELBOR01_Reuters', 'ILS_TELBOR_Reference_Banks', 'INR_BMK', 'INR_CMT', 'INR_FBIL_MIBOR_OIS_COMPOUND', 'INR_INBMK_REUTERS', 'INR_MIBOR', 'INR_MIBOR_OIS', 'INR_MIBOR_OIS_Compound_1', 'INR_MIBOR_OIS_COMPOUND', 'INR_MIFOR', 'INR_MIOIS', 'INR_MITOR_OIS_COMPOUND', 'INR_Modified_MIFOR', 'INR_Reference_Banks', 'INR_Semi_Annual_Swap_Rate_11_30_BGCANTOR', 'INR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'INR_Semi_Annual_Swap_Rate_Reference_Banks', 'INR_SORR', 'INR_SORR_OIS_Compound', 'ISK_REIBOR', 'ISK_REIBOR_Reference_Banks', 'ISK_REIBOR_Reuters', 'JPY_Annual_Swap_Rate_11_00_TRADITION', 'JPY_Annual_Swap_Rate_3_00_TRADITION', 'JPY_BBSF_Bloomberg_10_00', 'JPY_BBSF_Bloomberg_15_00', 'JPY_Euroyen_TIBOR', 'JPY_ISDA_Swap_Rate_10_00', 'JPY_ISDA_Swap_Rate_15_00', 'JPY_LIBOR', 'JPY_LIBOR_BBA', 'JPY_LIBOR_BBA_Bloomberg', 'JPY_LIBOR_FRASETT', 'JPY_LIBOR_ISDA', 'JPY_LIBOR_Reference_Banks', 'JPY_LIBOR_TSR_10_00', 'JPY_LIBOR_TSR_15_00', 'JPY_LTPR_MHBK', 'JPY_LTPR_MHCB', 'JPY_LTPR_TBC', 'JPY_MUTANCALL_TONAR', 'JPY_OIS_11_00_ICAP', 'JPY_OIS_11_00_TRADITION', 'JPY_OIS_3_00_TRADITION', 'JPY_Quoting_Banks_LIBOR', 'JPY_STPR_Quoting_Banks', 'JPY_TIBOR', 'JPY_TIBOR_17096', 'JPY_TIBOR_17097', 'JPY_TIBOR_DTIBOR01', 'JPY_TIBOR_TIBM', 'JPY_TIBOR_TIBM__10_Banks_', 'JPY_TIBOR_TIBM__5_Banks_', 'JPY_TIBOR_TIBM__All_Banks_', 'JPY_TIBOR_TIBM__All_Banks__Bloomberg', 'JPY_TIBOR_TIBM_Reference_Banks', 'JPY_TIBOR_ZTIBOR', 'JPY_TONA', 'JPY_TONA_Average_180D', 'JPY_TONA_Average_30D', 'JPY_TONA_Average_90D', 'JPY_TONA_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index_0_Floor', 'JPY_TONA_ICE_Compounded_Index_0_Floor_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_0_Floor_5D_Lag', 'JPY_TONA_ICE_Compounded_Index_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_5D_Lag', 'JPY_TONA_OIS_Compound_1', 'JPY_TONA_OIS_COMPOUND', 'JPY_TONA_TSR_10_00', 'JPY_TONA_TSR_15_00', 'JPY_TORF_QUICK', 'JPY_TSR_Reference_Banks', 'JPY_TSR_Reuters_10_00', 'JPY_TSR_Reuters_15_00', 'JPY_TSR_Telerate_10_00', 'JPY_TSR_Telerate_15_00', 'JPY_USD_Basis_Swaps_11_00_ICAP', 'KRW_Bond_3222', 'KRW_CD_3220', 'KRW_CD_91D', 'KRW_CD_KSDA_Bloomberg', 'KRW_KOFR', 'KRW_KOFR_OIS_Compound', 'KRW_Quarterly_Annual_Swap_Rate_3_30_ICAP', 'MXN_TIIE', 'MXN_TIIE_Banxico', 'MXN_TIIE_Banxico_Bloomberg', 'MXN_TIIE_Banxico_Reference_Banks', 'MXN_TIIE_ON', 'MXN_TIIE_ON_OIS_Compound', 'MXN_TIIE_Reference_Banks', 'MYR_KLIBOR', 'MYR_KLIBOR_BNM', 'MYR_KLIBOR_Reference_Banks', 'MYR_MYOR', 'MYR_MYOR_OIS_Compound', 'MYR_Quarterly_Swap_Rate_11_00_TRADITION', 'MYR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'NOK_NIBOR', 'NOK_NIBOR_NIBR', 'NOK_NIBOR_NIBR_Bloomberg', 'NOK_NIBOR_NIBR_Reference_Banks', 'NOK_NIBOR_OIBOR', 'NOK_NIBOR_Reference_Banks', 'NOK_NOWA', 'NOK_NOWA_OIS_Compound', 'NZD_BBR_BID', 'NZD_BBR_FRA', 'NZD_BBR_ISDC', 'NZD_BBR_Reference_Banks', 'NZD_BBR_Telerate', 'NZD_BKBM_Bid', 'NZD_BKBM_FRA', 'NZD_BKBM_FRA_Swap_Rate_ICAP', 'NZD_NZIONA', 'NZD_NZIONA_OIS_Compound_1', 'NZD_NZIONA_OIS_COMPOUND', 'NZD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'NZD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'NZD_Swap_Rate_ICAP', 'NZD_Swap_Rate_ICAP_Reference_Banks', 'PHP_ORR', 'PHP_PHIREF', 'PHP_PHIREF_BAP', 'PHP_PHIREF_Bloomberg', 'PHP_PHIREF_Reference_Banks', 'PHP_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'PHP_Semi_Annual_Swap_Rate_Reference_Banks', 'PLN_POLONIA', 'PLN_POLONIA_OIS_Compound_1', 'PLN_POLONIA_OIS_COMPOUND', 'PLN_POLSTR', 'PLN_POLSTR_OIS_Compound', 'PLN_WIBID', 'PLN_WIBOR', 'PLN_WIBOR_Reference_Banks', 'PLN_WIBOR_WIBO', 'PLN_WIRON', 'PLN_WIRON_OIS_Compound', 'PLZ_WIBOR_Reference_Banks', 'PLZ_WIBOR_WIBO', 'REPOFUNDS_RATE_FRANCE_OIS_COMPOUND', 'REPOFUNDS_RATE_GERMANY_OIS_COMPOUND', 'REPOFUNDS_RATE_ITALY_OIS_COMPOUND', 'RON_Annual_Swap_Rate_11_00_BGCANTOR', 'RON_Annual_Swap_Rate_Reference_Banks', 'RON_RBOR_Reuters', 'RON_ROBID', 'RON_ROBOR', 'RUB_Annual_Swap_Rate_11_00_BGCANTOR', 'RUB_Annual_Swap_Rate_12_45_TRADITION', 'RUB_Annual_Swap_Rate_4_15_TRADITION', 'RUB_Annual_Swap_Rate_Reference_Banks', 'RUB_Annual_Swap_Rate_TRADITION_Reference_Banks', 'RUB_Key_Rate_CBRF', 'RUB_MosPrime', 'RUB_MOSPRIME_NFEA', 'RUB_MOSPRIME_Reference_Banks', 'RUB_RUONIA', 'RUB_RUONIA_OIS_Compound_1', 'RUB_RUONIA_OIS_COMPOUND', 'SAR_SAIBOR', 'SAR_SRIOR_Reference_Banks', 'SAR_SRIOR_SUAA', 'SEK_Annual_Swap_Rate', 'SEK_Annual_Swap_Rate_SESWFI', 'SEK_SIOR_OIS_COMPOUND', 'SEK_STIBOR', 'SEK_STIBOR_Bloomberg', 'SEK_STIBOR_OIS_Compound', 'SEK_STIBOR_Reference_Banks', 'SEK_STIBOR_SIDE', 'SEK_SWESTR', 'SEK_SWESTR_Average_1M', 'SEK_SWESTR_Average_1W', 'SEK_SWESTR_Average_2M', 'SEK_SWESTR_Average_3M', 'SEK_SWESTR_Average_6M', 'SEK_SWESTR_Compounded_Index', 'SEK_SWESTR_OIS_Compound', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'SGD_Semi_Annual_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_TRADITION', 'SGD_Semi_Annual_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_ICAP', 'SGD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'SGD_SIBOR', 'SGD_SIBOR_Reference_Banks', 'SGD_SIBOR_Reuters', 'SGD_SIBOR_Telerate', 'SGD_SONAR_OIS_COMPOUND', 'SGD_SONAR_OIS_VWAP_COMPOUND', 'SGD_SOR', 'SGD_SORA', 'SGD_SORA_COMPOUND', 'SGD_SORA_OIS_Compound', 'SGD_SOR_Reference_Banks', 'SGD_SOR_Reuters', 'SGD_SOR_Telerate', 'SGD_SOR_VWAP', 'SGD_SOR_VWAP_Reference_Banks', 'SKK_BRIBOR_Bloomberg', 'SKK_BRIBOR_BRBO', 'SKK_BRIBOR_NBSK07', 'SKK_BRIBOR_Reference_Banks', 'THB_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'THB_Semi_Annual_Swap_Rate_Reference_Banks', 'THB_SOR_Reference_Banks', 'THB_SOR_Reuters', 'THB_SOR_Telerate', 'THB_THBFIX', 'THB_THBFIX_Reference_Banks', 'THB_THBFIX_Reuters', 'THB_THOR', 'THB_THOR_COMPOUND', 'THB_THOR_OIS_Compound', 'TRY_Annual_Swap_Rate_11_00_TRADITION', 'TRY_Annual_Swap_Rate_11_15_BGCANTOR', 'TRY_Annual_Swap_Rate_Reference_Banks', 'TRY_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'TRY_TLREF', 'TRY_TLREF_OIS_Compound_1', 'TRY_TLREF_OIS_COMPOUND', 'TRY_TRLIBOR', 'TRY_TRYIBOR_Reference_Banks', 'TRY_TRYIBOR_Reuters', 'TWD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'TWD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'TWD_Reference_Dealers', 'TWD_Reuters_6165', 'TWD_TAIBIR01', 'TWD_TAIBIR02', 'TWD_TAIBOR', 'TWD_TAIBOR_Bloomberg', 'TWD_TAIBOR_Reuters', 'TWD_Telerate_6165', 'TWD_TWCPBA', 'UK_Base_Rate', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_AMERIBOR', 'USD_AMERIBOR_Average_30D', 'USD_AMERIBOR_Average_90D', 'USD_AMERIBOR_Term', 'USD_AMERIBOR_Term_Structure', 'USD_Annual_Swap_Rate_11_00_BGCANTOR', 'USD_Annual_Swap_Rate_11_00_TRADITION', 'USD_Annual_Swap_Rate_4_00_TRADITION', 'USD_AXI_Term', 'USD_BA_H_15', 'USD_BA_Reference_Dealers', 'USD_BMA_Municipal_Swap_Index', 'USD_BSBY', 'USD_CD_H_15', 'USD_CD_Reference_Dealers', 'USD_CMS_Reference_Banks', 'USD_CMS_Reference_Banks_ICAP_SwapPX', 'USD_CMS_Reuters', 'USD_CMS_Telerate', 'USD_CMT', 'USD_CMT_Average_1W', 'USD_CMT_T7051', 'USD_CMT_T7052', 'USD_COF11_FHLBSF', 'USD_COF11_Reuters', 'USD_COF11_Telerate', 'USD_COFI', 'USD_CP_H_15', 'USD_CP_Money_Market_Yield', 'USD_CP_Reference_Dealers', 'USD_CRITR', 'USD_Federal_Funds', 'USD_Federal_Funds_H_15', 'USD_Federal_Funds_H_15_Bloomberg', 'USD_Federal_Funds_H_15_OIS_COMPOUND', 'USD_Federal_Funds_OIS_Compound', 'USD_Federal_Funds_Reference_Dealers', 'USD_FFCB_DISCO', 'USD_FXI_Term', 'USD_ISDAFIX3_Swap_Rate', 'USD_ISDAFIX3_Swap_Rate_3_00', 'USD_ISDA_Swap_Rate', 'USD_ISDA_Swap_Rate_3_00', 'USD_LIBOR', 'USD_LIBOR_BBA', 'USD_LIBOR_BBA_Bloomberg', 'USD_LIBOR_ICE_Swap_Rate_11_00', 'USD_LIBOR_ICE_Swap_Rate_15_00', 'USD_LIBOR_ISDA', 'USD_LIBOR_LIBO', 'USD_LIBOR_Reference_Banks', 'USD_Municipal_Swap_Index', 'USD_Municipal_Swap_Libor_Ratio_11_00_ICAP', 'USD_Municipal_Swap_Rate_11_00_ICAP', 'USD_OIS_11_00_BGCANTOR', 'USD_OIS_11_00_LON_ICAP', 'USD_OIS_11_00_NY_ICAP', 'USD_OIS_11_00_TRADITION', 'USD_OIS_3_00_BGCANTOR', 'USD_OIS_3_00_NY_ICAP', 'USD_OIS_4_00_TRADITION', 'USD_Overnight_Bank_Funding_Rate', 'USD_Prime', 'USD_Prime_H_15', 'USD_Prime_Reference_Banks', 'USD_S_P_Index_High_Grade', 'USD_SandP_Index_High_Grade', 'USD_SIBOR_Reference_Banks', 'USD_SIBOR_SIBO', 'USD_SIFMA_Municipal_Swap_Index', 'USD_SOFR', 'USD_SOFR_Average_180D', 'USD_SOFR_Average_30D', 'USD_SOFR_Average_90D', 'USD_SOFR_CME_Term', 'USD_SOFR_COMPOUND', 'USD_SOFR_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index_0_Floor', 'USD_SOFR_ICE_Compounded_Index_0_Floor_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_0_Floor_5D_Lag', 'USD_SOFR_ICE_Compounded_Index_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_5D_Lag', 'USD_SOFR_ICE_Swap_Rate', 'USD_SOFR_ICE_Swap_Rate_Spreads', 'USD_SOFR_ICE_Term', 'USD_SOFR_OIS_Compound', 'USD_Swap_Rate_BCMP1', 'USD_TBILL_Auction_High_Rate', 'USD_TBILL_H_15', 'USD_TBILL_H_15_Bloomberg', 'USD_TBILL_Secondary_Market', 'USD_TBILL_Secondary_Market_Bond_Equivalent_Yield', 'USD_TIBOR_ISDC', 'USD_TIBOR_Reference_Banks', 'USD_Treasury_19901_3_00_ICAP', 'USD_Treasury_Rate_BCMP1', 'USD_Treasury_Rate_ICAP_BrokerTec', 'USD_Treasury_Rate_SwapMarker100', 'USD_Treasury_Rate_SwapMarker99', 'USD_Treasury_Rate_T19901', 'USD_Treasury_Rate_T500', 'VND_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'VND_Semi_Annual_Swap_Rate_Reference_Banks', 'ZAR_DEPOSIT_Reference_Banks', 'ZAR_DEPOSIT_SAFEX', 'ZAR_JIBAR', 'ZAR_JIBAR_Reference_Banks', 'ZAR_JIBAR_SAFEX', 'ZAR_Prime_Average_1', 'ZAR_PRIME_AVERAGE', 'ZAR_PRIME_AVERAGE_Reference_Banks', 'ZAR_Quarterly_Swap_Rate_1_00_TRADITION', 'ZAR_Quarterly_Swap_Rate_5_30_TRADITION', 'ZAR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'ZAR_ZARONIA', 'ZAR_ZARONIA_OIS_Compound'))

UNION ALL

SELECT 'MakeWholeAmount' AS table_name, 'spread' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MakeWholeAmount" 
WHERE "MakeWholeAmount".spread IS NULL

UNION ALL

SELECT 'MakeWholeAmount' AS table_name, 'side' AS column_name, 'enum' AS constraint_type, id AS record_id, side AS invalid_value 
FROM "MakeWholeAmount" 
WHERE "MakeWholeAmount".side IS NOT NULL AND ("MakeWholeAmount".side NOT IN ('Afternoon', 'Ask', 'Bid', 'Closing', 'High', 'Index', 'MeanOfBidAndAsk', 'LocationalMarginal', 'Low', 'MarginalHourly', 'MarketClearing', 'MeanOfHighAndLow', 'Morning', 'Official', 'Opening', 'OSP', 'Settlement', 'Spot', 'Mid', 'NationalSingle', 'WeightedAverage', 'UnWeightedAverage'))

UNION ALL

SELECT 'SwapCurveValuation' AS table_name, 'floatingRateIndex' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SwapCurveValuation" 
WHERE "SwapCurveValuation"."floatingRateIndex" IS NULL

UNION ALL

SELECT 'SwapCurveValuation' AS table_name, 'floatingRateIndex' AS column_name, 'enum' AS constraint_type, id AS record_id, "floatingRateIndex" AS invalid_value 
FROM "SwapCurveValuation" 
WHERE "SwapCurveValuation"."floatingRateIndex" IS NOT NULL AND ("SwapCurveValuation"."floatingRateIndex" NOT IN ('AED_EBOR_Reuters', 'AED_EIBOR', 'AUD_AONIA', 'AUD_AONIA_OIS_Compound_1', 'AUD_AONIA_OIS_COMPOUND', 'AUD_AONIA_OIS_COMPOUND_SwapMarker', 'AUD_BBR_AUBBSW', 'AUD_BBR_BBSW', 'AUD_BBR_BBSW_Bloomberg', 'AUD_BBR_BBSY__BID_', 'AUD_BBR_ISDC', 'AUD_BBSW', 'AUD_BBSW_Quarterly_Swap_Rate_ICAP', 'AUD_BBSW_Semi_Annual_Swap_Rate_ICAP', 'AUD_BBSY_Bid', 'AUD_LIBOR_BBA', 'AUD_LIBOR_BBA_Bloomberg', 'AUD_LIBOR_Reference_Banks', 'AUD_Quarterly_Swap_Rate_ICAP', 'AUD_Quarterly_Swap_Rate_ICAP_Reference_Banks', 'AUD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'AUD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'AUD_Semi_annual_Swap_Rate_ICAP', 'AUD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'AUD_Swap_Rate_Reuters', 'BRL_CDI', 'CAD_BA_CDOR', 'CAD_BA_CDOR_Bloomberg', 'CAD_BA_ISDD', 'CAD_BA_Reference_Banks', 'CAD_BA_Reuters', 'CAD_BA_Telerate', 'CAD_CDOR', 'CAD_CORRA', 'CAD_CORRA_CanDeal_TMX_Term', 'CAD_CORRA_Compounded_Index', 'CAD_CORRA_OIS_Compound_1', 'CAD_CORRA_OIS_COMPOUND', 'CAD_ISDA_Swap_Rate', 'CAD_LIBOR_BBA', 'CAD_LIBOR_BBA_Bloomberg', 'CAD_LIBOR_BBA_SwapMarker', 'CAD_LIBOR_Reference_Banks', 'CAD_REPO_CORRA', 'CAD_TBILL_ISDD', 'CAD_TBILL_Reference_Banks', 'CAD_TBILL_Reuters', 'CAD_TBILL_Telerate', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_6M_LIBORSWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_Annual_Swap_Rate', 'CHF_Annual_Swap_Rate_11_00_ICAP', 'CHF_Annual_Swap_Rate_Reference_Banks', 'CHF_Basis_Swap_3m_vs_6m_LIBOR_11_00_ICAP', 'CHF_ISDAFIX_Swap_Rate', 'CHF_LIBOR', 'CHF_LIBOR_BBA', 'CHF_LIBOR_BBA_Bloomberg', 'CHF_LIBOR_ISDA', 'CHF_LIBOR_Reference_Banks', 'CHF_OIS_11_00_ICAP', 'CHF_SARON', 'CHF_SARON_Average_12M', 'CHF_SARON_Average_1M', 'CHF_SARON_Average_1W', 'CHF_SARON_Average_2M', 'CHF_SARON_Average_3M', 'CHF_SARON_Average_6M', 'CHF_SARON_Average_9M', 'CHF_SARON_Compounded_Index', 'CHF_SARON_OIS_Compound_1', 'CHF_SARON_OIS_COMPOUND', 'CHF_TOIS_OIS_COMPOUND', 'CHF_USD_Basis_Swaps_11_00_ICAP', 'CL_CLICP_Bloomberg', 'CLP_ICP', 'CLP_TNA', 'CNH_HIBOR', 'CNH_HIBOR_Reference_Banks', 'CNH_HIBOR_TMA', 'CNY_7_Repo_Compounding_Date', 'CNY_CNREPOFIX_CFXS_Reuters', 'CNY_Deposit_Rate', 'CNY_Fixing_Repo_Rate', 'CNY_LPR', 'CNY_PBOCB_Reuters', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION_Reference_Banks', 'CNY_Quarterly_7D_Repo_NDS_Rate_Tradition', 'CNY_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'CNY_Semi_Annual_Swap_Rate_Reference_Banks', 'CNY_SHIBOR', 'CNY_SHIBOR_OIS_Compound', 'CNY_Shibor_OIS_Compounding', 'CNY_SHIBOR_Reuters', 'COP_IBR_OIS_Compound_1', 'COP_IBR_OIS_COMPOUND', 'CZK_Annual_Swap_Rate_11_00_BGCANTOR', 'CZK_Annual_Swap_Rate_Reference_Banks', 'CZK_CZEONIA', 'CZK_CZEONIA_OIS_Compound', 'CZK_PRIBOR', 'CZK_PRIBOR_PRBO', 'CZK_PRIBOR_Reference_Banks', 'DKK_CIBOR', 'DKK_CIBOR2', 'DKK_CIBOR2_Bloomberg', 'DKK_CIBOR2_DKNA13', 'DKK_CIBOR_DKNA13', 'DKK_CIBOR_DKNA13_Bloomberg', 'DKK_CIBOR_Reference_Banks', 'DKK_CITA', 'DKK_CITA_DKNA14_COMPOUND', 'DKK_DESTR', 'DKK_DESTR_Compounded_Index', 'DKK_DESTR_OIS_Compound', 'DKK_DKKOIS_OIS_COMPOUND', 'DKK_Tom_Next_OIS_Compound', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_Annual_Swap_Rate_10_00', 'EUR_Annual_Swap_Rate_10_00_BGCANTOR', 'EUR_Annual_Swap_Rate_10_00_Bloomberg', 'EUR_Annual_Swap_Rate_10_00_ICAP', 'EUR_Annual_Swap_Rate_10_00_SwapMarker', 'EUR_Annual_Swap_Rate_10_00_TRADITION', 'EUR_Annual_Swap_Rate_11_00', 'EUR_Annual_Swap_Rate_11_00_Bloomberg', 'EUR_Annual_Swap_Rate_11_00_ICAP', 'EUR_Annual_Swap_Rate_11_00_SwapMarker', 'EUR_Annual_Swap_Rate_3_Month', 'EUR_Annual_Swap_Rate_3_Month_SwapMarker', 'EUR_Annual_Swap_Rate_4_15_TRADITION', 'EUR_Annual_Swap_Rate_Reference_Banks', 'EUR_Basis_Swap_EONIA_vs_3m_EUR_IBOR_Swap_Rates_A_360_10_00_ICAP', 'EUR_CNO_TEC10', 'EUR_EONIA', 'EUR_EONIA_AVERAGE_1', 'EUR_EONIA_Average', 'EUR_EONIA_OIS_10_00_BGCANTOR', 'EUR_EONIA_OIS_10_00_ICAP', 'EUR_EONIA_OIS_10_00_TRADITION', 'EUR_EONIA_OIS_11_00_ICAP', 'EUR_EONIA_OIS_4_15_TRADITION', 'EUR_EONIA_OIS_Compound_1', 'EUR_EONIA_OIS_COMPOUND', 'EUR_EONIA_OIS_COMPOUND_Bloomberg', 'EUR_EONIA_Swap_Index', 'EUR_EURIBOR', 'EUR_EURIBOR_Act_365', 'EUR_EURIBOR_Act_365_Bloomberg', 'EUR_EURIBOR_Annual_Bond_Swap_vs_1m_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_1m_vs_3m_Euribor_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_3m_vs_6m_11_00_ICAP', 'EUR_EURIBOR_ICE_Swap_Rate_11_00', 'EUR_EURIBOR_ICE_Swap_Rate_12_00', 'EUR_EURIBOR_Reference_Banks', 'EUR_EURIBOR_Reuters', 'EUR_EURIBOR_Telerate', 'EUR_EURONIA_OIS_Compound_1', 'EUR_EURONIA_OIS_COMPOUND', 'EUR_EuroSTR', 'EUR_EuroSTR_Average_12M', 'EUR_EuroSTR_Average_1M', 'EUR_EuroSTR_Average_1W', 'EUR_EuroSTR_Average_3M', 'EUR_EuroSTR_Average_6M', 'EUR_EuroSTR_COMPOUND', 'EUR_EuroSTR_Compounded_Index', 'EUR_EuroSTR_FTSE_Term', 'EUR_EuroSTR_ICE_Compounded_Index', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_5D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_5D_Lag', 'EUR_EuroSTR_ICE_Swap_Rate', 'EUR_EuroSTR_OIS_Compound', 'EUR_EuroSTR_Term', 'EUR_ISDA_EURIBOR_Swap_Rate_11_00', 'EUR_ISDA_EURIBOR_Swap_Rate_12_00', 'EUR_ISDA_LIBOR_Swap_Rate_10_00', 'EUR_ISDA_LIBOR_Swap_Rate_11_00', 'EUR_LIBOR', 'EUR_LIBOR_BBA', 'EUR_LIBOR_BBA_Bloomberg', 'EUR_LIBOR_Reference_Banks', 'EUR_TAM_CDC', 'EUR_TEC10_CNO', 'EUR_TEC10_CNO_SwapMarker', 'EUR_TEC10_Reference_Banks', 'EUR_TEC5_CNO', 'EUR_TEC5_CNO_SwapMarker', 'EUR_TEC5_Reference_Banks', 'EUR_TMM_CDC_COMPOUND', 'EUR_USD_Basis_Swaps_11_00_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'GBP_ISDA_Swap_Rate', 'GBP_LIBOR', 'GBP_LIBOR_BBA', 'GBP_LIBOR_BBA_Bloomberg', 'GBP_LIBOR_ICE_Swap_Rate', 'GBP_LIBOR_ISDA', 'GBP_LIBOR_Reference_Banks', 'GBP_RONIA', 'GBP_RONIA_OIS_Compound', 'GBP_Semi_Annual_Swap_Rate', 'GBP_Semi_Annual_Swap_Rate_11_00_ICAP', 'GBP_Semi_Annual_Swap_Rate_11_00_TRADITION', 'GBP_Semi_Annual_Swap_Rate_4_15_TRADITION', 'GBP_Semi_Annual_Swap_Rate_Reference_Banks', 'GBP_Semi_Annual_Swap_Rate_SwapMarker26', 'GBP_SONIA', 'GBP_SONIA_COMPOUND', 'GBP_SONIA_Compounded_Index', 'GBP_SONIA_FTSE_Term', 'GBP_SONIA_ICE_Compounded_Index', 'GBP_SONIA_ICE_Compounded_Index_0_Floor', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_5D_Lag', 'GBP_SONIA_ICE_Compounded_Index_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_5D_Lag', 'GBP_SONIA_ICE_Swap_Rate', 'GBP_SONIA_ICE_Term', 'GBP_SONIA_OIS_11_00_ICAP', 'GBP_SONIA_OIS_11_00_TRADITION', 'GBP_SONIA_OIS_4_15_TRADITION', 'GBP_SONIA_OIS_Compound', 'GBP_SONIA_Swap_Rate', 'GBP_UK_Base_Rate', 'GBP_USD_Basis_Swaps_11_00_ICAP', 'GBP_WMBA_RONIA_COMPOUND', 'GBP_WMBA_SONIA_COMPOUND', 'GRD_ATHIBOR_ATHIBOR', 'GRD_ATHIBOR_Reference_Banks', 'GRD_ATHIBOR_Telerate', 'GRD_ATHIMID_Reference_Banks', 'GRD_ATHIMID_Reuters', 'HKD_HIBOR', 'HKD_HIBOR_HIBOR_', 'HKD_HIBOR_HIBOR_Bloomberg', 'HKD_HIBOR_HKAB', 'HKD_HIBOR_HKAB_Bloomberg', 'HKD_HIBOR_ISDC', 'HKD_HIBOR_Reference_Banks', 'HKD_HONIA', 'HKD_HONIA_OIS_Compound', 'HKD_HONIX_OIS_COMPOUND', 'HKD_ISDA_Swap_Rate_11_00', 'HKD_ISDA_Swap_Rate_4_00', 'HKD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_11_00_TRADITION', 'HKD_Quarterly_Annual_Swap_Rate_4_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'HKD_Quarterly_Quarterly_Swap_Rate_11_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_4_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_Reference_Banks', 'HUF_BUBOR', 'HUF_BUBOR_Reference_Banks', 'HUF_BUBOR_Reuters', 'HUF_HUFONIA', 'HUF_HUFONIA_OIS_Compound', 'IDR_IDMA_Bloomberg', 'IDR_IDRFIX', 'IDR_INDONIA', 'IDR_INDONIA_OIS_Compound', 'IDR_JIBOR', 'IDR_JIBOR_Reuters', 'IDR_SBI_Reuters', 'IDR_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'IDR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'IDR_Semi_Annual_Swap_Rate_Reference_Banks', 'IDR_SOR_Reference_Banks', 'IDR_SOR_Reuters', 'IDR_SOR_Telerate', 'ILS_SHIR', 'ILS_SHIR_OIS_Compound', 'ILS_TELBOR', 'ILS_TELBOR01_Reuters', 'ILS_TELBOR_Reference_Banks', 'INR_BMK', 'INR_CMT', 'INR_FBIL_MIBOR_OIS_COMPOUND', 'INR_INBMK_REUTERS', 'INR_MIBOR', 'INR_MIBOR_OIS', 'INR_MIBOR_OIS_Compound_1', 'INR_MIBOR_OIS_COMPOUND', 'INR_MIFOR', 'INR_MIOIS', 'INR_MITOR_OIS_COMPOUND', 'INR_Modified_MIFOR', 'INR_Reference_Banks', 'INR_Semi_Annual_Swap_Rate_11_30_BGCANTOR', 'INR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'INR_Semi_Annual_Swap_Rate_Reference_Banks', 'INR_SORR', 'INR_SORR_OIS_Compound', 'ISK_REIBOR', 'ISK_REIBOR_Reference_Banks', 'ISK_REIBOR_Reuters', 'JPY_Annual_Swap_Rate_11_00_TRADITION', 'JPY_Annual_Swap_Rate_3_00_TRADITION', 'JPY_BBSF_Bloomberg_10_00', 'JPY_BBSF_Bloomberg_15_00', 'JPY_Euroyen_TIBOR', 'JPY_ISDA_Swap_Rate_10_00', 'JPY_ISDA_Swap_Rate_15_00', 'JPY_LIBOR', 'JPY_LIBOR_BBA', 'JPY_LIBOR_BBA_Bloomberg', 'JPY_LIBOR_FRASETT', 'JPY_LIBOR_ISDA', 'JPY_LIBOR_Reference_Banks', 'JPY_LIBOR_TSR_10_00', 'JPY_LIBOR_TSR_15_00', 'JPY_LTPR_MHBK', 'JPY_LTPR_MHCB', 'JPY_LTPR_TBC', 'JPY_MUTANCALL_TONAR', 'JPY_OIS_11_00_ICAP', 'JPY_OIS_11_00_TRADITION', 'JPY_OIS_3_00_TRADITION', 'JPY_Quoting_Banks_LIBOR', 'JPY_STPR_Quoting_Banks', 'JPY_TIBOR', 'JPY_TIBOR_17096', 'JPY_TIBOR_17097', 'JPY_TIBOR_DTIBOR01', 'JPY_TIBOR_TIBM', 'JPY_TIBOR_TIBM__10_Banks_', 'JPY_TIBOR_TIBM__5_Banks_', 'JPY_TIBOR_TIBM__All_Banks_', 'JPY_TIBOR_TIBM__All_Banks__Bloomberg', 'JPY_TIBOR_TIBM_Reference_Banks', 'JPY_TIBOR_ZTIBOR', 'JPY_TONA', 'JPY_TONA_Average_180D', 'JPY_TONA_Average_30D', 'JPY_TONA_Average_90D', 'JPY_TONA_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index_0_Floor', 'JPY_TONA_ICE_Compounded_Index_0_Floor_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_0_Floor_5D_Lag', 'JPY_TONA_ICE_Compounded_Index_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_5D_Lag', 'JPY_TONA_OIS_Compound_1', 'JPY_TONA_OIS_COMPOUND', 'JPY_TONA_TSR_10_00', 'JPY_TONA_TSR_15_00', 'JPY_TORF_QUICK', 'JPY_TSR_Reference_Banks', 'JPY_TSR_Reuters_10_00', 'JPY_TSR_Reuters_15_00', 'JPY_TSR_Telerate_10_00', 'JPY_TSR_Telerate_15_00', 'JPY_USD_Basis_Swaps_11_00_ICAP', 'KRW_Bond_3222', 'KRW_CD_3220', 'KRW_CD_91D', 'KRW_CD_KSDA_Bloomberg', 'KRW_KOFR', 'KRW_KOFR_OIS_Compound', 'KRW_Quarterly_Annual_Swap_Rate_3_30_ICAP', 'MXN_TIIE', 'MXN_TIIE_Banxico', 'MXN_TIIE_Banxico_Bloomberg', 'MXN_TIIE_Banxico_Reference_Banks', 'MXN_TIIE_ON', 'MXN_TIIE_ON_OIS_Compound', 'MXN_TIIE_Reference_Banks', 'MYR_KLIBOR', 'MYR_KLIBOR_BNM', 'MYR_KLIBOR_Reference_Banks', 'MYR_MYOR', 'MYR_MYOR_OIS_Compound', 'MYR_Quarterly_Swap_Rate_11_00_TRADITION', 'MYR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'NOK_NIBOR', 'NOK_NIBOR_NIBR', 'NOK_NIBOR_NIBR_Bloomberg', 'NOK_NIBOR_NIBR_Reference_Banks', 'NOK_NIBOR_OIBOR', 'NOK_NIBOR_Reference_Banks', 'NOK_NOWA', 'NOK_NOWA_OIS_Compound', 'NZD_BBR_BID', 'NZD_BBR_FRA', 'NZD_BBR_ISDC', 'NZD_BBR_Reference_Banks', 'NZD_BBR_Telerate', 'NZD_BKBM_Bid', 'NZD_BKBM_FRA', 'NZD_BKBM_FRA_Swap_Rate_ICAP', 'NZD_NZIONA', 'NZD_NZIONA_OIS_Compound_1', 'NZD_NZIONA_OIS_COMPOUND', 'NZD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'NZD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'NZD_Swap_Rate_ICAP', 'NZD_Swap_Rate_ICAP_Reference_Banks', 'PHP_ORR', 'PHP_PHIREF', 'PHP_PHIREF_BAP', 'PHP_PHIREF_Bloomberg', 'PHP_PHIREF_Reference_Banks', 'PHP_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'PHP_Semi_Annual_Swap_Rate_Reference_Banks', 'PLN_POLONIA', 'PLN_POLONIA_OIS_Compound_1', 'PLN_POLONIA_OIS_COMPOUND', 'PLN_POLSTR', 'PLN_POLSTR_OIS_Compound', 'PLN_WIBID', 'PLN_WIBOR', 'PLN_WIBOR_Reference_Banks', 'PLN_WIBOR_WIBO', 'PLN_WIRON', 'PLN_WIRON_OIS_Compound', 'PLZ_WIBOR_Reference_Banks', 'PLZ_WIBOR_WIBO', 'REPOFUNDS_RATE_FRANCE_OIS_COMPOUND', 'REPOFUNDS_RATE_GERMANY_OIS_COMPOUND', 'REPOFUNDS_RATE_ITALY_OIS_COMPOUND', 'RON_Annual_Swap_Rate_11_00_BGCANTOR', 'RON_Annual_Swap_Rate_Reference_Banks', 'RON_RBOR_Reuters', 'RON_ROBID', 'RON_ROBOR', 'RUB_Annual_Swap_Rate_11_00_BGCANTOR', 'RUB_Annual_Swap_Rate_12_45_TRADITION', 'RUB_Annual_Swap_Rate_4_15_TRADITION', 'RUB_Annual_Swap_Rate_Reference_Banks', 'RUB_Annual_Swap_Rate_TRADITION_Reference_Banks', 'RUB_Key_Rate_CBRF', 'RUB_MosPrime', 'RUB_MOSPRIME_NFEA', 'RUB_MOSPRIME_Reference_Banks', 'RUB_RUONIA', 'RUB_RUONIA_OIS_Compound_1', 'RUB_RUONIA_OIS_COMPOUND', 'SAR_SAIBOR', 'SAR_SRIOR_Reference_Banks', 'SAR_SRIOR_SUAA', 'SEK_Annual_Swap_Rate', 'SEK_Annual_Swap_Rate_SESWFI', 'SEK_SIOR_OIS_COMPOUND', 'SEK_STIBOR', 'SEK_STIBOR_Bloomberg', 'SEK_STIBOR_OIS_Compound', 'SEK_STIBOR_Reference_Banks', 'SEK_STIBOR_SIDE', 'SEK_SWESTR', 'SEK_SWESTR_Average_1M', 'SEK_SWESTR_Average_1W', 'SEK_SWESTR_Average_2M', 'SEK_SWESTR_Average_3M', 'SEK_SWESTR_Average_6M', 'SEK_SWESTR_Compounded_Index', 'SEK_SWESTR_OIS_Compound', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'SGD_Semi_Annual_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_TRADITION', 'SGD_Semi_Annual_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_ICAP', 'SGD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'SGD_SIBOR', 'SGD_SIBOR_Reference_Banks', 'SGD_SIBOR_Reuters', 'SGD_SIBOR_Telerate', 'SGD_SONAR_OIS_COMPOUND', 'SGD_SONAR_OIS_VWAP_COMPOUND', 'SGD_SOR', 'SGD_SORA', 'SGD_SORA_COMPOUND', 'SGD_SORA_OIS_Compound', 'SGD_SOR_Reference_Banks', 'SGD_SOR_Reuters', 'SGD_SOR_Telerate', 'SGD_SOR_VWAP', 'SGD_SOR_VWAP_Reference_Banks', 'SKK_BRIBOR_Bloomberg', 'SKK_BRIBOR_BRBO', 'SKK_BRIBOR_NBSK07', 'SKK_BRIBOR_Reference_Banks', 'THB_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'THB_Semi_Annual_Swap_Rate_Reference_Banks', 'THB_SOR_Reference_Banks', 'THB_SOR_Reuters', 'THB_SOR_Telerate', 'THB_THBFIX', 'THB_THBFIX_Reference_Banks', 'THB_THBFIX_Reuters', 'THB_THOR', 'THB_THOR_COMPOUND', 'THB_THOR_OIS_Compound', 'TRY_Annual_Swap_Rate_11_00_TRADITION', 'TRY_Annual_Swap_Rate_11_15_BGCANTOR', 'TRY_Annual_Swap_Rate_Reference_Banks', 'TRY_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'TRY_TLREF', 'TRY_TLREF_OIS_Compound_1', 'TRY_TLREF_OIS_COMPOUND', 'TRY_TRLIBOR', 'TRY_TRYIBOR_Reference_Banks', 'TRY_TRYIBOR_Reuters', 'TWD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'TWD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'TWD_Reference_Dealers', 'TWD_Reuters_6165', 'TWD_TAIBIR01', 'TWD_TAIBIR02', 'TWD_TAIBOR', 'TWD_TAIBOR_Bloomberg', 'TWD_TAIBOR_Reuters', 'TWD_Telerate_6165', 'TWD_TWCPBA', 'UK_Base_Rate', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_AMERIBOR', 'USD_AMERIBOR_Average_30D', 'USD_AMERIBOR_Average_90D', 'USD_AMERIBOR_Term', 'USD_AMERIBOR_Term_Structure', 'USD_Annual_Swap_Rate_11_00_BGCANTOR', 'USD_Annual_Swap_Rate_11_00_TRADITION', 'USD_Annual_Swap_Rate_4_00_TRADITION', 'USD_AXI_Term', 'USD_BA_H_15', 'USD_BA_Reference_Dealers', 'USD_BMA_Municipal_Swap_Index', 'USD_BSBY', 'USD_CD_H_15', 'USD_CD_Reference_Dealers', 'USD_CMS_Reference_Banks', 'USD_CMS_Reference_Banks_ICAP_SwapPX', 'USD_CMS_Reuters', 'USD_CMS_Telerate', 'USD_CMT', 'USD_CMT_Average_1W', 'USD_CMT_T7051', 'USD_CMT_T7052', 'USD_COF11_FHLBSF', 'USD_COF11_Reuters', 'USD_COF11_Telerate', 'USD_COFI', 'USD_CP_H_15', 'USD_CP_Money_Market_Yield', 'USD_CP_Reference_Dealers', 'USD_CRITR', 'USD_Federal_Funds', 'USD_Federal_Funds_H_15', 'USD_Federal_Funds_H_15_Bloomberg', 'USD_Federal_Funds_H_15_OIS_COMPOUND', 'USD_Federal_Funds_OIS_Compound', 'USD_Federal_Funds_Reference_Dealers', 'USD_FFCB_DISCO', 'USD_FXI_Term', 'USD_ISDAFIX3_Swap_Rate', 'USD_ISDAFIX3_Swap_Rate_3_00', 'USD_ISDA_Swap_Rate', 'USD_ISDA_Swap_Rate_3_00', 'USD_LIBOR', 'USD_LIBOR_BBA', 'USD_LIBOR_BBA_Bloomberg', 'USD_LIBOR_ICE_Swap_Rate_11_00', 'USD_LIBOR_ICE_Swap_Rate_15_00', 'USD_LIBOR_ISDA', 'USD_LIBOR_LIBO', 'USD_LIBOR_Reference_Banks', 'USD_Municipal_Swap_Index', 'USD_Municipal_Swap_Libor_Ratio_11_00_ICAP', 'USD_Municipal_Swap_Rate_11_00_ICAP', 'USD_OIS_11_00_BGCANTOR', 'USD_OIS_11_00_LON_ICAP', 'USD_OIS_11_00_NY_ICAP', 'USD_OIS_11_00_TRADITION', 'USD_OIS_3_00_BGCANTOR', 'USD_OIS_3_00_NY_ICAP', 'USD_OIS_4_00_TRADITION', 'USD_Overnight_Bank_Funding_Rate', 'USD_Prime', 'USD_Prime_H_15', 'USD_Prime_Reference_Banks', 'USD_S_P_Index_High_Grade', 'USD_SandP_Index_High_Grade', 'USD_SIBOR_Reference_Banks', 'USD_SIBOR_SIBO', 'USD_SIFMA_Municipal_Swap_Index', 'USD_SOFR', 'USD_SOFR_Average_180D', 'USD_SOFR_Average_30D', 'USD_SOFR_Average_90D', 'USD_SOFR_CME_Term', 'USD_SOFR_COMPOUND', 'USD_SOFR_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index_0_Floor', 'USD_SOFR_ICE_Compounded_Index_0_Floor_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_0_Floor_5D_Lag', 'USD_SOFR_ICE_Compounded_Index_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_5D_Lag', 'USD_SOFR_ICE_Swap_Rate', 'USD_SOFR_ICE_Swap_Rate_Spreads', 'USD_SOFR_ICE_Term', 'USD_SOFR_OIS_Compound', 'USD_Swap_Rate_BCMP1', 'USD_TBILL_Auction_High_Rate', 'USD_TBILL_H_15', 'USD_TBILL_H_15_Bloomberg', 'USD_TBILL_Secondary_Market', 'USD_TBILL_Secondary_Market_Bond_Equivalent_Yield', 'USD_TIBOR_ISDC', 'USD_TIBOR_Reference_Banks', 'USD_Treasury_19901_3_00_ICAP', 'USD_Treasury_Rate_BCMP1', 'USD_Treasury_Rate_ICAP_BrokerTec', 'USD_Treasury_Rate_SwapMarker100', 'USD_Treasury_Rate_SwapMarker99', 'USD_Treasury_Rate_T19901', 'USD_Treasury_Rate_T500', 'VND_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'VND_Semi_Annual_Swap_Rate_Reference_Banks', 'ZAR_DEPOSIT_Reference_Banks', 'ZAR_DEPOSIT_SAFEX', 'ZAR_JIBAR', 'ZAR_JIBAR_Reference_Banks', 'ZAR_JIBAR_SAFEX', 'ZAR_Prime_Average_1', 'ZAR_PRIME_AVERAGE', 'ZAR_PRIME_AVERAGE_Reference_Banks', 'ZAR_Quarterly_Swap_Rate_1_00_TRADITION', 'ZAR_Quarterly_Swap_Rate_5_30_TRADITION', 'ZAR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'ZAR_ZARONIA', 'ZAR_ZARONIA_OIS_Compound'))

UNION ALL

SELECT 'SwapCurveValuation' AS table_name, 'spread' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SwapCurveValuation" 
WHERE "SwapCurveValuation".spread IS NULL

UNION ALL

SELECT 'SwapCurveValuation' AS table_name, 'side' AS column_name, 'enum' AS constraint_type, id AS record_id, side AS invalid_value 
FROM "SwapCurveValuation" 
WHERE "SwapCurveValuation".side IS NOT NULL AND ("SwapCurveValuation".side NOT IN ('Afternoon', 'Ask', 'Bid', 'Closing', 'High', 'Index', 'MeanOfBidAndAsk', 'LocationalMarginal', 'Low', 'MarginalHourly', 'MarketClearing', 'MeanOfHighAndLow', 'Morning', 'Official', 'Opening', 'OSP', 'Settlement', 'Spot', 'Mid', 'NationalSingle', 'WeightedAverage', 'UnWeightedAverage'))

UNION ALL

SELECT 'ValuationDates' AS table_name, 'finalValuationDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ValuationDates" 
WHERE "ValuationDates"."finalValuationDate" IS NULL

UNION ALL

SELECT 'PerformanceValuationDates' AS table_name, 'determinationMethod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PerformanceValuationDates" 
WHERE "PerformanceValuationDates"."determinationMethod" IS NULL

UNION ALL

SELECT 'PerformanceValuationDates' AS table_name, 'determinationMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "determinationMethod" AS invalid_value 
FROM "PerformanceValuationDates" 
WHERE "PerformanceValuationDates"."determinationMethod" IS NOT NULL AND ("PerformanceValuationDates"."determinationMethod" NOT IN ('AgreedInitialPrice', 'AsSpecifiedInMasterConfirmation', 'CalculationAgent', 'ClosingPrice', 'DividendCurrency', 'ExpiringContractLevel', 'HedgeExecution', 'IssuerPaymentCurrency', 'NAV', 'OpenPrice', 'OSPPrice', 'SettlementCurrency', 'StrikeDateDetermination', 'TWAPPrice', 'TWAPVE', 'TWAPVEExcludingClose', 'ValuationTime', 'VWAPPrice', 'VWAPVE', 'VWAPVEExcludingClose'))

UNION ALL

SELECT 'PerformanceValuationDates' AS table_name, 'valuationTimeType' AS column_name, 'enum' AS constraint_type, id AS record_id, "valuationTimeType" AS invalid_value 
FROM "PerformanceValuationDates" 
WHERE "PerformanceValuationDates"."valuationTimeType" IS NOT NULL AND ("PerformanceValuationDates"."valuationTimeType" NOT IN ('Close', 'Open', 'OSP', 'SpecificTime', 'XETRA', 'DerivativesClose', 'AsSpecifiedInMasterConfirmation'))

UNION ALL

SELECT 'FxRateSourceFixing' AS table_name, 'settlementRateSource' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxRateSourceFixing" 
WHERE "FxRateSourceFixing"."settlementRateSource" IS NULL

UNION ALL

SELECT 'FxRateSourceFixing' AS table_name, 'fixingDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxRateSourceFixing" 
WHERE "FxRateSourceFixing"."fixingDate" IS NULL

UNION ALL

SELECT 'FxInformationSource' AS table_name, 'sourceProvider' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxInformationSource" 
WHERE "FxInformationSource"."sourceProvider" IS NULL

UNION ALL

SELECT 'FxInformationSource' AS table_name, 'sourceProvider' AS column_name, 'enum' AS constraint_type, id AS record_id, "sourceProvider" AS invalid_value 
FROM "FxInformationSource" 
WHERE "FxInformationSource"."sourceProvider" IS NOT NULL AND ("FxInformationSource"."sourceProvider" NOT IN ('AssocBanksSingapore', 'BancoCentralChile', 'BankOfCanada', 'BankOfEngland', 'BankOfJapan', 'Bloomberg', 'EuroCentralBank', 'FederalReserve', 'FHLBSF', 'ICESWAP', 'ISDA', 'Refinitiv', 'ReserveBankAustralia', 'ReserveBankNewZealand', 'Reuters', 'SAFEX', 'Telerate', 'TOKYOSWAP'))

UNION ALL

SELECT 'FallbackReferencePrice' AS table_name, 'fallBackSettlementRateOption' AS column_name, 'enum' AS constraint_type, id AS record_id, "fallBackSettlementRateOption" AS invalid_value 
FROM "FallbackReferencePrice" 
WHERE "FallbackReferencePrice"."fallBackSettlementRateOption" IS NOT NULL AND ("FallbackReferencePrice"."fallBackSettlementRateOption" NOT IN ('ARS_BNAR_ARS01', 'ARS_EMTA_INDICATIVE_SURVEY_RATE_ARS04', 'ARS_EMTA_INDUSTRY_SURVEY_RATE_ARS03', 'ARS_MAE_ARS05', 'ARS_OFFICIAL_RATE_ARS02', 'BRL_BRBY_BRL01', 'BRL_EMTA_INDICATIVE_SURVEY_RATE_BRL13', 'BRL_EMTA_INDUSTRY_SURVEY_RATE_BRL12', 'BRL_OFFICIAL_RATE_BRL02', 'BRL_PCOT_COMMERCIAL_BRL03', 'BRL_PCOT_FLOATING_BRL04', 'BRL_PTAX_BRL09', 'BRL_PTAX_COMMERCIAL_BRL05', 'BRL_PTAX_COMMERCIAL_BRFR_BRL06', 'BRL_PTAX_FLOATING_BRL07', 'BRL_PTAX_FLOATING_BRFR_BRL08', 'CLP_BCCH_CLP01', 'CLP_CHILD_INFORMAL_CLP02', 'CLP_CHILD_INTERBANK_CLP03', 'CLP_CHILD_OBSERVADO_CLP04', 'CLP_CHILG_INFORMAL_CLP05', 'CLP_CHILG_INTERBANK_CLP06', 'CLP_CHILG_OBSERVADO_CLP07', 'CLP_DOLAR_OBS_CLP10', 'CLP_EMTA_INDICATIVE_SURVEY_RATE_CLP11', 'CLP_OFFICIAL_RATE_CLP08', 'CLP_TELERATE_38942_CLP09', 'CNY_SAEC_CNY01', 'CNY_SFEMC_INDICATIVE_SURVEY_RATE_CNY02', 'COP_CO_COL03_COP01', 'COP_EMTA_INDICATIVE_SURVEY_RATE_COP03', 'COP_TRM_COP02', 'CURRENCY_IMPLIED_RATE__ADR__CURA1', 'CURRENCY_IMPLIED_RATE__LOCAL_ASSET__CURA2', 'CURRENCY_MUTUAL_AGREEMENT_CURA3', 'CURRENCY_REFERENCE_DEALERS_CURA4', 'CURRENCY_WHOLESALE_MARKET_CURA5', 'ECS_DNRP_ECS01', 'IDR_ABS_IDR01', 'IDR_JISDOR_IDR04', 'IDR_SFEMC_INDICATIVE_SURVEY_RATE_IDR02', 'IDR_VWAP_IDR03', 'ILS_BOIJ_ILS01', 'ILS_FXIL_ILS02', 'INR_FBIL_INR01', 'INR_RBIB_INR01', 'INR_SFEMC_INDICATIVE_SURVEY_RATE_INR02', 'KRW_KEBEY_KRW01', 'KRW_KFTC18_KRW02', 'KRW_SFEMC_INDICATIVE_SURVEY_RATE_KRW04', 'KRW_TELERATE_45644_KRW03', 'KZT_EMTA_INDICATIVE_SURVEY_RATE_KZT02', 'KZT_KASE_KZT01', 'LBP_BDLX_LBP01', 'MAD_OFFICIAL_RATE_MAD01', 'MXP_BNMX_MXP01', 'MXP_FIXING_RATE_MXP02', 'MXP_MEX01_MXP03', 'MXP_PUBLISHED_MXP04', 'MYR_ABS_MYR01', 'MYR_KL_REF_MYR04', 'MYR_PPKM_MYR03', 'MYR_SFEMC_INDICATIVE_SURVEY_RATE_MYR02', 'PEN_EMTA_INDICATIVE_SURVEY_RATE_PEN04', 'PEN_INTERBANK_AVE_PEN05', 'PEN_PDSB_PEN01', 'PEN_WT_AVE_PEN03', 'PHP_BAPPESO_PHP06', 'PHP_PDSPESO_PHP06', 'PHP_PHPESO_PHP01', 'PHP_SFEMC_INDICATIVE_SURVEY_RATE_PHP05', 'PHP_TELERATE_15439_PHP03', 'PHP_TELERATE_2920_PHP02', 'PKR_SBPK_PKR01', 'PKR_SFEMC_INDICATIVE_SURVEY_RATE_PKR02', 'PLZ_NBPQ_PLZ01', 'PLZ_NBPR_PLZ02', 'RUB_CME_EMTA_RUB03', 'RUB_EMTA_INDICATIVE_SURVEY_RATE_RUB04', 'RUB_MICEXFRX_RUB01', 'RUB_MMVB_RUB02', 'SGD_VWAP_SGD3', 'SKK_NBSB_SKK01', 'THB_ABS_THB01', 'THB_VWAP_THB01', 'TWD_SFEMC_INDICATIVE_SURVEY_RATE_TWD04', 'TWD_TAIFX1_TWD03', 'TWD_TELERATE_6161_TWD01', 'TWD_TFEMA_TWD02', 'UAH_EMTA_INDICATIVE_SURVEY_RATE_UAH03', 'UAH_EMTA_INDUSTRY_SURVEY_RATE_UAH02', 'UAH_GFI_UAH01', 'VEF_FIX_VEF01', 'VND_ABS_VND01', 'VND_FX_VND02', 'VND_SFEMC_INDICATIVE_SURVEY_RATE_VND03'))

UNION ALL

SELECT 'ValuationPostponement' AS table_name, 'maximumDaysOfPostponement' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ValuationPostponement" 
WHERE "ValuationPostponement"."maximumDaysOfPostponement" IS NULL

UNION ALL

SELECT 'FxRate' AS table_name, 'quotedCurrencyPair' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxRate" 
WHERE "FxRate"."quotedCurrencyPair" IS NULL

UNION ALL

SELECT 'FxSpotRateSource' AS table_name, 'primarySource' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxSpotRateSource" 
WHERE "FxSpotRateSource"."primarySource" IS NULL

UNION ALL

SELECT 'CreditNotation' AS table_name, 'agency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditNotation" 
WHERE "CreditNotation".agency IS NULL

UNION ALL

SELECT 'CreditNotation' AS table_name, 'agency' AS column_name, 'enum' AS constraint_type, id AS record_id, agency AS invalid_value 
FROM "CreditNotation" 
WHERE "CreditNotation".agency IS NOT NULL AND ("CreditNotation".agency NOT IN ('AMBest', 'CBRS', 'DBRS', 'Fitch', 'Japanagency', 'Moodys', 'RatingAndInvestmentInformation', 'StandardAndPoors'))

UNION ALL

SELECT 'CreditNotation' AS table_name, 'notation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditNotation" 
WHERE "CreditNotation".notation IS NULL

UNION ALL

SELECT 'CreditNotation' AS table_name, 'outlook' AS column_name, 'enum' AS constraint_type, id AS record_id, outlook AS invalid_value 
FROM "CreditNotation" 
WHERE "CreditNotation".outlook IS NOT NULL AND ("CreditNotation".outlook NOT IN ('Positive', 'Negative', 'Stable', 'Developing'))

UNION ALL

SELECT 'CreditNotation' AS table_name, 'creditWatch' AS column_name, 'enum' AS constraint_type, id AS record_id, "creditWatch" AS invalid_value 
FROM "CreditNotation" 
WHERE "CreditNotation"."creditWatch" IS NOT NULL AND ("CreditNotation"."creditWatch" NOT IN ('Positive', 'Negative', 'Developing'))

UNION ALL

SELECT 'MultipleCreditNotations' AS table_name, 'condition' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MultipleCreditNotations" 
WHERE "MultipleCreditNotations".condition IS NULL

UNION ALL

SELECT 'MultipleCreditNotations' AS table_name, 'condition' AS column_name, 'enum' AS constraint_type, id AS record_id, condition AS invalid_value 
FROM "MultipleCreditNotations" 
WHERE "MultipleCreditNotations".condition IS NOT NULL AND ("MultipleCreditNotations".condition NOT IN ('All', 'Any'))

UNION ALL

SELECT 'MultipleCreditNotations' AS table_name, 'creditNotation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MultipleCreditNotations" 
WHERE "MultipleCreditNotations"."creditNotation" IS NULL

UNION ALL

SELECT 'MultipleCreditNotations' AS table_name, 'mismatchResolution' AS column_name, 'enum' AS constraint_type, id AS record_id, "mismatchResolution" AS invalid_value 
FROM "MultipleCreditNotations" 
WHERE "MultipleCreditNotations"."mismatchResolution" IS NOT NULL AND ("MultipleCreditNotations"."mismatchResolution" NOT IN ('Lowest', 'Highest', 'ReferenceAgency', 'Average', 'SecondBest', 'Other'))

UNION ALL

SELECT 'MultipleCreditNotations' AS table_name, 'referenceAgency' AS column_name, 'enum' AS constraint_type, id AS record_id, "referenceAgency" AS invalid_value 
FROM "MultipleCreditNotations" 
WHERE "MultipleCreditNotations"."referenceAgency" IS NOT NULL AND ("MultipleCreditNotations"."referenceAgency" NOT IN ('AMBest', 'CBRS', 'DBRS', 'Fitch', 'Japanagency', 'Moodys', 'RatingAndInvestmentInformation', 'StandardAndPoors'))

UNION ALL

SELECT 'MultipleDebtTypes' AS table_name, 'condition' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MultipleDebtTypes" 
WHERE "MultipleDebtTypes".condition IS NULL

UNION ALL

SELECT 'MultipleDebtTypes' AS table_name, 'condition' AS column_name, 'enum' AS constraint_type, id AS record_id, condition AS invalid_value 
FROM "MultipleDebtTypes" 
WHERE "MultipleDebtTypes".condition IS NOT NULL AND ("MultipleDebtTypes".condition NOT IN ('All', 'Any'))

UNION ALL

SELECT 'MultipleDebtTypes' AS table_name, 'debtType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MultipleDebtTypes" 
WHERE "MultipleDebtTypes"."debtType" IS NULL

UNION ALL

SELECT 'CalculationAgent' AS table_name, 'calculationAgentParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "calculationAgentParty" AS invalid_value 
FROM "CalculationAgent" 
WHERE "CalculationAgent"."calculationAgentParty" IS NOT NULL AND ("CalculationAgent"."calculationAgentParty" NOT IN ('DisruptionEventsDeterminingParty', 'ExtraordinaryDividendsParty', 'PredeterminedClearingOrganizationParty', 'ExerciseNoticeReceiverPartyManual', 'ExerciseNoticeReceiverPartyOptionalEarlyTermination', 'ExerciseNoticeReceiverPartyCancelableProvision', 'ExerciseNoticeReceiverPartyExtendibleProvision', 'CalculationAgentIndependent', 'CalculationAgentOptionalEarlyTermination', 'CalculationAgentMandatoryEarlyTermination', 'CalculationAgentFallback'))

UNION ALL

SELECT 'CalculationAgent' AS table_name, 'calculationAgentPartyEnum' AS column_name, 'enum' AS constraint_type, id AS record_id, "calculationAgentPartyEnum" AS invalid_value 
FROM "CalculationAgent" 
WHERE "CalculationAgent"."calculationAgentPartyEnum" IS NOT NULL AND ("CalculationAgent"."calculationAgentPartyEnum" NOT IN ('ExercisingParty', 'NonExercisingParty', 'AsSpecifiedInMasterAgreement', 'AsSpecifiedInStandardTermsSupplement', 'Both'))

UNION ALL

SELECT 'SettlementRateOption' AS table_name, 'settlementRateOption' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SettlementRateOption" 
WHERE "SettlementRateOption"."settlementRateOption" IS NULL

UNION ALL

SELECT 'SettlementRateOption' AS table_name, 'settlementRateOption' AS column_name, 'enum' AS constraint_type, id AS record_id, "settlementRateOption" AS invalid_value 
FROM "SettlementRateOption" 
WHERE "SettlementRateOption"."settlementRateOption" IS NOT NULL AND ("SettlementRateOption"."settlementRateOption" NOT IN ('ARS_BNAR_ARS01', 'ARS_EMTA_INDICATIVE_SURVEY_RATE_ARS04', 'ARS_EMTA_INDUSTRY_SURVEY_RATE_ARS03', 'ARS_MAE_ARS05', 'ARS_OFFICIAL_RATE_ARS02', 'BRL_BRBY_BRL01', 'BRL_EMTA_INDICATIVE_SURVEY_RATE_BRL13', 'BRL_EMTA_INDUSTRY_SURVEY_RATE_BRL12', 'BRL_OFFICIAL_RATE_BRL02', 'BRL_PCOT_COMMERCIAL_BRL03', 'BRL_PCOT_FLOATING_BRL04', 'BRL_PTAX_BRL09', 'BRL_PTAX_COMMERCIAL_BRL05', 'BRL_PTAX_COMMERCIAL_BRFR_BRL06', 'BRL_PTAX_FLOATING_BRL07', 'BRL_PTAX_FLOATING_BRFR_BRL08', 'CLP_BCCH_CLP01', 'CLP_CHILD_INFORMAL_CLP02', 'CLP_CHILD_INTERBANK_CLP03', 'CLP_CHILD_OBSERVADO_CLP04', 'CLP_CHILG_INFORMAL_CLP05', 'CLP_CHILG_INTERBANK_CLP06', 'CLP_CHILG_OBSERVADO_CLP07', 'CLP_DOLAR_OBS_CLP10', 'CLP_EMTA_INDICATIVE_SURVEY_RATE_CLP11', 'CLP_OFFICIAL_RATE_CLP08', 'CLP_TELERATE_38942_CLP09', 'CNY_SAEC_CNY01', 'CNY_SFEMC_INDICATIVE_SURVEY_RATE_CNY02', 'COP_CO_COL03_COP01', 'COP_EMTA_INDICATIVE_SURVEY_RATE_COP03', 'COP_TRM_COP02', 'CURRENCY_IMPLIED_RATE__ADR__CURA1', 'CURRENCY_IMPLIED_RATE__LOCAL_ASSET__CURA2', 'CURRENCY_MUTUAL_AGREEMENT_CURA3', 'CURRENCY_REFERENCE_DEALERS_CURA4', 'CURRENCY_WHOLESALE_MARKET_CURA5', 'ECS_DNRP_ECS01', 'IDR_ABS_IDR01', 'IDR_JISDOR_IDR04', 'IDR_SFEMC_INDICATIVE_SURVEY_RATE_IDR02', 'IDR_VWAP_IDR03', 'ILS_BOIJ_ILS01', 'ILS_FXIL_ILS02', 'INR_FBIL_INR01', 'INR_RBIB_INR01', 'INR_SFEMC_INDICATIVE_SURVEY_RATE_INR02', 'KRW_KEBEY_KRW01', 'KRW_KFTC18_KRW02', 'KRW_SFEMC_INDICATIVE_SURVEY_RATE_KRW04', 'KRW_TELERATE_45644_KRW03', 'KZT_EMTA_INDICATIVE_SURVEY_RATE_KZT02', 'KZT_KASE_KZT01', 'LBP_BDLX_LBP01', 'MAD_OFFICIAL_RATE_MAD01', 'MXP_BNMX_MXP01', 'MXP_FIXING_RATE_MXP02', 'MXP_MEX01_MXP03', 'MXP_PUBLISHED_MXP04', 'MYR_ABS_MYR01', 'MYR_KL_REF_MYR04', 'MYR_PPKM_MYR03', 'MYR_SFEMC_INDICATIVE_SURVEY_RATE_MYR02', 'PEN_EMTA_INDICATIVE_SURVEY_RATE_PEN04', 'PEN_INTERBANK_AVE_PEN05', 'PEN_PDSB_PEN01', 'PEN_WT_AVE_PEN03', 'PHP_BAPPESO_PHP06', 'PHP_PDSPESO_PHP06', 'PHP_PHPESO_PHP01', 'PHP_SFEMC_INDICATIVE_SURVEY_RATE_PHP05', 'PHP_TELERATE_15439_PHP03', 'PHP_TELERATE_2920_PHP02', 'PKR_SBPK_PKR01', 'PKR_SFEMC_INDICATIVE_SURVEY_RATE_PKR02', 'PLZ_NBPQ_PLZ01', 'PLZ_NBPR_PLZ02', 'RUB_CME_EMTA_RUB03', 'RUB_EMTA_INDICATIVE_SURVEY_RATE_RUB04', 'RUB_MICEXFRX_RUB01', 'RUB_MMVB_RUB02', 'SGD_VWAP_SGD3', 'SKK_NBSB_SKK01', 'THB_ABS_THB01', 'THB_VWAP_THB01', 'TWD_SFEMC_INDICATIVE_SURVEY_RATE_TWD04', 'TWD_TAIFX1_TWD03', 'TWD_TELERATE_6161_TWD01', 'TWD_TFEMA_TWD02', 'UAH_EMTA_INDICATIVE_SURVEY_RATE_UAH03', 'UAH_EMTA_INDUSTRY_SURVEY_RATE_UAH02', 'UAH_GFI_UAH01', 'VEF_FIX_VEF01', 'VND_ABS_VND01', 'VND_FX_VND02', 'VND_SFEMC_INDICATIVE_SURVEY_RATE_VND03'))

UNION ALL

SELECT 'PriceSourceDisruption' AS table_name, 'fallbackReferencePrice' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PriceSourceDisruption" 
WHERE "PriceSourceDisruption"."fallbackReferencePrice" IS NULL

UNION ALL

SELECT 'ValuationMethod' AS table_name, 'valuationSource' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ValuationMethod" 
WHERE "ValuationMethod"."valuationSource" IS NULL

UNION ALL

SELECT 'ValuationMethod' AS table_name, 'quotationMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "quotationMethod" AS invalid_value 
FROM "ValuationMethod" 
WHERE "ValuationMethod"."quotationMethod" IS NOT NULL AND ("ValuationMethod"."quotationMethod" NOT IN ('Bid', 'Ask', 'Mid', 'ExercisingPartyPays'))

UNION ALL

SELECT 'ValuationMethod' AS table_name, 'valuationMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "valuationMethod" AS invalid_value 
FROM "ValuationMethod" 
WHERE "ValuationMethod"."valuationMethod" IS NOT NULL AND ("ValuationMethod"."valuationMethod" NOT IN ('Market', 'Highest', 'AverageMarket', 'AverageHighest', 'BlendedMarket', 'BlendedHighest', 'AverageBlendedMarket', 'AverageBlendedHighest'))

UNION ALL

SELECT 'CashCollateralValuationMethod' AS table_name, 'applicableCsa' AS column_name, 'enum' AS constraint_type, id AS record_id, "applicableCsa" AS invalid_value 
FROM "CashCollateralValuationMethod" 
WHERE "CashCollateralValuationMethod"."applicableCsa" IS NOT NULL AND ("CashCollateralValuationMethod"."applicableCsa" NOT IN ('NoCSA', 'ExistingCSA', 'ReferenceVMCSA'))

UNION ALL

SELECT 'CashCollateralValuationMethod' AS table_name, 'protectedParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "protectedParty" AS invalid_value 
FROM "CashCollateralValuationMethod" 
WHERE "CashCollateralValuationMethod"."protectedParty" IS NOT NULL AND ("CashCollateralValuationMethod"."protectedParty" NOT IN ('ExercisingParty', 'NonExercisingParty', 'AsSpecifiedInMasterAgreement', 'AsSpecifiedInStandardTermsSupplement', 'Both'))

UNION ALL

SELECT 'FloatingRateCalculationParameters' AS table_name, 'calculationMethod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingRateCalculationParameters" 
WHERE "FloatingRateCalculationParameters"."calculationMethod" IS NULL

UNION ALL

SELECT 'FloatingRateCalculationParameters' AS table_name, 'calculationMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "calculationMethod" AS invalid_value 
FROM "FloatingRateCalculationParameters" 
WHERE "FloatingRateCalculationParameters"."calculationMethod" IS NOT NULL AND ("FloatingRateCalculationParameters"."calculationMethod" NOT IN ('Averaging', 'Compounding', 'CompoundedIndex'))

UNION ALL

SELECT 'FallbackRateParameters' AS table_name, 'floatingRateIndex' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FallbackRateParameters" 
WHERE "FallbackRateParameters"."floatingRateIndex" IS NULL

UNION ALL

SELECT 'FallbackRateParameters' AS table_name, 'floatingRateIndex' AS column_name, 'enum' AS constraint_type, id AS record_id, "floatingRateIndex" AS invalid_value 
FROM "FallbackRateParameters" 
WHERE "FallbackRateParameters"."floatingRateIndex" IS NOT NULL AND ("FallbackRateParameters"."floatingRateIndex" NOT IN ('AED_EBOR_Reuters', 'AED_EIBOR', 'AUD_AONIA', 'AUD_AONIA_OIS_Compound_1', 'AUD_AONIA_OIS_COMPOUND', 'AUD_AONIA_OIS_COMPOUND_SwapMarker', 'AUD_BBR_AUBBSW', 'AUD_BBR_BBSW', 'AUD_BBR_BBSW_Bloomberg', 'AUD_BBR_BBSY__BID_', 'AUD_BBR_ISDC', 'AUD_BBSW', 'AUD_BBSW_Quarterly_Swap_Rate_ICAP', 'AUD_BBSW_Semi_Annual_Swap_Rate_ICAP', 'AUD_BBSY_Bid', 'AUD_LIBOR_BBA', 'AUD_LIBOR_BBA_Bloomberg', 'AUD_LIBOR_Reference_Banks', 'AUD_Quarterly_Swap_Rate_ICAP', 'AUD_Quarterly_Swap_Rate_ICAP_Reference_Banks', 'AUD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'AUD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'AUD_Semi_annual_Swap_Rate_ICAP', 'AUD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'AUD_Swap_Rate_Reuters', 'BRL_CDI', 'CAD_BA_CDOR', 'CAD_BA_CDOR_Bloomberg', 'CAD_BA_ISDD', 'CAD_BA_Reference_Banks', 'CAD_BA_Reuters', 'CAD_BA_Telerate', 'CAD_CDOR', 'CAD_CORRA', 'CAD_CORRA_CanDeal_TMX_Term', 'CAD_CORRA_Compounded_Index', 'CAD_CORRA_OIS_Compound_1', 'CAD_CORRA_OIS_COMPOUND', 'CAD_ISDA_Swap_Rate', 'CAD_LIBOR_BBA', 'CAD_LIBOR_BBA_Bloomberg', 'CAD_LIBOR_BBA_SwapMarker', 'CAD_LIBOR_Reference_Banks', 'CAD_REPO_CORRA', 'CAD_TBILL_ISDD', 'CAD_TBILL_Reference_Banks', 'CAD_TBILL_Reuters', 'CAD_TBILL_Telerate', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_6M_LIBORSWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_Annual_Swap_Rate', 'CHF_Annual_Swap_Rate_11_00_ICAP', 'CHF_Annual_Swap_Rate_Reference_Banks', 'CHF_Basis_Swap_3m_vs_6m_LIBOR_11_00_ICAP', 'CHF_ISDAFIX_Swap_Rate', 'CHF_LIBOR', 'CHF_LIBOR_BBA', 'CHF_LIBOR_BBA_Bloomberg', 'CHF_LIBOR_ISDA', 'CHF_LIBOR_Reference_Banks', 'CHF_OIS_11_00_ICAP', 'CHF_SARON', 'CHF_SARON_Average_12M', 'CHF_SARON_Average_1M', 'CHF_SARON_Average_1W', 'CHF_SARON_Average_2M', 'CHF_SARON_Average_3M', 'CHF_SARON_Average_6M', 'CHF_SARON_Average_9M', 'CHF_SARON_Compounded_Index', 'CHF_SARON_OIS_Compound_1', 'CHF_SARON_OIS_COMPOUND', 'CHF_TOIS_OIS_COMPOUND', 'CHF_USD_Basis_Swaps_11_00_ICAP', 'CL_CLICP_Bloomberg', 'CLP_ICP', 'CLP_TNA', 'CNH_HIBOR', 'CNH_HIBOR_Reference_Banks', 'CNH_HIBOR_TMA', 'CNY_7_Repo_Compounding_Date', 'CNY_CNREPOFIX_CFXS_Reuters', 'CNY_Deposit_Rate', 'CNY_Fixing_Repo_Rate', 'CNY_LPR', 'CNY_PBOCB_Reuters', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION_Reference_Banks', 'CNY_Quarterly_7D_Repo_NDS_Rate_Tradition', 'CNY_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'CNY_Semi_Annual_Swap_Rate_Reference_Banks', 'CNY_SHIBOR', 'CNY_SHIBOR_OIS_Compound', 'CNY_Shibor_OIS_Compounding', 'CNY_SHIBOR_Reuters', 'COP_IBR_OIS_Compound_1', 'COP_IBR_OIS_COMPOUND', 'CZK_Annual_Swap_Rate_11_00_BGCANTOR', 'CZK_Annual_Swap_Rate_Reference_Banks', 'CZK_CZEONIA', 'CZK_CZEONIA_OIS_Compound', 'CZK_PRIBOR', 'CZK_PRIBOR_PRBO', 'CZK_PRIBOR_Reference_Banks', 'DKK_CIBOR', 'DKK_CIBOR2', 'DKK_CIBOR2_Bloomberg', 'DKK_CIBOR2_DKNA13', 'DKK_CIBOR_DKNA13', 'DKK_CIBOR_DKNA13_Bloomberg', 'DKK_CIBOR_Reference_Banks', 'DKK_CITA', 'DKK_CITA_DKNA14_COMPOUND', 'DKK_DESTR', 'DKK_DESTR_Compounded_Index', 'DKK_DESTR_OIS_Compound', 'DKK_DKKOIS_OIS_COMPOUND', 'DKK_Tom_Next_OIS_Compound', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_Annual_Swap_Rate_10_00', 'EUR_Annual_Swap_Rate_10_00_BGCANTOR', 'EUR_Annual_Swap_Rate_10_00_Bloomberg', 'EUR_Annual_Swap_Rate_10_00_ICAP', 'EUR_Annual_Swap_Rate_10_00_SwapMarker', 'EUR_Annual_Swap_Rate_10_00_TRADITION', 'EUR_Annual_Swap_Rate_11_00', 'EUR_Annual_Swap_Rate_11_00_Bloomberg', 'EUR_Annual_Swap_Rate_11_00_ICAP', 'EUR_Annual_Swap_Rate_11_00_SwapMarker', 'EUR_Annual_Swap_Rate_3_Month', 'EUR_Annual_Swap_Rate_3_Month_SwapMarker', 'EUR_Annual_Swap_Rate_4_15_TRADITION', 'EUR_Annual_Swap_Rate_Reference_Banks', 'EUR_Basis_Swap_EONIA_vs_3m_EUR_IBOR_Swap_Rates_A_360_10_00_ICAP', 'EUR_CNO_TEC10', 'EUR_EONIA', 'EUR_EONIA_AVERAGE_1', 'EUR_EONIA_Average', 'EUR_EONIA_OIS_10_00_BGCANTOR', 'EUR_EONIA_OIS_10_00_ICAP', 'EUR_EONIA_OIS_10_00_TRADITION', 'EUR_EONIA_OIS_11_00_ICAP', 'EUR_EONIA_OIS_4_15_TRADITION', 'EUR_EONIA_OIS_Compound_1', 'EUR_EONIA_OIS_COMPOUND', 'EUR_EONIA_OIS_COMPOUND_Bloomberg', 'EUR_EONIA_Swap_Index', 'EUR_EURIBOR', 'EUR_EURIBOR_Act_365', 'EUR_EURIBOR_Act_365_Bloomberg', 'EUR_EURIBOR_Annual_Bond_Swap_vs_1m_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_1m_vs_3m_Euribor_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_3m_vs_6m_11_00_ICAP', 'EUR_EURIBOR_ICE_Swap_Rate_11_00', 'EUR_EURIBOR_ICE_Swap_Rate_12_00', 'EUR_EURIBOR_Reference_Banks', 'EUR_EURIBOR_Reuters', 'EUR_EURIBOR_Telerate', 'EUR_EURONIA_OIS_Compound_1', 'EUR_EURONIA_OIS_COMPOUND', 'EUR_EuroSTR', 'EUR_EuroSTR_Average_12M', 'EUR_EuroSTR_Average_1M', 'EUR_EuroSTR_Average_1W', 'EUR_EuroSTR_Average_3M', 'EUR_EuroSTR_Average_6M', 'EUR_EuroSTR_COMPOUND', 'EUR_EuroSTR_Compounded_Index', 'EUR_EuroSTR_FTSE_Term', 'EUR_EuroSTR_ICE_Compounded_Index', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_5D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_5D_Lag', 'EUR_EuroSTR_ICE_Swap_Rate', 'EUR_EuroSTR_OIS_Compound', 'EUR_EuroSTR_Term', 'EUR_ISDA_EURIBOR_Swap_Rate_11_00', 'EUR_ISDA_EURIBOR_Swap_Rate_12_00', 'EUR_ISDA_LIBOR_Swap_Rate_10_00', 'EUR_ISDA_LIBOR_Swap_Rate_11_00', 'EUR_LIBOR', 'EUR_LIBOR_BBA', 'EUR_LIBOR_BBA_Bloomberg', 'EUR_LIBOR_Reference_Banks', 'EUR_TAM_CDC', 'EUR_TEC10_CNO', 'EUR_TEC10_CNO_SwapMarker', 'EUR_TEC10_Reference_Banks', 'EUR_TEC5_CNO', 'EUR_TEC5_CNO_SwapMarker', 'EUR_TEC5_Reference_Banks', 'EUR_TMM_CDC_COMPOUND', 'EUR_USD_Basis_Swaps_11_00_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'GBP_ISDA_Swap_Rate', 'GBP_LIBOR', 'GBP_LIBOR_BBA', 'GBP_LIBOR_BBA_Bloomberg', 'GBP_LIBOR_ICE_Swap_Rate', 'GBP_LIBOR_ISDA', 'GBP_LIBOR_Reference_Banks', 'GBP_RONIA', 'GBP_RONIA_OIS_Compound', 'GBP_Semi_Annual_Swap_Rate', 'GBP_Semi_Annual_Swap_Rate_11_00_ICAP', 'GBP_Semi_Annual_Swap_Rate_11_00_TRADITION', 'GBP_Semi_Annual_Swap_Rate_4_15_TRADITION', 'GBP_Semi_Annual_Swap_Rate_Reference_Banks', 'GBP_Semi_Annual_Swap_Rate_SwapMarker26', 'GBP_SONIA', 'GBP_SONIA_COMPOUND', 'GBP_SONIA_Compounded_Index', 'GBP_SONIA_FTSE_Term', 'GBP_SONIA_ICE_Compounded_Index', 'GBP_SONIA_ICE_Compounded_Index_0_Floor', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_5D_Lag', 'GBP_SONIA_ICE_Compounded_Index_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_5D_Lag', 'GBP_SONIA_ICE_Swap_Rate', 'GBP_SONIA_ICE_Term', 'GBP_SONIA_OIS_11_00_ICAP', 'GBP_SONIA_OIS_11_00_TRADITION', 'GBP_SONIA_OIS_4_15_TRADITION', 'GBP_SONIA_OIS_Compound', 'GBP_SONIA_Swap_Rate', 'GBP_UK_Base_Rate', 'GBP_USD_Basis_Swaps_11_00_ICAP', 'GBP_WMBA_RONIA_COMPOUND', 'GBP_WMBA_SONIA_COMPOUND', 'GRD_ATHIBOR_ATHIBOR', 'GRD_ATHIBOR_Reference_Banks', 'GRD_ATHIBOR_Telerate', 'GRD_ATHIMID_Reference_Banks', 'GRD_ATHIMID_Reuters', 'HKD_HIBOR', 'HKD_HIBOR_HIBOR_', 'HKD_HIBOR_HIBOR_Bloomberg', 'HKD_HIBOR_HKAB', 'HKD_HIBOR_HKAB_Bloomberg', 'HKD_HIBOR_ISDC', 'HKD_HIBOR_Reference_Banks', 'HKD_HONIA', 'HKD_HONIA_OIS_Compound', 'HKD_HONIX_OIS_COMPOUND', 'HKD_ISDA_Swap_Rate_11_00', 'HKD_ISDA_Swap_Rate_4_00', 'HKD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_11_00_TRADITION', 'HKD_Quarterly_Annual_Swap_Rate_4_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'HKD_Quarterly_Quarterly_Swap_Rate_11_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_4_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_Reference_Banks', 'HUF_BUBOR', 'HUF_BUBOR_Reference_Banks', 'HUF_BUBOR_Reuters', 'HUF_HUFONIA', 'HUF_HUFONIA_OIS_Compound', 'IDR_IDMA_Bloomberg', 'IDR_IDRFIX', 'IDR_INDONIA', 'IDR_INDONIA_OIS_Compound', 'IDR_JIBOR', 'IDR_JIBOR_Reuters', 'IDR_SBI_Reuters', 'IDR_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'IDR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'IDR_Semi_Annual_Swap_Rate_Reference_Banks', 'IDR_SOR_Reference_Banks', 'IDR_SOR_Reuters', 'IDR_SOR_Telerate', 'ILS_SHIR', 'ILS_SHIR_OIS_Compound', 'ILS_TELBOR', 'ILS_TELBOR01_Reuters', 'ILS_TELBOR_Reference_Banks', 'INR_BMK', 'INR_CMT', 'INR_FBIL_MIBOR_OIS_COMPOUND', 'INR_INBMK_REUTERS', 'INR_MIBOR', 'INR_MIBOR_OIS', 'INR_MIBOR_OIS_Compound_1', 'INR_MIBOR_OIS_COMPOUND', 'INR_MIFOR', 'INR_MIOIS', 'INR_MITOR_OIS_COMPOUND', 'INR_Modified_MIFOR', 'INR_Reference_Banks', 'INR_Semi_Annual_Swap_Rate_11_30_BGCANTOR', 'INR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'INR_Semi_Annual_Swap_Rate_Reference_Banks', 'INR_SORR', 'INR_SORR_OIS_Compound', 'ISK_REIBOR', 'ISK_REIBOR_Reference_Banks', 'ISK_REIBOR_Reuters', 'JPY_Annual_Swap_Rate_11_00_TRADITION', 'JPY_Annual_Swap_Rate_3_00_TRADITION', 'JPY_BBSF_Bloomberg_10_00', 'JPY_BBSF_Bloomberg_15_00', 'JPY_Euroyen_TIBOR', 'JPY_ISDA_Swap_Rate_10_00', 'JPY_ISDA_Swap_Rate_15_00', 'JPY_LIBOR', 'JPY_LIBOR_BBA', 'JPY_LIBOR_BBA_Bloomberg', 'JPY_LIBOR_FRASETT', 'JPY_LIBOR_ISDA', 'JPY_LIBOR_Reference_Banks', 'JPY_LIBOR_TSR_10_00', 'JPY_LIBOR_TSR_15_00', 'JPY_LTPR_MHBK', 'JPY_LTPR_MHCB', 'JPY_LTPR_TBC', 'JPY_MUTANCALL_TONAR', 'JPY_OIS_11_00_ICAP', 'JPY_OIS_11_00_TRADITION', 'JPY_OIS_3_00_TRADITION', 'JPY_Quoting_Banks_LIBOR', 'JPY_STPR_Quoting_Banks', 'JPY_TIBOR', 'JPY_TIBOR_17096', 'JPY_TIBOR_17097', 'JPY_TIBOR_DTIBOR01', 'JPY_TIBOR_TIBM', 'JPY_TIBOR_TIBM__10_Banks_', 'JPY_TIBOR_TIBM__5_Banks_', 'JPY_TIBOR_TIBM__All_Banks_', 'JPY_TIBOR_TIBM__All_Banks__Bloomberg', 'JPY_TIBOR_TIBM_Reference_Banks', 'JPY_TIBOR_ZTIBOR', 'JPY_TONA', 'JPY_TONA_Average_180D', 'JPY_TONA_Average_30D', 'JPY_TONA_Average_90D', 'JPY_TONA_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index_0_Floor', 'JPY_TONA_ICE_Compounded_Index_0_Floor_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_0_Floor_5D_Lag', 'JPY_TONA_ICE_Compounded_Index_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_5D_Lag', 'JPY_TONA_OIS_Compound_1', 'JPY_TONA_OIS_COMPOUND', 'JPY_TONA_TSR_10_00', 'JPY_TONA_TSR_15_00', 'JPY_TORF_QUICK', 'JPY_TSR_Reference_Banks', 'JPY_TSR_Reuters_10_00', 'JPY_TSR_Reuters_15_00', 'JPY_TSR_Telerate_10_00', 'JPY_TSR_Telerate_15_00', 'JPY_USD_Basis_Swaps_11_00_ICAP', 'KRW_Bond_3222', 'KRW_CD_3220', 'KRW_CD_91D', 'KRW_CD_KSDA_Bloomberg', 'KRW_KOFR', 'KRW_KOFR_OIS_Compound', 'KRW_Quarterly_Annual_Swap_Rate_3_30_ICAP', 'MXN_TIIE', 'MXN_TIIE_Banxico', 'MXN_TIIE_Banxico_Bloomberg', 'MXN_TIIE_Banxico_Reference_Banks', 'MXN_TIIE_ON', 'MXN_TIIE_ON_OIS_Compound', 'MXN_TIIE_Reference_Banks', 'MYR_KLIBOR', 'MYR_KLIBOR_BNM', 'MYR_KLIBOR_Reference_Banks', 'MYR_MYOR', 'MYR_MYOR_OIS_Compound', 'MYR_Quarterly_Swap_Rate_11_00_TRADITION', 'MYR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'NOK_NIBOR', 'NOK_NIBOR_NIBR', 'NOK_NIBOR_NIBR_Bloomberg', 'NOK_NIBOR_NIBR_Reference_Banks', 'NOK_NIBOR_OIBOR', 'NOK_NIBOR_Reference_Banks', 'NOK_NOWA', 'NOK_NOWA_OIS_Compound', 'NZD_BBR_BID', 'NZD_BBR_FRA', 'NZD_BBR_ISDC', 'NZD_BBR_Reference_Banks', 'NZD_BBR_Telerate', 'NZD_BKBM_Bid', 'NZD_BKBM_FRA', 'NZD_BKBM_FRA_Swap_Rate_ICAP', 'NZD_NZIONA', 'NZD_NZIONA_OIS_Compound_1', 'NZD_NZIONA_OIS_COMPOUND', 'NZD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'NZD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'NZD_Swap_Rate_ICAP', 'NZD_Swap_Rate_ICAP_Reference_Banks', 'PHP_ORR', 'PHP_PHIREF', 'PHP_PHIREF_BAP', 'PHP_PHIREF_Bloomberg', 'PHP_PHIREF_Reference_Banks', 'PHP_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'PHP_Semi_Annual_Swap_Rate_Reference_Banks', 'PLN_POLONIA', 'PLN_POLONIA_OIS_Compound_1', 'PLN_POLONIA_OIS_COMPOUND', 'PLN_POLSTR', 'PLN_POLSTR_OIS_Compound', 'PLN_WIBID', 'PLN_WIBOR', 'PLN_WIBOR_Reference_Banks', 'PLN_WIBOR_WIBO', 'PLN_WIRON', 'PLN_WIRON_OIS_Compound', 'PLZ_WIBOR_Reference_Banks', 'PLZ_WIBOR_WIBO', 'REPOFUNDS_RATE_FRANCE_OIS_COMPOUND', 'REPOFUNDS_RATE_GERMANY_OIS_COMPOUND', 'REPOFUNDS_RATE_ITALY_OIS_COMPOUND', 'RON_Annual_Swap_Rate_11_00_BGCANTOR', 'RON_Annual_Swap_Rate_Reference_Banks', 'RON_RBOR_Reuters', 'RON_ROBID', 'RON_ROBOR', 'RUB_Annual_Swap_Rate_11_00_BGCANTOR', 'RUB_Annual_Swap_Rate_12_45_TRADITION', 'RUB_Annual_Swap_Rate_4_15_TRADITION', 'RUB_Annual_Swap_Rate_Reference_Banks', 'RUB_Annual_Swap_Rate_TRADITION_Reference_Banks', 'RUB_Key_Rate_CBRF', 'RUB_MosPrime', 'RUB_MOSPRIME_NFEA', 'RUB_MOSPRIME_Reference_Banks', 'RUB_RUONIA', 'RUB_RUONIA_OIS_Compound_1', 'RUB_RUONIA_OIS_COMPOUND', 'SAR_SAIBOR', 'SAR_SRIOR_Reference_Banks', 'SAR_SRIOR_SUAA', 'SEK_Annual_Swap_Rate', 'SEK_Annual_Swap_Rate_SESWFI', 'SEK_SIOR_OIS_COMPOUND', 'SEK_STIBOR', 'SEK_STIBOR_Bloomberg', 'SEK_STIBOR_OIS_Compound', 'SEK_STIBOR_Reference_Banks', 'SEK_STIBOR_SIDE', 'SEK_SWESTR', 'SEK_SWESTR_Average_1M', 'SEK_SWESTR_Average_1W', 'SEK_SWESTR_Average_2M', 'SEK_SWESTR_Average_3M', 'SEK_SWESTR_Average_6M', 'SEK_SWESTR_Compounded_Index', 'SEK_SWESTR_OIS_Compound', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'SGD_Semi_Annual_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_TRADITION', 'SGD_Semi_Annual_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_ICAP', 'SGD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'SGD_SIBOR', 'SGD_SIBOR_Reference_Banks', 'SGD_SIBOR_Reuters', 'SGD_SIBOR_Telerate', 'SGD_SONAR_OIS_COMPOUND', 'SGD_SONAR_OIS_VWAP_COMPOUND', 'SGD_SOR', 'SGD_SORA', 'SGD_SORA_COMPOUND', 'SGD_SORA_OIS_Compound', 'SGD_SOR_Reference_Banks', 'SGD_SOR_Reuters', 'SGD_SOR_Telerate', 'SGD_SOR_VWAP', 'SGD_SOR_VWAP_Reference_Banks', 'SKK_BRIBOR_Bloomberg', 'SKK_BRIBOR_BRBO', 'SKK_BRIBOR_NBSK07', 'SKK_BRIBOR_Reference_Banks', 'THB_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'THB_Semi_Annual_Swap_Rate_Reference_Banks', 'THB_SOR_Reference_Banks', 'THB_SOR_Reuters', 'THB_SOR_Telerate', 'THB_THBFIX', 'THB_THBFIX_Reference_Banks', 'THB_THBFIX_Reuters', 'THB_THOR', 'THB_THOR_COMPOUND', 'THB_THOR_OIS_Compound', 'TRY_Annual_Swap_Rate_11_00_TRADITION', 'TRY_Annual_Swap_Rate_11_15_BGCANTOR', 'TRY_Annual_Swap_Rate_Reference_Banks', 'TRY_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'TRY_TLREF', 'TRY_TLREF_OIS_Compound_1', 'TRY_TLREF_OIS_COMPOUND', 'TRY_TRLIBOR', 'TRY_TRYIBOR_Reference_Banks', 'TRY_TRYIBOR_Reuters', 'TWD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'TWD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'TWD_Reference_Dealers', 'TWD_Reuters_6165', 'TWD_TAIBIR01', 'TWD_TAIBIR02', 'TWD_TAIBOR', 'TWD_TAIBOR_Bloomberg', 'TWD_TAIBOR_Reuters', 'TWD_Telerate_6165', 'TWD_TWCPBA', 'UK_Base_Rate', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_AMERIBOR', 'USD_AMERIBOR_Average_30D', 'USD_AMERIBOR_Average_90D', 'USD_AMERIBOR_Term', 'USD_AMERIBOR_Term_Structure', 'USD_Annual_Swap_Rate_11_00_BGCANTOR', 'USD_Annual_Swap_Rate_11_00_TRADITION', 'USD_Annual_Swap_Rate_4_00_TRADITION', 'USD_AXI_Term', 'USD_BA_H_15', 'USD_BA_Reference_Dealers', 'USD_BMA_Municipal_Swap_Index', 'USD_BSBY', 'USD_CD_H_15', 'USD_CD_Reference_Dealers', 'USD_CMS_Reference_Banks', 'USD_CMS_Reference_Banks_ICAP_SwapPX', 'USD_CMS_Reuters', 'USD_CMS_Telerate', 'USD_CMT', 'USD_CMT_Average_1W', 'USD_CMT_T7051', 'USD_CMT_T7052', 'USD_COF11_FHLBSF', 'USD_COF11_Reuters', 'USD_COF11_Telerate', 'USD_COFI', 'USD_CP_H_15', 'USD_CP_Money_Market_Yield', 'USD_CP_Reference_Dealers', 'USD_CRITR', 'USD_Federal_Funds', 'USD_Federal_Funds_H_15', 'USD_Federal_Funds_H_15_Bloomberg', 'USD_Federal_Funds_H_15_OIS_COMPOUND', 'USD_Federal_Funds_OIS_Compound', 'USD_Federal_Funds_Reference_Dealers', 'USD_FFCB_DISCO', 'USD_FXI_Term', 'USD_ISDAFIX3_Swap_Rate', 'USD_ISDAFIX3_Swap_Rate_3_00', 'USD_ISDA_Swap_Rate', 'USD_ISDA_Swap_Rate_3_00', 'USD_LIBOR', 'USD_LIBOR_BBA', 'USD_LIBOR_BBA_Bloomberg', 'USD_LIBOR_ICE_Swap_Rate_11_00', 'USD_LIBOR_ICE_Swap_Rate_15_00', 'USD_LIBOR_ISDA', 'USD_LIBOR_LIBO', 'USD_LIBOR_Reference_Banks', 'USD_Municipal_Swap_Index', 'USD_Municipal_Swap_Libor_Ratio_11_00_ICAP', 'USD_Municipal_Swap_Rate_11_00_ICAP', 'USD_OIS_11_00_BGCANTOR', 'USD_OIS_11_00_LON_ICAP', 'USD_OIS_11_00_NY_ICAP', 'USD_OIS_11_00_TRADITION', 'USD_OIS_3_00_BGCANTOR', 'USD_OIS_3_00_NY_ICAP', 'USD_OIS_4_00_TRADITION', 'USD_Overnight_Bank_Funding_Rate', 'USD_Prime', 'USD_Prime_H_15', 'USD_Prime_Reference_Banks', 'USD_S_P_Index_High_Grade', 'USD_SandP_Index_High_Grade', 'USD_SIBOR_Reference_Banks', 'USD_SIBOR_SIBO', 'USD_SIFMA_Municipal_Swap_Index', 'USD_SOFR', 'USD_SOFR_Average_180D', 'USD_SOFR_Average_30D', 'USD_SOFR_Average_90D', 'USD_SOFR_CME_Term', 'USD_SOFR_COMPOUND', 'USD_SOFR_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index_0_Floor', 'USD_SOFR_ICE_Compounded_Index_0_Floor_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_0_Floor_5D_Lag', 'USD_SOFR_ICE_Compounded_Index_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_5D_Lag', 'USD_SOFR_ICE_Swap_Rate', 'USD_SOFR_ICE_Swap_Rate_Spreads', 'USD_SOFR_ICE_Term', 'USD_SOFR_OIS_Compound', 'USD_Swap_Rate_BCMP1', 'USD_TBILL_Auction_High_Rate', 'USD_TBILL_H_15', 'USD_TBILL_H_15_Bloomberg', 'USD_TBILL_Secondary_Market', 'USD_TBILL_Secondary_Market_Bond_Equivalent_Yield', 'USD_TIBOR_ISDC', 'USD_TIBOR_Reference_Banks', 'USD_Treasury_19901_3_00_ICAP', 'USD_Treasury_Rate_BCMP1', 'USD_Treasury_Rate_ICAP_BrokerTec', 'USD_Treasury_Rate_SwapMarker100', 'USD_Treasury_Rate_SwapMarker99', 'USD_Treasury_Rate_T19901', 'USD_Treasury_Rate_T500', 'VND_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'VND_Semi_Annual_Swap_Rate_Reference_Banks', 'ZAR_DEPOSIT_Reference_Banks', 'ZAR_DEPOSIT_SAFEX', 'ZAR_JIBAR', 'ZAR_JIBAR_Reference_Banks', 'ZAR_JIBAR_SAFEX', 'ZAR_Prime_Average_1', 'ZAR_PRIME_AVERAGE', 'ZAR_PRIME_AVERAGE_Reference_Banks', 'ZAR_Quarterly_Swap_Rate_1_00_TRADITION', 'ZAR_Quarterly_Swap_Rate_5_30_TRADITION', 'ZAR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'ZAR_ZARONIA', 'ZAR_ZARONIA_OIS_Compound'))

UNION ALL

SELECT 'ObservationShiftCalculation' AS table_name, 'calculationBase' AS column_name, 'enum' AS constraint_type, id AS record_id, "calculationBase" AS invalid_value 
FROM "ObservationShiftCalculation" 
WHERE "ObservationShiftCalculation"."calculationBase" IS NOT NULL AND ("ObservationShiftCalculation"."calculationBase" NOT IN ('SetInAdvance', 'Standard', 'FixingDate'))

UNION ALL

SELECT 'FloatingRateIndexDefinition' AS table_name, 'fro' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingRateIndexDefinition" 
WHERE "FloatingRateIndexDefinition".fro IS NULL

UNION ALL

SELECT 'FloatingRateIndexIdentification' AS table_name, 'floatingRateIndex' AS column_name, 'enum' AS constraint_type, id AS record_id, "floatingRateIndex" AS invalid_value 
FROM "FloatingRateIndexIdentification" 
WHERE "FloatingRateIndexIdentification"."floatingRateIndex" IS NOT NULL AND ("FloatingRateIndexIdentification"."floatingRateIndex" NOT IN ('AED_EBOR_Reuters', 'AED_EIBOR', 'AUD_AONIA', 'AUD_AONIA_OIS_Compound_1', 'AUD_AONIA_OIS_COMPOUND', 'AUD_AONIA_OIS_COMPOUND_SwapMarker', 'AUD_BBR_AUBBSW', 'AUD_BBR_BBSW', 'AUD_BBR_BBSW_Bloomberg', 'AUD_BBR_BBSY__BID_', 'AUD_BBR_ISDC', 'AUD_BBSW', 'AUD_BBSW_Quarterly_Swap_Rate_ICAP', 'AUD_BBSW_Semi_Annual_Swap_Rate_ICAP', 'AUD_BBSY_Bid', 'AUD_LIBOR_BBA', 'AUD_LIBOR_BBA_Bloomberg', 'AUD_LIBOR_Reference_Banks', 'AUD_Quarterly_Swap_Rate_ICAP', 'AUD_Quarterly_Swap_Rate_ICAP_Reference_Banks', 'AUD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'AUD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'AUD_Semi_annual_Swap_Rate_ICAP', 'AUD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'AUD_Swap_Rate_Reuters', 'BRL_CDI', 'CAD_BA_CDOR', 'CAD_BA_CDOR_Bloomberg', 'CAD_BA_ISDD', 'CAD_BA_Reference_Banks', 'CAD_BA_Reuters', 'CAD_BA_Telerate', 'CAD_CDOR', 'CAD_CORRA', 'CAD_CORRA_CanDeal_TMX_Term', 'CAD_CORRA_Compounded_Index', 'CAD_CORRA_OIS_Compound_1', 'CAD_CORRA_OIS_COMPOUND', 'CAD_ISDA_Swap_Rate', 'CAD_LIBOR_BBA', 'CAD_LIBOR_BBA_Bloomberg', 'CAD_LIBOR_BBA_SwapMarker', 'CAD_LIBOR_Reference_Banks', 'CAD_REPO_CORRA', 'CAD_TBILL_ISDD', 'CAD_TBILL_Reference_Banks', 'CAD_TBILL_Reuters', 'CAD_TBILL_Telerate', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_6M_LIBORSWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_Annual_Swap_Rate', 'CHF_Annual_Swap_Rate_11_00_ICAP', 'CHF_Annual_Swap_Rate_Reference_Banks', 'CHF_Basis_Swap_3m_vs_6m_LIBOR_11_00_ICAP', 'CHF_ISDAFIX_Swap_Rate', 'CHF_LIBOR', 'CHF_LIBOR_BBA', 'CHF_LIBOR_BBA_Bloomberg', 'CHF_LIBOR_ISDA', 'CHF_LIBOR_Reference_Banks', 'CHF_OIS_11_00_ICAP', 'CHF_SARON', 'CHF_SARON_Average_12M', 'CHF_SARON_Average_1M', 'CHF_SARON_Average_1W', 'CHF_SARON_Average_2M', 'CHF_SARON_Average_3M', 'CHF_SARON_Average_6M', 'CHF_SARON_Average_9M', 'CHF_SARON_Compounded_Index', 'CHF_SARON_OIS_Compound_1', 'CHF_SARON_OIS_COMPOUND', 'CHF_TOIS_OIS_COMPOUND', 'CHF_USD_Basis_Swaps_11_00_ICAP', 'CL_CLICP_Bloomberg', 'CLP_ICP', 'CLP_TNA', 'CNH_HIBOR', 'CNH_HIBOR_Reference_Banks', 'CNH_HIBOR_TMA', 'CNY_7_Repo_Compounding_Date', 'CNY_CNREPOFIX_CFXS_Reuters', 'CNY_Deposit_Rate', 'CNY_Fixing_Repo_Rate', 'CNY_LPR', 'CNY_PBOCB_Reuters', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION_Reference_Banks', 'CNY_Quarterly_7D_Repo_NDS_Rate_Tradition', 'CNY_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'CNY_Semi_Annual_Swap_Rate_Reference_Banks', 'CNY_SHIBOR', 'CNY_SHIBOR_OIS_Compound', 'CNY_Shibor_OIS_Compounding', 'CNY_SHIBOR_Reuters', 'COP_IBR_OIS_Compound_1', 'COP_IBR_OIS_COMPOUND', 'CZK_Annual_Swap_Rate_11_00_BGCANTOR', 'CZK_Annual_Swap_Rate_Reference_Banks', 'CZK_CZEONIA', 'CZK_CZEONIA_OIS_Compound', 'CZK_PRIBOR', 'CZK_PRIBOR_PRBO', 'CZK_PRIBOR_Reference_Banks', 'DKK_CIBOR', 'DKK_CIBOR2', 'DKK_CIBOR2_Bloomberg', 'DKK_CIBOR2_DKNA13', 'DKK_CIBOR_DKNA13', 'DKK_CIBOR_DKNA13_Bloomberg', 'DKK_CIBOR_Reference_Banks', 'DKK_CITA', 'DKK_CITA_DKNA14_COMPOUND', 'DKK_DESTR', 'DKK_DESTR_Compounded_Index', 'DKK_DESTR_OIS_Compound', 'DKK_DKKOIS_OIS_COMPOUND', 'DKK_Tom_Next_OIS_Compound', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_Annual_Swap_Rate_10_00', 'EUR_Annual_Swap_Rate_10_00_BGCANTOR', 'EUR_Annual_Swap_Rate_10_00_Bloomberg', 'EUR_Annual_Swap_Rate_10_00_ICAP', 'EUR_Annual_Swap_Rate_10_00_SwapMarker', 'EUR_Annual_Swap_Rate_10_00_TRADITION', 'EUR_Annual_Swap_Rate_11_00', 'EUR_Annual_Swap_Rate_11_00_Bloomberg', 'EUR_Annual_Swap_Rate_11_00_ICAP', 'EUR_Annual_Swap_Rate_11_00_SwapMarker', 'EUR_Annual_Swap_Rate_3_Month', 'EUR_Annual_Swap_Rate_3_Month_SwapMarker', 'EUR_Annual_Swap_Rate_4_15_TRADITION', 'EUR_Annual_Swap_Rate_Reference_Banks', 'EUR_Basis_Swap_EONIA_vs_3m_EUR_IBOR_Swap_Rates_A_360_10_00_ICAP', 'EUR_CNO_TEC10', 'EUR_EONIA', 'EUR_EONIA_AVERAGE_1', 'EUR_EONIA_Average', 'EUR_EONIA_OIS_10_00_BGCANTOR', 'EUR_EONIA_OIS_10_00_ICAP', 'EUR_EONIA_OIS_10_00_TRADITION', 'EUR_EONIA_OIS_11_00_ICAP', 'EUR_EONIA_OIS_4_15_TRADITION', 'EUR_EONIA_OIS_Compound_1', 'EUR_EONIA_OIS_COMPOUND', 'EUR_EONIA_OIS_COMPOUND_Bloomberg', 'EUR_EONIA_Swap_Index', 'EUR_EURIBOR', 'EUR_EURIBOR_Act_365', 'EUR_EURIBOR_Act_365_Bloomberg', 'EUR_EURIBOR_Annual_Bond_Swap_vs_1m_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_1m_vs_3m_Euribor_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_3m_vs_6m_11_00_ICAP', 'EUR_EURIBOR_ICE_Swap_Rate_11_00', 'EUR_EURIBOR_ICE_Swap_Rate_12_00', 'EUR_EURIBOR_Reference_Banks', 'EUR_EURIBOR_Reuters', 'EUR_EURIBOR_Telerate', 'EUR_EURONIA_OIS_Compound_1', 'EUR_EURONIA_OIS_COMPOUND', 'EUR_EuroSTR', 'EUR_EuroSTR_Average_12M', 'EUR_EuroSTR_Average_1M', 'EUR_EuroSTR_Average_1W', 'EUR_EuroSTR_Average_3M', 'EUR_EuroSTR_Average_6M', 'EUR_EuroSTR_COMPOUND', 'EUR_EuroSTR_Compounded_Index', 'EUR_EuroSTR_FTSE_Term', 'EUR_EuroSTR_ICE_Compounded_Index', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_5D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_5D_Lag', 'EUR_EuroSTR_ICE_Swap_Rate', 'EUR_EuroSTR_OIS_Compound', 'EUR_EuroSTR_Term', 'EUR_ISDA_EURIBOR_Swap_Rate_11_00', 'EUR_ISDA_EURIBOR_Swap_Rate_12_00', 'EUR_ISDA_LIBOR_Swap_Rate_10_00', 'EUR_ISDA_LIBOR_Swap_Rate_11_00', 'EUR_LIBOR', 'EUR_LIBOR_BBA', 'EUR_LIBOR_BBA_Bloomberg', 'EUR_LIBOR_Reference_Banks', 'EUR_TAM_CDC', 'EUR_TEC10_CNO', 'EUR_TEC10_CNO_SwapMarker', 'EUR_TEC10_Reference_Banks', 'EUR_TEC5_CNO', 'EUR_TEC5_CNO_SwapMarker', 'EUR_TEC5_Reference_Banks', 'EUR_TMM_CDC_COMPOUND', 'EUR_USD_Basis_Swaps_11_00_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'GBP_ISDA_Swap_Rate', 'GBP_LIBOR', 'GBP_LIBOR_BBA', 'GBP_LIBOR_BBA_Bloomberg', 'GBP_LIBOR_ICE_Swap_Rate', 'GBP_LIBOR_ISDA', 'GBP_LIBOR_Reference_Banks', 'GBP_RONIA', 'GBP_RONIA_OIS_Compound', 'GBP_Semi_Annual_Swap_Rate', 'GBP_Semi_Annual_Swap_Rate_11_00_ICAP', 'GBP_Semi_Annual_Swap_Rate_11_00_TRADITION', 'GBP_Semi_Annual_Swap_Rate_4_15_TRADITION', 'GBP_Semi_Annual_Swap_Rate_Reference_Banks', 'GBP_Semi_Annual_Swap_Rate_SwapMarker26', 'GBP_SONIA', 'GBP_SONIA_COMPOUND', 'GBP_SONIA_Compounded_Index', 'GBP_SONIA_FTSE_Term', 'GBP_SONIA_ICE_Compounded_Index', 'GBP_SONIA_ICE_Compounded_Index_0_Floor', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_5D_Lag', 'GBP_SONIA_ICE_Compounded_Index_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_5D_Lag', 'GBP_SONIA_ICE_Swap_Rate', 'GBP_SONIA_ICE_Term', 'GBP_SONIA_OIS_11_00_ICAP', 'GBP_SONIA_OIS_11_00_TRADITION', 'GBP_SONIA_OIS_4_15_TRADITION', 'GBP_SONIA_OIS_Compound', 'GBP_SONIA_Swap_Rate', 'GBP_UK_Base_Rate', 'GBP_USD_Basis_Swaps_11_00_ICAP', 'GBP_WMBA_RONIA_COMPOUND', 'GBP_WMBA_SONIA_COMPOUND', 'GRD_ATHIBOR_ATHIBOR', 'GRD_ATHIBOR_Reference_Banks', 'GRD_ATHIBOR_Telerate', 'GRD_ATHIMID_Reference_Banks', 'GRD_ATHIMID_Reuters', 'HKD_HIBOR', 'HKD_HIBOR_HIBOR_', 'HKD_HIBOR_HIBOR_Bloomberg', 'HKD_HIBOR_HKAB', 'HKD_HIBOR_HKAB_Bloomberg', 'HKD_HIBOR_ISDC', 'HKD_HIBOR_Reference_Banks', 'HKD_HONIA', 'HKD_HONIA_OIS_Compound', 'HKD_HONIX_OIS_COMPOUND', 'HKD_ISDA_Swap_Rate_11_00', 'HKD_ISDA_Swap_Rate_4_00', 'HKD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_11_00_TRADITION', 'HKD_Quarterly_Annual_Swap_Rate_4_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'HKD_Quarterly_Quarterly_Swap_Rate_11_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_4_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_Reference_Banks', 'HUF_BUBOR', 'HUF_BUBOR_Reference_Banks', 'HUF_BUBOR_Reuters', 'HUF_HUFONIA', 'HUF_HUFONIA_OIS_Compound', 'IDR_IDMA_Bloomberg', 'IDR_IDRFIX', 'IDR_INDONIA', 'IDR_INDONIA_OIS_Compound', 'IDR_JIBOR', 'IDR_JIBOR_Reuters', 'IDR_SBI_Reuters', 'IDR_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'IDR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'IDR_Semi_Annual_Swap_Rate_Reference_Banks', 'IDR_SOR_Reference_Banks', 'IDR_SOR_Reuters', 'IDR_SOR_Telerate', 'ILS_SHIR', 'ILS_SHIR_OIS_Compound', 'ILS_TELBOR', 'ILS_TELBOR01_Reuters', 'ILS_TELBOR_Reference_Banks', 'INR_BMK', 'INR_CMT', 'INR_FBIL_MIBOR_OIS_COMPOUND', 'INR_INBMK_REUTERS', 'INR_MIBOR', 'INR_MIBOR_OIS', 'INR_MIBOR_OIS_Compound_1', 'INR_MIBOR_OIS_COMPOUND', 'INR_MIFOR', 'INR_MIOIS', 'INR_MITOR_OIS_COMPOUND', 'INR_Modified_MIFOR', 'INR_Reference_Banks', 'INR_Semi_Annual_Swap_Rate_11_30_BGCANTOR', 'INR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'INR_Semi_Annual_Swap_Rate_Reference_Banks', 'INR_SORR', 'INR_SORR_OIS_Compound', 'ISK_REIBOR', 'ISK_REIBOR_Reference_Banks', 'ISK_REIBOR_Reuters', 'JPY_Annual_Swap_Rate_11_00_TRADITION', 'JPY_Annual_Swap_Rate_3_00_TRADITION', 'JPY_BBSF_Bloomberg_10_00', 'JPY_BBSF_Bloomberg_15_00', 'JPY_Euroyen_TIBOR', 'JPY_ISDA_Swap_Rate_10_00', 'JPY_ISDA_Swap_Rate_15_00', 'JPY_LIBOR', 'JPY_LIBOR_BBA', 'JPY_LIBOR_BBA_Bloomberg', 'JPY_LIBOR_FRASETT', 'JPY_LIBOR_ISDA', 'JPY_LIBOR_Reference_Banks', 'JPY_LIBOR_TSR_10_00', 'JPY_LIBOR_TSR_15_00', 'JPY_LTPR_MHBK', 'JPY_LTPR_MHCB', 'JPY_LTPR_TBC', 'JPY_MUTANCALL_TONAR', 'JPY_OIS_11_00_ICAP', 'JPY_OIS_11_00_TRADITION', 'JPY_OIS_3_00_TRADITION', 'JPY_Quoting_Banks_LIBOR', 'JPY_STPR_Quoting_Banks', 'JPY_TIBOR', 'JPY_TIBOR_17096', 'JPY_TIBOR_17097', 'JPY_TIBOR_DTIBOR01', 'JPY_TIBOR_TIBM', 'JPY_TIBOR_TIBM__10_Banks_', 'JPY_TIBOR_TIBM__5_Banks_', 'JPY_TIBOR_TIBM__All_Banks_', 'JPY_TIBOR_TIBM__All_Banks__Bloomberg', 'JPY_TIBOR_TIBM_Reference_Banks', 'JPY_TIBOR_ZTIBOR', 'JPY_TONA', 'JPY_TONA_Average_180D', 'JPY_TONA_Average_30D', 'JPY_TONA_Average_90D', 'JPY_TONA_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index_0_Floor', 'JPY_TONA_ICE_Compounded_Index_0_Floor_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_0_Floor_5D_Lag', 'JPY_TONA_ICE_Compounded_Index_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_5D_Lag', 'JPY_TONA_OIS_Compound_1', 'JPY_TONA_OIS_COMPOUND', 'JPY_TONA_TSR_10_00', 'JPY_TONA_TSR_15_00', 'JPY_TORF_QUICK', 'JPY_TSR_Reference_Banks', 'JPY_TSR_Reuters_10_00', 'JPY_TSR_Reuters_15_00', 'JPY_TSR_Telerate_10_00', 'JPY_TSR_Telerate_15_00', 'JPY_USD_Basis_Swaps_11_00_ICAP', 'KRW_Bond_3222', 'KRW_CD_3220', 'KRW_CD_91D', 'KRW_CD_KSDA_Bloomberg', 'KRW_KOFR', 'KRW_KOFR_OIS_Compound', 'KRW_Quarterly_Annual_Swap_Rate_3_30_ICAP', 'MXN_TIIE', 'MXN_TIIE_Banxico', 'MXN_TIIE_Banxico_Bloomberg', 'MXN_TIIE_Banxico_Reference_Banks', 'MXN_TIIE_ON', 'MXN_TIIE_ON_OIS_Compound', 'MXN_TIIE_Reference_Banks', 'MYR_KLIBOR', 'MYR_KLIBOR_BNM', 'MYR_KLIBOR_Reference_Banks', 'MYR_MYOR', 'MYR_MYOR_OIS_Compound', 'MYR_Quarterly_Swap_Rate_11_00_TRADITION', 'MYR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'NOK_NIBOR', 'NOK_NIBOR_NIBR', 'NOK_NIBOR_NIBR_Bloomberg', 'NOK_NIBOR_NIBR_Reference_Banks', 'NOK_NIBOR_OIBOR', 'NOK_NIBOR_Reference_Banks', 'NOK_NOWA', 'NOK_NOWA_OIS_Compound', 'NZD_BBR_BID', 'NZD_BBR_FRA', 'NZD_BBR_ISDC', 'NZD_BBR_Reference_Banks', 'NZD_BBR_Telerate', 'NZD_BKBM_Bid', 'NZD_BKBM_FRA', 'NZD_BKBM_FRA_Swap_Rate_ICAP', 'NZD_NZIONA', 'NZD_NZIONA_OIS_Compound_1', 'NZD_NZIONA_OIS_COMPOUND', 'NZD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'NZD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'NZD_Swap_Rate_ICAP', 'NZD_Swap_Rate_ICAP_Reference_Banks', 'PHP_ORR', 'PHP_PHIREF', 'PHP_PHIREF_BAP', 'PHP_PHIREF_Bloomberg', 'PHP_PHIREF_Reference_Banks', 'PHP_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'PHP_Semi_Annual_Swap_Rate_Reference_Banks', 'PLN_POLONIA', 'PLN_POLONIA_OIS_Compound_1', 'PLN_POLONIA_OIS_COMPOUND', 'PLN_POLSTR', 'PLN_POLSTR_OIS_Compound', 'PLN_WIBID', 'PLN_WIBOR', 'PLN_WIBOR_Reference_Banks', 'PLN_WIBOR_WIBO', 'PLN_WIRON', 'PLN_WIRON_OIS_Compound', 'PLZ_WIBOR_Reference_Banks', 'PLZ_WIBOR_WIBO', 'REPOFUNDS_RATE_FRANCE_OIS_COMPOUND', 'REPOFUNDS_RATE_GERMANY_OIS_COMPOUND', 'REPOFUNDS_RATE_ITALY_OIS_COMPOUND', 'RON_Annual_Swap_Rate_11_00_BGCANTOR', 'RON_Annual_Swap_Rate_Reference_Banks', 'RON_RBOR_Reuters', 'RON_ROBID', 'RON_ROBOR', 'RUB_Annual_Swap_Rate_11_00_BGCANTOR', 'RUB_Annual_Swap_Rate_12_45_TRADITION', 'RUB_Annual_Swap_Rate_4_15_TRADITION', 'RUB_Annual_Swap_Rate_Reference_Banks', 'RUB_Annual_Swap_Rate_TRADITION_Reference_Banks', 'RUB_Key_Rate_CBRF', 'RUB_MosPrime', 'RUB_MOSPRIME_NFEA', 'RUB_MOSPRIME_Reference_Banks', 'RUB_RUONIA', 'RUB_RUONIA_OIS_Compound_1', 'RUB_RUONIA_OIS_COMPOUND', 'SAR_SAIBOR', 'SAR_SRIOR_Reference_Banks', 'SAR_SRIOR_SUAA', 'SEK_Annual_Swap_Rate', 'SEK_Annual_Swap_Rate_SESWFI', 'SEK_SIOR_OIS_COMPOUND', 'SEK_STIBOR', 'SEK_STIBOR_Bloomberg', 'SEK_STIBOR_OIS_Compound', 'SEK_STIBOR_Reference_Banks', 'SEK_STIBOR_SIDE', 'SEK_SWESTR', 'SEK_SWESTR_Average_1M', 'SEK_SWESTR_Average_1W', 'SEK_SWESTR_Average_2M', 'SEK_SWESTR_Average_3M', 'SEK_SWESTR_Average_6M', 'SEK_SWESTR_Compounded_Index', 'SEK_SWESTR_OIS_Compound', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'SGD_Semi_Annual_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_TRADITION', 'SGD_Semi_Annual_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_ICAP', 'SGD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'SGD_SIBOR', 'SGD_SIBOR_Reference_Banks', 'SGD_SIBOR_Reuters', 'SGD_SIBOR_Telerate', 'SGD_SONAR_OIS_COMPOUND', 'SGD_SONAR_OIS_VWAP_COMPOUND', 'SGD_SOR', 'SGD_SORA', 'SGD_SORA_COMPOUND', 'SGD_SORA_OIS_Compound', 'SGD_SOR_Reference_Banks', 'SGD_SOR_Reuters', 'SGD_SOR_Telerate', 'SGD_SOR_VWAP', 'SGD_SOR_VWAP_Reference_Banks', 'SKK_BRIBOR_Bloomberg', 'SKK_BRIBOR_BRBO', 'SKK_BRIBOR_NBSK07', 'SKK_BRIBOR_Reference_Banks', 'THB_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'THB_Semi_Annual_Swap_Rate_Reference_Banks', 'THB_SOR_Reference_Banks', 'THB_SOR_Reuters', 'THB_SOR_Telerate', 'THB_THBFIX', 'THB_THBFIX_Reference_Banks', 'THB_THBFIX_Reuters', 'THB_THOR', 'THB_THOR_COMPOUND', 'THB_THOR_OIS_Compound', 'TRY_Annual_Swap_Rate_11_00_TRADITION', 'TRY_Annual_Swap_Rate_11_15_BGCANTOR', 'TRY_Annual_Swap_Rate_Reference_Banks', 'TRY_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'TRY_TLREF', 'TRY_TLREF_OIS_Compound_1', 'TRY_TLREF_OIS_COMPOUND', 'TRY_TRLIBOR', 'TRY_TRYIBOR_Reference_Banks', 'TRY_TRYIBOR_Reuters', 'TWD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'TWD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'TWD_Reference_Dealers', 'TWD_Reuters_6165', 'TWD_TAIBIR01', 'TWD_TAIBIR02', 'TWD_TAIBOR', 'TWD_TAIBOR_Bloomberg', 'TWD_TAIBOR_Reuters', 'TWD_Telerate_6165', 'TWD_TWCPBA', 'UK_Base_Rate', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_AMERIBOR', 'USD_AMERIBOR_Average_30D', 'USD_AMERIBOR_Average_90D', 'USD_AMERIBOR_Term', 'USD_AMERIBOR_Term_Structure', 'USD_Annual_Swap_Rate_11_00_BGCANTOR', 'USD_Annual_Swap_Rate_11_00_TRADITION', 'USD_Annual_Swap_Rate_4_00_TRADITION', 'USD_AXI_Term', 'USD_BA_H_15', 'USD_BA_Reference_Dealers', 'USD_BMA_Municipal_Swap_Index', 'USD_BSBY', 'USD_CD_H_15', 'USD_CD_Reference_Dealers', 'USD_CMS_Reference_Banks', 'USD_CMS_Reference_Banks_ICAP_SwapPX', 'USD_CMS_Reuters', 'USD_CMS_Telerate', 'USD_CMT', 'USD_CMT_Average_1W', 'USD_CMT_T7051', 'USD_CMT_T7052', 'USD_COF11_FHLBSF', 'USD_COF11_Reuters', 'USD_COF11_Telerate', 'USD_COFI', 'USD_CP_H_15', 'USD_CP_Money_Market_Yield', 'USD_CP_Reference_Dealers', 'USD_CRITR', 'USD_Federal_Funds', 'USD_Federal_Funds_H_15', 'USD_Federal_Funds_H_15_Bloomberg', 'USD_Federal_Funds_H_15_OIS_COMPOUND', 'USD_Federal_Funds_OIS_Compound', 'USD_Federal_Funds_Reference_Dealers', 'USD_FFCB_DISCO', 'USD_FXI_Term', 'USD_ISDAFIX3_Swap_Rate', 'USD_ISDAFIX3_Swap_Rate_3_00', 'USD_ISDA_Swap_Rate', 'USD_ISDA_Swap_Rate_3_00', 'USD_LIBOR', 'USD_LIBOR_BBA', 'USD_LIBOR_BBA_Bloomberg', 'USD_LIBOR_ICE_Swap_Rate_11_00', 'USD_LIBOR_ICE_Swap_Rate_15_00', 'USD_LIBOR_ISDA', 'USD_LIBOR_LIBO', 'USD_LIBOR_Reference_Banks', 'USD_Municipal_Swap_Index', 'USD_Municipal_Swap_Libor_Ratio_11_00_ICAP', 'USD_Municipal_Swap_Rate_11_00_ICAP', 'USD_OIS_11_00_BGCANTOR', 'USD_OIS_11_00_LON_ICAP', 'USD_OIS_11_00_NY_ICAP', 'USD_OIS_11_00_TRADITION', 'USD_OIS_3_00_BGCANTOR', 'USD_OIS_3_00_NY_ICAP', 'USD_OIS_4_00_TRADITION', 'USD_Overnight_Bank_Funding_Rate', 'USD_Prime', 'USD_Prime_H_15', 'USD_Prime_Reference_Banks', 'USD_S_P_Index_High_Grade', 'USD_SandP_Index_High_Grade', 'USD_SIBOR_Reference_Banks', 'USD_SIBOR_SIBO', 'USD_SIFMA_Municipal_Swap_Index', 'USD_SOFR', 'USD_SOFR_Average_180D', 'USD_SOFR_Average_30D', 'USD_SOFR_Average_90D', 'USD_SOFR_CME_Term', 'USD_SOFR_COMPOUND', 'USD_SOFR_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index_0_Floor', 'USD_SOFR_ICE_Compounded_Index_0_Floor_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_0_Floor_5D_Lag', 'USD_SOFR_ICE_Compounded_Index_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_5D_Lag', 'USD_SOFR_ICE_Swap_Rate', 'USD_SOFR_ICE_Swap_Rate_Spreads', 'USD_SOFR_ICE_Term', 'USD_SOFR_OIS_Compound', 'USD_Swap_Rate_BCMP1', 'USD_TBILL_Auction_High_Rate', 'USD_TBILL_H_15', 'USD_TBILL_H_15_Bloomberg', 'USD_TBILL_Secondary_Market', 'USD_TBILL_Secondary_Market_Bond_Equivalent_Yield', 'USD_TIBOR_ISDC', 'USD_TIBOR_Reference_Banks', 'USD_Treasury_19901_3_00_ICAP', 'USD_Treasury_Rate_BCMP1', 'USD_Treasury_Rate_ICAP_BrokerTec', 'USD_Treasury_Rate_SwapMarker100', 'USD_Treasury_Rate_SwapMarker99', 'USD_Treasury_Rate_T19901', 'USD_Treasury_Rate_T500', 'VND_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'VND_Semi_Annual_Swap_Rate_Reference_Banks', 'ZAR_DEPOSIT_Reference_Banks', 'ZAR_DEPOSIT_SAFEX', 'ZAR_JIBAR', 'ZAR_JIBAR_Reference_Banks', 'ZAR_JIBAR_SAFEX', 'ZAR_Prime_Average_1', 'ZAR_PRIME_AVERAGE', 'ZAR_PRIME_AVERAGE_Reference_Banks', 'ZAR_Quarterly_Swap_Rate_1_00_TRADITION', 'ZAR_Quarterly_Swap_Rate_5_30_TRADITION', 'ZAR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'ZAR_ZARONIA', 'ZAR_ZARONIA_OIS_Compound'))

UNION ALL

SELECT 'FloatingRateIndexIdentification' AS table_name, 'currency' AS column_name, 'enum' AS constraint_type, id AS record_id, currency AS invalid_value 
FROM "FloatingRateIndexIdentification" 
WHERE "FloatingRateIndexIdentification".currency IS NOT NULL AND ("FloatingRateIndexIdentification".currency NOT IN ('AED', 'AFN', 'ALL', 'AMD', 'AOA', 'ARS', 'AUD', 'AWG', 'AZN', 'BAM', 'BBD', 'BDT', 'BHD', 'BIF', 'BMD', 'BND', 'BOB', 'BOV', 'BRL', 'BSD', 'BTN', 'BWP', 'BYN', 'BZD', 'CAD', 'CDF', 'CHE', 'CHF', 'CHW', 'CLF', 'CLP', 'CNY', 'COP', 'COU', 'CRC', 'CUP', 'CVE', 'CZK', 'DJF', 'DKK', 'DOP', 'DZD', 'EGP', 'ERN', 'ETB', 'EUR', 'FJD', 'FKP', 'GBP', 'GEL', 'GHS', 'GIP', 'GMD', 'GNF', 'GTQ', 'GYD', 'HKD', 'HNL', 'HTG', 'HUF', 'IDR', 'ILS', 'INR', 'IQD', 'IRR', 'ISK', 'JMD', 'JOD', 'JPY', 'KES', 'KGS', 'KHR', 'KMF', 'KPW', 'KRW', 'KWD', 'KYD', 'KZT', 'LAK', 'LBP', 'LKR', 'LRD', 'LSL', 'LYD', 'MAD', 'MDL', 'MGA', 'MKD', 'MMK', 'MNT', 'MOP', 'MRU', 'MUR', 'MVR', 'MWK', 'MXN', 'MXV', 'MYR', 'MZN', 'NAD', 'NGN', 'NIO', 'NOK', 'NPR', 'NZD', 'OMR', 'PAB', 'PEN', 'PGK', 'PHP', 'PKR', 'PLN', 'PYG', 'QAR', 'RON', 'RSD', 'RUB', 'RWF', 'SAR', 'SBD', 'SCR', 'SDG', 'SEK', 'SGD', 'SHP', 'SLE', 'SOS', 'SRD', 'SSP', 'STN', 'SVC', 'SYP', 'SZL', 'THB', 'TJS', 'TMT', 'TND', 'TOP', 'TRY', 'TTD', 'TWD', 'TZS', 'UAH', 'UGX', 'USD', 'USN', 'UYI', 'UYU', 'UYW', 'UZS', 'VED', 'VES', 'VND', 'VUV', 'WST', 'XAD', 'XAF', 'XAG', 'XAU', 'XBA', 'XBB', 'XBC', 'XBD', 'XCD', 'XCG', 'XDR', 'XOF', 'XPD', 'XPF', 'XPT', 'XSU', 'XTS', 'XUA', 'XXX', 'YER', 'ZAR', 'ZMW', 'ZWG'))

UNION ALL

SELECT 'FloatingRateIndexCalculationDefaults' AS table_name, 'category' AS column_name, 'enum' AS constraint_type, id AS record_id, category AS invalid_value 
FROM "FloatingRateIndexCalculationDefaults" 
WHERE "FloatingRateIndexCalculationDefaults".category IS NOT NULL AND ("FloatingRateIndexCalculationDefaults".category NOT IN ('ScreenRate', 'Calculated', 'ReferenceBanks'))

UNION ALL

SELECT 'FloatingRateIndexCalculationDefaults' AS table_name, 'indexStyle' AS column_name, 'enum' AS constraint_type, id AS record_id, "indexStyle" AS invalid_value 
FROM "FloatingRateIndexCalculationDefaults" 
WHERE "FloatingRateIndexCalculationDefaults"."indexStyle" IS NOT NULL AND ("FloatingRateIndexCalculationDefaults"."indexStyle" NOT IN ('AverageFRO', 'CompoundedIndex', 'Index', 'Other', 'Overnight', 'PublishedAverage', 'SpecifiedFormula', 'SwapRate', 'TermRate'))

UNION ALL

SELECT 'FloatingRateIndexCalculationDefaults' AS table_name, 'method' AS column_name, 'enum' AS constraint_type, id AS record_id, method AS invalid_value 
FROM "FloatingRateIndexCalculationDefaults" 
WHERE "FloatingRateIndexCalculationDefaults".method IS NOT NULL AND ("FloatingRateIndexCalculationDefaults".method NOT IN ('OISCompound', 'Average', 'Compounded', 'AllInCompounded'))

UNION ALL

SELECT 'FloatingRateIndexCalculationDefaults' AS table_name, 'dayCountFraction' AS column_name, 'enum' AS constraint_type, id AS record_id, "dayCountFraction" AS invalid_value 
FROM "FloatingRateIndexCalculationDefaults" 
WHERE "FloatingRateIndexCalculationDefaults"."dayCountFraction" IS NOT NULL AND ("FloatingRateIndexCalculationDefaults"."dayCountFraction" NOT IN ('ACT_360', 'ACT_365L', 'ACT_364', 'ACT_365_FIXED', 'ACT_ACT_AFB', 'ACT_ACT_ICMA', 'ACT_ACT_ISDA', 'ACT_ACT_ISMA', 'CAL_252', '_1_1', '_30E_360', '_30E_360_ISDA', '_30_360', 'RBA_BOND_BASIS'))

UNION ALL

SELECT 'ContractualDefinitionIdentifier' AS table_name, 'contractualDefinitionType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ContractualDefinitionIdentifier" 
WHERE "ContractualDefinitionIdentifier"."contractualDefinitionType" IS NULL

UNION ALL

SELECT 'ContractualDefinitionIdentifier' AS table_name, 'contractualDefinitionType' AS column_name, 'enum' AS constraint_type, id AS record_id, "contractualDefinitionType" AS invalid_value 
FROM "ContractualDefinitionIdentifier" 
WHERE "ContractualDefinitionIdentifier"."contractualDefinitionType" IS NOT NULL AND ("ContractualDefinitionIdentifier"."contractualDefinitionType" NOT IN ('ISDA1991InterestRate', 'ISDA1993CommodityDerivatives', 'ISDA1996EquityDerivatives', 'ISDA1997Bullion', 'ISDA1997GovernmentBondOption', 'ISDA1998FxAndCurrencyOption', 'ISDA1999CreditDerivatives', 'ISDA2000', 'ISDA2002EquityDerivatives', 'ISDA2003CreditDerivatives', 'ISDA2004Novation', 'ISDA2005Commodity', 'ISDA2006', 'ISDA2006InflationDerivatives', 'ISDA2008InflationDerivatives', 'ISDA2011EquityDerivatives', 'ISDA2014CreditDerivatives', 'ISDA2021InterestRateDerivatives', 'ISDA2022VerifiedCarbonCredit', 'ISDA2023DigitalAssetDerivatives'))

UNION ALL

SELECT 'FloatingRateIndexMap' AS table_name, 'index_' AS column_name, 'enum' AS constraint_type, id AS record_id, index_ AS invalid_value 
FROM "FloatingRateIndexMap" 
WHERE "FloatingRateIndexMap".index_ IS NOT NULL AND ("FloatingRateIndexMap".index_ NOT IN ('AED_EBOR_Reuters', 'AED_EIBOR', 'AUD_AONIA', 'AUD_AONIA_OIS_Compound_1', 'AUD_AONIA_OIS_COMPOUND', 'AUD_AONIA_OIS_COMPOUND_SwapMarker', 'AUD_BBR_AUBBSW', 'AUD_BBR_BBSW', 'AUD_BBR_BBSW_Bloomberg', 'AUD_BBR_BBSY__BID_', 'AUD_BBR_ISDC', 'AUD_BBSW', 'AUD_BBSW_Quarterly_Swap_Rate_ICAP', 'AUD_BBSW_Semi_Annual_Swap_Rate_ICAP', 'AUD_BBSY_Bid', 'AUD_LIBOR_BBA', 'AUD_LIBOR_BBA_Bloomberg', 'AUD_LIBOR_Reference_Banks', 'AUD_Quarterly_Swap_Rate_ICAP', 'AUD_Quarterly_Swap_Rate_ICAP_Reference_Banks', 'AUD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'AUD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'AUD_Semi_annual_Swap_Rate_ICAP', 'AUD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'AUD_Swap_Rate_Reuters', 'BRL_CDI', 'CAD_BA_CDOR', 'CAD_BA_CDOR_Bloomberg', 'CAD_BA_ISDD', 'CAD_BA_Reference_Banks', 'CAD_BA_Reuters', 'CAD_BA_Telerate', 'CAD_CDOR', 'CAD_CORRA', 'CAD_CORRA_CanDeal_TMX_Term', 'CAD_CORRA_Compounded_Index', 'CAD_CORRA_OIS_Compound_1', 'CAD_CORRA_OIS_COMPOUND', 'CAD_ISDA_Swap_Rate', 'CAD_LIBOR_BBA', 'CAD_LIBOR_BBA_Bloomberg', 'CAD_LIBOR_BBA_SwapMarker', 'CAD_LIBOR_Reference_Banks', 'CAD_REPO_CORRA', 'CAD_TBILL_ISDD', 'CAD_TBILL_Reference_Banks', 'CAD_TBILL_Reuters', 'CAD_TBILL_Telerate', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_6M_LIBORSWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_Annual_Swap_Rate', 'CHF_Annual_Swap_Rate_11_00_ICAP', 'CHF_Annual_Swap_Rate_Reference_Banks', 'CHF_Basis_Swap_3m_vs_6m_LIBOR_11_00_ICAP', 'CHF_ISDAFIX_Swap_Rate', 'CHF_LIBOR', 'CHF_LIBOR_BBA', 'CHF_LIBOR_BBA_Bloomberg', 'CHF_LIBOR_ISDA', 'CHF_LIBOR_Reference_Banks', 'CHF_OIS_11_00_ICAP', 'CHF_SARON', 'CHF_SARON_Average_12M', 'CHF_SARON_Average_1M', 'CHF_SARON_Average_1W', 'CHF_SARON_Average_2M', 'CHF_SARON_Average_3M', 'CHF_SARON_Average_6M', 'CHF_SARON_Average_9M', 'CHF_SARON_Compounded_Index', 'CHF_SARON_OIS_Compound_1', 'CHF_SARON_OIS_COMPOUND', 'CHF_TOIS_OIS_COMPOUND', 'CHF_USD_Basis_Swaps_11_00_ICAP', 'CL_CLICP_Bloomberg', 'CLP_ICP', 'CLP_TNA', 'CNH_HIBOR', 'CNH_HIBOR_Reference_Banks', 'CNH_HIBOR_TMA', 'CNY_7_Repo_Compounding_Date', 'CNY_CNREPOFIX_CFXS_Reuters', 'CNY_Deposit_Rate', 'CNY_Fixing_Repo_Rate', 'CNY_LPR', 'CNY_PBOCB_Reuters', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION_Reference_Banks', 'CNY_Quarterly_7D_Repo_NDS_Rate_Tradition', 'CNY_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'CNY_Semi_Annual_Swap_Rate_Reference_Banks', 'CNY_SHIBOR', 'CNY_SHIBOR_OIS_Compound', 'CNY_Shibor_OIS_Compounding', 'CNY_SHIBOR_Reuters', 'COP_IBR_OIS_Compound_1', 'COP_IBR_OIS_COMPOUND', 'CZK_Annual_Swap_Rate_11_00_BGCANTOR', 'CZK_Annual_Swap_Rate_Reference_Banks', 'CZK_CZEONIA', 'CZK_CZEONIA_OIS_Compound', 'CZK_PRIBOR', 'CZK_PRIBOR_PRBO', 'CZK_PRIBOR_Reference_Banks', 'DKK_CIBOR', 'DKK_CIBOR2', 'DKK_CIBOR2_Bloomberg', 'DKK_CIBOR2_DKNA13', 'DKK_CIBOR_DKNA13', 'DKK_CIBOR_DKNA13_Bloomberg', 'DKK_CIBOR_Reference_Banks', 'DKK_CITA', 'DKK_CITA_DKNA14_COMPOUND', 'DKK_DESTR', 'DKK_DESTR_Compounded_Index', 'DKK_DESTR_OIS_Compound', 'DKK_DKKOIS_OIS_COMPOUND', 'DKK_Tom_Next_OIS_Compound', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_Annual_Swap_Rate_10_00', 'EUR_Annual_Swap_Rate_10_00_BGCANTOR', 'EUR_Annual_Swap_Rate_10_00_Bloomberg', 'EUR_Annual_Swap_Rate_10_00_ICAP', 'EUR_Annual_Swap_Rate_10_00_SwapMarker', 'EUR_Annual_Swap_Rate_10_00_TRADITION', 'EUR_Annual_Swap_Rate_11_00', 'EUR_Annual_Swap_Rate_11_00_Bloomberg', 'EUR_Annual_Swap_Rate_11_00_ICAP', 'EUR_Annual_Swap_Rate_11_00_SwapMarker', 'EUR_Annual_Swap_Rate_3_Month', 'EUR_Annual_Swap_Rate_3_Month_SwapMarker', 'EUR_Annual_Swap_Rate_4_15_TRADITION', 'EUR_Annual_Swap_Rate_Reference_Banks', 'EUR_Basis_Swap_EONIA_vs_3m_EUR_IBOR_Swap_Rates_A_360_10_00_ICAP', 'EUR_CNO_TEC10', 'EUR_EONIA', 'EUR_EONIA_AVERAGE_1', 'EUR_EONIA_Average', 'EUR_EONIA_OIS_10_00_BGCANTOR', 'EUR_EONIA_OIS_10_00_ICAP', 'EUR_EONIA_OIS_10_00_TRADITION', 'EUR_EONIA_OIS_11_00_ICAP', 'EUR_EONIA_OIS_4_15_TRADITION', 'EUR_EONIA_OIS_Compound_1', 'EUR_EONIA_OIS_COMPOUND', 'EUR_EONIA_OIS_COMPOUND_Bloomberg', 'EUR_EONIA_Swap_Index', 'EUR_EURIBOR', 'EUR_EURIBOR_Act_365', 'EUR_EURIBOR_Act_365_Bloomberg', 'EUR_EURIBOR_Annual_Bond_Swap_vs_1m_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_1m_vs_3m_Euribor_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_3m_vs_6m_11_00_ICAP', 'EUR_EURIBOR_ICE_Swap_Rate_11_00', 'EUR_EURIBOR_ICE_Swap_Rate_12_00', 'EUR_EURIBOR_Reference_Banks', 'EUR_EURIBOR_Reuters', 'EUR_EURIBOR_Telerate', 'EUR_EURONIA_OIS_Compound_1', 'EUR_EURONIA_OIS_COMPOUND', 'EUR_EuroSTR', 'EUR_EuroSTR_Average_12M', 'EUR_EuroSTR_Average_1M', 'EUR_EuroSTR_Average_1W', 'EUR_EuroSTR_Average_3M', 'EUR_EuroSTR_Average_6M', 'EUR_EuroSTR_COMPOUND', 'EUR_EuroSTR_Compounded_Index', 'EUR_EuroSTR_FTSE_Term', 'EUR_EuroSTR_ICE_Compounded_Index', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_5D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_5D_Lag', 'EUR_EuroSTR_ICE_Swap_Rate', 'EUR_EuroSTR_OIS_Compound', 'EUR_EuroSTR_Term', 'EUR_ISDA_EURIBOR_Swap_Rate_11_00', 'EUR_ISDA_EURIBOR_Swap_Rate_12_00', 'EUR_ISDA_LIBOR_Swap_Rate_10_00', 'EUR_ISDA_LIBOR_Swap_Rate_11_00', 'EUR_LIBOR', 'EUR_LIBOR_BBA', 'EUR_LIBOR_BBA_Bloomberg', 'EUR_LIBOR_Reference_Banks', 'EUR_TAM_CDC', 'EUR_TEC10_CNO', 'EUR_TEC10_CNO_SwapMarker', 'EUR_TEC10_Reference_Banks', 'EUR_TEC5_CNO', 'EUR_TEC5_CNO_SwapMarker', 'EUR_TEC5_Reference_Banks', 'EUR_TMM_CDC_COMPOUND', 'EUR_USD_Basis_Swaps_11_00_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'GBP_ISDA_Swap_Rate', 'GBP_LIBOR', 'GBP_LIBOR_BBA', 'GBP_LIBOR_BBA_Bloomberg', 'GBP_LIBOR_ICE_Swap_Rate', 'GBP_LIBOR_ISDA', 'GBP_LIBOR_Reference_Banks', 'GBP_RONIA', 'GBP_RONIA_OIS_Compound', 'GBP_Semi_Annual_Swap_Rate', 'GBP_Semi_Annual_Swap_Rate_11_00_ICAP', 'GBP_Semi_Annual_Swap_Rate_11_00_TRADITION', 'GBP_Semi_Annual_Swap_Rate_4_15_TRADITION', 'GBP_Semi_Annual_Swap_Rate_Reference_Banks', 'GBP_Semi_Annual_Swap_Rate_SwapMarker26', 'GBP_SONIA', 'GBP_SONIA_COMPOUND', 'GBP_SONIA_Compounded_Index', 'GBP_SONIA_FTSE_Term', 'GBP_SONIA_ICE_Compounded_Index', 'GBP_SONIA_ICE_Compounded_Index_0_Floor', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_5D_Lag', 'GBP_SONIA_ICE_Compounded_Index_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_5D_Lag', 'GBP_SONIA_ICE_Swap_Rate', 'GBP_SONIA_ICE_Term', 'GBP_SONIA_OIS_11_00_ICAP', 'GBP_SONIA_OIS_11_00_TRADITION', 'GBP_SONIA_OIS_4_15_TRADITION', 'GBP_SONIA_OIS_Compound', 'GBP_SONIA_Swap_Rate', 'GBP_UK_Base_Rate', 'GBP_USD_Basis_Swaps_11_00_ICAP', 'GBP_WMBA_RONIA_COMPOUND', 'GBP_WMBA_SONIA_COMPOUND', 'GRD_ATHIBOR_ATHIBOR', 'GRD_ATHIBOR_Reference_Banks', 'GRD_ATHIBOR_Telerate', 'GRD_ATHIMID_Reference_Banks', 'GRD_ATHIMID_Reuters', 'HKD_HIBOR', 'HKD_HIBOR_HIBOR_', 'HKD_HIBOR_HIBOR_Bloomberg', 'HKD_HIBOR_HKAB', 'HKD_HIBOR_HKAB_Bloomberg', 'HKD_HIBOR_ISDC', 'HKD_HIBOR_Reference_Banks', 'HKD_HONIA', 'HKD_HONIA_OIS_Compound', 'HKD_HONIX_OIS_COMPOUND', 'HKD_ISDA_Swap_Rate_11_00', 'HKD_ISDA_Swap_Rate_4_00', 'HKD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_11_00_TRADITION', 'HKD_Quarterly_Annual_Swap_Rate_4_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'HKD_Quarterly_Quarterly_Swap_Rate_11_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_4_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_Reference_Banks', 'HUF_BUBOR', 'HUF_BUBOR_Reference_Banks', 'HUF_BUBOR_Reuters', 'HUF_HUFONIA', 'HUF_HUFONIA_OIS_Compound', 'IDR_IDMA_Bloomberg', 'IDR_IDRFIX', 'IDR_INDONIA', 'IDR_INDONIA_OIS_Compound', 'IDR_JIBOR', 'IDR_JIBOR_Reuters', 'IDR_SBI_Reuters', 'IDR_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'IDR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'IDR_Semi_Annual_Swap_Rate_Reference_Banks', 'IDR_SOR_Reference_Banks', 'IDR_SOR_Reuters', 'IDR_SOR_Telerate', 'ILS_SHIR', 'ILS_SHIR_OIS_Compound', 'ILS_TELBOR', 'ILS_TELBOR01_Reuters', 'ILS_TELBOR_Reference_Banks', 'INR_BMK', 'INR_CMT', 'INR_FBIL_MIBOR_OIS_COMPOUND', 'INR_INBMK_REUTERS', 'INR_MIBOR', 'INR_MIBOR_OIS', 'INR_MIBOR_OIS_Compound_1', 'INR_MIBOR_OIS_COMPOUND', 'INR_MIFOR', 'INR_MIOIS', 'INR_MITOR_OIS_COMPOUND', 'INR_Modified_MIFOR', 'INR_Reference_Banks', 'INR_Semi_Annual_Swap_Rate_11_30_BGCANTOR', 'INR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'INR_Semi_Annual_Swap_Rate_Reference_Banks', 'INR_SORR', 'INR_SORR_OIS_Compound', 'ISK_REIBOR', 'ISK_REIBOR_Reference_Banks', 'ISK_REIBOR_Reuters', 'JPY_Annual_Swap_Rate_11_00_TRADITION', 'JPY_Annual_Swap_Rate_3_00_TRADITION', 'JPY_BBSF_Bloomberg_10_00', 'JPY_BBSF_Bloomberg_15_00', 'JPY_Euroyen_TIBOR', 'JPY_ISDA_Swap_Rate_10_00', 'JPY_ISDA_Swap_Rate_15_00', 'JPY_LIBOR', 'JPY_LIBOR_BBA', 'JPY_LIBOR_BBA_Bloomberg', 'JPY_LIBOR_FRASETT', 'JPY_LIBOR_ISDA', 'JPY_LIBOR_Reference_Banks', 'JPY_LIBOR_TSR_10_00', 'JPY_LIBOR_TSR_15_00', 'JPY_LTPR_MHBK', 'JPY_LTPR_MHCB', 'JPY_LTPR_TBC', 'JPY_MUTANCALL_TONAR', 'JPY_OIS_11_00_ICAP', 'JPY_OIS_11_00_TRADITION', 'JPY_OIS_3_00_TRADITION', 'JPY_Quoting_Banks_LIBOR', 'JPY_STPR_Quoting_Banks', 'JPY_TIBOR', 'JPY_TIBOR_17096', 'JPY_TIBOR_17097', 'JPY_TIBOR_DTIBOR01', 'JPY_TIBOR_TIBM', 'JPY_TIBOR_TIBM__10_Banks_', 'JPY_TIBOR_TIBM__5_Banks_', 'JPY_TIBOR_TIBM__All_Banks_', 'JPY_TIBOR_TIBM__All_Banks__Bloomberg', 'JPY_TIBOR_TIBM_Reference_Banks', 'JPY_TIBOR_ZTIBOR', 'JPY_TONA', 'JPY_TONA_Average_180D', 'JPY_TONA_Average_30D', 'JPY_TONA_Average_90D', 'JPY_TONA_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index_0_Floor', 'JPY_TONA_ICE_Compounded_Index_0_Floor_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_0_Floor_5D_Lag', 'JPY_TONA_ICE_Compounded_Index_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_5D_Lag', 'JPY_TONA_OIS_Compound_1', 'JPY_TONA_OIS_COMPOUND', 'JPY_TONA_TSR_10_00', 'JPY_TONA_TSR_15_00', 'JPY_TORF_QUICK', 'JPY_TSR_Reference_Banks', 'JPY_TSR_Reuters_10_00', 'JPY_TSR_Reuters_15_00', 'JPY_TSR_Telerate_10_00', 'JPY_TSR_Telerate_15_00', 'JPY_USD_Basis_Swaps_11_00_ICAP', 'KRW_Bond_3222', 'KRW_CD_3220', 'KRW_CD_91D', 'KRW_CD_KSDA_Bloomberg', 'KRW_KOFR', 'KRW_KOFR_OIS_Compound', 'KRW_Quarterly_Annual_Swap_Rate_3_30_ICAP', 'MXN_TIIE', 'MXN_TIIE_Banxico', 'MXN_TIIE_Banxico_Bloomberg', 'MXN_TIIE_Banxico_Reference_Banks', 'MXN_TIIE_ON', 'MXN_TIIE_ON_OIS_Compound', 'MXN_TIIE_Reference_Banks', 'MYR_KLIBOR', 'MYR_KLIBOR_BNM', 'MYR_KLIBOR_Reference_Banks', 'MYR_MYOR', 'MYR_MYOR_OIS_Compound', 'MYR_Quarterly_Swap_Rate_11_00_TRADITION', 'MYR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'NOK_NIBOR', 'NOK_NIBOR_NIBR', 'NOK_NIBOR_NIBR_Bloomberg', 'NOK_NIBOR_NIBR_Reference_Banks', 'NOK_NIBOR_OIBOR', 'NOK_NIBOR_Reference_Banks', 'NOK_NOWA', 'NOK_NOWA_OIS_Compound', 'NZD_BBR_BID', 'NZD_BBR_FRA', 'NZD_BBR_ISDC', 'NZD_BBR_Reference_Banks', 'NZD_BBR_Telerate', 'NZD_BKBM_Bid', 'NZD_BKBM_FRA', 'NZD_BKBM_FRA_Swap_Rate_ICAP', 'NZD_NZIONA', 'NZD_NZIONA_OIS_Compound_1', 'NZD_NZIONA_OIS_COMPOUND', 'NZD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'NZD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'NZD_Swap_Rate_ICAP', 'NZD_Swap_Rate_ICAP_Reference_Banks', 'PHP_ORR', 'PHP_PHIREF', 'PHP_PHIREF_BAP', 'PHP_PHIREF_Bloomberg', 'PHP_PHIREF_Reference_Banks', 'PHP_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'PHP_Semi_Annual_Swap_Rate_Reference_Banks', 'PLN_POLONIA', 'PLN_POLONIA_OIS_Compound_1', 'PLN_POLONIA_OIS_COMPOUND', 'PLN_POLSTR', 'PLN_POLSTR_OIS_Compound', 'PLN_WIBID', 'PLN_WIBOR', 'PLN_WIBOR_Reference_Banks', 'PLN_WIBOR_WIBO', 'PLN_WIRON', 'PLN_WIRON_OIS_Compound', 'PLZ_WIBOR_Reference_Banks', 'PLZ_WIBOR_WIBO', 'REPOFUNDS_RATE_FRANCE_OIS_COMPOUND', 'REPOFUNDS_RATE_GERMANY_OIS_COMPOUND', 'REPOFUNDS_RATE_ITALY_OIS_COMPOUND', 'RON_Annual_Swap_Rate_11_00_BGCANTOR', 'RON_Annual_Swap_Rate_Reference_Banks', 'RON_RBOR_Reuters', 'RON_ROBID', 'RON_ROBOR', 'RUB_Annual_Swap_Rate_11_00_BGCANTOR', 'RUB_Annual_Swap_Rate_12_45_TRADITION', 'RUB_Annual_Swap_Rate_4_15_TRADITION', 'RUB_Annual_Swap_Rate_Reference_Banks', 'RUB_Annual_Swap_Rate_TRADITION_Reference_Banks', 'RUB_Key_Rate_CBRF', 'RUB_MosPrime', 'RUB_MOSPRIME_NFEA', 'RUB_MOSPRIME_Reference_Banks', 'RUB_RUONIA', 'RUB_RUONIA_OIS_Compound_1', 'RUB_RUONIA_OIS_COMPOUND', 'SAR_SAIBOR', 'SAR_SRIOR_Reference_Banks', 'SAR_SRIOR_SUAA', 'SEK_Annual_Swap_Rate', 'SEK_Annual_Swap_Rate_SESWFI', 'SEK_SIOR_OIS_COMPOUND', 'SEK_STIBOR', 'SEK_STIBOR_Bloomberg', 'SEK_STIBOR_OIS_Compound', 'SEK_STIBOR_Reference_Banks', 'SEK_STIBOR_SIDE', 'SEK_SWESTR', 'SEK_SWESTR_Average_1M', 'SEK_SWESTR_Average_1W', 'SEK_SWESTR_Average_2M', 'SEK_SWESTR_Average_3M', 'SEK_SWESTR_Average_6M', 'SEK_SWESTR_Compounded_Index', 'SEK_SWESTR_OIS_Compound', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'SGD_Semi_Annual_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_TRADITION', 'SGD_Semi_Annual_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_ICAP', 'SGD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'SGD_SIBOR', 'SGD_SIBOR_Reference_Banks', 'SGD_SIBOR_Reuters', 'SGD_SIBOR_Telerate', 'SGD_SONAR_OIS_COMPOUND', 'SGD_SONAR_OIS_VWAP_COMPOUND', 'SGD_SOR', 'SGD_SORA', 'SGD_SORA_COMPOUND', 'SGD_SORA_OIS_Compound', 'SGD_SOR_Reference_Banks', 'SGD_SOR_Reuters', 'SGD_SOR_Telerate', 'SGD_SOR_VWAP', 'SGD_SOR_VWAP_Reference_Banks', 'SKK_BRIBOR_Bloomberg', 'SKK_BRIBOR_BRBO', 'SKK_BRIBOR_NBSK07', 'SKK_BRIBOR_Reference_Banks', 'THB_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'THB_Semi_Annual_Swap_Rate_Reference_Banks', 'THB_SOR_Reference_Banks', 'THB_SOR_Reuters', 'THB_SOR_Telerate', 'THB_THBFIX', 'THB_THBFIX_Reference_Banks', 'THB_THBFIX_Reuters', 'THB_THOR', 'THB_THOR_COMPOUND', 'THB_THOR_OIS_Compound', 'TRY_Annual_Swap_Rate_11_00_TRADITION', 'TRY_Annual_Swap_Rate_11_15_BGCANTOR', 'TRY_Annual_Swap_Rate_Reference_Banks', 'TRY_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'TRY_TLREF', 'TRY_TLREF_OIS_Compound_1', 'TRY_TLREF_OIS_COMPOUND', 'TRY_TRLIBOR', 'TRY_TRYIBOR_Reference_Banks', 'TRY_TRYIBOR_Reuters', 'TWD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'TWD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'TWD_Reference_Dealers', 'TWD_Reuters_6165', 'TWD_TAIBIR01', 'TWD_TAIBIR02', 'TWD_TAIBOR', 'TWD_TAIBOR_Bloomberg', 'TWD_TAIBOR_Reuters', 'TWD_Telerate_6165', 'TWD_TWCPBA', 'UK_Base_Rate', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_AMERIBOR', 'USD_AMERIBOR_Average_30D', 'USD_AMERIBOR_Average_90D', 'USD_AMERIBOR_Term', 'USD_AMERIBOR_Term_Structure', 'USD_Annual_Swap_Rate_11_00_BGCANTOR', 'USD_Annual_Swap_Rate_11_00_TRADITION', 'USD_Annual_Swap_Rate_4_00_TRADITION', 'USD_AXI_Term', 'USD_BA_H_15', 'USD_BA_Reference_Dealers', 'USD_BMA_Municipal_Swap_Index', 'USD_BSBY', 'USD_CD_H_15', 'USD_CD_Reference_Dealers', 'USD_CMS_Reference_Banks', 'USD_CMS_Reference_Banks_ICAP_SwapPX', 'USD_CMS_Reuters', 'USD_CMS_Telerate', 'USD_CMT', 'USD_CMT_Average_1W', 'USD_CMT_T7051', 'USD_CMT_T7052', 'USD_COF11_FHLBSF', 'USD_COF11_Reuters', 'USD_COF11_Telerate', 'USD_COFI', 'USD_CP_H_15', 'USD_CP_Money_Market_Yield', 'USD_CP_Reference_Dealers', 'USD_CRITR', 'USD_Federal_Funds', 'USD_Federal_Funds_H_15', 'USD_Federal_Funds_H_15_Bloomberg', 'USD_Federal_Funds_H_15_OIS_COMPOUND', 'USD_Federal_Funds_OIS_Compound', 'USD_Federal_Funds_Reference_Dealers', 'USD_FFCB_DISCO', 'USD_FXI_Term', 'USD_ISDAFIX3_Swap_Rate', 'USD_ISDAFIX3_Swap_Rate_3_00', 'USD_ISDA_Swap_Rate', 'USD_ISDA_Swap_Rate_3_00', 'USD_LIBOR', 'USD_LIBOR_BBA', 'USD_LIBOR_BBA_Bloomberg', 'USD_LIBOR_ICE_Swap_Rate_11_00', 'USD_LIBOR_ICE_Swap_Rate_15_00', 'USD_LIBOR_ISDA', 'USD_LIBOR_LIBO', 'USD_LIBOR_Reference_Banks', 'USD_Municipal_Swap_Index', 'USD_Municipal_Swap_Libor_Ratio_11_00_ICAP', 'USD_Municipal_Swap_Rate_11_00_ICAP', 'USD_OIS_11_00_BGCANTOR', 'USD_OIS_11_00_LON_ICAP', 'USD_OIS_11_00_NY_ICAP', 'USD_OIS_11_00_TRADITION', 'USD_OIS_3_00_BGCANTOR', 'USD_OIS_3_00_NY_ICAP', 'USD_OIS_4_00_TRADITION', 'USD_Overnight_Bank_Funding_Rate', 'USD_Prime', 'USD_Prime_H_15', 'USD_Prime_Reference_Banks', 'USD_S_P_Index_High_Grade', 'USD_SandP_Index_High_Grade', 'USD_SIBOR_Reference_Banks', 'USD_SIBOR_SIBO', 'USD_SIFMA_Municipal_Swap_Index', 'USD_SOFR', 'USD_SOFR_Average_180D', 'USD_SOFR_Average_30D', 'USD_SOFR_Average_90D', 'USD_SOFR_CME_Term', 'USD_SOFR_COMPOUND', 'USD_SOFR_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index_0_Floor', 'USD_SOFR_ICE_Compounded_Index_0_Floor_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_0_Floor_5D_Lag', 'USD_SOFR_ICE_Compounded_Index_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_5D_Lag', 'USD_SOFR_ICE_Swap_Rate', 'USD_SOFR_ICE_Swap_Rate_Spreads', 'USD_SOFR_ICE_Term', 'USD_SOFR_OIS_Compound', 'USD_Swap_Rate_BCMP1', 'USD_TBILL_Auction_High_Rate', 'USD_TBILL_H_15', 'USD_TBILL_H_15_Bloomberg', 'USD_TBILL_Secondary_Market', 'USD_TBILL_Secondary_Market_Bond_Equivalent_Yield', 'USD_TIBOR_ISDC', 'USD_TIBOR_Reference_Banks', 'USD_Treasury_19901_3_00_ICAP', 'USD_Treasury_Rate_BCMP1', 'USD_Treasury_Rate_ICAP_BrokerTec', 'USD_Treasury_Rate_SwapMarker100', 'USD_Treasury_Rate_SwapMarker99', 'USD_Treasury_Rate_T19901', 'USD_Treasury_Rate_T500', 'VND_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'VND_Semi_Annual_Swap_Rate_Reference_Banks', 'ZAR_DEPOSIT_Reference_Banks', 'ZAR_DEPOSIT_SAFEX', 'ZAR_JIBAR', 'ZAR_JIBAR_Reference_Banks', 'ZAR_JIBAR_SAFEX', 'ZAR_Prime_Average_1', 'ZAR_PRIME_AVERAGE', 'ZAR_PRIME_AVERAGE_Reference_Banks', 'ZAR_Quarterly_Swap_Rate_1_00_TRADITION', 'ZAR_Quarterly_Swap_Rate_5_30_TRADITION', 'ZAR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'ZAR_ZARONIA', 'ZAR_ZARONIA_OIS_Compound'))

UNION ALL

SELECT 'FloatingRateIndexExternalMap' AS table_name, 'externalId' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingRateIndexExternalMap" 
WHERE "FloatingRateIndexExternalMap"."externalId" IS NULL

UNION ALL

SELECT 'FloatingRateIndexFixingTime' AS table_name, 'hourMinuteTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingRateIndexFixingTime" 
WHERE "FloatingRateIndexFixingTime"."hourMinuteTime" IS NULL

UNION ALL

SELECT 'FloatingRateIndexFixingTime' AS table_name, 'businessCenter' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingRateIndexFixingTime" 
WHERE "FloatingRateIndexFixingTime"."businessCenter" IS NULL

UNION ALL

SELECT 'FloatingRateIndexFixingOffset' AS table_name, 'periodMultiplier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingRateIndexFixingOffset" 
WHERE "FloatingRateIndexFixingOffset"."periodMultiplier" IS NULL

UNION ALL

SELECT 'FloatingRateIndexFixingOffset' AS table_name, 'period' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingRateIndexFixingOffset" 
WHERE "FloatingRateIndexFixingOffset".period IS NULL

UNION ALL

SELECT 'FloatingRateIndexFixingOffset' AS table_name, 'period' AS column_name, 'enum' AS constraint_type, id AS record_id, period AS invalid_value 
FROM "FloatingRateIndexFixingOffset" 
WHERE "FloatingRateIndexFixingOffset".period IS NOT NULL AND ("FloatingRateIndexFixingOffset".period NOT IN ('D', 'W', 'M', 'Y'))

UNION ALL

SELECT 'BusinessDayOffset' AS table_name, 'periodMultiplier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BusinessDayOffset" 
WHERE "BusinessDayOffset"."periodMultiplier" IS NULL

UNION ALL

SELECT 'BusinessDayOffset' AS table_name, 'period' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BusinessDayOffset" 
WHERE "BusinessDayOffset".period IS NULL

UNION ALL

SELECT 'BusinessDayOffset' AS table_name, 'period' AS column_name, 'enum' AS constraint_type, id AS record_id, period AS invalid_value 
FROM "BusinessDayOffset" 
WHERE "BusinessDayOffset".period IS NOT NULL AND ("BusinessDayOffset".period NOT IN ('D', 'W', 'M', 'Y'))

UNION ALL

SELECT 'Trigger' AS table_name, 'triggerType' AS column_name, 'enum' AS constraint_type, id AS record_id, "triggerType" AS invalid_value 
FROM "Trigger" 
WHERE "Trigger"."triggerType" IS NOT NULL AND ("Trigger"."triggerType" NOT IN ('EqualOrLess', 'EqualOrGreater', 'Equal', 'Less', 'Greater'))

UNION ALL

SELECT 'Trigger' AS table_name, 'triggerTimeType' AS column_name, 'enum' AS constraint_type, id AS record_id, "triggerTimeType" AS invalid_value 
FROM "Trigger" 
WHERE "Trigger"."triggerTimeType" IS NOT NULL AND ("Trigger"."triggerTimeType" NOT IN ('Closing', 'Anytime'))

UNION ALL

SELECT 'TriggerEvent' AS table_name, 'trigger' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TriggerEvent" 
WHERE "TriggerEvent"."trigger" IS NULL

UNION ALL

SELECT 'CreditEventNotice' AS table_name, 'notifyingParty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditEventNotice" 
WHERE "CreditEventNotice"."notifyingParty" IS NULL

UNION ALL

SELECT 'CreditEventNotice' AS table_name, 'notifyingParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "notifyingParty" AS invalid_value 
FROM "CreditEventNotice" 
WHERE "CreditEventNotice"."notifyingParty" IS NOT NULL AND ("CreditEventNotice"."notifyingParty" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'FailureToPay' AS table_name, 'applicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FailureToPay" 
WHERE "FailureToPay".applicable IS NULL

UNION ALL

SELECT 'GracePeriodExtension' AS table_name, 'applicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "GracePeriodExtension" 
WHERE "GracePeriodExtension".applicable IS NULL

UNION ALL

SELECT 'Restructuring' AS table_name, 'applicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Restructuring" 
WHERE "Restructuring".applicable IS NULL

UNION ALL

SELECT 'Restructuring' AS table_name, 'restructuringType' AS column_name, 'enum' AS constraint_type, id AS record_id, "restructuringType" AS invalid_value 
FROM "Restructuring" 
WHERE "Restructuring"."restructuringType" IS NOT NULL AND ("Restructuring"."restructuringType" NOT IN ('ModModR', 'ModR', 'R'))

UNION ALL

SELECT 'FeaturePayment' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FeaturePayment" 
WHERE "FeaturePayment"."payerReceiver" IS NULL

UNION ALL

SELECT 'FeaturePayment' AS table_name, 'time' AS column_name, 'enum' AS constraint_type, id AS record_id, time AS invalid_value 
FROM "FeaturePayment" 
WHERE "FeaturePayment".time IS NOT NULL AND ("FeaturePayment".time NOT IN ('Close', 'Open', 'OSP', 'SpecificTime', 'XETRA', 'DerivativesClose', 'AsSpecifiedInMasterConfirmation'))

UNION ALL

SELECT 'Observation' AS table_name, 'observedValue' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Observation" 
WHERE "Observation"."observedValue" IS NULL

UNION ALL

SELECT 'Observation' AS table_name, 'observationIdentifier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Observation" 
WHERE "Observation"."observationIdentifier" IS NULL

UNION ALL

SELECT 'ObservationIdentifier' AS table_name, 'observable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ObservationIdentifier" 
WHERE "ObservationIdentifier".observable IS NULL

UNION ALL

SELECT 'ObservationIdentifier' AS table_name, 'observationDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ObservationIdentifier" 
WHERE "ObservationIdentifier"."observationDate" IS NULL

UNION ALL

SELECT 'DeterminationMethodology' AS table_name, 'determinationMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "determinationMethod" AS invalid_value 
FROM "DeterminationMethodology" 
WHERE "DeterminationMethodology"."determinationMethod" IS NOT NULL AND ("DeterminationMethodology"."determinationMethod" NOT IN ('AgreedInitialPrice', 'AsSpecifiedInMasterConfirmation', 'CalculationAgent', 'ClosingPrice', 'DividendCurrency', 'ExpiringContractLevel', 'HedgeExecution', 'IssuerPaymentCurrency', 'NAV', 'OpenPrice', 'OSPPrice', 'SettlementCurrency', 'StrikeDateDetermination', 'TWAPPrice', 'TWAPVE', 'TWAPVEExcludingClose', 'ValuationTime', 'VWAPPrice', 'VWAPVE', 'VWAPVEExcludingClose'))

UNION ALL

SELECT 'DeterminationMethodology' AS table_name, 'averagingMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "averagingMethod" AS invalid_value 
FROM "DeterminationMethodology" 
WHERE "DeterminationMethodology"."averagingMethod" IS NOT NULL AND ("DeterminationMethodology"."averagingMethod" NOT IN ('Arithmetic', 'Geometric', 'Harmonic'))

UNION ALL

SELECT 'CommodityPayout' AS table_name, 'pricingDates' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CommodityPayout" 
WHERE "CommodityPayout"."pricingDates" IS NULL

UNION ALL

SELECT 'CommodityPayout' AS table_name, 'paymentDates' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CommodityPayout" 
WHERE "CommodityPayout"."paymentDates" IS NULL

UNION ALL

SELECT 'CommodityPayout' AS table_name, 'underlier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CommodityPayout" 
WHERE "CommodityPayout".underlier IS NULL

UNION ALL

SELECT 'CommodityPayout' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CommodityPayout" 
WHERE "CommodityPayout"."payerReceiver" IS NULL

UNION ALL

SELECT 'AssetDeliveryInformation' AS table_name, 'commodityGrade' AS column_name, 'enum' AS constraint_type, id AS record_id, "commodityGrade" AS invalid_value 
FROM "AssetDeliveryInformation" 
WHERE "AssetDeliveryInformation"."commodityGrade" IS NOT NULL AND ("AssetDeliveryInformation"."commodityGrade" NOT IN ('_0_1_Percent', '_0_5_Percent', '_1_0_Percent', '_10_PPM', '_10_PPM_95_R', '_10_PPM_Premium_Unleaded', '_10_PPM_Regular_Unleaded', '_180_CST', '_3_5_Percent', '_380_CST', '_50_PPM', '_54', '_55', '_87_M', '_87_Unleaded', '_87_Unleaded_ULS_30', '_92_Unleaded', '_93_Unleaded', '_95_Unleaded', '_97_Unleaded', '_98_Unleaded', 'Arabian_Light', 'Brass_Blend', 'Brent', 'CARBOB', 'CBOB', 'Cold_Lake', 'Dubai', 'Edmonton_High_Sulphur_Sour', 'EUROBOB', 'German_10PPM', 'Gulf_Coast_Sweet', 'Hardisty_Light', 'Iranian_Light_1', 'Iranian_Light', 'Jet', 'Kirkuk_Light', 'Kuwait', 'Light_Louisiana_Sweet', 'Low_Sulphur', 'Low_Sulphur_Jet', 'Mars', 'Mixed_Sour_Blend', 'Mixed_Sweet_Blend', 'Murban', 'Natural_Gasoline', 'No__2', 'No__6_0_3_Percent', 'No__6_0_3_Percent_HP', 'No__6_0_3_Percent_LP', 'No__6_0_7_Percent', 'No__6_1_0_Percent', 'No__6_2_2_Percent', 'No__6_3_Percent', 'Normal_Butane', 'North_Dakota_Light', 'Oman', 'Polymer_Grade', 'RBOB', 'Saharan', 'Sour', 'Southern_Green_Canyon', 'Tapis', 'Thunder_Horse', 'Ultra_Low_Sulphur', 'Urals', 'Urals_Sour', 'US_Regular_Unleaded', 'Western_Canadian_Select', 'WTI', 'WTS', 'Zuetina'))

UNION ALL

SELECT 'AssetDeliveryProfile' AS table_name, 'loadType' AS column_name, 'enum' AS constraint_type, id AS record_id, "loadType" AS invalid_value 
FROM "AssetDeliveryProfile" 
WHERE "AssetDeliveryProfile"."loadType" IS NOT NULL AND ("AssetDeliveryProfile"."loadType" NOT IN ('BaseLoad', 'PeakLoad', 'OffPeak', 'BlockHours', 'Shaped', 'GasDay', 'Other'))

UNION ALL

SELECT 'AssetDeliveryProfile' AS table_name, 'bankHolidaysTreatment' AS column_name, 'enum' AS constraint_type, id AS record_id, "bankHolidaysTreatment" AS invalid_value 
FROM "AssetDeliveryProfile" 
WHERE "AssetDeliveryProfile"."bankHolidaysTreatment" IS NOT NULL AND ("AssetDeliveryProfile"."bankHolidaysTreatment" NOT IN ('AsWeekday', 'AsWeekend'))

UNION ALL

SELECT 'AssetDeliveryProfileBlock' AS table_name, 'dayOfWeek' AS column_name, 'enum' AS constraint_type, id AS record_id, "dayOfWeek" AS invalid_value 
FROM "AssetDeliveryProfileBlock" 
WHERE "AssetDeliveryProfileBlock"."dayOfWeek" IS NOT NULL AND ("AssetDeliveryProfileBlock"."dayOfWeek" NOT IN ('MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'))

UNION ALL

SELECT 'CreditDefaultPayout' AS table_name, 'generalTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditDefaultPayout" 
WHERE "CreditDefaultPayout"."generalTerms" IS NULL

UNION ALL

SELECT 'CreditDefaultPayout' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CreditDefaultPayout" 
WHERE "CreditDefaultPayout"."payerReceiver" IS NULL

UNION ALL

SELECT 'InterestRatePayout' AS table_name, 'dayCountFraction' AS column_name, 'enum' AS constraint_type, id AS record_id, "dayCountFraction" AS invalid_value 
FROM "InterestRatePayout" 
WHERE "InterestRatePayout"."dayCountFraction" IS NOT NULL AND ("InterestRatePayout"."dayCountFraction" NOT IN ('ACT_360', 'ACT_365L', 'ACT_364', 'ACT_365_FIXED', 'ACT_ACT_AFB', 'ACT_ACT_ICMA', 'ACT_ACT_ISDA', 'ACT_ACT_ISMA', 'CAL_252', '_1_1', '_30E_360', '_30E_360_ISDA', '_30_360', 'RBA_BOND_BASIS'))

UNION ALL

SELECT 'InterestRatePayout' AS table_name, 'compoundingMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "compoundingMethod" AS invalid_value 
FROM "InterestRatePayout" 
WHERE "InterestRatePayout"."compoundingMethod" IS NOT NULL AND ("InterestRatePayout"."compoundingMethod" NOT IN ('Flat', 'None', 'Straight', 'SpreadExclusive'))

UNION ALL

SELECT 'InterestRatePayout' AS table_name, 'spreadCalculationMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "spreadCalculationMethod" AS invalid_value 
FROM "InterestRatePayout" 
WHERE "InterestRatePayout"."spreadCalculationMethod" IS NOT NULL AND ("InterestRatePayout"."spreadCalculationMethod" NOT IN ('ParPar', 'Proceeds'))

UNION ALL

SELECT 'InterestRatePayout' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InterestRatePayout" 
WHERE "InterestRatePayout"."payerReceiver" IS NULL

UNION ALL

SELECT 'DividendPayoutRatio' AS table_name, 'totalRatio' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DividendPayoutRatio" 
WHERE "DividendPayoutRatio"."totalRatio" IS NULL

UNION ALL

SELECT 'BasketReferenceInformation' AS table_name, 'referencePool' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BasketReferenceInformation" 
WHERE "BasketReferenceInformation"."referencePool" IS NULL

UNION ALL

SELECT 'InterestShortFall' AS table_name, 'interestShortfallCap' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InterestShortFall" 
WHERE "InterestShortFall"."interestShortfallCap" IS NULL

UNION ALL

SELECT 'InterestShortFall' AS table_name, 'interestShortfallCap' AS column_name, 'enum' AS constraint_type, id AS record_id, "interestShortfallCap" AS invalid_value 
FROM "InterestShortFall" 
WHERE "InterestShortFall"."interestShortfallCap" IS NOT NULL AND ("InterestShortFall"."interestShortfallCap" NOT IN ('Fixed', 'Variable'))

UNION ALL

SELECT 'InterestShortFall' AS table_name, 'compounding' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InterestShortFall" 
WHERE "InterestShortFall".compounding IS NULL

UNION ALL

SELECT 'InterestShortFall' AS table_name, 'rateSource' AS column_name, 'enum' AS constraint_type, id AS record_id, "rateSource" AS invalid_value 
FROM "InterestShortFall" 
WHERE "InterestShortFall"."rateSource" IS NOT NULL AND ("InterestShortFall"."rateSource" NOT IN ('AED_EBOR_Reuters', 'AED_EIBOR', 'AUD_AONIA', 'AUD_AONIA_OIS_Compound_1', 'AUD_AONIA_OIS_COMPOUND', 'AUD_AONIA_OIS_COMPOUND_SwapMarker', 'AUD_BBR_AUBBSW', 'AUD_BBR_BBSW', 'AUD_BBR_BBSW_Bloomberg', 'AUD_BBR_BBSY__BID_', 'AUD_BBR_ISDC', 'AUD_BBSW', 'AUD_BBSW_Quarterly_Swap_Rate_ICAP', 'AUD_BBSW_Semi_Annual_Swap_Rate_ICAP', 'AUD_BBSY_Bid', 'AUD_LIBOR_BBA', 'AUD_LIBOR_BBA_Bloomberg', 'AUD_LIBOR_Reference_Banks', 'AUD_Quarterly_Swap_Rate_ICAP', 'AUD_Quarterly_Swap_Rate_ICAP_Reference_Banks', 'AUD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'AUD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'AUD_Semi_annual_Swap_Rate_ICAP', 'AUD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'AUD_Swap_Rate_Reuters', 'BRL_CDI', 'CAD_BA_CDOR', 'CAD_BA_CDOR_Bloomberg', 'CAD_BA_ISDD', 'CAD_BA_Reference_Banks', 'CAD_BA_Reuters', 'CAD_BA_Telerate', 'CAD_CDOR', 'CAD_CORRA', 'CAD_CORRA_CanDeal_TMX_Term', 'CAD_CORRA_Compounded_Index', 'CAD_CORRA_OIS_Compound_1', 'CAD_CORRA_OIS_COMPOUND', 'CAD_ISDA_Swap_Rate', 'CAD_LIBOR_BBA', 'CAD_LIBOR_BBA_Bloomberg', 'CAD_LIBOR_BBA_SwapMarker', 'CAD_LIBOR_Reference_Banks', 'CAD_REPO_CORRA', 'CAD_TBILL_ISDD', 'CAD_TBILL_Reference_Banks', 'CAD_TBILL_Reuters', 'CAD_TBILL_Telerate', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_6M_LIBORSWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_Annual_Swap_Rate', 'CHF_Annual_Swap_Rate_11_00_ICAP', 'CHF_Annual_Swap_Rate_Reference_Banks', 'CHF_Basis_Swap_3m_vs_6m_LIBOR_11_00_ICAP', 'CHF_ISDAFIX_Swap_Rate', 'CHF_LIBOR', 'CHF_LIBOR_BBA', 'CHF_LIBOR_BBA_Bloomberg', 'CHF_LIBOR_ISDA', 'CHF_LIBOR_Reference_Banks', 'CHF_OIS_11_00_ICAP', 'CHF_SARON', 'CHF_SARON_Average_12M', 'CHF_SARON_Average_1M', 'CHF_SARON_Average_1W', 'CHF_SARON_Average_2M', 'CHF_SARON_Average_3M', 'CHF_SARON_Average_6M', 'CHF_SARON_Average_9M', 'CHF_SARON_Compounded_Index', 'CHF_SARON_OIS_Compound_1', 'CHF_SARON_OIS_COMPOUND', 'CHF_TOIS_OIS_COMPOUND', 'CHF_USD_Basis_Swaps_11_00_ICAP', 'CL_CLICP_Bloomberg', 'CLP_ICP', 'CLP_TNA', 'CNH_HIBOR', 'CNH_HIBOR_Reference_Banks', 'CNH_HIBOR_TMA', 'CNY_7_Repo_Compounding_Date', 'CNY_CNREPOFIX_CFXS_Reuters', 'CNY_Deposit_Rate', 'CNY_Fixing_Repo_Rate', 'CNY_LPR', 'CNY_PBOCB_Reuters', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION_Reference_Banks', 'CNY_Quarterly_7D_Repo_NDS_Rate_Tradition', 'CNY_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'CNY_Semi_Annual_Swap_Rate_Reference_Banks', 'CNY_SHIBOR', 'CNY_SHIBOR_OIS_Compound', 'CNY_Shibor_OIS_Compounding', 'CNY_SHIBOR_Reuters', 'COP_IBR_OIS_Compound_1', 'COP_IBR_OIS_COMPOUND', 'CZK_Annual_Swap_Rate_11_00_BGCANTOR', 'CZK_Annual_Swap_Rate_Reference_Banks', 'CZK_CZEONIA', 'CZK_CZEONIA_OIS_Compound', 'CZK_PRIBOR', 'CZK_PRIBOR_PRBO', 'CZK_PRIBOR_Reference_Banks', 'DKK_CIBOR', 'DKK_CIBOR2', 'DKK_CIBOR2_Bloomberg', 'DKK_CIBOR2_DKNA13', 'DKK_CIBOR_DKNA13', 'DKK_CIBOR_DKNA13_Bloomberg', 'DKK_CIBOR_Reference_Banks', 'DKK_CITA', 'DKK_CITA_DKNA14_COMPOUND', 'DKK_DESTR', 'DKK_DESTR_Compounded_Index', 'DKK_DESTR_OIS_Compound', 'DKK_DKKOIS_OIS_COMPOUND', 'DKK_Tom_Next_OIS_Compound', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_Annual_Swap_Rate_10_00', 'EUR_Annual_Swap_Rate_10_00_BGCANTOR', 'EUR_Annual_Swap_Rate_10_00_Bloomberg', 'EUR_Annual_Swap_Rate_10_00_ICAP', 'EUR_Annual_Swap_Rate_10_00_SwapMarker', 'EUR_Annual_Swap_Rate_10_00_TRADITION', 'EUR_Annual_Swap_Rate_11_00', 'EUR_Annual_Swap_Rate_11_00_Bloomberg', 'EUR_Annual_Swap_Rate_11_00_ICAP', 'EUR_Annual_Swap_Rate_11_00_SwapMarker', 'EUR_Annual_Swap_Rate_3_Month', 'EUR_Annual_Swap_Rate_3_Month_SwapMarker', 'EUR_Annual_Swap_Rate_4_15_TRADITION', 'EUR_Annual_Swap_Rate_Reference_Banks', 'EUR_Basis_Swap_EONIA_vs_3m_EUR_IBOR_Swap_Rates_A_360_10_00_ICAP', 'EUR_CNO_TEC10', 'EUR_EONIA', 'EUR_EONIA_AVERAGE_1', 'EUR_EONIA_Average', 'EUR_EONIA_OIS_10_00_BGCANTOR', 'EUR_EONIA_OIS_10_00_ICAP', 'EUR_EONIA_OIS_10_00_TRADITION', 'EUR_EONIA_OIS_11_00_ICAP', 'EUR_EONIA_OIS_4_15_TRADITION', 'EUR_EONIA_OIS_Compound_1', 'EUR_EONIA_OIS_COMPOUND', 'EUR_EONIA_OIS_COMPOUND_Bloomberg', 'EUR_EONIA_Swap_Index', 'EUR_EURIBOR', 'EUR_EURIBOR_Act_365', 'EUR_EURIBOR_Act_365_Bloomberg', 'EUR_EURIBOR_Annual_Bond_Swap_vs_1m_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_1m_vs_3m_Euribor_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_3m_vs_6m_11_00_ICAP', 'EUR_EURIBOR_ICE_Swap_Rate_11_00', 'EUR_EURIBOR_ICE_Swap_Rate_12_00', 'EUR_EURIBOR_Reference_Banks', 'EUR_EURIBOR_Reuters', 'EUR_EURIBOR_Telerate', 'EUR_EURONIA_OIS_Compound_1', 'EUR_EURONIA_OIS_COMPOUND', 'EUR_EuroSTR', 'EUR_EuroSTR_Average_12M', 'EUR_EuroSTR_Average_1M', 'EUR_EuroSTR_Average_1W', 'EUR_EuroSTR_Average_3M', 'EUR_EuroSTR_Average_6M', 'EUR_EuroSTR_COMPOUND', 'EUR_EuroSTR_Compounded_Index', 'EUR_EuroSTR_FTSE_Term', 'EUR_EuroSTR_ICE_Compounded_Index', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_5D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_5D_Lag', 'EUR_EuroSTR_ICE_Swap_Rate', 'EUR_EuroSTR_OIS_Compound', 'EUR_EuroSTR_Term', 'EUR_ISDA_EURIBOR_Swap_Rate_11_00', 'EUR_ISDA_EURIBOR_Swap_Rate_12_00', 'EUR_ISDA_LIBOR_Swap_Rate_10_00', 'EUR_ISDA_LIBOR_Swap_Rate_11_00', 'EUR_LIBOR', 'EUR_LIBOR_BBA', 'EUR_LIBOR_BBA_Bloomberg', 'EUR_LIBOR_Reference_Banks', 'EUR_TAM_CDC', 'EUR_TEC10_CNO', 'EUR_TEC10_CNO_SwapMarker', 'EUR_TEC10_Reference_Banks', 'EUR_TEC5_CNO', 'EUR_TEC5_CNO_SwapMarker', 'EUR_TEC5_Reference_Banks', 'EUR_TMM_CDC_COMPOUND', 'EUR_USD_Basis_Swaps_11_00_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'GBP_ISDA_Swap_Rate', 'GBP_LIBOR', 'GBP_LIBOR_BBA', 'GBP_LIBOR_BBA_Bloomberg', 'GBP_LIBOR_ICE_Swap_Rate', 'GBP_LIBOR_ISDA', 'GBP_LIBOR_Reference_Banks', 'GBP_RONIA', 'GBP_RONIA_OIS_Compound', 'GBP_Semi_Annual_Swap_Rate', 'GBP_Semi_Annual_Swap_Rate_11_00_ICAP', 'GBP_Semi_Annual_Swap_Rate_11_00_TRADITION', 'GBP_Semi_Annual_Swap_Rate_4_15_TRADITION', 'GBP_Semi_Annual_Swap_Rate_Reference_Banks', 'GBP_Semi_Annual_Swap_Rate_SwapMarker26', 'GBP_SONIA', 'GBP_SONIA_COMPOUND', 'GBP_SONIA_Compounded_Index', 'GBP_SONIA_FTSE_Term', 'GBP_SONIA_ICE_Compounded_Index', 'GBP_SONIA_ICE_Compounded_Index_0_Floor', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_5D_Lag', 'GBP_SONIA_ICE_Compounded_Index_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_5D_Lag', 'GBP_SONIA_ICE_Swap_Rate', 'GBP_SONIA_ICE_Term', 'GBP_SONIA_OIS_11_00_ICAP', 'GBP_SONIA_OIS_11_00_TRADITION', 'GBP_SONIA_OIS_4_15_TRADITION', 'GBP_SONIA_OIS_Compound', 'GBP_SONIA_Swap_Rate', 'GBP_UK_Base_Rate', 'GBP_USD_Basis_Swaps_11_00_ICAP', 'GBP_WMBA_RONIA_COMPOUND', 'GBP_WMBA_SONIA_COMPOUND', 'GRD_ATHIBOR_ATHIBOR', 'GRD_ATHIBOR_Reference_Banks', 'GRD_ATHIBOR_Telerate', 'GRD_ATHIMID_Reference_Banks', 'GRD_ATHIMID_Reuters', 'HKD_HIBOR', 'HKD_HIBOR_HIBOR_', 'HKD_HIBOR_HIBOR_Bloomberg', 'HKD_HIBOR_HKAB', 'HKD_HIBOR_HKAB_Bloomberg', 'HKD_HIBOR_ISDC', 'HKD_HIBOR_Reference_Banks', 'HKD_HONIA', 'HKD_HONIA_OIS_Compound', 'HKD_HONIX_OIS_COMPOUND', 'HKD_ISDA_Swap_Rate_11_00', 'HKD_ISDA_Swap_Rate_4_00', 'HKD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_11_00_TRADITION', 'HKD_Quarterly_Annual_Swap_Rate_4_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'HKD_Quarterly_Quarterly_Swap_Rate_11_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_4_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_Reference_Banks', 'HUF_BUBOR', 'HUF_BUBOR_Reference_Banks', 'HUF_BUBOR_Reuters', 'HUF_HUFONIA', 'HUF_HUFONIA_OIS_Compound', 'IDR_IDMA_Bloomberg', 'IDR_IDRFIX', 'IDR_INDONIA', 'IDR_INDONIA_OIS_Compound', 'IDR_JIBOR', 'IDR_JIBOR_Reuters', 'IDR_SBI_Reuters', 'IDR_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'IDR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'IDR_Semi_Annual_Swap_Rate_Reference_Banks', 'IDR_SOR_Reference_Banks', 'IDR_SOR_Reuters', 'IDR_SOR_Telerate', 'ILS_SHIR', 'ILS_SHIR_OIS_Compound', 'ILS_TELBOR', 'ILS_TELBOR01_Reuters', 'ILS_TELBOR_Reference_Banks', 'INR_BMK', 'INR_CMT', 'INR_FBIL_MIBOR_OIS_COMPOUND', 'INR_INBMK_REUTERS', 'INR_MIBOR', 'INR_MIBOR_OIS', 'INR_MIBOR_OIS_Compound_1', 'INR_MIBOR_OIS_COMPOUND', 'INR_MIFOR', 'INR_MIOIS', 'INR_MITOR_OIS_COMPOUND', 'INR_Modified_MIFOR', 'INR_Reference_Banks', 'INR_Semi_Annual_Swap_Rate_11_30_BGCANTOR', 'INR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'INR_Semi_Annual_Swap_Rate_Reference_Banks', 'INR_SORR', 'INR_SORR_OIS_Compound', 'ISK_REIBOR', 'ISK_REIBOR_Reference_Banks', 'ISK_REIBOR_Reuters', 'JPY_Annual_Swap_Rate_11_00_TRADITION', 'JPY_Annual_Swap_Rate_3_00_TRADITION', 'JPY_BBSF_Bloomberg_10_00', 'JPY_BBSF_Bloomberg_15_00', 'JPY_Euroyen_TIBOR', 'JPY_ISDA_Swap_Rate_10_00', 'JPY_ISDA_Swap_Rate_15_00', 'JPY_LIBOR', 'JPY_LIBOR_BBA', 'JPY_LIBOR_BBA_Bloomberg', 'JPY_LIBOR_FRASETT', 'JPY_LIBOR_ISDA', 'JPY_LIBOR_Reference_Banks', 'JPY_LIBOR_TSR_10_00', 'JPY_LIBOR_TSR_15_00', 'JPY_LTPR_MHBK', 'JPY_LTPR_MHCB', 'JPY_LTPR_TBC', 'JPY_MUTANCALL_TONAR', 'JPY_OIS_11_00_ICAP', 'JPY_OIS_11_00_TRADITION', 'JPY_OIS_3_00_TRADITION', 'JPY_Quoting_Banks_LIBOR', 'JPY_STPR_Quoting_Banks', 'JPY_TIBOR', 'JPY_TIBOR_17096', 'JPY_TIBOR_17097', 'JPY_TIBOR_DTIBOR01', 'JPY_TIBOR_TIBM', 'JPY_TIBOR_TIBM__10_Banks_', 'JPY_TIBOR_TIBM__5_Banks_', 'JPY_TIBOR_TIBM__All_Banks_', 'JPY_TIBOR_TIBM__All_Banks__Bloomberg', 'JPY_TIBOR_TIBM_Reference_Banks', 'JPY_TIBOR_ZTIBOR', 'JPY_TONA', 'JPY_TONA_Average_180D', 'JPY_TONA_Average_30D', 'JPY_TONA_Average_90D', 'JPY_TONA_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index_0_Floor', 'JPY_TONA_ICE_Compounded_Index_0_Floor_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_0_Floor_5D_Lag', 'JPY_TONA_ICE_Compounded_Index_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_5D_Lag', 'JPY_TONA_OIS_Compound_1', 'JPY_TONA_OIS_COMPOUND', 'JPY_TONA_TSR_10_00', 'JPY_TONA_TSR_15_00', 'JPY_TORF_QUICK', 'JPY_TSR_Reference_Banks', 'JPY_TSR_Reuters_10_00', 'JPY_TSR_Reuters_15_00', 'JPY_TSR_Telerate_10_00', 'JPY_TSR_Telerate_15_00', 'JPY_USD_Basis_Swaps_11_00_ICAP', 'KRW_Bond_3222', 'KRW_CD_3220', 'KRW_CD_91D', 'KRW_CD_KSDA_Bloomberg', 'KRW_KOFR', 'KRW_KOFR_OIS_Compound', 'KRW_Quarterly_Annual_Swap_Rate_3_30_ICAP', 'MXN_TIIE', 'MXN_TIIE_Banxico', 'MXN_TIIE_Banxico_Bloomberg', 'MXN_TIIE_Banxico_Reference_Banks', 'MXN_TIIE_ON', 'MXN_TIIE_ON_OIS_Compound', 'MXN_TIIE_Reference_Banks', 'MYR_KLIBOR', 'MYR_KLIBOR_BNM', 'MYR_KLIBOR_Reference_Banks', 'MYR_MYOR', 'MYR_MYOR_OIS_Compound', 'MYR_Quarterly_Swap_Rate_11_00_TRADITION', 'MYR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'NOK_NIBOR', 'NOK_NIBOR_NIBR', 'NOK_NIBOR_NIBR_Bloomberg', 'NOK_NIBOR_NIBR_Reference_Banks', 'NOK_NIBOR_OIBOR', 'NOK_NIBOR_Reference_Banks', 'NOK_NOWA', 'NOK_NOWA_OIS_Compound', 'NZD_BBR_BID', 'NZD_BBR_FRA', 'NZD_BBR_ISDC', 'NZD_BBR_Reference_Banks', 'NZD_BBR_Telerate', 'NZD_BKBM_Bid', 'NZD_BKBM_FRA', 'NZD_BKBM_FRA_Swap_Rate_ICAP', 'NZD_NZIONA', 'NZD_NZIONA_OIS_Compound_1', 'NZD_NZIONA_OIS_COMPOUND', 'NZD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'NZD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'NZD_Swap_Rate_ICAP', 'NZD_Swap_Rate_ICAP_Reference_Banks', 'PHP_ORR', 'PHP_PHIREF', 'PHP_PHIREF_BAP', 'PHP_PHIREF_Bloomberg', 'PHP_PHIREF_Reference_Banks', 'PHP_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'PHP_Semi_Annual_Swap_Rate_Reference_Banks', 'PLN_POLONIA', 'PLN_POLONIA_OIS_Compound_1', 'PLN_POLONIA_OIS_COMPOUND', 'PLN_POLSTR', 'PLN_POLSTR_OIS_Compound', 'PLN_WIBID', 'PLN_WIBOR', 'PLN_WIBOR_Reference_Banks', 'PLN_WIBOR_WIBO', 'PLN_WIRON', 'PLN_WIRON_OIS_Compound', 'PLZ_WIBOR_Reference_Banks', 'PLZ_WIBOR_WIBO', 'REPOFUNDS_RATE_FRANCE_OIS_COMPOUND', 'REPOFUNDS_RATE_GERMANY_OIS_COMPOUND', 'REPOFUNDS_RATE_ITALY_OIS_COMPOUND', 'RON_Annual_Swap_Rate_11_00_BGCANTOR', 'RON_Annual_Swap_Rate_Reference_Banks', 'RON_RBOR_Reuters', 'RON_ROBID', 'RON_ROBOR', 'RUB_Annual_Swap_Rate_11_00_BGCANTOR', 'RUB_Annual_Swap_Rate_12_45_TRADITION', 'RUB_Annual_Swap_Rate_4_15_TRADITION', 'RUB_Annual_Swap_Rate_Reference_Banks', 'RUB_Annual_Swap_Rate_TRADITION_Reference_Banks', 'RUB_Key_Rate_CBRF', 'RUB_MosPrime', 'RUB_MOSPRIME_NFEA', 'RUB_MOSPRIME_Reference_Banks', 'RUB_RUONIA', 'RUB_RUONIA_OIS_Compound_1', 'RUB_RUONIA_OIS_COMPOUND', 'SAR_SAIBOR', 'SAR_SRIOR_Reference_Banks', 'SAR_SRIOR_SUAA', 'SEK_Annual_Swap_Rate', 'SEK_Annual_Swap_Rate_SESWFI', 'SEK_SIOR_OIS_COMPOUND', 'SEK_STIBOR', 'SEK_STIBOR_Bloomberg', 'SEK_STIBOR_OIS_Compound', 'SEK_STIBOR_Reference_Banks', 'SEK_STIBOR_SIDE', 'SEK_SWESTR', 'SEK_SWESTR_Average_1M', 'SEK_SWESTR_Average_1W', 'SEK_SWESTR_Average_2M', 'SEK_SWESTR_Average_3M', 'SEK_SWESTR_Average_6M', 'SEK_SWESTR_Compounded_Index', 'SEK_SWESTR_OIS_Compound', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'SGD_Semi_Annual_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_TRADITION', 'SGD_Semi_Annual_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_ICAP', 'SGD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'SGD_SIBOR', 'SGD_SIBOR_Reference_Banks', 'SGD_SIBOR_Reuters', 'SGD_SIBOR_Telerate', 'SGD_SONAR_OIS_COMPOUND', 'SGD_SONAR_OIS_VWAP_COMPOUND', 'SGD_SOR', 'SGD_SORA', 'SGD_SORA_COMPOUND', 'SGD_SORA_OIS_Compound', 'SGD_SOR_Reference_Banks', 'SGD_SOR_Reuters', 'SGD_SOR_Telerate', 'SGD_SOR_VWAP', 'SGD_SOR_VWAP_Reference_Banks', 'SKK_BRIBOR_Bloomberg', 'SKK_BRIBOR_BRBO', 'SKK_BRIBOR_NBSK07', 'SKK_BRIBOR_Reference_Banks', 'THB_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'THB_Semi_Annual_Swap_Rate_Reference_Banks', 'THB_SOR_Reference_Banks', 'THB_SOR_Reuters', 'THB_SOR_Telerate', 'THB_THBFIX', 'THB_THBFIX_Reference_Banks', 'THB_THBFIX_Reuters', 'THB_THOR', 'THB_THOR_COMPOUND', 'THB_THOR_OIS_Compound', 'TRY_Annual_Swap_Rate_11_00_TRADITION', 'TRY_Annual_Swap_Rate_11_15_BGCANTOR', 'TRY_Annual_Swap_Rate_Reference_Banks', 'TRY_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'TRY_TLREF', 'TRY_TLREF_OIS_Compound_1', 'TRY_TLREF_OIS_COMPOUND', 'TRY_TRLIBOR', 'TRY_TRYIBOR_Reference_Banks', 'TRY_TRYIBOR_Reuters', 'TWD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'TWD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'TWD_Reference_Dealers', 'TWD_Reuters_6165', 'TWD_TAIBIR01', 'TWD_TAIBIR02', 'TWD_TAIBOR', 'TWD_TAIBOR_Bloomberg', 'TWD_TAIBOR_Reuters', 'TWD_Telerate_6165', 'TWD_TWCPBA', 'UK_Base_Rate', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_AMERIBOR', 'USD_AMERIBOR_Average_30D', 'USD_AMERIBOR_Average_90D', 'USD_AMERIBOR_Term', 'USD_AMERIBOR_Term_Structure', 'USD_Annual_Swap_Rate_11_00_BGCANTOR', 'USD_Annual_Swap_Rate_11_00_TRADITION', 'USD_Annual_Swap_Rate_4_00_TRADITION', 'USD_AXI_Term', 'USD_BA_H_15', 'USD_BA_Reference_Dealers', 'USD_BMA_Municipal_Swap_Index', 'USD_BSBY', 'USD_CD_H_15', 'USD_CD_Reference_Dealers', 'USD_CMS_Reference_Banks', 'USD_CMS_Reference_Banks_ICAP_SwapPX', 'USD_CMS_Reuters', 'USD_CMS_Telerate', 'USD_CMT', 'USD_CMT_Average_1W', 'USD_CMT_T7051', 'USD_CMT_T7052', 'USD_COF11_FHLBSF', 'USD_COF11_Reuters', 'USD_COF11_Telerate', 'USD_COFI', 'USD_CP_H_15', 'USD_CP_Money_Market_Yield', 'USD_CP_Reference_Dealers', 'USD_CRITR', 'USD_Federal_Funds', 'USD_Federal_Funds_H_15', 'USD_Federal_Funds_H_15_Bloomberg', 'USD_Federal_Funds_H_15_OIS_COMPOUND', 'USD_Federal_Funds_OIS_Compound', 'USD_Federal_Funds_Reference_Dealers', 'USD_FFCB_DISCO', 'USD_FXI_Term', 'USD_ISDAFIX3_Swap_Rate', 'USD_ISDAFIX3_Swap_Rate_3_00', 'USD_ISDA_Swap_Rate', 'USD_ISDA_Swap_Rate_3_00', 'USD_LIBOR', 'USD_LIBOR_BBA', 'USD_LIBOR_BBA_Bloomberg', 'USD_LIBOR_ICE_Swap_Rate_11_00', 'USD_LIBOR_ICE_Swap_Rate_15_00', 'USD_LIBOR_ISDA', 'USD_LIBOR_LIBO', 'USD_LIBOR_Reference_Banks', 'USD_Municipal_Swap_Index', 'USD_Municipal_Swap_Libor_Ratio_11_00_ICAP', 'USD_Municipal_Swap_Rate_11_00_ICAP', 'USD_OIS_11_00_BGCANTOR', 'USD_OIS_11_00_LON_ICAP', 'USD_OIS_11_00_NY_ICAP', 'USD_OIS_11_00_TRADITION', 'USD_OIS_3_00_BGCANTOR', 'USD_OIS_3_00_NY_ICAP', 'USD_OIS_4_00_TRADITION', 'USD_Overnight_Bank_Funding_Rate', 'USD_Prime', 'USD_Prime_H_15', 'USD_Prime_Reference_Banks', 'USD_S_P_Index_High_Grade', 'USD_SandP_Index_High_Grade', 'USD_SIBOR_Reference_Banks', 'USD_SIBOR_SIBO', 'USD_SIFMA_Municipal_Swap_Index', 'USD_SOFR', 'USD_SOFR_Average_180D', 'USD_SOFR_Average_30D', 'USD_SOFR_Average_90D', 'USD_SOFR_CME_Term', 'USD_SOFR_COMPOUND', 'USD_SOFR_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index_0_Floor', 'USD_SOFR_ICE_Compounded_Index_0_Floor_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_0_Floor_5D_Lag', 'USD_SOFR_ICE_Compounded_Index_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_5D_Lag', 'USD_SOFR_ICE_Swap_Rate', 'USD_SOFR_ICE_Swap_Rate_Spreads', 'USD_SOFR_ICE_Term', 'USD_SOFR_OIS_Compound', 'USD_Swap_Rate_BCMP1', 'USD_TBILL_Auction_High_Rate', 'USD_TBILL_H_15', 'USD_TBILL_H_15_Bloomberg', 'USD_TBILL_Secondary_Market', 'USD_TBILL_Secondary_Market_Bond_Equivalent_Yield', 'USD_TIBOR_ISDC', 'USD_TIBOR_Reference_Banks', 'USD_Treasury_19901_3_00_ICAP', 'USD_Treasury_Rate_BCMP1', 'USD_Treasury_Rate_ICAP_BrokerTec', 'USD_Treasury_Rate_SwapMarker100', 'USD_Treasury_Rate_SwapMarker99', 'USD_Treasury_Rate_T19901', 'USD_Treasury_Rate_T500', 'VND_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'VND_Semi_Annual_Swap_Rate_Reference_Banks', 'ZAR_DEPOSIT_Reference_Banks', 'ZAR_DEPOSIT_SAFEX', 'ZAR_JIBAR', 'ZAR_JIBAR_Reference_Banks', 'ZAR_JIBAR_SAFEX', 'ZAR_Prime_Average_1', 'ZAR_PRIME_AVERAGE', 'ZAR_PRIME_AVERAGE_Reference_Banks', 'ZAR_Quarterly_Swap_Rate_1_00_TRADITION', 'ZAR_Quarterly_Swap_Rate_5_30_TRADITION', 'ZAR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'ZAR_ZARONIA', 'ZAR_ZARONIA_OIS_Compound'))

UNION ALL

SELECT 'ReferenceInformation' AS table_name, 'referenceEntity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ReferenceInformation" 
WHERE "ReferenceInformation"."referenceEntity" IS NULL

UNION ALL

SELECT 'ReferencePair' AS table_name, 'referenceEntity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ReferencePair" 
WHERE "ReferencePair"."referenceEntity" IS NULL

UNION ALL

SELECT 'ReferencePair' AS table_name, 'entityType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ReferencePair" 
WHERE "ReferencePair"."entityType" IS NULL

UNION ALL

SELECT 'ReferencePair' AS table_name, 'entityType' AS column_name, 'enum' AS constraint_type, id AS record_id, "entityType" AS invalid_value 
FROM "ReferencePair" 
WHERE "ReferencePair"."entityType" IS NOT NULL AND ("ReferencePair"."entityType" NOT IN ('Asian', 'AustralianAndNewZealand', 'EuropeanEmergingMarkets', 'Japanese', 'NorthAmericanHighYield', 'NorthAmericanInsurance', 'NorthAmericanInvestmentGrade', 'Singaporean', 'WesternEuropean', 'WesternEuropeanInsurance'))

UNION ALL

SELECT 'ReferencePool' AS table_name, 'referencePoolItem' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ReferencePool" 
WHERE "ReferencePool"."referencePoolItem" IS NULL

UNION ALL

SELECT 'ReferencePoolItem' AS table_name, 'referencePair' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ReferencePoolItem" 
WHERE "ReferencePoolItem"."referencePair" IS NULL

UNION ALL

SELECT 'SettledEntityMatrix' AS table_name, 'matrixSource' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SettledEntityMatrix" 
WHERE "SettledEntityMatrix"."matrixSource" IS NULL

UNION ALL

SELECT 'SettledEntityMatrix' AS table_name, 'matrixSource' AS column_name, 'enum' AS constraint_type, id AS record_id, "matrixSource" AS invalid_value 
FROM "SettledEntityMatrix" 
WHERE "SettledEntityMatrix"."matrixSource" IS NOT NULL AND ("SettledEntityMatrix"."matrixSource" NOT IN ('ConfirmationAnnex', 'NotApplicable', 'Publisher'))

UNION ALL

SELECT 'Tranche' AS table_name, 'attachmentPoint' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Tranche" 
WHERE "Tranche"."attachmentPoint" IS NULL

UNION ALL

SELECT 'Tranche' AS table_name, 'exhaustionPoint' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Tranche" 
WHERE "Tranche"."exhaustionPoint" IS NULL

UNION ALL

SELECT 'DividendCurrency' AS table_name, 'determinationMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "determinationMethod" AS invalid_value 
FROM "DividendCurrency" 
WHERE "DividendCurrency"."determinationMethod" IS NOT NULL AND ("DividendCurrency"."determinationMethod" NOT IN ('AgreedInitialPrice', 'AsSpecifiedInMasterConfirmation', 'CalculationAgent', 'ClosingPrice', 'DividendCurrency', 'ExpiringContractLevel', 'HedgeExecution', 'IssuerPaymentCurrency', 'NAV', 'OpenPrice', 'OSPPrice', 'SettlementCurrency', 'StrikeDateDetermination', 'TWAPPrice', 'TWAPVE', 'TWAPVEExcludingClose', 'ValuationTime', 'VWAPPrice', 'VWAPVE', 'VWAPVEExcludingClose'))

UNION ALL

SELECT 'DividendDateReference' AS table_name, 'dateReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DividendDateReference" 
WHERE "DividendDateReference"."dateReference" IS NULL

UNION ALL

SELECT 'DividendDateReference' AS table_name, 'dateReference' AS column_name, 'enum' AS constraint_type, id AS record_id, "dateReference" AS invalid_value 
FROM "DividendDateReference" 
WHERE "DividendDateReference"."dateReference" IS NOT NULL AND ("DividendDateReference"."dateReference" NOT IN ('AdHocDate', 'CashSettlementPaymentDate', 'CashSettlePaymentDateExDiv', 'CashSettlePaymentDateIssuerPayment', 'CumulativeEquityExDiv', 'CumulativeEquityPaid', 'CumulativeEquityExDivBeforeReset', 'CumulativeEquityPaidBeforeReset', 'CumulativeEquityPaidInclReset', 'CumulativeInterestExDiv', 'CumulativeInterestPaid', 'CumulativeInterestPaidInclReset', 'CumulativeInterestPaidBeforeReset', 'DividendPaymentDate', 'DividendValuationDate', 'EquityPaymentDate', 'ExDate', 'FloatingAmountPaymentDate', 'FollowingPaymentDate', 'RecordDate', 'SharePayment', 'TerminationDate', 'TradeDate', 'UnwindOrEquityExDiv', 'UnwindOrEquityPaid', 'UnwindOrInterestExDiv', 'UnwindOrInterestPaid', 'UnwindExDiv', 'UnwindPaid'))

UNION ALL

SELECT 'DividendReturnTerms' AS table_name, 'dividendEntitlement' AS column_name, 'enum' AS constraint_type, id AS record_id, "dividendEntitlement" AS invalid_value 
FROM "DividendReturnTerms" 
WHERE "DividendReturnTerms"."dividendEntitlement" IS NOT NULL AND ("DividendReturnTerms"."dividendEntitlement" NOT IN ('ExDate', 'RecordDate'))

UNION ALL

SELECT 'DividendReturnTerms' AS table_name, 'dividendAmountType' AS column_name, 'enum' AS constraint_type, id AS record_id, "dividendAmountType" AS invalid_value 
FROM "DividendReturnTerms" 
WHERE "DividendReturnTerms"."dividendAmountType" IS NOT NULL AND ("DividendReturnTerms"."dividendAmountType" NOT IN ('RecordAmount', 'ExAmount', 'PaidAmount', 'AsSpecifiedInMasterConfirmation'))

UNION ALL

SELECT 'DividendReturnTerms' AS table_name, 'firstOrSecondPeriod' AS column_name, 'enum' AS constraint_type, id AS record_id, "firstOrSecondPeriod" AS invalid_value 
FROM "DividendReturnTerms" 
WHERE "DividendReturnTerms"."firstOrSecondPeriod" IS NOT NULL AND ("DividendReturnTerms"."firstOrSecondPeriod" NOT IN ('FirstPeriod', 'SecondPeriod'))

UNION ALL

SELECT 'DividendReturnTerms' AS table_name, 'extraordinaryDividendsParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "extraordinaryDividendsParty" AS invalid_value 
FROM "DividendReturnTerms" 
WHERE "DividendReturnTerms"."extraordinaryDividendsParty" IS NOT NULL AND ("DividendReturnTerms"."extraordinaryDividendsParty" NOT IN ('DisruptionEventsDeterminingParty', 'ExtraordinaryDividendsParty', 'PredeterminedClearingOrganizationParty', 'ExerciseNoticeReceiverPartyManual', 'ExerciseNoticeReceiverPartyOptionalEarlyTermination', 'ExerciseNoticeReceiverPartyCancelableProvision', 'ExerciseNoticeReceiverPartyExtendibleProvision', 'CalculationAgentIndependent', 'CalculationAgentOptionalEarlyTermination', 'CalculationAgentMandatoryEarlyTermination', 'CalculationAgentFallback'))

UNION ALL

SELECT 'DividendReturnTerms' AS table_name, 'excessDividendAmount' AS column_name, 'enum' AS constraint_type, id AS record_id, "excessDividendAmount" AS invalid_value 
FROM "DividendReturnTerms" 
WHERE "DividendReturnTerms"."excessDividendAmount" IS NOT NULL AND ("DividendReturnTerms"."excessDividendAmount" NOT IN ('RecordAmount', 'ExAmount', 'PaidAmount', 'AsSpecifiedInMasterConfirmation'))

UNION ALL

SELECT 'DividendReturnTerms' AS table_name, 'nonCashDividendTreatment' AS column_name, 'enum' AS constraint_type, id AS record_id, "nonCashDividendTreatment" AS invalid_value 
FROM "DividendReturnTerms" 
WHERE "DividendReturnTerms"."nonCashDividendTreatment" IS NOT NULL AND ("DividendReturnTerms"."nonCashDividendTreatment" NOT IN ('PotentialAdjustmentEvent', 'CashEquivalent'))

UNION ALL

SELECT 'DividendReturnTerms' AS table_name, 'dividendComposition' AS column_name, 'enum' AS constraint_type, id AS record_id, "dividendComposition" AS invalid_value 
FROM "DividendReturnTerms" 
WHERE "DividendReturnTerms"."dividendComposition" IS NOT NULL AND ("DividendReturnTerms"."dividendComposition" NOT IN ('EquityAmountReceiverElection', 'CalculationAgentElection'))

UNION ALL

SELECT 'DividendPeriod' AS table_name, 'dateAdjustments' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DividendPeriod" 
WHERE "DividendPeriod"."dateAdjustments" IS NULL

UNION ALL

SELECT 'DividendPeriod' AS table_name, 'dividendPaymentDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DividendPeriod" 
WHERE "DividendPeriod"."dividendPaymentDate" IS NULL

UNION ALL

SELECT 'PriceReturnTerms' AS table_name, 'returnType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PriceReturnTerms" 
WHERE "PriceReturnTerms"."returnType" IS NULL

UNION ALL

SELECT 'PriceReturnTerms' AS table_name, 'returnType' AS column_name, 'enum' AS constraint_type, id AS record_id, "returnType" AS invalid_value 
FROM "PriceReturnTerms" 
WHERE "PriceReturnTerms"."returnType" IS NOT NULL AND ("PriceReturnTerms"."returnType" NOT IN ('Price', 'Total'))

UNION ALL

SELECT 'ReturnTermsBase' AS table_name, 'valuationTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ReturnTermsBase" 
WHERE "ReturnTermsBase"."valuationTerms" IS NULL

UNION ALL

SELECT 'ReturnTermsBase' AS table_name, 'expectedN' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ReturnTermsBase" 
WHERE "ReturnTermsBase"."expectedN" IS NULL

UNION ALL

SELECT 'ReturnTermsBase' AS table_name, 'initialLevelSource' AS column_name, 'enum' AS constraint_type, id AS record_id, "initialLevelSource" AS invalid_value 
FROM "ReturnTermsBase" 
WHERE "ReturnTermsBase"."initialLevelSource" IS NOT NULL AND ("ReturnTermsBase"."initialLevelSource" NOT IN ('AgreedInitialPrice', 'AsSpecifiedInMasterConfirmation', 'CalculationAgent', 'ClosingPrice', 'DividendCurrency', 'ExpiringContractLevel', 'HedgeExecution', 'IssuerPaymentCurrency', 'NAV', 'OpenPrice', 'OSPPrice', 'SettlementCurrency', 'StrikeDateDetermination', 'TWAPPrice', 'TWAPVE', 'TWAPVEExcludingClose', 'ValuationTime', 'VWAPPrice', 'VWAPVE', 'VWAPVEExcludingClose'))

UNION ALL

SELECT 'VarianceReturnTerms' AS table_name, 'valuationTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "VarianceReturnTerms" 
WHERE "VarianceReturnTerms"."valuationTerms" IS NULL

UNION ALL

SELECT 'VarianceReturnTerms' AS table_name, 'expectedN' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "VarianceReturnTerms" 
WHERE "VarianceReturnTerms"."expectedN" IS NULL

UNION ALL

SELECT 'VarianceReturnTerms' AS table_name, 'initialLevelSource' AS column_name, 'enum' AS constraint_type, id AS record_id, "initialLevelSource" AS invalid_value 
FROM "VarianceReturnTerms" 
WHERE "VarianceReturnTerms"."initialLevelSource" IS NOT NULL AND ("VarianceReturnTerms"."initialLevelSource" NOT IN ('AgreedInitialPrice', 'AsSpecifiedInMasterConfirmation', 'CalculationAgent', 'ClosingPrice', 'DividendCurrency', 'ExpiringContractLevel', 'HedgeExecution', 'IssuerPaymentCurrency', 'NAV', 'OpenPrice', 'OSPPrice', 'SettlementCurrency', 'StrikeDateDetermination', 'TWAPPrice', 'TWAPVE', 'TWAPVEExcludingClose', 'ValuationTime', 'VWAPPrice', 'VWAPVE', 'VWAPVEExcludingClose'))

UNION ALL

SELECT 'VolatilityReturnTerms' AS table_name, 'volatilityStrikePrice' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "VolatilityReturnTerms" 
WHERE "VolatilityReturnTerms"."volatilityStrikePrice" IS NULL

UNION ALL

SELECT 'VolatilityReturnTerms' AS table_name, 'valuationTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "VolatilityReturnTerms" 
WHERE "VolatilityReturnTerms"."valuationTerms" IS NULL

UNION ALL

SELECT 'VolatilityReturnTerms' AS table_name, 'expectedN' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "VolatilityReturnTerms" 
WHERE "VolatilityReturnTerms"."expectedN" IS NULL

UNION ALL

SELECT 'VolatilityReturnTerms' AS table_name, 'initialLevelSource' AS column_name, 'enum' AS constraint_type, id AS record_id, "initialLevelSource" AS invalid_value 
FROM "VolatilityReturnTerms" 
WHERE "VolatilityReturnTerms"."initialLevelSource" IS NOT NULL AND ("VolatilityReturnTerms"."initialLevelSource" NOT IN ('AgreedInitialPrice', 'AsSpecifiedInMasterConfirmation', 'CalculationAgent', 'ClosingPrice', 'DividendCurrency', 'ExpiringContractLevel', 'HedgeExecution', 'IssuerPaymentCurrency', 'NAV', 'OpenPrice', 'OSPPrice', 'SettlementCurrency', 'StrikeDateDetermination', 'TWAPPrice', 'TWAPVE', 'TWAPVEExcludingClose', 'ValuationTime', 'VWAPPrice', 'VWAPVE', 'VWAPVEExcludingClose'))

UNION ALL

SELECT 'CorrelationReturnTerms' AS table_name, 'correlationStrikePrice' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CorrelationReturnTerms" 
WHERE "CorrelationReturnTerms"."correlationStrikePrice" IS NULL

UNION ALL

SELECT 'CorrelationReturnTerms' AS table_name, 'valuationTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CorrelationReturnTerms" 
WHERE "CorrelationReturnTerms"."valuationTerms" IS NULL

UNION ALL

SELECT 'CorrelationReturnTerms' AS table_name, 'expectedN' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CorrelationReturnTerms" 
WHERE "CorrelationReturnTerms"."expectedN" IS NULL

UNION ALL

SELECT 'CorrelationReturnTerms' AS table_name, 'initialLevelSource' AS column_name, 'enum' AS constraint_type, id AS record_id, "initialLevelSource" AS invalid_value 
FROM "CorrelationReturnTerms" 
WHERE "CorrelationReturnTerms"."initialLevelSource" IS NOT NULL AND ("CorrelationReturnTerms"."initialLevelSource" NOT IN ('AgreedInitialPrice', 'AsSpecifiedInMasterConfirmation', 'CalculationAgent', 'ClosingPrice', 'DividendCurrency', 'ExpiringContractLevel', 'HedgeExecution', 'IssuerPaymentCurrency', 'NAV', 'OpenPrice', 'OSPPrice', 'SettlementCurrency', 'StrikeDateDetermination', 'TWAPPrice', 'TWAPVE', 'TWAPVEExcludingClose', 'ValuationTime', 'VWAPPrice', 'VWAPVE', 'VWAPVEExcludingClose'))

UNION ALL

SELECT 'ValuationTerms' AS table_name, 'fPVFinalPriceElectionFallback' AS column_name, 'enum' AS constraint_type, id AS record_id, "fPVFinalPriceElectionFallback" AS invalid_value 
FROM "ValuationTerms" 
WHERE "ValuationTerms"."fPVFinalPriceElectionFallback" IS NOT NULL AND ("ValuationTerms"."fPVFinalPriceElectionFallback" NOT IN ('FPVClose', 'FPVHedgeExecution'))

UNION ALL

SELECT 'VarianceCapFloor' AS table_name, 'varianceCap' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "VarianceCapFloor" 
WHERE "VarianceCapFloor"."varianceCap" IS NULL

UNION ALL

SELECT 'BoundedVariance' AS table_name, 'realisedVarianceMethod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BoundedVariance" 
WHERE "BoundedVariance"."realisedVarianceMethod" IS NULL

UNION ALL

SELECT 'BoundedVariance' AS table_name, 'realisedVarianceMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "realisedVarianceMethod" AS invalid_value 
FROM "BoundedVariance" 
WHERE "BoundedVariance"."realisedVarianceMethod" IS NOT NULL AND ("BoundedVariance"."realisedVarianceMethod" NOT IN ('Previous', 'Last', 'Both'))

UNION ALL

SELECT 'BoundedVariance' AS table_name, 'daysInRangeAdjustment' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BoundedVariance" 
WHERE "BoundedVariance"."daysInRangeAdjustment" IS NULL

UNION ALL

SELECT 'VolatilityCapFloor' AS table_name, 'applicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "VolatilityCapFloor" 
WHERE "VolatilityCapFloor".applicable IS NULL

UNION ALL

SELECT 'BondReference' AS table_name, 'bond' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BondReference" 
WHERE "BondReference".bond IS NULL

UNION ALL

SELECT 'BondReference' AS table_name, 'conditionPrecedentBond' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "BondReference" 
WHERE "BondReference"."conditionPrecedentBond" IS NULL

UNION ALL

SELECT 'CashflowRepresentation' AS table_name, 'cashflowsMatchParameters' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CashflowRepresentation" 
WHERE "CashflowRepresentation"."cashflowsMatchParameters" IS NULL

UNION ALL

SELECT 'DiscountingMethod' AS table_name, 'discountingType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DiscountingMethod" 
WHERE "DiscountingMethod"."discountingType" IS NULL

UNION ALL

SELECT 'DiscountingMethod' AS table_name, 'discountingType' AS column_name, 'enum' AS constraint_type, id AS record_id, "discountingType" AS invalid_value 
FROM "DiscountingMethod" 
WHERE "DiscountingMethod"."discountingType" IS NOT NULL AND ("DiscountingMethod"."discountingType" NOT IN ('Standard', 'FRA', 'FRAYield', 'AFMA'))

UNION ALL

SELECT 'DiscountingMethod' AS table_name, 'discountRateDayCountFraction' AS column_name, 'enum' AS constraint_type, id AS record_id, "discountRateDayCountFraction" AS invalid_value 
FROM "DiscountingMethod" 
WHERE "DiscountingMethod"."discountRateDayCountFraction" IS NOT NULL AND ("DiscountingMethod"."discountRateDayCountFraction" NOT IN ('ACT_360', 'ACT_365L', 'ACT_364', 'ACT_365_FIXED', 'ACT_ACT_AFB', 'ACT_ACT_ICMA', 'ACT_ACT_ISDA', 'ACT_ACT_ISMA', 'CAL_252', '_1_1', '_30E_360', '_30E_360_ISDA', '_30_360', 'RBA_BOND_BASIS'))

UNION ALL

SELECT 'InflationRateSpecification' AS table_name, 'inflationLag' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InflationRateSpecification" 
WHERE "InflationRateSpecification"."inflationLag" IS NULL

UNION ALL

SELECT 'InflationRateSpecification' AS table_name, 'indexSource' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InflationRateSpecification" 
WHERE "InflationRateSpecification"."indexSource" IS NULL

UNION ALL

SELECT 'InflationRateSpecification' AS table_name, 'mainPublication' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InflationRateSpecification" 
WHERE "InflationRateSpecification"."mainPublication" IS NULL

UNION ALL

SELECT 'InflationRateSpecification' AS table_name, 'interpolationMethod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InflationRateSpecification" 
WHERE "InflationRateSpecification"."interpolationMethod" IS NULL

UNION ALL

SELECT 'InflationRateSpecification' AS table_name, 'interpolationMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "interpolationMethod" AS invalid_value 
FROM "InflationRateSpecification" 
WHERE "InflationRateSpecification"."interpolationMethod" IS NOT NULL AND ("InflationRateSpecification"."interpolationMethod" NOT IN ('Linear', 'LinearZeroYield', 'None'))

UNION ALL

SELECT 'InflationRateSpecification' AS table_name, 'fallbackBondApplicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InflationRateSpecification" 
WHERE "InflationRateSpecification"."fallbackBondApplicable" IS NULL

UNION ALL

SELECT 'InflationRateSpecification' AS table_name, 'calculationMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "calculationMethod" AS invalid_value 
FROM "InflationRateSpecification" 
WHERE "InflationRateSpecification"."calculationMethod" IS NOT NULL AND ("InflationRateSpecification"."calculationMethod" NOT IN ('Ratio', 'Return', 'Spread'))

UNION ALL

SELECT 'InflationRateSpecification' AS table_name, 'calculationStyle' AS column_name, 'enum' AS constraint_type, id AS record_id, "calculationStyle" AS invalid_value 
FROM "InflationRateSpecification" 
WHERE "InflationRateSpecification"."calculationStyle" IS NOT NULL AND ("InflationRateSpecification"."calculationStyle" NOT IN ('YearOnYear', 'ZeroCoupon'))

UNION ALL

SELECT 'InflationRateSpecification' AS table_name, 'finalPrincipalExchangeCalculation' AS column_name, 'enum' AS constraint_type, id AS record_id, "finalPrincipalExchangeCalculation" AS invalid_value 
FROM "InflationRateSpecification" 
WHERE "InflationRateSpecification"."finalPrincipalExchangeCalculation" IS NOT NULL AND ("InflationRateSpecification"."finalPrincipalExchangeCalculation" NOT IN ('Floored', 'NonFloored'))

UNION ALL

SELECT 'InflationRateSpecification' AS table_name, 'averagingMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "averagingMethod" AS invalid_value 
FROM "InflationRateSpecification" 
WHERE "InflationRateSpecification"."averagingMethod" IS NOT NULL AND ("InflationRateSpecification"."averagingMethod" NOT IN ('Unweighted', 'Weighted'))

UNION ALL

SELECT 'InflationRateSpecification' AS table_name, 'negativeInterestRateTreatment' AS column_name, 'enum' AS constraint_type, id AS record_id, "negativeInterestRateTreatment" AS invalid_value 
FROM "InflationRateSpecification" 
WHERE "InflationRateSpecification"."negativeInterestRateTreatment" IS NOT NULL AND ("InflationRateSpecification"."negativeInterestRateTreatment" NOT IN ('NegativeInterestRateMethod', 'ZeroInterestRateMethod', 'ZeroInterestRateExcludingSpreadMethod'))

UNION ALL

SELECT 'InflationRateSpecification' AS table_name, 'rateTreatment' AS column_name, 'enum' AS constraint_type, id AS record_id, "rateTreatment" AS invalid_value 
FROM "InflationRateSpecification" 
WHERE "InflationRateSpecification"."rateTreatment" IS NOT NULL AND ("InflationRateSpecification"."rateTreatment" NOT IN ('BondEquivalentYield', 'MoneyMarketYield'))

UNION ALL

SELECT 'FloatingRate' AS table_name, 'rateTreatment' AS column_name, 'enum' AS constraint_type, id AS record_id, "rateTreatment" AS invalid_value 
FROM "FloatingRate" 
WHERE "FloatingRate"."rateTreatment" IS NOT NULL AND ("FloatingRate"."rateTreatment" NOT IN ('BondEquivalentYield', 'MoneyMarketYield'))

UNION ALL

SELECT 'FloatingRateSpecification' AS table_name, 'averagingMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "averagingMethod" AS invalid_value 
FROM "FloatingRateSpecification" 
WHERE "FloatingRateSpecification"."averagingMethod" IS NOT NULL AND ("FloatingRateSpecification"."averagingMethod" NOT IN ('Unweighted', 'Weighted'))

UNION ALL

SELECT 'FloatingRateSpecification' AS table_name, 'negativeInterestRateTreatment' AS column_name, 'enum' AS constraint_type, id AS record_id, "negativeInterestRateTreatment" AS invalid_value 
FROM "FloatingRateSpecification" 
WHERE "FloatingRateSpecification"."negativeInterestRateTreatment" IS NOT NULL AND ("FloatingRateSpecification"."negativeInterestRateTreatment" NOT IN ('NegativeInterestRateMethod', 'ZeroInterestRateMethod', 'ZeroInterestRateExcludingSpreadMethod'))

UNION ALL

SELECT 'FloatingRateSpecification' AS table_name, 'rateTreatment' AS column_name, 'enum' AS constraint_type, id AS record_id, "rateTreatment" AS invalid_value 
FROM "FloatingRateSpecification" 
WHERE "FloatingRateSpecification"."rateTreatment" IS NOT NULL AND ("FloatingRateSpecification"."rateTreatment" NOT IN ('BondEquivalentYield', 'MoneyMarketYield'))

UNION ALL

SELECT 'FutureValueAmount' AS table_name, 'currency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FutureValueAmount" 
WHERE "FutureValueAmount".currency IS NULL

UNION ALL

SELECT 'FutureValueAmount' AS table_name, 'calculationPeriodNumberOfDays' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FutureValueAmount" 
WHERE "FutureValueAmount"."calculationPeriodNumberOfDays" IS NULL

UNION ALL

SELECT 'FutureValueAmount' AS table_name, 'valueDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FutureValueAmount" 
WHERE "FutureValueAmount"."valueDate" IS NULL

UNION ALL

SELECT 'SpreadSchedule' AS table_name, 'spreadScheduleType' AS column_name, 'enum' AS constraint_type, id AS record_id, "spreadScheduleType" AS invalid_value 
FROM "SpreadSchedule" 
WHERE "SpreadSchedule"."spreadScheduleType" IS NOT NULL AND ("SpreadSchedule"."spreadScheduleType" NOT IN ('Long', 'Short'))

UNION ALL

SELECT 'SpreadSchedule' AS table_name, 'price' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SpreadSchedule" 
WHERE "SpreadSchedule".price IS NULL

UNION ALL

SELECT 'StubFloatingRate' AS table_name, 'floatingRateIndex' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "StubFloatingRate" 
WHERE "StubFloatingRate"."floatingRateIndex" IS NULL

UNION ALL

SELECT 'StubFloatingRate' AS table_name, 'floatingRateIndex' AS column_name, 'enum' AS constraint_type, id AS record_id, "floatingRateIndex" AS invalid_value 
FROM "StubFloatingRate" 
WHERE "StubFloatingRate"."floatingRateIndex" IS NOT NULL AND ("StubFloatingRate"."floatingRateIndex" NOT IN ('AED_EBOR_Reuters', 'AED_EIBOR', 'AUD_AONIA', 'AUD_AONIA_OIS_Compound_1', 'AUD_AONIA_OIS_COMPOUND', 'AUD_AONIA_OIS_COMPOUND_SwapMarker', 'AUD_BBR_AUBBSW', 'AUD_BBR_BBSW', 'AUD_BBR_BBSW_Bloomberg', 'AUD_BBR_BBSY__BID_', 'AUD_BBR_ISDC', 'AUD_BBSW', 'AUD_BBSW_Quarterly_Swap_Rate_ICAP', 'AUD_BBSW_Semi_Annual_Swap_Rate_ICAP', 'AUD_BBSY_Bid', 'AUD_LIBOR_BBA', 'AUD_LIBOR_BBA_Bloomberg', 'AUD_LIBOR_Reference_Banks', 'AUD_Quarterly_Swap_Rate_ICAP', 'AUD_Quarterly_Swap_Rate_ICAP_Reference_Banks', 'AUD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'AUD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'AUD_Semi_annual_Swap_Rate_ICAP', 'AUD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'AUD_Swap_Rate_Reuters', 'BRL_CDI', 'CAD_BA_CDOR', 'CAD_BA_CDOR_Bloomberg', 'CAD_BA_ISDD', 'CAD_BA_Reference_Banks', 'CAD_BA_Reuters', 'CAD_BA_Telerate', 'CAD_CDOR', 'CAD_CORRA', 'CAD_CORRA_CanDeal_TMX_Term', 'CAD_CORRA_Compounded_Index', 'CAD_CORRA_OIS_Compound_1', 'CAD_CORRA_OIS_COMPOUND', 'CAD_ISDA_Swap_Rate', 'CAD_LIBOR_BBA', 'CAD_LIBOR_BBA_Bloomberg', 'CAD_LIBOR_BBA_SwapMarker', 'CAD_LIBOR_Reference_Banks', 'CAD_REPO_CORRA', 'CAD_TBILL_ISDD', 'CAD_TBILL_Reference_Banks', 'CAD_TBILL_Reuters', 'CAD_TBILL_Telerate', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_3M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'CHF_6M_LIBORSWAP_CME_vs_LCH_ICAP_Bloomberg', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'CHF_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'CHF_Annual_Swap_Rate', 'CHF_Annual_Swap_Rate_11_00_ICAP', 'CHF_Annual_Swap_Rate_Reference_Banks', 'CHF_Basis_Swap_3m_vs_6m_LIBOR_11_00_ICAP', 'CHF_ISDAFIX_Swap_Rate', 'CHF_LIBOR', 'CHF_LIBOR_BBA', 'CHF_LIBOR_BBA_Bloomberg', 'CHF_LIBOR_ISDA', 'CHF_LIBOR_Reference_Banks', 'CHF_OIS_11_00_ICAP', 'CHF_SARON', 'CHF_SARON_Average_12M', 'CHF_SARON_Average_1M', 'CHF_SARON_Average_1W', 'CHF_SARON_Average_2M', 'CHF_SARON_Average_3M', 'CHF_SARON_Average_6M', 'CHF_SARON_Average_9M', 'CHF_SARON_Compounded_Index', 'CHF_SARON_OIS_Compound_1', 'CHF_SARON_OIS_COMPOUND', 'CHF_TOIS_OIS_COMPOUND', 'CHF_USD_Basis_Swaps_11_00_ICAP', 'CL_CLICP_Bloomberg', 'CLP_ICP', 'CLP_TNA', 'CNH_HIBOR', 'CNH_HIBOR_Reference_Banks', 'CNH_HIBOR_TMA', 'CNY_7_Repo_Compounding_Date', 'CNY_CNREPOFIX_CFXS_Reuters', 'CNY_Deposit_Rate', 'CNY_Fixing_Repo_Rate', 'CNY_LPR', 'CNY_PBOCB_Reuters', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION', 'CNY_Quarterly_7_day_Repo_Non_Deliverable_Swap_Rate_TRADITION_Reference_Banks', 'CNY_Quarterly_7D_Repo_NDS_Rate_Tradition', 'CNY_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'CNY_Semi_Annual_Swap_Rate_Reference_Banks', 'CNY_SHIBOR', 'CNY_SHIBOR_OIS_Compound', 'CNY_Shibor_OIS_Compounding', 'CNY_SHIBOR_Reuters', 'COP_IBR_OIS_Compound_1', 'COP_IBR_OIS_COMPOUND', 'CZK_Annual_Swap_Rate_11_00_BGCANTOR', 'CZK_Annual_Swap_Rate_Reference_Banks', 'CZK_CZEONIA', 'CZK_CZEONIA_OIS_Compound', 'CZK_PRIBOR', 'CZK_PRIBOR_PRBO', 'CZK_PRIBOR_Reference_Banks', 'DKK_CIBOR', 'DKK_CIBOR2', 'DKK_CIBOR2_Bloomberg', 'DKK_CIBOR2_DKNA13', 'DKK_CIBOR_DKNA13', 'DKK_CIBOR_DKNA13_Bloomberg', 'DKK_CIBOR_Reference_Banks', 'DKK_CITA', 'DKK_CITA_DKNA14_COMPOUND', 'DKK_DESTR', 'DKK_DESTR_Compounded_Index', 'DKK_DESTR_OIS_Compound', 'DKK_DKKOIS_OIS_COMPOUND', 'DKK_Tom_Next_OIS_Compound', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_3M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP', 'EUR_6M_EURIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'EUR_Annual_Swap_Rate_10_00', 'EUR_Annual_Swap_Rate_10_00_BGCANTOR', 'EUR_Annual_Swap_Rate_10_00_Bloomberg', 'EUR_Annual_Swap_Rate_10_00_ICAP', 'EUR_Annual_Swap_Rate_10_00_SwapMarker', 'EUR_Annual_Swap_Rate_10_00_TRADITION', 'EUR_Annual_Swap_Rate_11_00', 'EUR_Annual_Swap_Rate_11_00_Bloomberg', 'EUR_Annual_Swap_Rate_11_00_ICAP', 'EUR_Annual_Swap_Rate_11_00_SwapMarker', 'EUR_Annual_Swap_Rate_3_Month', 'EUR_Annual_Swap_Rate_3_Month_SwapMarker', 'EUR_Annual_Swap_Rate_4_15_TRADITION', 'EUR_Annual_Swap_Rate_Reference_Banks', 'EUR_Basis_Swap_EONIA_vs_3m_EUR_IBOR_Swap_Rates_A_360_10_00_ICAP', 'EUR_CNO_TEC10', 'EUR_EONIA', 'EUR_EONIA_AVERAGE_1', 'EUR_EONIA_Average', 'EUR_EONIA_OIS_10_00_BGCANTOR', 'EUR_EONIA_OIS_10_00_ICAP', 'EUR_EONIA_OIS_10_00_TRADITION', 'EUR_EONIA_OIS_11_00_ICAP', 'EUR_EONIA_OIS_4_15_TRADITION', 'EUR_EONIA_OIS_Compound_1', 'EUR_EONIA_OIS_COMPOUND', 'EUR_EONIA_OIS_COMPOUND_Bloomberg', 'EUR_EONIA_Swap_Index', 'EUR_EURIBOR', 'EUR_EURIBOR_Act_365', 'EUR_EURIBOR_Act_365_Bloomberg', 'EUR_EURIBOR_Annual_Bond_Swap_vs_1m_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_1m_vs_3m_Euribor_11_00_ICAP', 'EUR_EURIBOR_Basis_Swap_3m_vs_6m_11_00_ICAP', 'EUR_EURIBOR_ICE_Swap_Rate_11_00', 'EUR_EURIBOR_ICE_Swap_Rate_12_00', 'EUR_EURIBOR_Reference_Banks', 'EUR_EURIBOR_Reuters', 'EUR_EURIBOR_Telerate', 'EUR_EURONIA_OIS_Compound_1', 'EUR_EURONIA_OIS_COMPOUND', 'EUR_EuroSTR', 'EUR_EuroSTR_Average_12M', 'EUR_EuroSTR_Average_1M', 'EUR_EuroSTR_Average_1W', 'EUR_EuroSTR_Average_3M', 'EUR_EuroSTR_Average_6M', 'EUR_EuroSTR_COMPOUND', 'EUR_EuroSTR_Compounded_Index', 'EUR_EuroSTR_FTSE_Term', 'EUR_EuroSTR_ICE_Compounded_Index', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_0_Floor_5D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_2D_Lag', 'EUR_EuroSTR_ICE_Compounded_Index_5D_Lag', 'EUR_EuroSTR_ICE_Swap_Rate', 'EUR_EuroSTR_OIS_Compound', 'EUR_EuroSTR_Term', 'EUR_ISDA_EURIBOR_Swap_Rate_11_00', 'EUR_ISDA_EURIBOR_Swap_Rate_12_00', 'EUR_ISDA_LIBOR_Swap_Rate_10_00', 'EUR_ISDA_LIBOR_Swap_Rate_11_00', 'EUR_LIBOR', 'EUR_LIBOR_BBA', 'EUR_LIBOR_BBA_Bloomberg', 'EUR_LIBOR_Reference_Banks', 'EUR_TAM_CDC', 'EUR_TEC10_CNO', 'EUR_TEC10_CNO_SwapMarker', 'EUR_TEC10_Reference_Banks', 'EUR_TEC5_CNO', 'EUR_TEC5_CNO_SwapMarker', 'EUR_TEC5_Reference_Banks', 'EUR_TMM_CDC_COMPOUND', 'EUR_USD_Basis_Swaps_11_00_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP', 'GBP_6M_LIBOR_SWAP_EUREX_vs_LCH_ICAP_Bloomberg', 'GBP_ISDA_Swap_Rate', 'GBP_LIBOR', 'GBP_LIBOR_BBA', 'GBP_LIBOR_BBA_Bloomberg', 'GBP_LIBOR_ICE_Swap_Rate', 'GBP_LIBOR_ISDA', 'GBP_LIBOR_Reference_Banks', 'GBP_RONIA', 'GBP_RONIA_OIS_Compound', 'GBP_Semi_Annual_Swap_Rate', 'GBP_Semi_Annual_Swap_Rate_11_00_ICAP', 'GBP_Semi_Annual_Swap_Rate_11_00_TRADITION', 'GBP_Semi_Annual_Swap_Rate_4_15_TRADITION', 'GBP_Semi_Annual_Swap_Rate_Reference_Banks', 'GBP_Semi_Annual_Swap_Rate_SwapMarker26', 'GBP_SONIA', 'GBP_SONIA_COMPOUND', 'GBP_SONIA_Compounded_Index', 'GBP_SONIA_FTSE_Term', 'GBP_SONIA_ICE_Compounded_Index', 'GBP_SONIA_ICE_Compounded_Index_0_Floor', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_0_Floor_5D_Lag', 'GBP_SONIA_ICE_Compounded_Index_2D_Lag', 'GBP_SONIA_ICE_Compounded_Index_5D_Lag', 'GBP_SONIA_ICE_Swap_Rate', 'GBP_SONIA_ICE_Term', 'GBP_SONIA_OIS_11_00_ICAP', 'GBP_SONIA_OIS_11_00_TRADITION', 'GBP_SONIA_OIS_4_15_TRADITION', 'GBP_SONIA_OIS_Compound', 'GBP_SONIA_Swap_Rate', 'GBP_UK_Base_Rate', 'GBP_USD_Basis_Swaps_11_00_ICAP', 'GBP_WMBA_RONIA_COMPOUND', 'GBP_WMBA_SONIA_COMPOUND', 'GRD_ATHIBOR_ATHIBOR', 'GRD_ATHIBOR_Reference_Banks', 'GRD_ATHIBOR_Telerate', 'GRD_ATHIMID_Reference_Banks', 'GRD_ATHIMID_Reuters', 'HKD_HIBOR', 'HKD_HIBOR_HIBOR_', 'HKD_HIBOR_HIBOR_Bloomberg', 'HKD_HIBOR_HKAB', 'HKD_HIBOR_HKAB_Bloomberg', 'HKD_HIBOR_ISDC', 'HKD_HIBOR_Reference_Banks', 'HKD_HONIA', 'HKD_HONIA_OIS_Compound', 'HKD_HONIX_OIS_COMPOUND', 'HKD_ISDA_Swap_Rate_11_00', 'HKD_ISDA_Swap_Rate_4_00', 'HKD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_11_00_TRADITION', 'HKD_Quarterly_Annual_Swap_Rate_4_00_BGCANTOR', 'HKD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'HKD_Quarterly_Quarterly_Swap_Rate_11_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_4_00_ICAP', 'HKD_Quarterly_Quarterly_Swap_Rate_Reference_Banks', 'HUF_BUBOR', 'HUF_BUBOR_Reference_Banks', 'HUF_BUBOR_Reuters', 'HUF_HUFONIA', 'HUF_HUFONIA_OIS_Compound', 'IDR_IDMA_Bloomberg', 'IDR_IDRFIX', 'IDR_INDONIA', 'IDR_INDONIA_OIS_Compound', 'IDR_JIBOR', 'IDR_JIBOR_Reuters', 'IDR_SBI_Reuters', 'IDR_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'IDR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'IDR_Semi_Annual_Swap_Rate_Reference_Banks', 'IDR_SOR_Reference_Banks', 'IDR_SOR_Reuters', 'IDR_SOR_Telerate', 'ILS_SHIR', 'ILS_SHIR_OIS_Compound', 'ILS_TELBOR', 'ILS_TELBOR01_Reuters', 'ILS_TELBOR_Reference_Banks', 'INR_BMK', 'INR_CMT', 'INR_FBIL_MIBOR_OIS_COMPOUND', 'INR_INBMK_REUTERS', 'INR_MIBOR', 'INR_MIBOR_OIS', 'INR_MIBOR_OIS_Compound_1', 'INR_MIBOR_OIS_COMPOUND', 'INR_MIFOR', 'INR_MIOIS', 'INR_MITOR_OIS_COMPOUND', 'INR_Modified_MIFOR', 'INR_Reference_Banks', 'INR_Semi_Annual_Swap_Rate_11_30_BGCANTOR', 'INR_Semi_Annual_Swap_Rate_Non_deliverable_16_00_Tullett_Prebon', 'INR_Semi_Annual_Swap_Rate_Reference_Banks', 'INR_SORR', 'INR_SORR_OIS_Compound', 'ISK_REIBOR', 'ISK_REIBOR_Reference_Banks', 'ISK_REIBOR_Reuters', 'JPY_Annual_Swap_Rate_11_00_TRADITION', 'JPY_Annual_Swap_Rate_3_00_TRADITION', 'JPY_BBSF_Bloomberg_10_00', 'JPY_BBSF_Bloomberg_15_00', 'JPY_Euroyen_TIBOR', 'JPY_ISDA_Swap_Rate_10_00', 'JPY_ISDA_Swap_Rate_15_00', 'JPY_LIBOR', 'JPY_LIBOR_BBA', 'JPY_LIBOR_BBA_Bloomberg', 'JPY_LIBOR_FRASETT', 'JPY_LIBOR_ISDA', 'JPY_LIBOR_Reference_Banks', 'JPY_LIBOR_TSR_10_00', 'JPY_LIBOR_TSR_15_00', 'JPY_LTPR_MHBK', 'JPY_LTPR_MHCB', 'JPY_LTPR_TBC', 'JPY_MUTANCALL_TONAR', 'JPY_OIS_11_00_ICAP', 'JPY_OIS_11_00_TRADITION', 'JPY_OIS_3_00_TRADITION', 'JPY_Quoting_Banks_LIBOR', 'JPY_STPR_Quoting_Banks', 'JPY_TIBOR', 'JPY_TIBOR_17096', 'JPY_TIBOR_17097', 'JPY_TIBOR_DTIBOR01', 'JPY_TIBOR_TIBM', 'JPY_TIBOR_TIBM__10_Banks_', 'JPY_TIBOR_TIBM__5_Banks_', 'JPY_TIBOR_TIBM__All_Banks_', 'JPY_TIBOR_TIBM__All_Banks__Bloomberg', 'JPY_TIBOR_TIBM_Reference_Banks', 'JPY_TIBOR_ZTIBOR', 'JPY_TONA', 'JPY_TONA_Average_180D', 'JPY_TONA_Average_30D', 'JPY_TONA_Average_90D', 'JPY_TONA_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index', 'JPY_TONA_ICE_Compounded_Index_0_Floor', 'JPY_TONA_ICE_Compounded_Index_0_Floor_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_0_Floor_5D_Lag', 'JPY_TONA_ICE_Compounded_Index_2D_Lag', 'JPY_TONA_ICE_Compounded_Index_5D_Lag', 'JPY_TONA_OIS_Compound_1', 'JPY_TONA_OIS_COMPOUND', 'JPY_TONA_TSR_10_00', 'JPY_TONA_TSR_15_00', 'JPY_TORF_QUICK', 'JPY_TSR_Reference_Banks', 'JPY_TSR_Reuters_10_00', 'JPY_TSR_Reuters_15_00', 'JPY_TSR_Telerate_10_00', 'JPY_TSR_Telerate_15_00', 'JPY_USD_Basis_Swaps_11_00_ICAP', 'KRW_Bond_3222', 'KRW_CD_3220', 'KRW_CD_91D', 'KRW_CD_KSDA_Bloomberg', 'KRW_KOFR', 'KRW_KOFR_OIS_Compound', 'KRW_Quarterly_Annual_Swap_Rate_3_30_ICAP', 'MXN_TIIE', 'MXN_TIIE_Banxico', 'MXN_TIIE_Banxico_Bloomberg', 'MXN_TIIE_Banxico_Reference_Banks', 'MXN_TIIE_ON', 'MXN_TIIE_ON_OIS_Compound', 'MXN_TIIE_Reference_Banks', 'MYR_KLIBOR', 'MYR_KLIBOR_BNM', 'MYR_KLIBOR_Reference_Banks', 'MYR_MYOR', 'MYR_MYOR_OIS_Compound', 'MYR_Quarterly_Swap_Rate_11_00_TRADITION', 'MYR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'NOK_NIBOR', 'NOK_NIBOR_NIBR', 'NOK_NIBOR_NIBR_Bloomberg', 'NOK_NIBOR_NIBR_Reference_Banks', 'NOK_NIBOR_OIBOR', 'NOK_NIBOR_Reference_Banks', 'NOK_NOWA', 'NOK_NOWA_OIS_Compound', 'NZD_BBR_BID', 'NZD_BBR_FRA', 'NZD_BBR_ISDC', 'NZD_BBR_Reference_Banks', 'NZD_BBR_Telerate', 'NZD_BKBM_Bid', 'NZD_BKBM_FRA', 'NZD_BKBM_FRA_Swap_Rate_ICAP', 'NZD_NZIONA', 'NZD_NZIONA_OIS_Compound_1', 'NZD_NZIONA_OIS_COMPOUND', 'NZD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'NZD_Semi_Annual_Swap_Rate_BGCANTOR_Reference_Banks', 'NZD_Swap_Rate_ICAP', 'NZD_Swap_Rate_ICAP_Reference_Banks', 'PHP_ORR', 'PHP_PHIREF', 'PHP_PHIREF_BAP', 'PHP_PHIREF_Bloomberg', 'PHP_PHIREF_Reference_Banks', 'PHP_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'PHP_Semi_Annual_Swap_Rate_Reference_Banks', 'PLN_POLONIA', 'PLN_POLONIA_OIS_Compound_1', 'PLN_POLONIA_OIS_COMPOUND', 'PLN_POLSTR', 'PLN_POLSTR_OIS_Compound', 'PLN_WIBID', 'PLN_WIBOR', 'PLN_WIBOR_Reference_Banks', 'PLN_WIBOR_WIBO', 'PLN_WIRON', 'PLN_WIRON_OIS_Compound', 'PLZ_WIBOR_Reference_Banks', 'PLZ_WIBOR_WIBO', 'REPOFUNDS_RATE_FRANCE_OIS_COMPOUND', 'REPOFUNDS_RATE_GERMANY_OIS_COMPOUND', 'REPOFUNDS_RATE_ITALY_OIS_COMPOUND', 'RON_Annual_Swap_Rate_11_00_BGCANTOR', 'RON_Annual_Swap_Rate_Reference_Banks', 'RON_RBOR_Reuters', 'RON_ROBID', 'RON_ROBOR', 'RUB_Annual_Swap_Rate_11_00_BGCANTOR', 'RUB_Annual_Swap_Rate_12_45_TRADITION', 'RUB_Annual_Swap_Rate_4_15_TRADITION', 'RUB_Annual_Swap_Rate_Reference_Banks', 'RUB_Annual_Swap_Rate_TRADITION_Reference_Banks', 'RUB_Key_Rate_CBRF', 'RUB_MosPrime', 'RUB_MOSPRIME_NFEA', 'RUB_MOSPRIME_Reference_Banks', 'RUB_RUONIA', 'RUB_RUONIA_OIS_Compound_1', 'RUB_RUONIA_OIS_COMPOUND', 'SAR_SAIBOR', 'SAR_SRIOR_Reference_Banks', 'SAR_SRIOR_SUAA', 'SEK_Annual_Swap_Rate', 'SEK_Annual_Swap_Rate_SESWFI', 'SEK_SIOR_OIS_COMPOUND', 'SEK_STIBOR', 'SEK_STIBOR_Bloomberg', 'SEK_STIBOR_OIS_Compound', 'SEK_STIBOR_Reference_Banks', 'SEK_STIBOR_SIDE', 'SEK_SWESTR', 'SEK_SWESTR_Average_1M', 'SEK_SWESTR_Average_1W', 'SEK_SWESTR_Average_2M', 'SEK_SWESTR_Average_3M', 'SEK_SWESTR_Average_6M', 'SEK_SWESTR_Compounded_Index', 'SEK_SWESTR_OIS_Compound', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Currency_Basis_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'SGD_Semi_Annual_Swap_Rate_11_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_11_00_TRADITION', 'SGD_Semi_Annual_Swap_Rate_16_00_Tullett_Prebon', 'SGD_Semi_Annual_Swap_Rate_ICAP', 'SGD_Semi_Annual_Swap_Rate_ICAP_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_Reference_Banks', 'SGD_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'SGD_SIBOR', 'SGD_SIBOR_Reference_Banks', 'SGD_SIBOR_Reuters', 'SGD_SIBOR_Telerate', 'SGD_SONAR_OIS_COMPOUND', 'SGD_SONAR_OIS_VWAP_COMPOUND', 'SGD_SOR', 'SGD_SORA', 'SGD_SORA_COMPOUND', 'SGD_SORA_OIS_Compound', 'SGD_SOR_Reference_Banks', 'SGD_SOR_Reuters', 'SGD_SOR_Telerate', 'SGD_SOR_VWAP', 'SGD_SOR_VWAP_Reference_Banks', 'SKK_BRIBOR_Bloomberg', 'SKK_BRIBOR_BRBO', 'SKK_BRIBOR_NBSK07', 'SKK_BRIBOR_Reference_Banks', 'THB_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'THB_Semi_Annual_Swap_Rate_Reference_Banks', 'THB_SOR_Reference_Banks', 'THB_SOR_Reuters', 'THB_SOR_Telerate', 'THB_THBFIX', 'THB_THBFIX_Reference_Banks', 'THB_THBFIX_Reuters', 'THB_THOR', 'THB_THOR_COMPOUND', 'THB_THOR_OIS_Compound', 'TRY_Annual_Swap_Rate_11_00_TRADITION', 'TRY_Annual_Swap_Rate_11_15_BGCANTOR', 'TRY_Annual_Swap_Rate_Reference_Banks', 'TRY_Semi_Annual_Swap_Rate_TRADITION_Reference_Banks', 'TRY_TLREF', 'TRY_TLREF_OIS_Compound_1', 'TRY_TLREF_OIS_COMPOUND', 'TRY_TRLIBOR', 'TRY_TRYIBOR_Reference_Banks', 'TRY_TRYIBOR_Reuters', 'TWD_Quarterly_Annual_Swap_Rate_11_00_BGCANTOR', 'TWD_Quarterly_Annual_Swap_Rate_Reference_Banks', 'TWD_Reference_Dealers', 'TWD_Reuters_6165', 'TWD_TAIBIR01', 'TWD_TAIBIR02', 'TWD_TAIBOR', 'TWD_TAIBOR_Bloomberg', 'TWD_TAIBOR_Reuters', 'TWD_Telerate_6165', 'TWD_TWCPBA', 'UK_Base_Rate', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_3M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP', 'USD_6M_LIBOR_SWAP_CME_vs_LCH_ICAP_Bloomberg', 'USD_AMERIBOR', 'USD_AMERIBOR_Average_30D', 'USD_AMERIBOR_Average_90D', 'USD_AMERIBOR_Term', 'USD_AMERIBOR_Term_Structure', 'USD_Annual_Swap_Rate_11_00_BGCANTOR', 'USD_Annual_Swap_Rate_11_00_TRADITION', 'USD_Annual_Swap_Rate_4_00_TRADITION', 'USD_AXI_Term', 'USD_BA_H_15', 'USD_BA_Reference_Dealers', 'USD_BMA_Municipal_Swap_Index', 'USD_BSBY', 'USD_CD_H_15', 'USD_CD_Reference_Dealers', 'USD_CMS_Reference_Banks', 'USD_CMS_Reference_Banks_ICAP_SwapPX', 'USD_CMS_Reuters', 'USD_CMS_Telerate', 'USD_CMT', 'USD_CMT_Average_1W', 'USD_CMT_T7051', 'USD_CMT_T7052', 'USD_COF11_FHLBSF', 'USD_COF11_Reuters', 'USD_COF11_Telerate', 'USD_COFI', 'USD_CP_H_15', 'USD_CP_Money_Market_Yield', 'USD_CP_Reference_Dealers', 'USD_CRITR', 'USD_Federal_Funds', 'USD_Federal_Funds_H_15', 'USD_Federal_Funds_H_15_Bloomberg', 'USD_Federal_Funds_H_15_OIS_COMPOUND', 'USD_Federal_Funds_OIS_Compound', 'USD_Federal_Funds_Reference_Dealers', 'USD_FFCB_DISCO', 'USD_FXI_Term', 'USD_ISDAFIX3_Swap_Rate', 'USD_ISDAFIX3_Swap_Rate_3_00', 'USD_ISDA_Swap_Rate', 'USD_ISDA_Swap_Rate_3_00', 'USD_LIBOR', 'USD_LIBOR_BBA', 'USD_LIBOR_BBA_Bloomberg', 'USD_LIBOR_ICE_Swap_Rate_11_00', 'USD_LIBOR_ICE_Swap_Rate_15_00', 'USD_LIBOR_ISDA', 'USD_LIBOR_LIBO', 'USD_LIBOR_Reference_Banks', 'USD_Municipal_Swap_Index', 'USD_Municipal_Swap_Libor_Ratio_11_00_ICAP', 'USD_Municipal_Swap_Rate_11_00_ICAP', 'USD_OIS_11_00_BGCANTOR', 'USD_OIS_11_00_LON_ICAP', 'USD_OIS_11_00_NY_ICAP', 'USD_OIS_11_00_TRADITION', 'USD_OIS_3_00_BGCANTOR', 'USD_OIS_3_00_NY_ICAP', 'USD_OIS_4_00_TRADITION', 'USD_Overnight_Bank_Funding_Rate', 'USD_Prime', 'USD_Prime_H_15', 'USD_Prime_Reference_Banks', 'USD_S_P_Index_High_Grade', 'USD_SandP_Index_High_Grade', 'USD_SIBOR_Reference_Banks', 'USD_SIBOR_SIBO', 'USD_SIFMA_Municipal_Swap_Index', 'USD_SOFR', 'USD_SOFR_Average_180D', 'USD_SOFR_Average_30D', 'USD_SOFR_Average_90D', 'USD_SOFR_CME_Term', 'USD_SOFR_COMPOUND', 'USD_SOFR_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index', 'USD_SOFR_ICE_Compounded_Index_0_Floor', 'USD_SOFR_ICE_Compounded_Index_0_Floor_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_0_Floor_5D_Lag', 'USD_SOFR_ICE_Compounded_Index_2D_Lag', 'USD_SOFR_ICE_Compounded_Index_5D_Lag', 'USD_SOFR_ICE_Swap_Rate', 'USD_SOFR_ICE_Swap_Rate_Spreads', 'USD_SOFR_ICE_Term', 'USD_SOFR_OIS_Compound', 'USD_Swap_Rate_BCMP1', 'USD_TBILL_Auction_High_Rate', 'USD_TBILL_H_15', 'USD_TBILL_H_15_Bloomberg', 'USD_TBILL_Secondary_Market', 'USD_TBILL_Secondary_Market_Bond_Equivalent_Yield', 'USD_TIBOR_ISDC', 'USD_TIBOR_Reference_Banks', 'USD_Treasury_19901_3_00_ICAP', 'USD_Treasury_Rate_BCMP1', 'USD_Treasury_Rate_ICAP_BrokerTec', 'USD_Treasury_Rate_SwapMarker100', 'USD_Treasury_Rate_SwapMarker99', 'USD_Treasury_Rate_T19901', 'USD_Treasury_Rate_T500', 'VND_Semi_Annual_Swap_Rate_11_00_BGCANTOR', 'VND_Semi_Annual_Swap_Rate_Reference_Banks', 'ZAR_DEPOSIT_Reference_Banks', 'ZAR_DEPOSIT_SAFEX', 'ZAR_JIBAR', 'ZAR_JIBAR_Reference_Banks', 'ZAR_JIBAR_SAFEX', 'ZAR_Prime_Average_1', 'ZAR_PRIME_AVERAGE', 'ZAR_PRIME_AVERAGE_Reference_Banks', 'ZAR_Quarterly_Swap_Rate_1_00_TRADITION', 'ZAR_Quarterly_Swap_Rate_5_30_TRADITION', 'ZAR_Quarterly_Swap_Rate_TRADITION_Reference_Banks', 'ZAR_ZARONIA', 'ZAR_ZARONIA_OIS_Compound'))

UNION ALL

SELECT 'StubFloatingRate' AS table_name, 'rateTreatment' AS column_name, 'enum' AS constraint_type, id AS record_id, "rateTreatment" AS invalid_value 
FROM "StubFloatingRate" 
WHERE "StubFloatingRate"."rateTreatment" IS NOT NULL AND ("StubFloatingRate"."rateTreatment" NOT IN ('BondEquivalentYield', 'MoneyMarketYield'))

UNION ALL

SELECT 'FixedAmountCalculationDetails' AS table_name, 'calculationPeriod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FixedAmountCalculationDetails" 
WHERE "FixedAmountCalculationDetails"."calculationPeriod" IS NULL

UNION ALL

SELECT 'FixedAmountCalculationDetails' AS table_name, 'calculationPeriodNotionalAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FixedAmountCalculationDetails" 
WHERE "FixedAmountCalculationDetails"."calculationPeriodNotionalAmount" IS NULL

UNION ALL

SELECT 'FixedAmountCalculationDetails' AS table_name, 'fixedRate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FixedAmountCalculationDetails" 
WHERE "FixedAmountCalculationDetails"."fixedRate" IS NULL

UNION ALL

SELECT 'FixedAmountCalculationDetails' AS table_name, 'yearFraction' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FixedAmountCalculationDetails" 
WHERE "FixedAmountCalculationDetails"."yearFraction" IS NULL

UNION ALL

SELECT 'FixedAmountCalculationDetails' AS table_name, 'calculatedAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FixedAmountCalculationDetails" 
WHERE "FixedAmountCalculationDetails"."calculatedAmount" IS NULL

UNION ALL

SELECT 'CalculationPeriodData' AS table_name, 'startDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationPeriodData" 
WHERE "CalculationPeriodData"."startDate" IS NULL

UNION ALL

SELECT 'CalculationPeriodData' AS table_name, 'endDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationPeriodData" 
WHERE "CalculationPeriodData"."endDate" IS NULL

UNION ALL

SELECT 'CalculationPeriodData' AS table_name, 'daysInPeriod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationPeriodData" 
WHERE "CalculationPeriodData"."daysInPeriod" IS NULL

UNION ALL

SELECT 'CalculationPeriodData' AS table_name, 'daysInLeapYearPeriod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationPeriodData" 
WHERE "CalculationPeriodData"."daysInLeapYearPeriod" IS NULL

UNION ALL

SELECT 'CalculationPeriodData' AS table_name, 'isFirstPeriod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationPeriodData" 
WHERE "CalculationPeriodData"."isFirstPeriod" IS NULL

UNION ALL

SELECT 'CalculationPeriodData' AS table_name, 'isLastPeriod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationPeriodData" 
WHERE "CalculationPeriodData"."isLastPeriod" IS NULL

UNION ALL

SELECT 'StubPeriod' AS table_name, 'calculationPeriodDatesReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "StubPeriod" 
WHERE "StubPeriod"."calculationPeriodDatesReference" IS NULL

UNION ALL

SELECT 'CalculationPeriodDates' AS table_name, 'stubPeriodType' AS column_name, 'enum' AS constraint_type, id AS record_id, "stubPeriodType" AS invalid_value 
FROM "CalculationPeriodDates" 
WHERE "CalculationPeriodDates"."stubPeriodType" IS NOT NULL AND ("CalculationPeriodDates"."stubPeriodType" NOT IN ('ShortInitial', 'ShortFinal', 'LongInitial', 'LongFinal'))

UNION ALL

SELECT 'DateRelativeToCalculationPeriodDates' AS table_name, 'calculationPeriodDatesReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DateRelativeToCalculationPeriodDates" 
WHERE "DateRelativeToCalculationPeriodDates"."calculationPeriodDatesReference" IS NULL

UNION ALL

SELECT 'DateRelativeToValuationDates' AS table_name, 'valuationDatesReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DateRelativeToValuationDates" 
WHERE "DateRelativeToValuationDates"."valuationDatesReference" IS NULL

UNION ALL

SELECT 'DateRelativeToPaymentDates' AS table_name, 'paymentDatesReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DateRelativeToPaymentDates" 
WHERE "DateRelativeToPaymentDates"."paymentDatesReference" IS NULL

UNION ALL

SELECT 'FxLinkedNotionalSchedule' AS table_name, 'varyingNotionalCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxLinkedNotionalSchedule" 
WHERE "FxLinkedNotionalSchedule"."varyingNotionalCurrency" IS NULL

UNION ALL

SELECT 'FxLinkedNotionalSchedule' AS table_name, 'varyingNotionalFixingDates' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxLinkedNotionalSchedule" 
WHERE "FxLinkedNotionalSchedule"."varyingNotionalFixingDates" IS NULL

UNION ALL

SELECT 'FxLinkedNotionalSchedule' AS table_name, 'fxSpotRateSource' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxLinkedNotionalSchedule" 
WHERE "FxLinkedNotionalSchedule"."fxSpotRateSource" IS NULL

UNION ALL

SELECT 'FxLinkedNotionalSchedule' AS table_name, 'varyingNotionalInterimExchangePaymentDates' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxLinkedNotionalSchedule" 
WHERE "FxLinkedNotionalSchedule"."varyingNotionalInterimExchangePaymentDates" IS NULL

UNION ALL

SELECT 'PaymentCalculationPeriod' AS table_name, 'calculationPeriod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PaymentCalculationPeriod" 
WHERE "PaymentCalculationPeriod"."calculationPeriod" IS NULL

UNION ALL

SELECT 'RateSchedule' AS table_name, 'price' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RateSchedule" 
WHERE "RateSchedule".price IS NULL

UNION ALL

SELECT 'ObservationTerms' AS table_name, 'observationTimeType' AS column_name, 'enum' AS constraint_type, id AS record_id, "observationTimeType" AS invalid_value 
FROM "ObservationTerms" 
WHERE "ObservationTerms"."observationTimeType" IS NOT NULL AND ("ObservationTerms"."observationTimeType" NOT IN ('Close', 'Open', 'OSP', 'SpecificTime', 'XETRA', 'DerivativesClose', 'AsSpecifiedInMasterConfirmation'))

UNION ALL

SELECT 'ObservationTerms' AS table_name, 'observationDates' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ObservationTerms" 
WHERE "ObservationTerms"."observationDates" IS NULL

UNION ALL

SELECT 'ParametricDates' AS table_name, 'dayType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ParametricDates" 
WHERE "ParametricDates"."dayType" IS NULL

UNION ALL

SELECT 'ParametricDates' AS table_name, 'dayType' AS column_name, 'enum' AS constraint_type, id AS record_id, "dayType" AS invalid_value 
FROM "ParametricDates" 
WHERE "ParametricDates"."dayType" IS NOT NULL AND ("ParametricDates"."dayType" NOT IN ('Business', 'Calendar', 'CurrencyBusiness', 'ExchangeBusiness', 'ScheduledTradingDay'))

UNION ALL

SELECT 'ParametricDates' AS table_name, 'dayDistribution' AS column_name, 'enum' AS constraint_type, id AS record_id, "dayDistribution" AS invalid_value 
FROM "ParametricDates" 
WHERE "ParametricDates"."dayDistribution" IS NOT NULL AND ("ParametricDates"."dayDistribution" NOT IN ('All', 'First', 'Last', 'Penultimate'))

UNION ALL

SELECT 'ParametricDates' AS table_name, 'dayOfWeek' AS column_name, 'enum' AS constraint_type, id AS record_id, "dayOfWeek" AS invalid_value 
FROM "ParametricDates" 
WHERE "ParametricDates"."dayOfWeek" IS NOT NULL AND ("ParametricDates"."dayOfWeek" NOT IN ('MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'))

UNION ALL

SELECT 'ParametricDates' AS table_name, 'businessCenters' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ParametricDates" 
WHERE "ParametricDates"."businessCenters" IS NULL

UNION ALL

SELECT 'Lag' AS table_name, 'lagDuration' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Lag" 
WHERE "Lag"."lagDuration" IS NULL

UNION ALL

SELECT 'ResetDates' AS table_name, 'resetRelativeTo' AS column_name, 'enum' AS constraint_type, id AS record_id, "resetRelativeTo" AS invalid_value 
FROM "ResetDates" 
WHERE "ResetDates"."resetRelativeTo" IS NOT NULL AND ("ResetDates"."resetRelativeTo" NOT IN ('CalculationPeriodStartDate', 'CalculationPeriodEndDate'))

UNION ALL

SELECT 'StubCalculationPeriodAmount' AS table_name, 'calculationPeriodDatesReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "StubCalculationPeriodAmount" 
WHERE "StubCalculationPeriodAmount"."calculationPeriodDatesReference" IS NULL

UNION ALL

SELECT 'AveragingObservationList' AS table_name, 'averagingObservation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AveragingObservationList" 
WHERE "AveragingObservationList"."averagingObservation" IS NULL

UNION ALL

SELECT 'AveragingPeriod' AS table_name, 'marketDisruption' AS column_name, 'enum' AS constraint_type, id AS record_id, "marketDisruption" AS invalid_value 
FROM "AveragingPeriod" 
WHERE "AveragingPeriod"."marketDisruption" IS NOT NULL AND ("AveragingPeriod"."marketDisruption" NOT IN ('ModifiedPostponement', 'Omission', 'Postponement'))

UNION ALL

SELECT 'WeightedAveragingObservation' AS table_name, 'weight' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "WeightedAveragingObservation" 
WHERE "WeightedAveragingObservation".weight IS NULL

UNION ALL

SELECT 'AmountSchedule' AS table_name, 'currency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AmountSchedule" 
WHERE "AmountSchedule".currency IS NULL

UNION ALL

SELECT 'AmountSchedule' AS table_name, 'value' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AmountSchedule" 
WHERE "AmountSchedule".value IS NULL

UNION ALL

SELECT 'PaymentDates' AS table_name, 'payRelativeTo' AS column_name, 'enum' AS constraint_type, id AS record_id, "payRelativeTo" AS invalid_value 
FROM "PaymentDates" 
WHERE "PaymentDates"."payRelativeTo" IS NOT NULL AND ("PaymentDates"."payRelativeTo" NOT IN ('CalculationPeriodStartDate', 'CalculationPeriodEndDate', 'LastPricingDate', 'ResetDate', 'ValuationDate'))

UNION ALL

SELECT 'ResetFrequency' AS table_name, 'weeklyRollConvention' AS column_name, 'enum' AS constraint_type, id AS record_id, "weeklyRollConvention" AS invalid_value 
FROM "ResetFrequency" 
WHERE "ResetFrequency"."weeklyRollConvention" IS NOT NULL AND ("ResetFrequency"."weeklyRollConvention" NOT IN ('TBILL'))

UNION ALL

SELECT 'ResetFrequency' AS table_name, 'periodMultiplier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ResetFrequency" 
WHERE "ResetFrequency"."periodMultiplier" IS NULL

UNION ALL

SELECT 'ResetFrequency' AS table_name, 'period' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ResetFrequency" 
WHERE "ResetFrequency".period IS NULL

UNION ALL

SELECT 'ResetFrequency' AS table_name, 'period' AS column_name, 'enum' AS constraint_type, id AS record_id, period AS invalid_value 
FROM "ResetFrequency" 
WHERE "ResetFrequency".period IS NOT NULL AND ("ResetFrequency".period NOT IN ('H', 'D', 'W', 'M', 'Y', 'T', 'C'))

UNION ALL

SELECT 'FinalCalculationPeriodDateAdjustment' AS table_name, 'relevantUnderlyingDateReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FinalCalculationPeriodDateAdjustment" 
WHERE "FinalCalculationPeriodDateAdjustment"."relevantUnderlyingDateReference" IS NULL

UNION ALL

SELECT 'FinalCalculationPeriodDateAdjustment' AS table_name, 'swapStreamReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FinalCalculationPeriodDateAdjustment" 
WHERE "FinalCalculationPeriodDateAdjustment"."swapStreamReference" IS NULL

UNION ALL

SELECT 'FinalCalculationPeriodDateAdjustment' AS table_name, 'businessDayConvention' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FinalCalculationPeriodDateAdjustment" 
WHERE "FinalCalculationPeriodDateAdjustment"."businessDayConvention" IS NULL

UNION ALL

SELECT 'FinalCalculationPeriodDateAdjustment' AS table_name, 'businessDayConvention' AS column_name, 'enum' AS constraint_type, id AS record_id, "businessDayConvention" AS invalid_value 
FROM "FinalCalculationPeriodDateAdjustment" 
WHERE "FinalCalculationPeriodDateAdjustment"."businessDayConvention" IS NOT NULL AND ("FinalCalculationPeriodDateAdjustment"."businessDayConvention" NOT IN ('FOLLOWING', 'FRN', 'MODFOLLOWING', 'PRECEDING', 'MODPRECEDING', 'NEAREST', 'NONE', 'NotApplicable'))

UNION ALL

SELECT 'FloatingAmountCalculationDetails' AS table_name, 'calculationPeriod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingAmountCalculationDetails" 
WHERE "FloatingAmountCalculationDetails"."calculationPeriod" IS NULL

UNION ALL

SELECT 'FloatingAmountCalculationDetails' AS table_name, 'calculationPeriodNotionalAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingAmountCalculationDetails" 
WHERE "FloatingAmountCalculationDetails"."calculationPeriodNotionalAmount" IS NULL

UNION ALL

SELECT 'FloatingAmountCalculationDetails' AS table_name, 'appliedRate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingAmountCalculationDetails" 
WHERE "FloatingAmountCalculationDetails"."appliedRate" IS NULL

UNION ALL

SELECT 'FloatingAmountCalculationDetails' AS table_name, 'yearFraction' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingAmountCalculationDetails" 
WHERE "FloatingAmountCalculationDetails"."yearFraction" IS NULL

UNION ALL

SELECT 'FloatingAmountCalculationDetails' AS table_name, 'calculatedAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingAmountCalculationDetails" 
WHERE "FloatingAmountCalculationDetails"."calculatedAmount" IS NULL

UNION ALL

SELECT 'FloatingAmountCalculationDetails' AS table_name, 'spreadExclusiveCalculatedAMount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingAmountCalculationDetails" 
WHERE "FloatingAmountCalculationDetails"."spreadExclusiveCalculatedAMount" IS NULL

UNION ALL

SELECT 'FloatingRateSettingDetails' AS table_name, 'floatingRate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingRateSettingDetails" 
WHERE "FloatingRateSettingDetails"."floatingRate" IS NULL

UNION ALL

SELECT 'FloatingRateProcessingDetails' AS table_name, 'rawRate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingRateProcessingDetails" 
WHERE "FloatingRateProcessingDetails"."rawRate" IS NULL

UNION ALL

SELECT 'FloatingRateProcessingDetails' AS table_name, 'processedRate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingRateProcessingDetails" 
WHERE "FloatingRateProcessingDetails"."processedRate" IS NULL

UNION ALL

SELECT 'FloatingRateProcessingDetails' AS table_name, 'spreadExclusiveRate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FloatingRateProcessingDetails" 
WHERE "FloatingRateProcessingDetails"."spreadExclusiveRate" IS NULL

UNION ALL

SELECT 'FloatingRateProcessingParameters' AS table_name, 'treatment' AS column_name, 'enum' AS constraint_type, id AS record_id, treatment AS invalid_value 
FROM "FloatingRateProcessingParameters" 
WHERE "FloatingRateProcessingParameters".treatment IS NOT NULL AND ("FloatingRateProcessingParameters".treatment NOT IN ('BondEquivalentYield', 'MoneyMarketYield'))

UNION ALL

SELECT 'FloatingRateProcessingParameters' AS table_name, 'negativeTreatment' AS column_name, 'enum' AS constraint_type, id AS record_id, "negativeTreatment" AS invalid_value 
FROM "FloatingRateProcessingParameters" 
WHERE "FloatingRateProcessingParameters"."negativeTreatment" IS NOT NULL AND ("FloatingRateProcessingParameters"."negativeTreatment" NOT IN ('NegativeInterestRateMethod', 'ZeroInterestRateMethod', 'ZeroInterestRateExcludingSpreadMethod'))

UNION ALL

SELECT 'EligibilityQuery' AS table_name, 'maturity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EligibilityQuery" 
WHERE "EligibilityQuery".maturity IS NULL

UNION ALL

SELECT 'EligibilityQuery' AS table_name, 'collateralAssetType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EligibilityQuery" 
WHERE "EligibilityQuery"."collateralAssetType" IS NULL

UNION ALL

SELECT 'EligibilityQuery' AS table_name, 'assetCountryOfOrigin' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EligibilityQuery" 
WHERE "EligibilityQuery"."assetCountryOfOrigin" IS NULL

UNION ALL

SELECT 'EligibilityQuery' AS table_name, 'assetCountryOfOrigin' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetCountryOfOrigin" AS invalid_value 
FROM "EligibilityQuery" 
WHERE "EligibilityQuery"."assetCountryOfOrigin" IS NOT NULL AND ("EligibilityQuery"."assetCountryOfOrigin" NOT IN ('AF', 'AL', 'DZ', 'AS', 'AD', 'AO', 'AI', 'AQ', 'AG', 'AR', 'AM', 'AW', 'AU', 'AT', 'AZ', 'BS', 'BH', 'BD', 'BB', 'BY', 'BE', 'BZ', 'BJ', 'BM', 'AX', 'BT', 'BO', 'BQ', 'BA', 'BW', 'BV', 'BR', 'IO', 'BN', 'BG', 'BF', 'BI', 'CV', 'KH', 'CM', 'CA', 'KY', 'CF', 'TD', 'CL', 'CN', 'CX', 'CC', 'CO', 'KM', 'CD', 'CG', 'CK', 'CR', 'HR', 'CU', 'CW', 'CY', 'CZ', 'CI', 'DK', 'DJ', 'DM', 'DO', 'EC', 'EG', 'SV', 'GQ', 'ER', 'EE', 'SZ', 'ET', 'FK', 'FO', 'FJ', 'FI', 'FR', 'GF', 'PF', 'TF', 'GA', 'GM', 'GE', 'DE', 'GH', 'GI', 'GR', 'GL', 'GD', 'GP', 'GU', 'GT', 'GG', 'GN', 'GW', 'GY', 'HT', 'HM', 'VA', 'HN', 'HK', 'HU', 'IS', 'IN', 'ID', 'IR', 'IQ', 'IE', 'IM', 'IL', 'IT', 'JM', 'JP', 'JE', 'JO', 'KZ', 'KE', 'KI', 'KP', 'KR', 'KW', 'KG', 'LA', 'LV', 'LB', 'LS', 'LR', 'LY', 'LI', 'LT', 'LU', 'MO', 'MG', 'MW', 'MY', 'MV', 'ML', 'MT', 'MH', 'MQ', 'MR', 'MU', 'YT', 'MX', 'FM', 'MD', 'MC', 'MN', 'ME', 'MS', 'MA', 'MZ', 'MM', 'NA', 'NR', 'NP', 'NL', 'NC', 'NZ', 'NI', 'NE', 'NG', 'NU', 'NF', 'MK', 'MP', 'NO', 'OM', 'PK', 'PW', 'PS', 'PA', 'PG', 'PY', 'PE', 'PH', 'PN', 'PL', 'PT', 'PR', 'QA', 'RO', 'RU', 'RW', 'RE', 'BL', 'SH', 'KN', 'LC', 'MF', 'PM', 'VC', 'WS', 'SM', 'ST', 'SA', 'SN', 'RS', 'SC', 'SL', 'SG', 'SX', 'SK', 'SI', 'SB', 'SO', 'ZA', 'GS', 'SS', 'ES', 'LK', 'SD', 'SR', 'SJ', 'SE', 'CH', 'SY', 'TW', 'TJ', 'TZ', 'TH', 'TL', 'TG', 'TK', 'TO', 'TT', 'TN', 'TM', 'TC', 'TV', 'TR', 'UG', 'UA', 'AE', 'GB', 'UM', 'US', 'UY', 'UZ', 'VU', 'VE', 'VN', 'VG', 'VI', 'WF', 'EH', 'YE', 'ZM', 'ZW'))

UNION ALL

SELECT 'EligibilityQuery' AS table_name, 'denominatedCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EligibilityQuery" 
WHERE "EligibilityQuery"."denominatedCurrency" IS NULL

UNION ALL

SELECT 'EligibilityQuery' AS table_name, 'denominatedCurrency' AS column_name, 'enum' AS constraint_type, id AS record_id, "denominatedCurrency" AS invalid_value 
FROM "EligibilityQuery" 
WHERE "EligibilityQuery"."denominatedCurrency" IS NOT NULL AND ("EligibilityQuery"."denominatedCurrency" NOT IN ('CNH', 'CNT', 'GGP', 'IMP', 'JEP', 'KID', 'MCF', 'SML', 'VAL'))

UNION ALL

SELECT 'EligibilityQuery' AS table_name, 'agencyRating' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EligibilityQuery" 
WHERE "EligibilityQuery"."agencyRating" IS NULL

UNION ALL

SELECT 'EligibilityQuery' AS table_name, 'issuerType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EligibilityQuery" 
WHERE "EligibilityQuery"."issuerType" IS NULL

UNION ALL

SELECT 'EligibilityQuery' AS table_name, 'issuerName' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EligibilityQuery" 
WHERE "EligibilityQuery"."issuerName" IS NULL

UNION ALL

SELECT 'CheckEligibilityResult' AS table_name, 'isEligible' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CheckEligibilityResult" 
WHERE "CheckEligibilityResult"."isEligible" IS NULL

UNION ALL

SELECT 'CheckEligibilityResult' AS table_name, 'eligibilityQuery' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CheckEligibilityResult" 
WHERE "CheckEligibilityResult"."eligibilityQuery" IS NULL

UNION ALL

SELECT 'CheckEligibilityResult' AS table_name, 'specification' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CheckEligibilityResult" 
WHERE "CheckEligibilityResult".specification IS NULL

UNION ALL

SELECT 'CollateralProvisions' AS table_name, 'collateralType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralProvisions" 
WHERE "CollateralProvisions"."collateralType" IS NULL

UNION ALL

SELECT 'CollateralProvisions' AS table_name, 'collateralType' AS column_name, 'enum' AS constraint_type, id AS record_id, "collateralType" AS invalid_value 
FROM "CollateralProvisions" 
WHERE "CollateralProvisions"."collateralType" IS NOT NULL AND ("CollateralProvisions"."collateralType" NOT IN ('Cash', 'NonCash', 'CashPool'))

UNION ALL

SELECT 'IndependentAmount' AS table_name, 'paymentDetail' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IndependentAmount" 
WHERE "IndependentAmount"."paymentDetail" IS NULL

UNION ALL

SELECT 'IndependentAmount' AS table_name, 'payerPartyReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IndependentAmount" 
WHERE "IndependentAmount"."payerPartyReference" IS NULL

UNION ALL

SELECT 'IndependentAmount' AS table_name, 'receiverPartyReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IndependentAmount" 
WHERE "IndependentAmount"."receiverPartyReference" IS NULL

UNION ALL

SELECT 'AgencyRatingCriteria' AS table_name, 'creditNotation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AgencyRatingCriteria" 
WHERE "AgencyRatingCriteria"."creditNotation" IS NULL

UNION ALL

SELECT 'AgencyRatingCriteria' AS table_name, 'mismatchResolution' AS column_name, 'enum' AS constraint_type, id AS record_id, "mismatchResolution" AS invalid_value 
FROM "AgencyRatingCriteria" 
WHERE "AgencyRatingCriteria"."mismatchResolution" IS NOT NULL AND ("AgencyRatingCriteria"."mismatchResolution" NOT IN ('Lowest', 'Highest', 'ReferenceAgency', 'Average', 'SecondBest', 'Other'))

UNION ALL

SELECT 'AgencyRatingCriteria' AS table_name, 'referenceAgency' AS column_name, 'enum' AS constraint_type, id AS record_id, "referenceAgency" AS invalid_value 
FROM "AgencyRatingCriteria" 
WHERE "AgencyRatingCriteria"."referenceAgency" IS NOT NULL AND ("AgencyRatingCriteria"."referenceAgency" NOT IN ('AMBest', 'CBRS', 'DBRS', 'Fitch', 'Japanagency', 'Moodys', 'RatingAndInvestmentInformation', 'StandardAndPoors'))

UNION ALL

SELECT 'AgencyRatingCriteria' AS table_name, 'boundary' AS column_name, 'enum' AS constraint_type, id AS record_id, boundary AS invalid_value 
FROM "AgencyRatingCriteria" 
WHERE "AgencyRatingCriteria".boundary IS NOT NULL AND ("AgencyRatingCriteria".boundary NOT IN ('Minimum', 'Maximum'))

UNION ALL

SELECT 'EligibleCollateralSpecification' AS table_name, 'criteria' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EligibleCollateralSpecification" 
WHERE "EligibleCollateralSpecification".criteria IS NULL

UNION ALL

SELECT 'CollateralCriteriaBase' AS table_name, 'appliesTo' AS column_name, 'enum' AS constraint_type, id AS record_id, "appliesTo" AS invalid_value 
FROM "CollateralCriteriaBase" 
WHERE "CollateralCriteriaBase"."appliesTo" IS NOT NULL AND ("CollateralCriteriaBase"."appliesTo" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'CollateralCriteriaBase' AS table_name, 'restrictTo' AS column_name, 'enum' AS constraint_type, id AS record_id, "restrictTo" AS invalid_value 
FROM "CollateralCriteriaBase" 
WHERE "CollateralCriteriaBase"."restrictTo" IS NOT NULL AND ("CollateralCriteriaBase"."restrictTo" NOT IN ('VariationMargin', 'InitialMargin'))

UNION ALL

SELECT 'CollateralCriteriaBase' AS table_name, 'ratingPriorityResolution' AS column_name, 'enum' AS constraint_type, id AS record_id, "ratingPriorityResolution" AS invalid_value 
FROM "CollateralCriteriaBase" 
WHERE "CollateralCriteriaBase"."ratingPriorityResolution" IS NOT NULL AND ("CollateralCriteriaBase"."ratingPriorityResolution" NOT IN ('Issuer', 'Asset', 'Lowest', 'Highest', 'Average'))

UNION ALL

SELECT 'EligibleCollateralCriteria' AS table_name, 'treatment' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EligibleCollateralCriteria" 
WHERE "EligibleCollateralCriteria".treatment IS NULL

UNION ALL

SELECT 'EligibleCollateralCriteria' AS table_name, 'appliesTo' AS column_name, 'enum' AS constraint_type, id AS record_id, "appliesTo" AS invalid_value 
FROM "EligibleCollateralCriteria" 
WHERE "EligibleCollateralCriteria"."appliesTo" IS NOT NULL AND ("EligibleCollateralCriteria"."appliesTo" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'EligibleCollateralCriteria' AS table_name, 'restrictTo' AS column_name, 'enum' AS constraint_type, id AS record_id, "restrictTo" AS invalid_value 
FROM "EligibleCollateralCriteria" 
WHERE "EligibleCollateralCriteria"."restrictTo" IS NOT NULL AND ("EligibleCollateralCriteria"."restrictTo" NOT IN ('VariationMargin', 'InitialMargin'))

UNION ALL

SELECT 'EligibleCollateralCriteria' AS table_name, 'ratingPriorityResolution' AS column_name, 'enum' AS constraint_type, id AS record_id, "ratingPriorityResolution" AS invalid_value 
FROM "EligibleCollateralCriteria" 
WHERE "EligibleCollateralCriteria"."ratingPriorityResolution" IS NOT NULL AND ("EligibleCollateralCriteria"."ratingPriorityResolution" NOT IN ('Issuer', 'Asset', 'Lowest', 'Highest', 'Average'))

UNION ALL

SELECT 'CollateralTreatment' AS table_name, 'isIncluded' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralTreatment" 
WHERE "CollateralTreatment"."isIncluded" IS NULL

UNION ALL

SELECT 'ConcentrationLimitCriteria' AS table_name, 'concentrationLimitType' AS column_name, 'enum' AS constraint_type, id AS record_id, "concentrationLimitType" AS invalid_value 
FROM "ConcentrationLimitCriteria" 
WHERE "ConcentrationLimitCriteria"."concentrationLimitType" IS NOT NULL AND ("ConcentrationLimitCriteria"."concentrationLimitType" NOT IN ('Asset', 'BaseCurrencyEquivalent', 'Issuer', 'PrimaryExchange', 'IndustrySector', 'UltimateParentInstitution', 'IssueOutstandingAmount', 'MarketCapitalisation', 'OutstandingBalance'))

UNION ALL

SELECT 'ConcentrationLimitCriteria' AS table_name, 'appliesTo' AS column_name, 'enum' AS constraint_type, id AS record_id, "appliesTo" AS invalid_value 
FROM "ConcentrationLimitCriteria" 
WHERE "ConcentrationLimitCriteria"."appliesTo" IS NOT NULL AND ("ConcentrationLimitCriteria"."appliesTo" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'ConcentrationLimitCriteria' AS table_name, 'restrictTo' AS column_name, 'enum' AS constraint_type, id AS record_id, "restrictTo" AS invalid_value 
FROM "ConcentrationLimitCriteria" 
WHERE "ConcentrationLimitCriteria"."restrictTo" IS NOT NULL AND ("ConcentrationLimitCriteria"."restrictTo" NOT IN ('VariationMargin', 'InitialMargin'))

UNION ALL

SELECT 'ConcentrationLimitCriteria' AS table_name, 'ratingPriorityResolution' AS column_name, 'enum' AS constraint_type, id AS record_id, "ratingPriorityResolution" AS invalid_value 
FROM "ConcentrationLimitCriteria" 
WHERE "ConcentrationLimitCriteria"."ratingPriorityResolution" IS NOT NULL AND ("ConcentrationLimitCriteria"."ratingPriorityResolution" NOT IN ('Issuer', 'Asset', 'Lowest', 'Highest', 'Average'))

UNION ALL

SELECT 'AverageTradingVolume' AS table_name, 'period' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AverageTradingVolume" 
WHERE "AverageTradingVolume".period IS NULL

UNION ALL

SELECT 'AverageTradingVolume' AS table_name, 'methodology' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AverageTradingVolume" 
WHERE "AverageTradingVolume".methodology IS NULL

UNION ALL

SELECT 'AverageTradingVolume' AS table_name, 'methodology' AS column_name, 'enum' AS constraint_type, id AS record_id, methodology AS invalid_value 
FROM "AverageTradingVolume" 
WHERE "AverageTradingVolume".methodology IS NOT NULL AND ("AverageTradingVolume".methodology NOT IN ('Single', 'Consolidated'))

UNION ALL

SELECT 'IssuerCountryOfOrigin' AS table_name, 'issuerCountryOfOrigin' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IssuerCountryOfOrigin" 
WHERE "IssuerCountryOfOrigin"."issuerCountryOfOrigin" IS NULL

UNION ALL

SELECT 'IssuerCountryOfOrigin' AS table_name, 'issuerCountryOfOrigin' AS column_name, 'enum' AS constraint_type, id AS record_id, "issuerCountryOfOrigin" AS invalid_value 
FROM "IssuerCountryOfOrigin" 
WHERE "IssuerCountryOfOrigin"."issuerCountryOfOrigin" IS NOT NULL AND ("IssuerCountryOfOrigin"."issuerCountryOfOrigin" NOT IN ('AF', 'AL', 'DZ', 'AS', 'AD', 'AO', 'AI', 'AQ', 'AG', 'AR', 'AM', 'AW', 'AU', 'AT', 'AZ', 'BS', 'BH', 'BD', 'BB', 'BY', 'BE', 'BZ', 'BJ', 'BM', 'AX', 'BT', 'BO', 'BQ', 'BA', 'BW', 'BV', 'BR', 'IO', 'BN', 'BG', 'BF', 'BI', 'CV', 'KH', 'CM', 'CA', 'KY', 'CF', 'TD', 'CL', 'CN', 'CX', 'CC', 'CO', 'KM', 'CD', 'CG', 'CK', 'CR', 'HR', 'CU', 'CW', 'CY', 'CZ', 'CI', 'DK', 'DJ', 'DM', 'DO', 'EC', 'EG', 'SV', 'GQ', 'ER', 'EE', 'SZ', 'ET', 'FK', 'FO', 'FJ', 'FI', 'FR', 'GF', 'PF', 'TF', 'GA', 'GM', 'GE', 'DE', 'GH', 'GI', 'GR', 'GL', 'GD', 'GP', 'GU', 'GT', 'GG', 'GN', 'GW', 'GY', 'HT', 'HM', 'VA', 'HN', 'HK', 'HU', 'IS', 'IN', 'ID', 'IR', 'IQ', 'IE', 'IM', 'IL', 'IT', 'JM', 'JP', 'JE', 'JO', 'KZ', 'KE', 'KI', 'KP', 'KR', 'KW', 'KG', 'LA', 'LV', 'LB', 'LS', 'LR', 'LY', 'LI', 'LT', 'LU', 'MO', 'MG', 'MW', 'MY', 'MV', 'ML', 'MT', 'MH', 'MQ', 'MR', 'MU', 'YT', 'MX', 'FM', 'MD', 'MC', 'MN', 'ME', 'MS', 'MA', 'MZ', 'MM', 'NA', 'NR', 'NP', 'NL', 'NC', 'NZ', 'NI', 'NE', 'NG', 'NU', 'NF', 'MK', 'MP', 'NO', 'OM', 'PK', 'PW', 'PS', 'PA', 'PG', 'PY', 'PE', 'PH', 'PN', 'PL', 'PT', 'PR', 'QA', 'RO', 'RU', 'RW', 'RE', 'BL', 'SH', 'KN', 'LC', 'MF', 'PM', 'VC', 'WS', 'SM', 'ST', 'SA', 'SN', 'RS', 'SC', 'SL', 'SG', 'SX', 'SK', 'SI', 'SB', 'SO', 'ZA', 'GS', 'SS', 'ES', 'LK', 'SD', 'SR', 'SJ', 'SE', 'CH', 'SY', 'TW', 'TJ', 'TZ', 'TH', 'TL', 'TG', 'TK', 'TO', 'TT', 'TN', 'TM', 'TC', 'TV', 'TR', 'UG', 'UA', 'AE', 'GB', 'UM', 'US', 'UY', 'UZ', 'VU', 'VE', 'VN', 'VG', 'VI', 'WF', 'EH', 'YE', 'ZM', 'ZW'))

UNION ALL

SELECT 'AssetCountryOfOrigin' AS table_name, 'assetCountryOfOrigin' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetCountryOfOrigin" 
WHERE "AssetCountryOfOrigin"."assetCountryOfOrigin" IS NULL

UNION ALL

SELECT 'AssetCountryOfOrigin' AS table_name, 'assetCountryOfOrigin' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetCountryOfOrigin" AS invalid_value 
FROM "AssetCountryOfOrigin" 
WHERE "AssetCountryOfOrigin"."assetCountryOfOrigin" IS NOT NULL AND ("AssetCountryOfOrigin"."assetCountryOfOrigin" NOT IN ('AF', 'AL', 'DZ', 'AS', 'AD', 'AO', 'AI', 'AQ', 'AG', 'AR', 'AM', 'AW', 'AU', 'AT', 'AZ', 'BS', 'BH', 'BD', 'BB', 'BY', 'BE', 'BZ', 'BJ', 'BM', 'AX', 'BT', 'BO', 'BQ', 'BA', 'BW', 'BV', 'BR', 'IO', 'BN', 'BG', 'BF', 'BI', 'CV', 'KH', 'CM', 'CA', 'KY', 'CF', 'TD', 'CL', 'CN', 'CX', 'CC', 'CO', 'KM', 'CD', 'CG', 'CK', 'CR', 'HR', 'CU', 'CW', 'CY', 'CZ', 'CI', 'DK', 'DJ', 'DM', 'DO', 'EC', 'EG', 'SV', 'GQ', 'ER', 'EE', 'SZ', 'ET', 'FK', 'FO', 'FJ', 'FI', 'FR', 'GF', 'PF', 'TF', 'GA', 'GM', 'GE', 'DE', 'GH', 'GI', 'GR', 'GL', 'GD', 'GP', 'GU', 'GT', 'GG', 'GN', 'GW', 'GY', 'HT', 'HM', 'VA', 'HN', 'HK', 'HU', 'IS', 'IN', 'ID', 'IR', 'IQ', 'IE', 'IM', 'IL', 'IT', 'JM', 'JP', 'JE', 'JO', 'KZ', 'KE', 'KI', 'KP', 'KR', 'KW', 'KG', 'LA', 'LV', 'LB', 'LS', 'LR', 'LY', 'LI', 'LT', 'LU', 'MO', 'MG', 'MW', 'MY', 'MV', 'ML', 'MT', 'MH', 'MQ', 'MR', 'MU', 'YT', 'MX', 'FM', 'MD', 'MC', 'MN', 'ME', 'MS', 'MA', 'MZ', 'MM', 'NA', 'NR', 'NP', 'NL', 'NC', 'NZ', 'NI', 'NE', 'NG', 'NU', 'NF', 'MK', 'MP', 'NO', 'OM', 'PK', 'PW', 'PS', 'PA', 'PG', 'PY', 'PE', 'PH', 'PN', 'PL', 'PT', 'PR', 'QA', 'RO', 'RU', 'RW', 'RE', 'BL', 'SH', 'KN', 'LC', 'MF', 'PM', 'VC', 'WS', 'SM', 'ST', 'SA', 'SN', 'RS', 'SC', 'SL', 'SG', 'SX', 'SK', 'SI', 'SB', 'SO', 'ZA', 'GS', 'SS', 'ES', 'LK', 'SD', 'SR', 'SJ', 'SE', 'CH', 'SY', 'TW', 'TJ', 'TZ', 'TH', 'TL', 'TG', 'TK', 'TO', 'TT', 'TN', 'TM', 'TC', 'TV', 'TR', 'UG', 'UA', 'AE', 'GB', 'UM', 'US', 'UY', 'UZ', 'VU', 'VE', 'VN', 'VG', 'VI', 'WF', 'EH', 'YE', 'ZM', 'ZW'))

UNION ALL

SELECT 'IssuerName' AS table_name, 'issuerName' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IssuerName" 
WHERE "IssuerName"."issuerName" IS NULL

UNION ALL

SELECT 'IssuerAgencyRating' AS table_name, 'issuerAgencyRating' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "IssuerAgencyRating" 
WHERE "IssuerAgencyRating"."issuerAgencyRating" IS NULL

UNION ALL

SELECT 'SovereignAgencyRating' AS table_name, 'sovereignAgencyRating' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SovereignAgencyRating" 
WHERE "SovereignAgencyRating"."sovereignAgencyRating" IS NULL

UNION ALL

SELECT 'AssetAgencyRating' AS table_name, 'assetAgencyRating' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetAgencyRating" 
WHERE "AssetAgencyRating"."assetAgencyRating" IS NULL

UNION ALL

SELECT 'AssetMaturity' AS table_name, 'maturityType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetMaturity" 
WHERE "AssetMaturity"."maturityType" IS NULL

UNION ALL

SELECT 'AssetMaturity' AS table_name, 'maturityType' AS column_name, 'enum' AS constraint_type, id AS record_id, "maturityType" AS invalid_value 
FROM "AssetMaturity" 
WHERE "AssetMaturity"."maturityType" IS NOT NULL AND ("AssetMaturity"."maturityType" NOT IN ('RemainingMaturity', 'OriginalMaturity', 'FromIssuance'))

UNION ALL

SELECT 'AssetMaturity' AS table_name, 'maturityRange' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetMaturity" 
WHERE "AssetMaturity"."maturityRange" IS NULL

UNION ALL

SELECT 'ListingExchange' AS table_name, 'exchange' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ListingExchange" 
WHERE "ListingExchange".exchange IS NULL

UNION ALL

SELECT 'ListingSector' AS table_name, 'sector' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ListingSector" 
WHERE "ListingSector".sector IS NULL

UNION ALL

SELECT 'DomesticCurrencyIssued' AS table_name, 'domesticCurrencyIssued' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DomesticCurrencyIssued" 
WHERE "DomesticCurrencyIssued"."domesticCurrencyIssued" IS NULL

UNION ALL

SELECT 'CounterpartyOwnIssuePermitted' AS table_name, 'counterpartyOwnIssuePermitted' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CounterpartyOwnIssuePermitted" 
WHERE "CounterpartyOwnIssuePermitted"."counterpartyOwnIssuePermitted" IS NULL

UNION ALL

SELECT 'AllCriteria' AS table_name, 'allCriteria' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AllCriteria" 
WHERE "AllCriteria"."allCriteria" IS NULL

UNION ALL

SELECT 'AnyCriteria' AS table_name, 'anyCriteria' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AnyCriteria" 
WHERE "AnyCriteria"."anyCriteria" IS NULL

UNION ALL

SELECT 'NegativeCriteria' AS table_name, 'negativeCriteria' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "NegativeCriteria" 
WHERE "NegativeCriteria"."negativeCriteria" IS NULL

UNION ALL

SELECT 'CollateralInterestParameters' AS table_name, 'postingParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "postingParty" AS invalid_value 
FROM "CollateralInterestParameters" 
WHERE "CollateralInterestParameters"."postingParty" IS NOT NULL AND ("CollateralInterestParameters"."postingParty" NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'CollateralInterestParameters' AS table_name, 'marginType' AS column_name, 'enum' AS constraint_type, id AS record_id, "marginType" AS invalid_value 
FROM "CollateralInterestParameters" 
WHERE "CollateralInterestParameters"."marginType" IS NOT NULL AND ("CollateralInterestParameters"."marginType" NOT IN ('VariationMargin', 'InitialMargin'))

UNION ALL

SELECT 'CollateralInterestCalculationParameters' AS table_name, 'inBaseCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralInterestCalculationParameters" 
WHERE "CollateralInterestCalculationParameters"."inBaseCurrency" IS NULL

UNION ALL

SELECT 'CollateralInterestCalculationParameters' AS table_name, 'compoundingType' AS column_name, 'enum' AS constraint_type, id AS record_id, "compoundingType" AS invalid_value 
FROM "CollateralInterestCalculationParameters" 
WHERE "CollateralInterestCalculationParameters"."compoundingType" IS NOT NULL AND ("CollateralInterestCalculationParameters"."compoundingType" NOT IN ('None', 'Business', 'Calendar'))

UNION ALL

SELECT 'CollateralInterestCalculationParameters' AS table_name, 'dayCountFraction' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralInterestCalculationParameters" 
WHERE "CollateralInterestCalculationParameters"."dayCountFraction" IS NULL

UNION ALL

SELECT 'CollateralInterestCalculationParameters' AS table_name, 'dayCountFraction' AS column_name, 'enum' AS constraint_type, id AS record_id, "dayCountFraction" AS invalid_value 
FROM "CollateralInterestCalculationParameters" 
WHERE "CollateralInterestCalculationParameters"."dayCountFraction" IS NOT NULL AND ("CollateralInterestCalculationParameters"."dayCountFraction" NOT IN ('ACT_360', 'ACT_365L', 'ACT_364', 'ACT_365_FIXED', 'ACT_ACT_AFB', 'ACT_ACT_ICMA', 'ACT_ACT_ISDA', 'ACT_ACT_ISMA', 'CAL_252', '_1_1', '_30E_360', '_30E_360_ISDA', '_30_360', 'RBA_BOND_BASIS'))

UNION ALL

SELECT 'CollateralInterestCalculationParameters' AS table_name, 'roundingFrequency' AS column_name, 'enum' AS constraint_type, id AS record_id, "roundingFrequency" AS invalid_value 
FROM "CollateralInterestCalculationParameters" 
WHERE "CollateralInterestCalculationParameters"."roundingFrequency" IS NOT NULL AND ("CollateralInterestCalculationParameters"."roundingFrequency" NOT IN ('Daily', 'PeriodEnd'))

UNION ALL

SELECT 'CollateralAgreementFloatingRate' AS table_name, 'negativeInterest' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralAgreementFloatingRate" 
WHERE "CollateralAgreementFloatingRate"."negativeInterest" IS NULL

UNION ALL

SELECT 'CollateralAgreementFloatingRate' AS table_name, 'compressibleSpread' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralAgreementFloatingRate" 
WHERE "CollateralAgreementFloatingRate"."compressibleSpread" IS NULL

UNION ALL

SELECT 'CollateralInterestHandlingParameters' AS table_name, 'interestPaymentHandling' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralInterestHandlingParameters" 
WHERE "CollateralInterestHandlingParameters"."interestPaymentHandling" IS NULL

UNION ALL

SELECT 'CollateralInterestHandlingParameters' AS table_name, 'interestPaymentHandling' AS column_name, 'enum' AS constraint_type, id AS record_id, "interestPaymentHandling" AS invalid_value 
FROM "CollateralInterestHandlingParameters" 
WHERE "CollateralInterestHandlingParameters"."interestPaymentHandling" IS NOT NULL AND ("CollateralInterestHandlingParameters"."interestPaymentHandling" NOT IN ('Transfer', 'Adjust', 'Transfer_or_Adjust'))

UNION ALL

SELECT 'CollateralInterestHandlingParameters' AS table_name, 'netPostedAndHeldInterest' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralInterestHandlingParameters" 
WHERE "CollateralInterestHandlingParameters"."netPostedAndHeldInterest" IS NULL

UNION ALL

SELECT 'CollateralInterestHandlingParameters' AS table_name, 'netInterestWithMarginCalls' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralInterestHandlingParameters" 
WHERE "CollateralInterestHandlingParameters"."netInterestWithMarginCalls" IS NULL

UNION ALL

SELECT 'CollateralInterestHandlingParameters' AS table_name, 'includeAccrualInMarginCalc' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralInterestHandlingParameters" 
WHERE "CollateralInterestHandlingParameters"."includeAccrualInMarginCalc" IS NULL

UNION ALL

SELECT 'CollateralInterestHandlingParameters' AS table_name, 'onFullReturn' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralInterestHandlingParameters" 
WHERE "CollateralInterestHandlingParameters"."onFullReturn" IS NULL

UNION ALL

SELECT 'CollateralInterestHandlingParameters' AS table_name, 'onPartialReturn' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralInterestHandlingParameters" 
WHERE "CollateralInterestHandlingParameters"."onPartialReturn" IS NULL

UNION ALL

SELECT 'CollateralInterestHandlingParameters' AS table_name, 'alternativeToInterestAmount' AS column_name, 'enum' AS constraint_type, id AS record_id, "alternativeToInterestAmount" AS invalid_value 
FROM "CollateralInterestHandlingParameters" 
WHERE "CollateralInterestHandlingParameters"."alternativeToInterestAmount" IS NOT NULL AND ("CollateralInterestHandlingParameters"."alternativeToInterestAmount" NOT IN ('Standard', 'ActualAmountReceived', 'TransferIfDeliveryAmountBelowMTA', 'Other'))

UNION ALL

SELECT 'CollateralInterestNotification' AS table_name, 'trigger' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralInterestNotification" 
WHERE "CollateralInterestNotification"."trigger" IS NULL

UNION ALL

SELECT 'CollateralInterestNotification' AS table_name, 'offset' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralInterestNotification" 
WHERE "CollateralInterestNotification"."offset" IS NULL

UNION ALL

SELECT 'CollateralInterestNotification' AS table_name, 'notificationTime' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralInterestNotification" 
WHERE "CollateralInterestNotification"."notificationTime" IS NULL

UNION ALL

SELECT 'CollateralInterestNotification' AS table_name, 'notificationDayType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CollateralInterestNotification" 
WHERE "CollateralInterestNotification"."notificationDayType" IS NULL

UNION ALL

SELECT 'CollateralInterestNotification' AS table_name, 'notificationDayType' AS column_name, 'enum' AS constraint_type, id AS record_id, "notificationDayType" AS invalid_value 
FROM "CollateralInterestNotification" 
WHERE "CollateralInterestNotification"."notificationDayType" IS NOT NULL AND ("CollateralInterestNotification"."notificationDayType" NOT IN ('Business', 'Calendar', 'CurrencyBusiness', 'ExchangeBusiness', 'ScheduledTradingDay'))

UNION ALL

SELECT 'InterestAmountApplication' AS table_name, 'returnAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InterestAmountApplication" 
WHERE "InterestAmountApplication"."returnAmount" IS NULL

UNION ALL

SELECT 'InterestAmountApplication' AS table_name, 'deliveryAmount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InterestAmountApplication" 
WHERE "InterestAmountApplication"."deliveryAmount" IS NULL

UNION ALL

SELECT 'DeliveryAmount' AS table_name, 'standardElection' AS column_name, 'enum' AS constraint_type, id AS record_id, "standardElection" AS invalid_value 
FROM "DeliveryAmount" 
WHERE "DeliveryAmount"."standardElection" IS NOT NULL AND ("DeliveryAmount"."standardElection" NOT IN ('LastLocalBusinessDay', 'LastAndAnyLocalBusinessDay'))

UNION ALL

SELECT 'IndexType' AS table_name, 'equityIndex' AS column_name, 'enum' AS constraint_type, id AS record_id, "equityIndex" AS invalid_value 
FROM "IndexType" 
WHERE "IndexType"."equityIndex" IS NOT NULL AND ("IndexType"."equityIndex" NOT IN ('AEX', 'ALLORD', 'AMSMID', 'AASHR', 'ASCIX', 'ARBG', 'ARGMI', 'ATHEX', 'ATX50', 'ATX', 'BEL20', 'BELAS', 'BELMD', 'BGBEL', 'BELSM', 'BGREIT', 'BULG30', 'BGBX40', 'TRKSTN', 'TIN30', 'BKADR', 'BKBRIC', 'BUMIX', 'BUDPES', 'PBVGEN', 'CAC40', 'FCASH', 'SBF250', 'CACL60', 'CAC190', 'FCAM', 'CAC20', 'CSM90', 'CDAX', 'CECE', 'CINT10', 'CSMGL', 'CSMST', 'CNX100', 'MILBCI', 'CZSEC', 'CSI500', 'CZT', 'DAX', 'DJTB30', 'DOWCOM', 'DOWI', 'DJT30', 'DJTCOM', 'DOWTRA', 'DOWUTI', 'DJES50', 'DJEUR', 'DJESTX', 'EURNXT', 'TSEFSI', 'FT100', 'FTSE25', 'FT350', 'FTAIM', 'FTSEAL', 'FALLW', 'BEMAS', 'BHSH', 'KLCOMP', 'FCHA50', 'FTE100', 'EURTP1', 'FTSFLG', 'GWADV', 'FTIASI', 'FTIMCI', 'FITSMC', 'ALLSTR', 'SPMIB', 'FTSMCA', 'SNGSES', 'FTSE', 'TAI50', 'FSA20', 'FTS40', 'JSEAS', 'JOHT25', 'FTJAS', 'FTJ40', 'JOHT40', 'EUR300', 'XDAX', 'HKHS', 'HSCEI', 'HSCI', 'HSENG', 'HSM100', 'HSREIT', 'HDAX', 'EHRMS', 'HUNTRI', 'IBEX35', 'IBEXM', 'IBEXS', 'BOVESP', 'JKCM', 'LQ45', 'SPAMAD', 'IMC30', 'ISEQ', 'ISEQ20', 'NK400', 'DBMIDC', 'SKKD', 'KO100', 'KORK20', 'KO50', 'KSPI', 'KORLRG', 'KOSPM', 'KOSPS', 'KRX100', 'LXBORG', 'DAXMID', 'MICEX', 'MSAPAC', 'MSEME', 'MSACEJ', 'MSACW', 'MSALL', 'MSACES', 'MSWDEJ', 'MAUIMI', 'MAUSLC', 'MAUSMC', 'MSAUST', 'AUSIMI', 'MSBELG', 'MSBRZ', 'MSCNDA', 'MCHA50', 'MSCHIN', 'MSCRLC', 'MSCRMC', 'MSDIMI', 'MSIMI', 'MSEAFE', 'MSEMAS', 'MSCIEM', 'MSERO', 'MSEESG', 'MSUREE', 'MSCIE', 'MSESC', 'MESMID', 'MSFDLC', 'MSFDMC', 'MSFIMI', 'MSFRLP', 'MHKIMI', 'MSIND', 'MIRIMI', 'MSITAL', 'MSITLC', 'MSITMC', 'ITSMCI', 'JAPIMI', 'MSCIJP', 'MSKOR', 'MSMEX', 'MSNETH', 'MSNEMC', 'MNZIMI', 'MSNORW', 'MSCIPE', 'MPOLLC', 'MPOLMC', 'MSPIMI', 'MSSING', 'MSCSA', 'MSSIMI', 'SWEIMI', 'MSWELC', 'SWIIMI', 'MSSWLP', 'MSTAI', 'MSTHAI', 'UKIMI', 'MSCIUK', 'UKSMCI', 'MSUSAL', 'MSUSEE', 'MSCIUS', 'MSWESG', 'MSDWEE', 'MSCIWD', 'MSLCBL', 'MSWSCS', 'MWSMID', 'MWIG', 'NASDAQ', 'NASCOM', 'NEXT15', 'NIK500', 'NIKKEI', 'NK300O', 'NYSE', 'OBX25', 'OMXAFG', 'KAX', 'KFX', 'KBX', 'OMXCPM', 'OMXCPS', 'HEXGEN', 'HEX25', 'HEXP', 'OMHSM', 'OMHSS', 'NOMXT', 'ICEX', 'ICEM', 'ICES', 'OMX', 'GENX', 'SOXP', 'OBX', 'OEBI', 'OSEMF', 'OESC', 'RUSTRA', 'PSECOM', 'PSIGI', 'PSI', 'PRAGE', 'PRIMAL', 'ASPMTI', 'ASPGEN', 'RRTS', 'RU1000', 'RU2000', 'RU250', 'RU3000', 'SP100', 'SP1500', 'SPFINA', 'SP500', 'SPINDU', 'SP600', 'SPADR', 'BMIFR', 'INSPCN', 'BS100', 'BS200', 'BOM500', 'BMIEMG', 'SPGNRG', 'SPGLBL', 'SPLT40', 'SPMIDC', 'TX150', 'ASX100', '_20LEAD', 'ASX200', 'ASX300', 'ASX50', 'ASXM50', 'ASPA', 'SPASX', 'INMEX', 'MEXCM', 'IPC', 'IPCM', 'PEGEN', 'INSENS', 'SPHG', 'SPLC', 'NZX10', 'NZSE50', 'NZSEAL', 'NZXMI', 'NZXSI', 'SP60', 'CSPT', 'TSE300', 'SNPPF', 'CSPS', 'TSXVEN', 'SBF120', 'SBITOP', 'SDAX', 'SET100', 'BNGK50', 'CHSHG', 'C180', 'CHSA', 'CHSB', 'CSSC', 'S300', '_S300', 'CHZA', 'CHZB', 'CSZC', 'SLISWS', 'SMIEX', 'SMI', 'SMIM', 'BSOFIX', 'PAC600', 'DJSE', 'STXE6B', 'DJS600', 'DJSTXL', 'SX1800', 'SNGSTR', 'SWIG', 'SPI', 'ISTMI', 'TELAVI', 'TDWTAS', 'TWSE', 'TAIOTC', 'TECDAX', 'BNGKSE', 'TPX100', 'TS1000', 'JT500', 'TCOR30', 'TOPIX', 'TPXLRG', 'TMID40', 'TPXSMA', 'TSEGMC', 'TSEGMI', 'TKMOTH', 'TSEPMC', 'TSEPMI', 'TSER', 'TSESMI', 'TSES20', 'VENGEN', 'AVSE', 'PWWGI', 'PWG20', 'WIG30', 'WFEXCH'))

UNION ALL

SELECT 'ComputedAmount' AS table_name, 'callFunction' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ComputedAmount" 
WHERE "ComputedAmount"."callFunction" IS NULL

UNION ALL

SELECT 'ComputedAmount' AS table_name, 'amount' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ComputedAmount" 
WHERE "ComputedAmount".amount IS NULL

UNION ALL

SELECT 'AssetFlowBase' AS table_name, 'quantity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetFlowBase" 
WHERE "AssetFlowBase".quantity IS NULL

UNION ALL

SELECT 'AssetFlowBase' AS table_name, 'asset' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetFlowBase" 
WHERE "AssetFlowBase".asset IS NULL

UNION ALL

SELECT 'AssetFlowBase' AS table_name, 'settlementDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetFlowBase" 
WHERE "AssetFlowBase"."settlementDate" IS NULL

UNION ALL

SELECT 'AssetFlow' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetFlow" 
WHERE "AssetFlow"."payerReceiver" IS NULL

UNION ALL

SELECT 'AssetFlow' AS table_name, 'assetFlowType' AS column_name, 'enum' AS constraint_type, id AS record_id, "assetFlowType" AS invalid_value 
FROM "AssetFlow" 
WHERE "AssetFlow"."assetFlowType" IS NOT NULL AND ("AssetFlow"."assetFlowType" NOT IN ('CorporateAction', 'Coupon', 'CreditEvent', 'DividendReturn', 'Exercise', 'FixedRateReturn', 'FloatingRateReturn', 'FractionalAmount', 'InterestReturn', 'NetInterest', 'Performance', 'Principal'))

UNION ALL

SELECT 'AssetFlow' AS table_name, 'quantity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetFlow" 
WHERE "AssetFlow".quantity IS NULL

UNION ALL

SELECT 'AssetFlow' AS table_name, 'asset' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetFlow" 
WHERE "AssetFlow".asset IS NULL

UNION ALL

SELECT 'AssetFlow' AS table_name, 'settlementDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetFlow" 
WHERE "AssetFlow"."settlementDate" IS NULL

UNION ALL

SELECT 'PayoutBase' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PayoutBase" 
WHERE "PayoutBase"."payerReceiver" IS NULL

UNION ALL

SELECT 'RollFeature' AS table_name, 'rollSourceCalendar' AS column_name, 'enum' AS constraint_type, id AS record_id, "rollSourceCalendar" AS invalid_value 
FROM "RollFeature" 
WHERE "RollFeature"."rollSourceCalendar" IS NOT NULL AND ("RollFeature"."rollSourceCalendar" NOT IN ('ListedOption', 'Future'))

UNION ALL

SELECT 'CashSettlementTerms' AS table_name, 'cashSettlementMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "cashSettlementMethod" AS invalid_value 
FROM "CashSettlementTerms" 
WHERE "CashSettlementTerms"."cashSettlementMethod" IS NOT NULL AND ("CashSettlementTerms"."cashSettlementMethod" NOT IN ('CashPriceMethod', 'CashPriceAlternateMethod', 'ParYieldCurveAdjustedMethod', 'ZeroCouponYieldAdjustedMethod', 'ParYieldCurveUnadjustedMethod', 'CrossCurrencyMethod', 'CollateralizedCashPriceMethod', 'MidMarketIndicativeQuotations', 'MidMarketIndicativeQuotationsAlternate', 'MidMarketCalculationAgentDetermination', 'ReplacementValueFirmQuotations', 'ReplacementValueCalculationAgentDetermination'))

UNION ALL

SELECT 'DeliverableObligations' AS table_name, 'category' AS column_name, 'enum' AS constraint_type, id AS record_id, category AS invalid_value 
FROM "DeliverableObligations" 
WHERE "DeliverableObligations".category IS NOT NULL AND ("DeliverableObligations".category NOT IN ('Payment', 'BorrowedMoney', 'ReferenceObligationsOnly', 'Bond', 'Loan', 'BondOrLoan'))

UNION ALL

SELECT 'LoanParticipation' AS table_name, 'applicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "LoanParticipation" 
WHERE "LoanParticipation".applicable IS NULL

UNION ALL

SELECT 'PCDeliverableObligationCharac' AS table_name, 'applicable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PCDeliverableObligationCharac" 
WHERE "PCDeliverableObligationCharac".applicable IS NULL

UNION ALL

SELECT 'PhysicalSettlementTerms' AS table_name, 'predeterminedClearingOrganizationParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "predeterminedClearingOrganizationParty" AS invalid_value 
FROM "PhysicalSettlementTerms" 
WHERE "PhysicalSettlementTerms"."predeterminedClearingOrganizationParty" IS NOT NULL AND ("PhysicalSettlementTerms"."predeterminedClearingOrganizationParty" NOT IN ('DisruptionEventsDeterminingParty', 'ExtraordinaryDividendsParty', 'PredeterminedClearingOrganizationParty', 'ExerciseNoticeReceiverPartyManual', 'ExerciseNoticeReceiverPartyOptionalEarlyTermination', 'ExerciseNoticeReceiverPartyCancelableProvision', 'ExerciseNoticeReceiverPartyExtendibleProvision', 'CalculationAgentIndependent', 'CalculationAgentOptionalEarlyTermination', 'CalculationAgentMandatoryEarlyTermination', 'CalculationAgentFallback'))

UNION ALL

SELECT 'PercentageRule' AS table_name, 'paymentPercent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PercentageRule" 
WHERE "PercentageRule"."paymentPercent" IS NULL

UNION ALL

SELECT 'PercentageRule' AS table_name, 'notionalAmountReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PercentageRule" 
WHERE "PercentageRule"."notionalAmountReference" IS NULL

UNION ALL

SELECT 'FxFixingDate' AS table_name, 'businessDayConvention' AS column_name, 'enum' AS constraint_type, id AS record_id, "businessDayConvention" AS invalid_value 
FROM "FxFixingDate" 
WHERE "FxFixingDate"."businessDayConvention" IS NOT NULL AND ("FxFixingDate"."businessDayConvention" NOT IN ('FOLLOWING', 'FRN', 'MODFOLLOWING', 'PRECEDING', 'MODPRECEDING', 'NEAREST', 'NONE', 'NotApplicable'))

UNION ALL

SELECT 'FxFixingDate' AS table_name, 'dayType' AS column_name, 'enum' AS constraint_type, id AS record_id, "dayType" AS invalid_value 
FROM "FxFixingDate" 
WHERE "FxFixingDate"."dayType" IS NOT NULL AND ("FxFixingDate"."dayType" NOT IN ('Business', 'Calendar', 'CurrencyBusiness', 'ExchangeBusiness', 'ScheduledTradingDay'))

UNION ALL

SELECT 'FxFixingDate' AS table_name, 'periodMultiplier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxFixingDate" 
WHERE "FxFixingDate"."periodMultiplier" IS NULL

UNION ALL

SELECT 'FxFixingDate' AS table_name, 'period' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxFixingDate" 
WHERE "FxFixingDate".period IS NULL

UNION ALL

SELECT 'FxFixingDate' AS table_name, 'period' AS column_name, 'enum' AS constraint_type, id AS record_id, period AS invalid_value 
FROM "FxFixingDate" 
WHERE "FxFixingDate".period IS NOT NULL AND ("FxFixingDate".period NOT IN ('D', 'W', 'M', 'Y'))

UNION ALL

SELECT 'SettlementTerms' AS table_name, 'settlementType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SettlementTerms" 
WHERE "SettlementTerms"."settlementType" IS NULL

UNION ALL

SELECT 'SettlementTerms' AS table_name, 'settlementType' AS column_name, 'enum' AS constraint_type, id AS record_id, "settlementType" AS invalid_value 
FROM "SettlementTerms" 
WHERE "SettlementTerms"."settlementType" IS NOT NULL AND ("SettlementTerms"."settlementType" NOT IN ('Cash', 'Physical', 'Election', 'CashOrPhysical'))

UNION ALL

SELECT 'SettlementTerms' AS table_name, 'transferSettlementType' AS column_name, 'enum' AS constraint_type, id AS record_id, "transferSettlementType" AS invalid_value 
FROM "SettlementTerms" 
WHERE "SettlementTerms"."transferSettlementType" IS NOT NULL AND ("SettlementTerms"."transferSettlementType" NOT IN ('DeliveryVersusDelivery', 'DeliveryVersusPayment', 'PaymentVersusPayment', 'NotCentralSettlement'))

UNION ALL

SELECT 'SettlementTerms' AS table_name, 'settlementCentre' AS column_name, 'enum' AS constraint_type, id AS record_id, "settlementCentre" AS invalid_value 
FROM "SettlementTerms" 
WHERE "SettlementTerms"."settlementCentre" IS NOT NULL AND ("SettlementTerms"."settlementCentre" NOT IN ('EuroclearBank', 'ClearstreamBankingLuxembourg'))

UNION ALL

SELECT 'SettlementTerms' AS table_name, 'standardSettlementStyle' AS column_name, 'enum' AS constraint_type, id AS record_id, "standardSettlementStyle" AS invalid_value 
FROM "SettlementTerms" 
WHERE "SettlementTerms"."standardSettlementStyle" IS NOT NULL AND ("SettlementTerms"."standardSettlementStyle" NOT IN ('Standard', 'Net', 'StandardAndNet', 'PairAndNet'))

UNION ALL

SELECT 'PaymentDetail' AS table_name, 'paymentRule' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PaymentDetail" 
WHERE "PaymentDetail"."paymentRule" IS NULL

UNION ALL

SELECT 'PrincipalPayments' AS table_name, 'initialPayment' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PrincipalPayments" 
WHERE "PrincipalPayments"."initialPayment" IS NULL

UNION ALL

SELECT 'PrincipalPayments' AS table_name, 'finalPayment' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PrincipalPayments" 
WHERE "PrincipalPayments"."finalPayment" IS NULL

UNION ALL

SELECT 'PrincipalPayments' AS table_name, 'intermediatePayment' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PrincipalPayments" 
WHERE "PrincipalPayments"."intermediatePayment" IS NULL

UNION ALL

SELECT 'SettlementBase' AS table_name, 'settlementType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SettlementBase" 
WHERE "SettlementBase"."settlementType" IS NULL

UNION ALL

SELECT 'SettlementBase' AS table_name, 'settlementType' AS column_name, 'enum' AS constraint_type, id AS record_id, "settlementType" AS invalid_value 
FROM "SettlementBase" 
WHERE "SettlementBase"."settlementType" IS NOT NULL AND ("SettlementBase"."settlementType" NOT IN ('Cash', 'Physical', 'Election', 'CashOrPhysical'))

UNION ALL

SELECT 'SettlementBase' AS table_name, 'transferSettlementType' AS column_name, 'enum' AS constraint_type, id AS record_id, "transferSettlementType" AS invalid_value 
FROM "SettlementBase" 
WHERE "SettlementBase"."transferSettlementType" IS NOT NULL AND ("SettlementBase"."transferSettlementType" NOT IN ('DeliveryVersusDelivery', 'DeliveryVersusPayment', 'PaymentVersusPayment', 'NotCentralSettlement'))

UNION ALL

SELECT 'SettlementBase' AS table_name, 'settlementCentre' AS column_name, 'enum' AS constraint_type, id AS record_id, "settlementCentre" AS invalid_value 
FROM "SettlementBase" 
WHERE "SettlementBase"."settlementCentre" IS NOT NULL AND ("SettlementBase"."settlementCentre" NOT IN ('EuroclearBank', 'ClearstreamBankingLuxembourg'))

UNION ALL

SELECT 'SettlementBase' AS table_name, 'standardSettlementStyle' AS column_name, 'enum' AS constraint_type, id AS record_id, "standardSettlementStyle" AS invalid_value 
FROM "SettlementBase" 
WHERE "SettlementBase"."standardSettlementStyle" IS NOT NULL AND ("SettlementBase"."standardSettlementStyle" NOT IN ('Standard', 'Net', 'StandardAndNet', 'PairAndNet'))

UNION ALL

SELECT 'ShapingProvision' AS table_name, 'shapeSchedule' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ShapingProvision" 
WHERE "ShapingProvision"."shapeSchedule" IS NULL

UNION ALL

SELECT 'TransferableProduct' AS table_name, 'economicTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TransferableProduct" 
WHERE "TransferableProduct"."economicTerms" IS NULL

UNION ALL

SELECT 'EconomicTerms' AS table_name, 'payout' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EconomicTerms" 
WHERE "EconomicTerms".payout IS NULL

UNION ALL

SELECT 'OptionPayout' AS table_name, 'buyerSeller' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "OptionPayout" 
WHERE "OptionPayout"."buyerSeller" IS NULL

UNION ALL

SELECT 'OptionPayout' AS table_name, 'underlier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "OptionPayout" 
WHERE "OptionPayout".underlier IS NULL

UNION ALL

SELECT 'OptionPayout' AS table_name, 'optionType' AS column_name, 'enum' AS constraint_type, id AS record_id, "optionType" AS invalid_value 
FROM "OptionPayout" 
WHERE "OptionPayout"."optionType" IS NOT NULL AND ("OptionPayout"."optionType" NOT IN ('Payer', 'Receiver', 'Straddle'))

UNION ALL

SELECT 'OptionPayout' AS table_name, 'exerciseTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "OptionPayout" 
WHERE "OptionPayout"."exerciseTerms" IS NULL

UNION ALL

SELECT 'OptionPayout' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "OptionPayout" 
WHERE "OptionPayout"."payerReceiver" IS NULL

UNION ALL

SELECT 'PerformancePayout' AS table_name, 'valuationDates' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PerformancePayout" 
WHERE "PerformancePayout"."valuationDates" IS NULL

UNION ALL

SELECT 'PerformancePayout' AS table_name, 'paymentDates' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PerformancePayout" 
WHERE "PerformancePayout"."paymentDates" IS NULL

UNION ALL

SELECT 'PerformancePayout' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PerformancePayout" 
WHERE "PerformancePayout"."payerReceiver" IS NULL

UNION ALL

SELECT 'PortfolioReturnTerms' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PortfolioReturnTerms" 
WHERE "PortfolioReturnTerms"."payerReceiver" IS NULL

UNION ALL

SELECT 'PortfolioReturnTerms' AS table_name, 'underlier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PortfolioReturnTerms" 
WHERE "PortfolioReturnTerms".underlier IS NULL

UNION ALL

SELECT 'NonTransferableProduct' AS table_name, 'economicTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "NonTransferableProduct" 
WHERE "NonTransferableProduct"."economicTerms" IS NULL

UNION ALL

SELECT 'TradeLot' AS table_name, 'priceQuantity' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TradeLot" 
WHERE "TradeLot"."priceQuantity" IS NULL

UNION ALL

SELECT 'TradableProduct' AS table_name, 'product' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TradableProduct" 
WHERE "TradableProduct".product IS NULL

UNION ALL

SELECT 'TradableProduct' AS table_name, 'tradeLot' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TradableProduct" 
WHERE "TradableProduct"."tradeLot" IS NULL

UNION ALL

SELECT 'TradableProduct' AS table_name, 'counterparty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "TradableProduct" 
WHERE "TradableProduct".counterparty IS NULL

UNION ALL

SELECT 'TradableProduct' AS table_name, 'adjustment' AS column_name, 'enum' AS constraint_type, id AS record_id, adjustment AS invalid_value 
FROM "TradableProduct" 
WHERE "TradableProduct".adjustment IS NOT NULL AND ("TradableProduct".adjustment NOT IN ('Execution', 'PortfolioRebalancing', 'Standard'))

UNION ALL

SELECT 'SettlementPayout' AS table_name, 'underlier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SettlementPayout" 
WHERE "SettlementPayout".underlier IS NULL

UNION ALL

SELECT 'SettlementPayout' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SettlementPayout" 
WHERE "SettlementPayout"."payerReceiver" IS NULL

UNION ALL

SELECT 'CalculationSchedule' AS table_name, 'schedulePeriod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalculationSchedule" 
WHERE "CalculationSchedule"."schedulePeriod" IS NULL

UNION ALL

SELECT 'SchedulePeriod' AS table_name, 'calculationPeriod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SchedulePeriod" 
WHERE "SchedulePeriod"."calculationPeriod" IS NULL

UNION ALL

SELECT 'SchedulePeriod' AS table_name, 'paymentDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SchedulePeriod" 
WHERE "SchedulePeriod"."paymentDate" IS NULL

UNION ALL

SELECT 'SchedulePeriod' AS table_name, 'fixingPeriod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SchedulePeriod" 
WHERE "SchedulePeriod"."fixingPeriod" IS NULL

UNION ALL

SELECT 'FixedPricePayout' AS table_name, 'paymentDates' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FixedPricePayout" 
WHERE "FixedPricePayout"."paymentDates" IS NULL

UNION ALL

SELECT 'FixedPricePayout' AS table_name, 'fixedPrice' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FixedPricePayout" 
WHERE "FixedPricePayout"."fixedPrice" IS NULL

UNION ALL

SELECT 'FixedPricePayout' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FixedPricePayout" 
WHERE "FixedPricePayout"."payerReceiver" IS NULL

UNION ALL

SELECT 'CancelableProvision' AS table_name, 'followUpConfirmation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CancelableProvision" 
WHERE "CancelableProvision"."followUpConfirmation" IS NULL

UNION ALL

SELECT 'CancelableProvision' AS table_name, 'callingParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "callingParty" AS invalid_value 
FROM "CancelableProvision" 
WHERE "CancelableProvision"."callingParty" IS NOT NULL AND ("CancelableProvision"."callingParty" NOT IN ('InitialBuyer', 'InitialSeller', 'Either', 'AsDefinedInMasterAgreement'))

UNION ALL

SELECT 'CancelableProvision' AS table_name, 'exerciseTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CancelableProvision" 
WHERE "CancelableProvision"."exerciseTerms" IS NULL

UNION ALL

SELECT 'CancelableProvision' AS table_name, 'buyer' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CancelableProvision" 
WHERE "CancelableProvision".buyer IS NULL

UNION ALL

SELECT 'CancelableProvision' AS table_name, 'buyer' AS column_name, 'enum' AS constraint_type, id AS record_id, buyer AS invalid_value 
FROM "CancelableProvision" 
WHERE "CancelableProvision".buyer IS NOT NULL AND ("CancelableProvision".buyer NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'CancelableProvision' AS table_name, 'seller' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CancelableProvision" 
WHERE "CancelableProvision".seller IS NULL

UNION ALL

SELECT 'CancelableProvision' AS table_name, 'seller' AS column_name, 'enum' AS constraint_type, id AS record_id, seller AS invalid_value 
FROM "CancelableProvision" 
WHERE "CancelableProvision".seller IS NOT NULL AND ("CancelableProvision".seller NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'CancelableProvisionAdjustedDates' AS table_name, 'cancellationEvent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CancelableProvisionAdjustedDates" 
WHERE "CancelableProvisionAdjustedDates"."cancellationEvent" IS NULL

UNION ALL

SELECT 'CancellationEvent' AS table_name, 'adjustedExerciseDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CancellationEvent" 
WHERE "CancellationEvent"."adjustedExerciseDate" IS NULL

UNION ALL

SELECT 'CancellationEvent' AS table_name, 'adjustedEarlyTerminationDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CancellationEvent" 
WHERE "CancellationEvent"."adjustedEarlyTerminationDate" IS NULL

UNION ALL

SELECT 'EarlyTerminationEvent' AS table_name, 'adjustedExerciseDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EarlyTerminationEvent" 
WHERE "EarlyTerminationEvent"."adjustedExerciseDate" IS NULL

UNION ALL

SELECT 'EarlyTerminationEvent' AS table_name, 'adjustedEarlyTerminationDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EarlyTerminationEvent" 
WHERE "EarlyTerminationEvent"."adjustedEarlyTerminationDate" IS NULL

UNION ALL

SELECT 'EarlyTerminationEvent' AS table_name, 'adjustedCashSettlementValuationDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EarlyTerminationEvent" 
WHERE "EarlyTerminationEvent"."adjustedCashSettlementValuationDate" IS NULL

UNION ALL

SELECT 'EarlyTerminationEvent' AS table_name, 'adjustedCashSettlementPaymentDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EarlyTerminationEvent" 
WHERE "EarlyTerminationEvent"."adjustedCashSettlementPaymentDate" IS NULL

UNION ALL

SELECT 'ExercisePeriod' AS table_name, 'earliestExerciseDateTenor' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExercisePeriod" 
WHERE "ExercisePeriod"."earliestExerciseDateTenor" IS NULL

UNION ALL

SELECT 'ExtendibleProvision' AS table_name, 'callingParty' AS column_name, 'enum' AS constraint_type, id AS record_id, "callingParty" AS invalid_value 
FROM "ExtendibleProvision" 
WHERE "ExtendibleProvision"."callingParty" IS NOT NULL AND ("ExtendibleProvision"."callingParty" NOT IN ('InitialBuyer', 'InitialSeller', 'Either', 'AsDefinedInMasterAgreement'))

UNION ALL

SELECT 'ExtendibleProvision' AS table_name, 'exerciseTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExtendibleProvision" 
WHERE "ExtendibleProvision"."exerciseTerms" IS NULL

UNION ALL

SELECT 'ExtendibleProvision' AS table_name, 'buyer' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExtendibleProvision" 
WHERE "ExtendibleProvision".buyer IS NULL

UNION ALL

SELECT 'ExtendibleProvision' AS table_name, 'buyer' AS column_name, 'enum' AS constraint_type, id AS record_id, buyer AS invalid_value 
FROM "ExtendibleProvision" 
WHERE "ExtendibleProvision".buyer IS NOT NULL AND ("ExtendibleProvision".buyer NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'ExtendibleProvision' AS table_name, 'seller' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExtendibleProvision" 
WHERE "ExtendibleProvision".seller IS NULL

UNION ALL

SELECT 'ExtendibleProvision' AS table_name, 'seller' AS column_name, 'enum' AS constraint_type, id AS record_id, seller AS invalid_value 
FROM "ExtendibleProvision" 
WHERE "ExtendibleProvision".seller IS NOT NULL AND ("ExtendibleProvision".seller NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'ExtendibleProvisionAdjustedDates' AS table_name, 'extensionEvent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExtendibleProvisionAdjustedDates" 
WHERE "ExtendibleProvisionAdjustedDates"."extensionEvent" IS NULL

UNION ALL

SELECT 'ExtensionEvent' AS table_name, 'adjustedExerciseDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExtensionEvent" 
WHERE "ExtensionEvent"."adjustedExerciseDate" IS NULL

UNION ALL

SELECT 'ExtensionEvent' AS table_name, 'adjustedExtendedTerminationDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExtensionEvent" 
WHERE "ExtensionEvent"."adjustedExtendedTerminationDate" IS NULL

UNION ALL

SELECT 'MandatoryEarlyTermination' AS table_name, 'mandatoryEarlyTerminationDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MandatoryEarlyTermination" 
WHERE "MandatoryEarlyTermination"."mandatoryEarlyTerminationDate" IS NULL

UNION ALL

SELECT 'MandatoryEarlyTermination' AS table_name, 'calculationAgent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MandatoryEarlyTermination" 
WHERE "MandatoryEarlyTermination"."calculationAgent" IS NULL

UNION ALL

SELECT 'MandatoryEarlyTermination' AS table_name, 'cashSettlement' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MandatoryEarlyTermination" 
WHERE "MandatoryEarlyTermination"."cashSettlement" IS NULL

UNION ALL

SELECT 'MandatoryEarlyTerminationAdjustedDates' AS table_name, 'adjustedEarlyTerminationDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MandatoryEarlyTerminationAdjustedDates" 
WHERE "MandatoryEarlyTerminationAdjustedDates"."adjustedEarlyTerminationDate" IS NULL

UNION ALL

SELECT 'MandatoryEarlyTerminationAdjustedDates' AS table_name, 'adjustedCashSettlementValuationDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MandatoryEarlyTerminationAdjustedDates" 
WHERE "MandatoryEarlyTerminationAdjustedDates"."adjustedCashSettlementValuationDate" IS NULL

UNION ALL

SELECT 'MandatoryEarlyTerminationAdjustedDates' AS table_name, 'adjustedCashSettlementPaymentDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "MandatoryEarlyTerminationAdjustedDates" 
WHERE "MandatoryEarlyTerminationAdjustedDates"."adjustedCashSettlementPaymentDate" IS NULL

UNION ALL

SELECT 'OptionalEarlyTermination' AS table_name, 'exerciseTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "OptionalEarlyTermination" 
WHERE "OptionalEarlyTermination"."exerciseTerms" IS NULL

UNION ALL

SELECT 'OptionalEarlyTerminationAdjustedDates' AS table_name, 'earlyTerminationEvent' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "OptionalEarlyTerminationAdjustedDates" 
WHERE "OptionalEarlyTerminationAdjustedDates"."earlyTerminationEvent" IS NULL

UNION ALL

SELECT 'AveragingFeature' AS table_name, 'averagingCalculation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AveragingFeature" 
WHERE "AveragingFeature"."averagingCalculation" IS NULL

UNION ALL

SELECT 'AveragingFeature' AS table_name, 'averagingInOut' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AveragingFeature" 
WHERE "AveragingFeature"."averagingInOut" IS NULL

UNION ALL

SELECT 'AveragingFeature' AS table_name, 'averagingInOut' AS column_name, 'enum' AS constraint_type, id AS record_id, "averagingInOut" AS invalid_value 
FROM "AveragingFeature" 
WHERE "AveragingFeature"."averagingInOut" IS NOT NULL AND ("AveragingFeature"."averagingInOut" NOT IN ('In', 'Out', 'Both'))

UNION ALL

SELECT 'AveragingCalculation' AS table_name, 'averagingMethod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AveragingCalculation" 
WHERE "AveragingCalculation"."averagingMethod" IS NULL

UNION ALL

SELECT 'AveragingCalculation' AS table_name, 'precision' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AveragingCalculation" 
WHERE "AveragingCalculation".precision IS NULL

UNION ALL

SELECT 'AveragingStrikeFeature' AS table_name, 'averagingCalculation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AveragingStrikeFeature" 
WHERE "AveragingStrikeFeature"."averagingCalculation" IS NULL

UNION ALL

SELECT 'AveragingStrikeFeature' AS table_name, 'observationTerms' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AveragingStrikeFeature" 
WHERE "AveragingStrikeFeature"."observationTerms" IS NULL

UNION ALL

SELECT 'CalendarSpread' AS table_name, 'expirationDateTwo' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "CalendarSpread" 
WHERE "CalendarSpread"."expirationDateTwo" IS NULL

UNION ALL

SELECT 'Composite' AS table_name, 'determinationMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "determinationMethod" AS invalid_value 
FROM "Composite" 
WHERE "Composite"."determinationMethod" IS NOT NULL AND ("Composite"."determinationMethod" NOT IN ('AgreedInitialPrice', 'AsSpecifiedInMasterConfirmation', 'CalculationAgent', 'ClosingPrice', 'DividendCurrency', 'ExpiringContractLevel', 'HedgeExecution', 'IssuerPaymentCurrency', 'NAV', 'OpenPrice', 'OSPPrice', 'SettlementCurrency', 'StrikeDateDetermination', 'TWAPPrice', 'TWAPVE', 'TWAPVEExcludingClose', 'ValuationTime', 'VWAPPrice', 'VWAPVE', 'VWAPVEExcludingClose'))

UNION ALL

SELECT 'FxFeature' AS table_name, 'referenceCurrency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FxFeature" 
WHERE "FxFeature"."referenceCurrency" IS NULL

UNION ALL

SELECT 'RecallProvision' AS table_name, 'isRecallable' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RecallProvision" 
WHERE "RecallProvision"."isRecallable" IS NULL

UNION ALL

SELECT 'PassThrough' AS table_name, 'passThroughItem' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PassThrough" 
WHERE "PassThrough"."passThroughItem" IS NULL

UNION ALL

SELECT 'PassThroughItem' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PassThroughItem" 
WHERE "PassThroughItem"."payerReceiver" IS NULL

UNION ALL

SELECT 'PassThroughItem' AS table_name, 'passThroughPercentage' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "PassThroughItem" 
WHERE "PassThroughItem"."passThroughPercentage" IS NULL

UNION ALL

SELECT 'StrikeSpread' AS table_name, 'upperStrike' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "StrikeSpread" 
WHERE "StrikeSpread"."upperStrike" IS NULL

UNION ALL

SELECT 'StrikeSpread' AS table_name, 'upperStrikeNumberOfOptions' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "StrikeSpread" 
WHERE "StrikeSpread"."upperStrikeNumberOfOptions" IS NULL

UNION ALL

SELECT 'ExerciseTerms' AS table_name, 'style' AS column_name, 'enum' AS constraint_type, id AS record_id, style AS invalid_value 
FROM "ExerciseTerms" 
WHERE "ExerciseTerms".style IS NOT NULL AND ("ExerciseTerms".style NOT IN ('European', 'Bermuda', 'American'))

UNION ALL

SELECT 'ExerciseTerms' AS table_name, 'expirationTimeType' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExerciseTerms" 
WHERE "ExerciseTerms"."expirationTimeType" IS NULL

UNION ALL

SELECT 'ExerciseTerms' AS table_name, 'expirationTimeType' AS column_name, 'enum' AS constraint_type, id AS record_id, "expirationTimeType" AS invalid_value 
FROM "ExerciseTerms" 
WHERE "ExerciseTerms"."expirationTimeType" IS NOT NULL AND ("ExerciseTerms"."expirationTimeType" NOT IN ('Close', 'Open', 'OSP', 'SpecificTime', 'XETRA', 'DerivativesClose', 'AsSpecifiedInMasterConfirmation'))

UNION ALL

SELECT 'ExerciseFee' AS table_name, 'notionalReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExerciseFee" 
WHERE "ExerciseFee"."notionalReference" IS NULL

UNION ALL

SELECT 'ExerciseFee' AS table_name, 'feePaymentDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExerciseFee" 
WHERE "ExerciseFee"."feePaymentDate" IS NULL

UNION ALL

SELECT 'ExerciseFee' AS table_name, 'payer' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExerciseFee" 
WHERE "ExerciseFee".payer IS NULL

UNION ALL

SELECT 'ExerciseFee' AS table_name, 'payer' AS column_name, 'enum' AS constraint_type, id AS record_id, payer AS invalid_value 
FROM "ExerciseFee" 
WHERE "ExerciseFee".payer IS NOT NULL AND ("ExerciseFee".payer NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'ExerciseFee' AS table_name, 'receiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExerciseFee" 
WHERE "ExerciseFee".receiver IS NULL

UNION ALL

SELECT 'ExerciseFee' AS table_name, 'receiver' AS column_name, 'enum' AS constraint_type, id AS record_id, receiver AS invalid_value 
FROM "ExerciseFee" 
WHERE "ExerciseFee".receiver IS NOT NULL AND ("ExerciseFee".receiver NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'ExerciseFeeSchedule' AS table_name, 'notionalReference' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExerciseFeeSchedule" 
WHERE "ExerciseFeeSchedule"."notionalReference" IS NULL

UNION ALL

SELECT 'ExerciseFeeSchedule' AS table_name, 'feePaymentDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExerciseFeeSchedule" 
WHERE "ExerciseFeeSchedule"."feePaymentDate" IS NULL

UNION ALL

SELECT 'ExerciseFeeSchedule' AS table_name, 'payer' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExerciseFeeSchedule" 
WHERE "ExerciseFeeSchedule".payer IS NULL

UNION ALL

SELECT 'ExerciseFeeSchedule' AS table_name, 'payer' AS column_name, 'enum' AS constraint_type, id AS record_id, payer AS invalid_value 
FROM "ExerciseFeeSchedule" 
WHERE "ExerciseFeeSchedule".payer IS NOT NULL AND ("ExerciseFeeSchedule".payer NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'ExerciseFeeSchedule' AS table_name, 'receiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExerciseFeeSchedule" 
WHERE "ExerciseFeeSchedule".receiver IS NULL

UNION ALL

SELECT 'ExerciseFeeSchedule' AS table_name, 'receiver' AS column_name, 'enum' AS constraint_type, id AS record_id, receiver AS invalid_value 
FROM "ExerciseFeeSchedule" 
WHERE "ExerciseFeeSchedule".receiver IS NOT NULL AND ("ExerciseFeeSchedule".receiver NOT IN ('Party1', 'Party2'))

UNION ALL

SELECT 'ExerciseNotice' AS table_name, 'exerciseNoticeGiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExerciseNotice" 
WHERE "ExerciseNotice"."exerciseNoticeGiver" IS NULL

UNION ALL

SELECT 'ExerciseNotice' AS table_name, 'exerciseNoticeGiver' AS column_name, 'enum' AS constraint_type, id AS record_id, "exerciseNoticeGiver" AS invalid_value 
FROM "ExerciseNotice" 
WHERE "ExerciseNotice"."exerciseNoticeGiver" IS NOT NULL AND ("ExerciseNotice"."exerciseNoticeGiver" NOT IN ('Buyer', 'Seller', 'Both', 'AsSpecifiedInMasterAgreement'))

UNION ALL

SELECT 'ExerciseNotice' AS table_name, 'exerciseNoticeReceiver' AS column_name, 'enum' AS constraint_type, id AS record_id, "exerciseNoticeReceiver" AS invalid_value 
FROM "ExerciseNotice" 
WHERE "ExerciseNotice"."exerciseNoticeReceiver" IS NOT NULL AND ("ExerciseNotice"."exerciseNoticeReceiver" NOT IN ('DisruptionEventsDeterminingParty', 'ExtraordinaryDividendsParty', 'PredeterminedClearingOrganizationParty', 'ExerciseNoticeReceiverPartyManual', 'ExerciseNoticeReceiverPartyOptionalEarlyTermination', 'ExerciseNoticeReceiverPartyCancelableProvision', 'ExerciseNoticeReceiverPartyExtendibleProvision', 'CalculationAgentIndependent', 'CalculationAgentOptionalEarlyTermination', 'CalculationAgentMandatoryEarlyTermination', 'CalculationAgentFallback'))

UNION ALL

SELECT 'ExerciseNotice' AS table_name, 'businessCenter' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExerciseNotice" 
WHERE "ExerciseNotice"."businessCenter" IS NULL

UNION ALL

SELECT 'ExerciseProcedure' AS table_name, 'followUpConfirmation' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExerciseProcedure" 
WHERE "ExerciseProcedure"."followUpConfirmation" IS NULL

UNION ALL

SELECT 'Strike' AS table_name, 'strikeRate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Strike" 
WHERE "Strike"."strikeRate" IS NULL

UNION ALL

SELECT 'Strike' AS table_name, 'buyer' AS column_name, 'enum' AS constraint_type, id AS record_id, buyer AS invalid_value 
FROM "Strike" 
WHERE "Strike".buyer IS NOT NULL AND ("Strike".buyer NOT IN ('Payer', 'Receiver'))

UNION ALL

SELECT 'Strike' AS table_name, 'seller' AS column_name, 'enum' AS constraint_type, id AS record_id, seller AS invalid_value 
FROM "Strike" 
WHERE "Strike".seller IS NOT NULL AND ("Strike".seller NOT IN ('Payer', 'Receiver'))

UNION ALL

SELECT 'StrikeSchedule' AS table_name, 'buyer' AS column_name, 'enum' AS constraint_type, id AS record_id, buyer AS invalid_value 
FROM "StrikeSchedule" 
WHERE "StrikeSchedule".buyer IS NOT NULL AND ("StrikeSchedule".buyer NOT IN ('Payer', 'Receiver'))

UNION ALL

SELECT 'StrikeSchedule' AS table_name, 'seller' AS column_name, 'enum' AS constraint_type, id AS record_id, seller AS invalid_value 
FROM "StrikeSchedule" 
WHERE "StrikeSchedule".seller IS NOT NULL AND ("StrikeSchedule".seller NOT IN ('Payer', 'Receiver'))

UNION ALL

SELECT 'StrikeSchedule' AS table_name, 'price' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "StrikeSchedule" 
WHERE "StrikeSchedule".price IS NULL

UNION ALL

SELECT 'AssetPayout' AS table_name, 'assetLeg' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetPayout" 
WHERE "AssetPayout"."assetLeg" IS NULL

UNION ALL

SELECT 'AssetPayout' AS table_name, 'underlier' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetPayout" 
WHERE "AssetPayout".underlier IS NULL

UNION ALL

SELECT 'AssetPayout' AS table_name, 'tradeType' AS column_name, 'enum' AS constraint_type, id AS record_id, "tradeType" AS invalid_value 
FROM "AssetPayout" 
WHERE "AssetPayout"."tradeType" IS NOT NULL AND ("AssetPayout"."tradeType" NOT IN ('Repo', 'BuySellBack', 'SecurityLending'))

UNION ALL

SELECT 'AssetPayout' AS table_name, 'payerReceiver' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetPayout" 
WHERE "AssetPayout"."payerReceiver" IS NULL

UNION ALL

SELECT 'DividendTerms' AS table_name, 'manufacturedIncomeRequirement' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DividendTerms" 
WHERE "DividendTerms"."manufacturedIncomeRequirement" IS NULL

UNION ALL

SELECT 'DividendTerms' AS table_name, 'dividendEntitlement' AS column_name, 'enum' AS constraint_type, id AS record_id, "dividendEntitlement" AS invalid_value 
FROM "DividendTerms" 
WHERE "DividendTerms"."dividendEntitlement" IS NOT NULL AND ("DividendTerms"."dividendEntitlement" NOT IN ('ExDate', 'RecordDate'))

UNION ALL

SELECT 'AssetLeg' AS table_name, 'settlementDate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetLeg" 
WHERE "AssetLeg"."settlementDate" IS NULL

UNION ALL

SELECT 'AssetLeg' AS table_name, 'deliveryMethod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AssetLeg" 
WHERE "AssetLeg"."deliveryMethod" IS NULL

UNION ALL

SELECT 'AssetLeg' AS table_name, 'deliveryMethod' AS column_name, 'enum' AS constraint_type, id AS record_id, "deliveryMethod" AS invalid_value 
FROM "AssetLeg" 
WHERE "AssetLeg"."deliveryMethod" IS NOT NULL AND ("AssetLeg"."deliveryMethod" NOT IN ('DeliveryVersusPayment', 'FreeOfPayment', 'PreDelivery', 'PrePayment'))

UNION ALL

SELECT 'EvergreenProvision' AS table_name, 'noticePeriod' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EvergreenProvision" 
WHERE "EvergreenProvision"."noticePeriod" IS NULL

UNION ALL

SELECT 'EvergreenProvision' AS table_name, 'extensionFrequency' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "EvergreenProvision" 
WHERE "EvergreenProvision"."extensionFrequency" IS NULL

UNION ALL

SELECT 'Document' AS table_name, 'finInstrmRptgTxRpt' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Document" 
WHERE "Document"."finInstrmRptgTxRpt" IS NULL

UNION ALL

SELECT 'FinInstrmRptgTxRpt' AS table_name, 'tx' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FinInstrmRptgTxRpt" 
WHERE "FinInstrmRptgTxRpt".tx IS NULL

UNION ALL

SELECT 'Tx' AS table_name, 'newTx' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Tx" 
WHERE "Tx"."newTx" IS NULL

UNION ALL

SELECT 'Tx' AS table_name, 'tradDt' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Tx" 
WHERE "Tx"."tradDt" IS NULL

UNION ALL

SELECT 'Tx' AS table_name, 'tradgCpcty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Tx" 
WHERE "Tx"."tradgCpcty" IS NULL

UNION ALL

SELECT 'Tx' AS table_name, 'qty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Tx" 
WHERE "Tx".qty IS NULL

UNION ALL

SELECT 'Tx' AS table_name, 'pric' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Tx" 
WHERE "Tx".pric IS NULL

UNION ALL

SELECT 'Tx' AS table_name, 'tradVn' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Tx" 
WHERE "Tx"."tradVn" IS NULL

UNION ALL

SELECT 'Tx' AS table_name, 'ctryOfBrnch' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Tx" 
WHERE "Tx"."ctryOfBrnch" IS NULL

UNION ALL

SELECT 'New' AS table_name, 'txId' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "New" 
WHERE "New"."txId" IS NULL

UNION ALL

SELECT 'New' AS table_name, 'exctgPty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "New" 
WHERE "New"."exctgPty" IS NULL

UNION ALL

SELECT 'New' AS table_name, 'invstmtPtyInd' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "New" 
WHERE "New"."invstmtPtyInd" IS NULL

UNION ALL

SELECT 'New' AS table_name, 'submitgPty' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "New" 
WHERE "New"."submitgPty" IS NULL

UNION ALL

SELECT 'New' AS table_name, 'buyr' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "New" 
WHERE "New".buyr IS NULL

UNION ALL

SELECT 'New' AS table_name, 'sellr' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "New" 
WHERE "New".sellr IS NULL

UNION ALL

SELECT 'New' AS table_name, 'ordrTrnsmssn' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "New" 
WHERE "New"."ordrTrnsmssn" IS NULL

UNION ALL

SELECT 'New' AS table_name, 'tx' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "New" 
WHERE "New".tx IS NULL

UNION ALL

SELECT 'New' AS table_name, 'finInstrm' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "New" 
WHERE "New"."finInstrm" IS NULL

UNION ALL

SELECT 'New' AS table_name, 'invstmtDcsnPrsn' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "New" 
WHERE "New"."invstmtDcsnPrsn" IS NULL

UNION ALL

SELECT 'New' AS table_name, 'exctgPrsn' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "New" 
WHERE "New"."exctgPrsn" IS NULL

UNION ALL

SELECT 'New' AS table_name, 'addtlAttrbts' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "New" 
WHERE "New"."addtlAttrbts" IS NULL

UNION ALL

SELECT 'Sellr' AS table_name, 'acctOwnr' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Sellr" 
WHERE "Sellr"."acctOwnr" IS NULL

UNION ALL

SELECT 'Sngl' AS table_name, 'isin' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Sngl" 
WHERE "Sngl".isin IS NULL

UNION ALL

SELECT 'Sngl' AS table_name, 'indx' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Sngl" 
WHERE "Sngl".indx IS NULL

UNION ALL

SELECT 'OrdrTrnsmssn' AS table_name, 'trnsmssnInd' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "OrdrTrnsmssn" 
WHERE "OrdrTrnsmssn"."trnsmssnInd" IS NULL

UNION ALL

SELECT 'DerivInstrmAttrbts' AS table_name, 'xpryDt' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DerivInstrmAttrbts" 
WHERE "DerivInstrmAttrbts"."xpryDt" IS NULL

UNION ALL

SELECT 'DerivInstrmAttrbts' AS table_name, 'pricMltplr' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DerivInstrmAttrbts" 
WHERE "DerivInstrmAttrbts"."pricMltplr" IS NULL

UNION ALL

SELECT 'DerivInstrmAttrbts' AS table_name, 'undrlygInstrm' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DerivInstrmAttrbts" 
WHERE "DerivInstrmAttrbts"."undrlygInstrm" IS NULL

UNION ALL

SELECT 'DerivInstrmAttrbts' AS table_name, 'dlvryTp' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "DerivInstrmAttrbts" 
WHERE "DerivInstrmAttrbts"."dlvryTp" IS NULL

UNION ALL

SELECT 'UndrlygInstrm' AS table_name, 'swp' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "UndrlygInstrm" 
WHERE "UndrlygInstrm".swp IS NULL

UNION ALL

SELECT 'AcctOwnr' AS table_name, 'id' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AcctOwnr" 
WHERE "AcctOwnr".id IS NULL

UNION ALL

SELECT 'InvstmtDcsnPrsn' AS table_name, 'prsn' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "InvstmtDcsnPrsn" 
WHERE "InvstmtDcsnPrsn".prsn IS NULL

UNION ALL

SELECT 'Buyr' AS table_name, 'acctOwnr' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Buyr" 
WHERE "Buyr"."acctOwnr" IS NULL

UNION ALL

SELECT 'Qty' AS table_name, 'unit' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Qty" 
WHERE "Qty".unit IS NULL

UNION ALL

SELECT 'FinInstrm' AS table_name, 'othr' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FinInstrm" 
WHERE "FinInstrm".othr IS NULL

UNION ALL

SELECT 'Pric' AS table_name, 'pric' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Pric" 
WHERE "Pric".pric IS NULL

UNION ALL

SELECT 'Pric' AS table_name, 'bsisPts' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Pric" 
WHERE "Pric"."bsisPts" IS NULL

UNION ALL

SELECT 'Prsn' AS table_name, 'ctryOfBrnch' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Prsn" 
WHERE "Prsn"."ctryOfBrnch" IS NULL

UNION ALL

SELECT 'Prsn' AS table_name, 'othr' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Prsn" 
WHERE "Prsn".othr IS NULL

UNION ALL

SELECT 'FinInstrmGnlAttrbts' AS table_name, 'fullNm' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FinInstrmGnlAttrbts" 
WHERE "FinInstrmGnlAttrbts"."fullNm" IS NULL

UNION ALL

SELECT 'FinInstrmGnlAttrbts' AS table_name, 'clssfctnTp' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FinInstrmGnlAttrbts" 
WHERE "FinInstrmGnlAttrbts"."clssfctnTp" IS NULL

UNION ALL

SELECT 'FinInstrmGnlAttrbts' AS table_name, 'ntnlCcy' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "FinInstrmGnlAttrbts" 
WHERE "FinInstrmGnlAttrbts"."ntnlCcy" IS NULL

UNION ALL

SELECT 'Nm' AS table_name, 'refRate' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Nm" 
WHERE "Nm"."refRate" IS NULL

UNION ALL

SELECT 'Nm' AS table_name, 'term' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Nm" 
WHERE "Nm".term IS NULL

UNION ALL

SELECT 'SwpOut' AS table_name, 'sngl' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SwpOut" 
WHERE "SwpOut".sngl IS NULL

UNION ALL

SELECT 'Othr' AS table_name, 'finInstrmGnlAttrbts' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Othr" 
WHERE "Othr"."finInstrmGnlAttrbts" IS NULL

UNION ALL

SELECT 'Othr' AS table_name, 'derivInstrmAttrbts' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Othr" 
WHERE "Othr"."derivInstrmAttrbts" IS NULL

UNION ALL

SELECT 'Othr' AS table_name, 'id' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Othr" 
WHERE "Othr".id IS NULL

UNION ALL

SELECT 'Othr' AS table_name, 'schmeNm' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Othr" 
WHERE "Othr"."schmeNm" IS NULL

UNION ALL

SELECT 'ExctgPrsn' AS table_name, 'prsn' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "ExctgPrsn" 
WHERE "ExctgPrsn".prsn IS NULL

UNION ALL

SELECT 'Term' AS table_name, 'unit' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Term" 
WHERE "Term".unit IS NULL

UNION ALL

SELECT 'Term' AS table_name, 'val' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Term" 
WHERE "Term".val IS NULL

UNION ALL

SELECT 'Swp' AS table_name, 'swpIn' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Swp" 
WHERE "Swp"."swpIn" IS NULL

UNION ALL

SELECT 'Swp' AS table_name, 'swpOut' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Swp" 
WHERE "Swp"."swpOut" IS NULL

UNION ALL

SELECT 'SchmeNm' AS table_name, 'prtry' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SchmeNm" 
WHERE "SchmeNm".prtry IS NULL

UNION ALL

SELECT 'RefRate' AS table_name, 'indx' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RefRate" 
WHERE "RefRate".indx IS NULL

UNION ALL

SELECT 'RefRate' AS table_name, 'nm' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "RefRate" 
WHERE "RefRate".nm IS NULL

UNION ALL

SELECT 'AddtlAttrbts' AS table_name, 'rskRdcgTx' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AddtlAttrbts" 
WHERE "AddtlAttrbts"."rskRdcgTx" IS NULL

UNION ALL

SELECT 'AddtlAttrbts' AS table_name, 'sctiesFincgTxInd' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "AddtlAttrbts" 
WHERE "AddtlAttrbts"."sctiesFincgTxInd" IS NULL

UNION ALL

SELECT 'SwpIn' AS table_name, 'sngl' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "SwpIn" 
WHERE "SwpIn".sngl IS NULL

UNION ALL

SELECT 'Indx' AS table_name, 'nm' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Indx" 
WHERE "Indx".nm IS NULL

UNION ALL

SELECT 'Id' AS table_name, 'lei' AS column_name, 'required' AS constraint_type, id AS record_id, NULL AS invalid_value 
FROM "Id" 
WHERE "Id".lei IS NULL;

