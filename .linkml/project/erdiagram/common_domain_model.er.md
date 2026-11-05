erDiagram
Account {
    string accountName  
    string accountNumber  
    AccountTypeEnum accountType  
}
AccrualFactor {

}
AccrualFactorCalculationTerms {
    DayCountFractionEnum dayCountFraction  
    decimal tenorTillMaturity  
}
AdditionalDisruptionEvents {
    boolean changeInLaw  
    AncillaryRoleEnum determiningParty  
    boolean failureToDeliver  
    boolean foreignOwnershipEvent  
    boolean hedgingDisruption  
    boolean increasedCostOfHedging  
    boolean increasedCostOfStockBorrow  
    decimal initialStockLoanRate  
    boolean insolvencyFiling  
    boolean lossOfStockBorrow  
    decimal maximumStockLoanRate  
}
AdditionalRepresentation {
    string customElection  
}
AdditionalRepresentationElection {
    string additionalLanguage  
    boolean isApplicable  
    CounterpartyRoleEnum party  
}
AdditionalRepresentations {
    boolean regulatoryComplianceRepresentation  
}
AdditionalRightsEvent {
    boolean isApplicable  
    string qualification  
}
Address {
    string city  
    string country  
    string postalCode  
    string state  
    stringList street  
}
AddressesForTransfer {

}
AdjustableDate {
    date adjustedDate  
    date unadjustedDate  
}
AdjustableDates {
    dateList adjustedDate  
    dateList unadjustedDate  
}
AdjustableOrAdjustedDate {
    date adjustedDate  
    date unadjustedDate  
}
AdjustableOrAdjustedOrRelativeDate {
    date adjustedDate  
    date unadjustedDate  
}
AdjustableOrRelativeDate {

}
AdjustableOrRelativeDates {

}
AdjustableRelativeOrPeriodicDates {

}
AdjustedRelativeDateOffset {
    date adjustedDate  
    BusinessDayConventionEnum businessDayConvention  
    date dateRelativeTo  
    DayTypeEnum dayType  
    PeriodEnum period  
    integer periodMultiplier  
}
AdjustmentFactor {
    decimal value  
}
AdjustmentFactorCalculationTerms {
    string bespokeCalculationFormula  
    decimal dividendRatio  
    decimal shareForRightsRatio  
    decimal shareForShareRatio  
}
Agreement {

}
AgreementName {
    LegalAgreementTypeEnum agreementType  
    BrokerConfirmationTypeEnum brokerConfirmationType  
    ContractualDefinitionsEnumList contractualDefinitionsType  
    CollateralMarginTypeEnum creditSupportAgreementMarginType  
    CreditSupportAgreementTypeEnum creditSupportAgreementType  
    MasterAgreementTypeEnum masterAgreementType  
    MasterConfirmationAnnexTypeEnum masterConfirmationAnnexType  
    MasterConfirmationTypeEnum masterConfirmationType  
    string otherAgreement  
}
AgreementTerms {
    boolean clauseLibrary  
}
AmendmentEffectiveDate {
    string customProvision  
    date date  
    AmendmentEffectiveDateEnum specificDate  
}
AmountSchedule {
    stringList currency  
    decimal value  
}
AncillaryEntity {
    AncillaryRoleEnum ancillaryParty  
}
AncillaryParty {
    CounterpartyRoleEnum onBehalfOf  
    AncillaryRoleEnum role  
}
ApplicableRegime {
    string additionalRegime  
    string additionalTerms  
    AdditionalTypeEnum additionalType  
    RegulatoryRegimeEnum regime  
}
AppropriatedCollateralValuation {
    string election  
    boolean isSpecified  
}
Asset {

}
AssetDeliveryInformation {
    ProductGradeEnumList commodityGrade  
}
AssetDeliveryPeriods {
    date endDate  
    date startDate  
}
AssetDeliveryProfile {
    BankHolidayTreatmentEnum bankHolidaysTreatment  
    LoadTypeEnum loadType  
}
AssetDeliveryProfileBlock {
    DayOfWeekEnumList dayOfWeek  
    time endTime  
    time startTime  
}
AssetIdentifier {
    string identifier  
    AssetIdTypeEnum identifierType  
}
AssignedIdentifier {
    string identifier  
    integer version  
}
AutomaticExercise {
    boolean isApplicable  
    decimal thresholdRate  
}
AvailableInventory {
    AvailableInventoryTypeEnum availableInventoryType  
    string comment  
}
AvailableInventoryRecord {
    string comment  
    datetime expirationDateTime  
}
AverageTradingVolume {
    AverageTradingVolumeMethodologyEnum methodology  
}
AveragingCalculation {

}
AveragingCalculationMethod {
    AveragingCalculationMethodEnum calculationMethod  
    boolean isWeighted  
}
AveragingFeature {
    AveragingInOutEnum averagingInOut  
    decimal strikeFactor  
}
AveragingObservationList {

}
AveragingPeriod {
    MarketDisruptionEnum marketDisruption  
}
AveragingSchedule {
    date endDate  
    date startDate  
}
AveragingStrikeFeature {

}
Barrier {

}
BaseAndEligibleCurrency {
    ISOCurrencyCodeEnum baseCurrency  
    string baseCurrencyOther  
    boolean baseCurrencyTerminationCurrency  
    ISOCurrencyCodeEnumList eligibleCurrency  
    boolean eligibleCurrencyInclBaseCurrency  
    string eligibleCurrencyOther  
}
BasketConstituent {

}
BespokeCalculationDate {
    string calculationDateImTerms  
    boolean isApplicable  
}
BespokeCalculationTime {
    boolean asCalculationAgent  
    string bespokeCalculationTimeTerms  
}
BespokeTransferTiming {
    string bespokeTransferTimingTerms  
    boolean isApplicable  
}
BillingRecord {
    date recordEndDate  
    date recordStartDate  
}
BillingSummary {
    RecordAmountTypeEnum summaryAmountType  
}
BondReference {
    boolean conditionPrecedentBond  
    boolean discrepancyClause  
}
BusinessCenterTime {
    BusinessCenter businessCenter  
    time hourMinuteTime  
}
BusinessCenters {
    BusinessCenterList businessCenter  
    CommodityBusinessCalendarEnumList commodityBusinessCalendar  
}
BusinessDateRange {
    BusinessDayConventionEnum businessDayConvention  
    date endDate  
    date startDate  
}
BusinessDayAdjustments {
    BusinessDayConventionEnum businessDayConvention  
}
BusinessEvent {
    string eventQualifier  
    CorporateActionTypeEnum corporateActionIntent  
    date effectiveDate  
    date eventDate  
    EventIntentEnum intent  
}
BusinessUnit {
    string name  
}
BuyerSeller {
    CounterpartyRoleEnum buyer  
    CounterpartyRoleEnum seller  
}
CSADeliveryAmount {
    string additionalLanguage  
    DeliveryReturnAmountEnum deliveryAmount  
}
CSAMinimumTransferAmountVariableSet {
    CreditRatingAgencyEnum name  
    integer amount  
    boolean amountIsInfinity  
    string value  
}
CSAReturnAmount {
    DeliveryReturnAmountEnum returnAmount  
}
CSAThresholdVariableSet {
    CreditRatingAgencyEnum name  
    integer amount  
    string value  
}
CalculationAgent {
    BusinessCenter calculationAgentBusinessCenter  
    AncillaryRoleEnum calculationAgentParty  
    PartyDeterminationEnum calculationAgentPartyEnum  
}
CalculationAgentTerms {
    string bespokeCalculationAgentTerms  
    CalculationValuationAgentPartyEnum party  
}
CalculationAndTimingCollateralTransferAgreement {
    string cashSettlementDay  
    string securitiesSettlementDay  
}
CalculationCurrencyElection {
    string currency  
    boolean isBaseCurrency  
    CounterpartyRoleEnum party  
}
CalculationPeriod {
    integer calculationPeriodNumberOfDays  
    decimal dayCountYearFraction  
    decimal fixedRate  
    decimal forecastRate  
    decimal notionalAmount  
    date unadjustedEndDate  
    date unadjustedStartDate  
    date adjustedEndDate  
    date adjustedStartDate  
}
CalculationPeriodDates {
    date firstCompoundingPeriodEndDate  
    date firstRegularPeriodStartDate  
    date lastRegularPeriodEndDate  
    StubPeriodTypeEnumList stubPeriodType  
}
CalculationPeriodFrequency {
    boolean balanceOfFirstPeriod  
    RollConventionEnum rollConvention  
    PeriodExtendedEnum period  
    integer periodMultiplier  
}
CalculationSchedule {

}
CalculationScheduleDeliveryPeriods {
    date endDate  
    date startDate  
}
CalendarSpread {

}
CancelableProvision {
    CallingPartyEnum callingParty  
    boolean followUpConfirmation  
    CounterpartyRoleEnum buyer  
    CounterpartyRoleEnum seller  
}
CancelableProvisionAdjustedDates {

}
CancellationEvent {
    date adjustedEarlyTerminationDate  
    date adjustedExerciseDate  
}
CashCollateralValuationMethod {
    string agreedDiscountRate  
    CsaTypeEnum applicableCsa  
    string cashCollateralCurrency  
    string cashCollateralInterestRate  
    boolean prescribedDocumentationAdjustment  
    PartyDeterminationEnumList protectedParty  
}
CashSettlementTerms {
    boolean accruedInterest  
    CashSettlementMethodEnum cashSettlementMethod  
    boolean fixedSettlement  
    decimal recoveryFactor  
}
CashflowRepresentation {
    boolean cashflowsMatchParameters  
}
Clause {
    string identifier  
    string terms  
}
ClosedState {
    date activityDate  
    date effectiveDate  
    date lastPaymentDate  
    ClosedStateEnum state  
}
Collateral {

}
CollateralAccessBreach {
    decimal cabEndDate  
    boolean cabEndDateElection  
    string cabEndDateTerms  
    boolean isApplicable  
}
CollateralBalance {
    CollateralStatusEnum collateralBalanceStatus  
    HaircutIndicatorEnum haircutIndicator  
}
CollateralCriteria {

}
CollateralManagementAgreement {

}
CollateralManagementAgreementElection {
    string collateralManagementAgreement  
    CounterpartyRoleEnum party  
}
CollateralPortfolio {

}
CollateralPosition {
    CollateralStatusEnum collateralPositionStatus  
}
CollateralProvisions {
    CollateralTypeEnum collateralType  
}
CollateralRounding {
    ISOCurrencyCodeEnum currency  
    decimal deliveryAmount  
    RoundingModeEnum deliveryDirection  
    string other  
    decimal returnAmount  
    RoundingModeEnum returnDirection  
}
CollateralTransferAgreementElections {
    string additionalAmendments  
    string additionalBespokeTerms  
    boolean identifiedCrossCurrencySwap  
    string interpretationTerms  
}
CollateralTransferTiming {

}
CollateralTransferTimingDefinition {
    string additionalLanguage  
    boolean isApplicable  
}
CollateralTreatment {
    boolean isIncluded  
}
CollateralValuationTreatment {
    decimal additionalHaircutPercentage  
    decimal fxHaircutPercentage  
    decimal haircutPercentage  
    decimal marginPercentage  
}
Composite {
    DeterminationMethodEnum determinationMethod  
}
ConcentrationLimit {

}
ConcentrationLimitCriteria {
    ConcentrationLimitTypeEnum concentrationLimitType  
    CounterpartyRoleEnumList appliesTo  
    RatingPriorityResolutionEnum ratingPriorityResolution  
    CollateralMarginTypeEnum restrictTo  
}
ConditionsPrecedent {
    ExceptionEnum conditionsPrecedentElection  
    string customProvision  
}
ContactInformation {
    stringList email  
    stringList webPage  
}
ContractDetails {
    GoverningLawEnum governingLaw  
}
ContractFormationInstruction {

}
ContractualMatrix {
    MatrixTermEnum matrixTerm  
    MatrixTypeEnum matrixType  
}
ContractualTermsSupplement {
    ContractualSupplementTypeEnum contractualTermsSupplementType  
    date publicationDate  
}
ControlAgreement {

}
ControlAgreementElections {
    boolean consistencyWithControlAgreement  
    boolean controlAgreementAsCsd  
    CounterpartyRoleEnum party  
    boolean relationshipWithControlAgreement  
}
ControlAgreementNecEvent {

}
ControlAgreementNecEventElection {
    boolean necEvent  
    CounterpartyRoleEnum party  
}
CorporateAction {
    date announcementDate  
    string bespokeEventDescription  
    CorporateActionTypeEnum corporateActionType  
    date exDate  
    date payDate  
    date recordDate  
}
Counterparty {
    CounterpartyRoleEnum role  
}
CounterpartyPosition {
    datetime openDateTime  
}
CounterpartyPositionBusinessEvent {
    CorporateActionTypeEnum corporateActionIntent  
    date effectiveDate  
    date eventDate  
    PositionEventIntentEnum intent  
}
CounterpartyPositionState {

}
CreditEvent {
    date auctionDate  
    CreditEventTypeEnum creditEventType  
    date eventDeterminationDate  
    decimal recoveryPercent  
}
CreditEventNotice {
    BusinessCenter businessCenter  
    CounterpartyRoleEnumList notifyingParty  
}
CreditEvents {
    boolean bankruptcy  
    boolean distressedRatingsDowngrade  
    boolean failureToPayInterest  
    boolean failureToPayPrincipal  
    boolean governmentalIntervention  
    boolean impliedWritedown  
    boolean maturityExtension  
    boolean obligationAcceleration  
    boolean obligationDefault  
    boolean repudiationMoratorium  
    boolean writedown  
}
CreditLimitInformation {

}
CreditLimitUtilisation {

}
CreditLimitUtilisationPosition {
    decimal global_  
    decimal longPosition  
    decimal shortPosition  
}
CreditSupportAgreementElections {

}
CreditSupportAmount {
    string additionalLanguage  
    CreditSupportAmountEnum creditSupportAmount  
}
CreditSupportObligationsCollateralTransferAgreement {
    string otherEligibleSupportIM  
}
Custodian {

}
CustodianElection {
    string additionalLanguage  
    LegacyVMCustodianEnum legacyVMCustodian  
    CounterpartyRoleEnum party  
}
CustodianEvent {
    boolean isApplicable  
}
CustodianEventEndDate {

}
CustodianRisk {

}
CustodianRiskElection {
    boolean isSpecified  
    CounterpartyRoleEnum party  
    string qualification  
}
CustodyArrangements {
    boolean hasControlAgreementLanguage  
    boolean isCreditSupportDocument  
    string otherProvisions  
}
CustomisableOffset {
    string customProvision  
}
CustomisedWorkflow {
    string itemName  
    string itemValue  
}
DateList {
    dateList date  
}
DateRange {
    date endDate  
    date startDate  
}
DateRelativeToCalculationPeriodDates {

}
DateRelativeToPaymentDates {

}
DateRelativeToValuationDates {

}
DateTimeList {
    datetimeList dateTime  
}
DatedValue {
    date date  
    decimal value  
}
DebtEconomics {
    DebtInterestEnum interest  
    DebtPrincipalEnum principal  
    DebtSeniorityEnum seniority  
}
DebtRedemption {
    RedemptionPartyEnum party  
    PutCallEnum putCall  
    RedemptionTypeEnum redemptionType  
}
DebtType {

}
DeliverableObligations {
    boolean acceleratedOrMatured  
    boolean accruedInterest  
    ObligationCategoryEnum category  
    string excluded  
    boolean fullFaithAndCreditObLiability  
    boolean generalFundObligationLiability  
    boolean listed  
    boolean notBearer  
    boolean notContingent  
    boolean notDomesticIssuance  
    boolean notDomesticLaw  
    boolean notSovereignLender  
    boolean notSubordinated  
    string othReferenceEntityObligations  
    boolean revenueObligationLiability  
    boolean transferable  
}
DemandsAndNotices {
    boolean deemedEffectiveNextLBD  
}
DeterminationMethodology {
    AveragingCalculationMethodEnum averagingMethod  
    DeterminationMethodEnum determinationMethod  
}
DeterminationRolesAndTerms {
    DeterminationRoleEnum determinationRole  
    CounterpartyRoleEnum disputingParty  
    CounterpartyRoleEnumList whoToDetermine  
}
DirectOrRelativeTime {

}
DiscountingMethod {
    decimal discountRate  
    DayCountFractionEnum discountRateDayCountFraction  
    DiscountingTypeEnum discountingType  
}
DisputeResolution {
    string alternativeTerms  
    string otherTerms  
}
DividendPayoutRatio {
    decimal cashRatio  
    decimal nonCashRatio  
    decimal totalRatio  
}
DividendTerms {
    DividendEntitlementEnum dividendEntitlement  
}
EarlyTerminationEvent {
    date adjustedCashSettlementPaymentDate  
    date adjustedCashSettlementValuationDate  
    date adjustedEarlyTerminationDate  
    date adjustedExerciseDate  
    date adjustedExerciseFeePaymentDate  
}
EarlyTerminationProvision {

}
EconomicTerms {
    boolean nonStandardisedTerms  
}
ElectiveAmountElection {
    string customElection  
    ElectiveAmountEnum electiveAmount  
    CounterpartyRoleEnum party  
}
EligibleCollateralCriteria {
    CounterpartyRoleEnumList appliesTo  
    RatingPriorityResolutionEnum ratingPriorityResolution  
    CollateralMarginTypeEnum restrictTo  
}
EligibleCollateralSpecification {

}
EnforcementEvent {
    boolean earlyTerminationDate  
    boolean failureToPay  
}
EntityIdentifier {
    string identifier  
    EntityIdentifierTypeEnum identifierType  
}
EquityAdditionalTerms {

}
EquityCorporateEvents {
    ShareExtraordinaryEventEnum shareForCombined  
    ShareExtraordinaryEventEnum shareForOther  
    ShareExtraordinaryEventEnum shareForShare  
}
EquityType {
    DepositaryReceiptTypeEnum depositaryReceipt  
    EquityTypeEnum equityType  
}
EscrowArrangement {
    boolean escrowArrangementIsApplicable  
}
EventCurrency {
    string eventCurrency  
}
EventInstruction {
    CorporateActionTypeEnum corporateActionIntent  
    date effectiveDate  
    date eventDate  
    EventIntentEnum intent  
}
EventTimestamp {
    datetime dateTime  
    EventTimestampQualificationEnum qualification  
}
EvergreenProvision {
    datetime noticeDeadlineDateTime  
}
ExecutionDetails {
    ExecutionTypeEnum executionType  
}
ExecutionInstruction {
    date tradeDate  
}
ExecutionLanguage {
    string numberOfOriginals  
    string otherLanguage  
    boolean standardLanguage  
}
ExecutionLocation {
    string dutyPayer  
    string dutyPayerLanguage  
    date dutyPaymentDate  
    string dutyPaymentLanguage  
    ExecutionLocationEnum executionLocation  
    string otherLanguage  
}
ExecutionTerms {

}
ExerciseFee {
    decimal feeAmount  
    decimal feeRate  
    CounterpartyRoleEnum payer  
    CounterpartyRoleEnum receiver  
}
ExerciseFeeSchedule {
    CounterpartyRoleEnum payer  
    CounterpartyRoleEnum receiver  
}
ExerciseInstruction {

}
ExerciseNotice {
    BusinessCenter businessCenter  
    ExerciseNoticeGiverEnum exerciseNoticeGiver  
    AncillaryRoleEnum exerciseNoticeReceiver  
}
ExercisePeriod {

}
ExerciseProcedure {
    boolean followUpConfirmation  
    boolean limitedRightToConfirm  
    boolean splitTicket  
}
ExerciseTerms {
    ExpirationTimeTypeEnum expirationTimeType  
    OptionExerciseStyleEnum style  
}
ExtendibleProvision {
    CallingPartyEnum callingParty  
    boolean followUpConfirmation  
    datetime noticeDeadlineDateTime  
    CounterpartyRoleEnum buyer  
    CounterpartyRoleEnum seller  
}
ExtendibleProvisionAdjustedDates {

}
ExtensionEvent {
    date adjustedExerciseDate  
    date adjustedExtendedTerminationDate  
}
ExtraordinaryEvents {
    boolean compositionOfCombinedConsideration  
    NationalizationOrInsolvencyOrDelistingEventEnum delisting  
    boolean failureToDeliver  
    NationalizationOrInsolvencyOrDelistingEventEnum nationalizationOrInsolvency  
}
FailureToPay {
    boolean applicable  
}
FallbackReferencePrice {
    SettlementRateOptionEnumList fallBackSettlementRateOption  
    boolean fallbackSurveyValuationPostponement  
}
FeaturePayment {
    decimal amount  
    string currency  
    decimal levelPercentage  
    TimeTypeEnum time  
}
FinalCalculationPeriodDateAdjustment {
    BusinessDayConventionEnum businessDayConvention  
}
FinalReturns {
    string additionalLanguage  
    boolean applicable  
}
FixedRateSpecification {

}
FloatingRateDefinition {
    decimal calculatedRate  
    decimal floatingRateMultiplier  
    decimal spread  
}
FrenchLawAddendum {
    boolean isApplicable  
}
FrenchLawAddendumElection {
    string addendumLanguage  
    boolean isApplicable  
    CounterpartyRoleEnum party  
}
Frequency {
    PeriodExtendedEnum period  
    integer periodMultiplier  
}
FutureValueAmount {
    integer calculationPeriodNumberOfDays  
    string currency  
    date valueDate  
}
FxAdditionalTerms {
    boolean noFaultTermination  
}
FxBenchmarkObligationDefault {
    boolean benchmarkObligationDefaultIsApplicable  
    FxSubstitutionProvisionTypeEnum localSubstituteProvisionType  
    SpecifiedValueEnum specifiedValue  
}
FxDisruptionEvents {
    FxForceMajeureOrActOfSStateEnum forceMajeureOrActOfSState  
    FxIllegalityOrImpossibilityEnum illegalityOrImpossibility  
}
FxDualExchangeRate {
    boolean dualExchangeRateIsApplicable  
}
FxFeature {
    string referenceCurrency  
}
FxFixingDate {
    BusinessDayConventionEnum businessDayConvention  
    DayTypeEnum dayType  
    PeriodEnum period  
    integer periodMultiplier  
}
FxHaircutCurrency {
    string fxDesignatedCurrency  
    boolean isTerminationCurrency  
}
FxInconvertibilityOrNonTransferability {

}
FxLinkedNotionalAmount {
    date adjustedFxSpotFixingDate  
    decimal notionalAmount  
    decimal observedFxSpotRate  
    date resetDate  
}
FxLinkedNotionalSchedule {
    string varyingNotionalCurrency  
}
FxPriceSourceDisruption {
    boolean priceSourceDisruptionIsApplicable  
}
FxRate {
    decimal rate  
}
FxSpotRateSource {

}
GeneralInconvertibility {
    boolean generalInconvertibilityIsApplicable  
    FxSubstitutionProvisionTypeEnum localSubstituteProvisionType  
}
GeneralNonTransferability {
    boolean generalNonTransferabilityIsApplicable  
    FxSubstitutionProvisionTypeEnum localSubstituteProvisionType  
}
GeneralSimmElections {

}
GovernmentalAuthorityDefault {
    boolean governmentalAuthorityDefaultIsApplicable  
    FxSubstitutionProvisionTypeEnum localSubstituteProvisionType  
    SpecifiedValueEnum specifiedValue  
}
GracePeriodExtension {
    boolean applicable  
}
IdentifiedList {

}
Identifier {
    string issuer  
}
Illiquidity {
    boolean illiquidityIsApplicable  
}
IndependentAmount {

}
IndexAdjustmentEvents {
    IndexEventConsequenceEnum indexCancellation  
    IndexEventConsequenceEnum indexDisruption  
    IndexEventConsequenceEnum indexModification  
}
IndexTransitionInstruction {
    date effectiveDate  
}
InformationSource {
    string sourcePage  
    string sourcePageHeading  
    InformationProviderEnum sourceProvider  
}
InitialFixingDate {
    date initialFixingDate  
}
Instruction {

}
InterestRatePayout {
    CompoundingMethodEnum compoundingMethod  
    DayCountFractionEnum dayCountFraction  
    string fixedAmount  
    string floatingAmount  
    boolean paymentDelay  
    SpreadCalculationMethodEnum spreadCalculationMethod  
}
JapaneseSecuritiesProvisions {
    boolean amendmentsToJapaneseProvisions  
    string amendmentsToJapaneseProvisionsTerms  
    boolean clearstreamAmendmentToJapaneseProvisions  
    boolean isApplicable  
    boolean relevantProvisionsElection  
    string relevantProvisionsTerms  
}
JurisdictionRelatedTerms {
    boolean belgianLawSecurityAgreement  
    boolean exclusiveJurisdiction  
    boolean juryWaiver  
}
Lag {

}
LegacyResolutionAlternative {
    string additionalLanguage  
    LegacyResolutionAlternativeEnum resolutionAlternative  
}
LegalAgreement {
    date agreementDate  
    date effectiveDate  
}
LegalAgreementIdentification {
    GoverningLawEnum governingLaw  
    LegalAgreementPublisherEnum publisher  
    integer vintage  
}
LegalEntity {
    string name  
}
LimitApplicableExtended {
    decimal limitAmount  
    decimal limitImpactDueToTrade  
    LimitLevelEnum limitLevel  
    decimal amountRemaining  
    decimal amountUtilized  
    integer clipSize  
    string currency  
    CreditLimitTypeEnum limitType  
}
Lineage {

}
Loan {
    date creditAgreementDate  
    string facilityType  
    string lien  
    string tranche  
    AssetTypeEnum assetType  
    boolean isExchangeListed  
}
LoanParticipation {
    string qualifyingParticipationSeller  
    boolean applicable  
    boolean partialCashSettlement  
}
LocationIdentifier {
    CommodityLocationIdentifierTypeEnum locationIdentifierType  
    string issuer  
}
MakeWholeAmount {
    date earlyCallDate  
    InterpolationMethodEnum interpolationMethod  
    FloatingRateIndexEnum floatingRateIndex  
    QuotationSideEnum side  
    decimal spread  
}
MandatoryEarlyTermination {

}
MandatoryEarlyTerminationAdjustedDates {
    date adjustedCashSettlementPaymentDate  
    date adjustedCashSettlementValuationDate  
    date adjustedEarlyTerminationDate  
}
ManualExercise {
    boolean fallbackExercise  
}
MarginApproach {
    MarginApproachEnum marginApproach  
}
MasterAgreementClause {
    string name  
    CounterpartyRoleEnumList counterparty  
    MasterAgreementClauseIdentifierEnum identifer  
    PartyRoleEnumList otherParty  
}
MasterAgreementClauseVariant {
    string name  
    CounterpartyRoleEnumList counterparty  
    MasterAgreementVariantIdentifierEnum identifier  
    PartyRoleEnumList otherParty  
}
MasterAgreementElections {

}
MasterAgreementSchedule {

}
MasterAgreementVariableSet {
    string name  
    string value  
}
MaterialChangeInCircumstance {
    boolean materialChangeInCircumstanceIsApplicable  
}
Measure {
    decimal value  
}
Merger {

}
MessageInformation {
    stringList copyTo  
    string messageId  
    string sentBy  
    stringList sentTo  
}
MinimumTransferAmount {

}
MinimumTransferAmountAmendment {
    boolean isApplicable  
}
MinimumTransferAmountElection {
    string other  
    CounterpartyRoleEnum party  
}
MinimumTransferAmountRatingsBased {
    CreditNotationMismatchResolutionEnum compare  
    ISOCurrencyCodeEnum currency  
    string namedAffiliate  
    string namedEntity  
    boolean noRating  
    NotRatedByEnum notRatedBy  
    NumberOfRatingAgenciesEnum numberOfRatingAgencies  
    RatedPartyEnum ratedParty  
    RatingTypeEnum ratingType  
    ZeroEventEnumList event  
    boolean zeroEvent  
}
Money {
    decimal value  
}
MoneyBound {
    boolean inclusive  
}
MoneyRange {

}
MultipleExercise {
    decimal maximumNotionalAmount  
    integer maximumNumberOfOptions  
    decimal integralMultipleAmount  
    decimal minimumNotionalAmount  
    integer minimumNumberOfOptions  
}
MultipleValuationDates {
    integer businessDaysThereafter  
    integer numberValuationDates  
    integer businessDays  
}
Nationalization {
    boolean assignmentOfClaim  
    boolean nationalizationIsApplicable  
}
NaturalPerson {
    date dateOfBirth  
    string firstName  
    string honorific  
    stringList initial  
    stringList middleName  
    string suffix  
    string surname  
}
NaturalPersonRole {
    NaturalPersonRoleEnumList role  
}
NonDeliverableSubstitute {
    boolean nonDeliverableSubstituteIsApplicable  
}
NonLegalEntity {
    string identifier  
    string identifierType  
}
NonNegativeQuantitySchedule {
    decimal value  
}
NonTransferableProduct {

}
NotDomesticCurrency {
    boolean applicable  
    string currency  
}
NoticeContactInformation {
    string additionalInformation  
    stringList email  
    stringList webPage  
}
NoticeInformationElection {
    CounterpartyRoleEnum partyReference  
}
NotificationTime {
    boolean disputeNotificationReference  
    boolean transferTimingProviso  
}
NotificationTimeElection {
    string customNotification  
    boolean localBusinessDay  
    CounterpartyRoleEnum party  
}
NumberBound {
    boolean inclusive  
    decimal number  
}
NumberRange {

}
Observable {

}
Observation {

}
ObservationDate {
    date adjustedDate  
    string observationReference  
    date unadjustedDate  
    decimal weight  
}
ObservationDates {

}
ObservationEvent {

}
ObservationIdentifier {
    date observationDate  
}
ObservationInstruction {

}
ObservationSchedule {

}
ObservationTerms {
    integer numberOfObservationDates  
    TimeTypeEnum observationTimeType  
}
Offset {
    DayTypeEnum dayType  
    PeriodEnum period  
    integer periodMultiplier  
}
OneWayProvisions {
    boolean isApplicable  
    CounterpartyRoleEnum postingParty  
}
OptionFeature {

}
OptionPayout {
    OptionTypeEnum optionType  
}
OptionStrike {

}
OptionalEarlyTermination {
    boolean followUpConfirmation  
    boolean mutualEarlyTermination  
}
OptionalEarlyTerminationAdjustedDates {

}
OtherAgreementTerms {
    boolean isSpecified  
    string legalDocument  
}
OtherAgreements {

}
PCDeliverableObligationCharac {
    boolean applicable  
    boolean partialCashSettlement  
}
ParametricDates {
    DayDistributionEnum dayDistribution  
    decimal dayFrequency  
    DayOfWeekEnumList dayOfWeek  
    DayTypeEnum dayType  
}
PartialExercise {
    decimal integralMultipleAmount  
    decimal minimumNotionalAmount  
    integer minimumNumberOfOptions  
}
Party {
    string name  
}
PartyChangeInstruction {

}
PartyCustomisedWorkflow {
    string partyName  
}
PartyIdentifier {
    string identifier  
    PartyIdentifierTypeEnum identifierType  
}
PartyReferencePayerReceiver {

}
PartyRole {
    PartyRoleEnum role  
}
PassThrough {

}
PassThroughItem {
    decimal passThroughPercentage  
}
PayerReceiver {
    CounterpartyRoleEnum payer  
    CounterpartyRoleEnum receiver  
}
PaymentCalculationPeriod {
    date adjustedPaymentDate  
    decimal discountFactor  
    date unadjustedPaymentDate  
}
PaymentDateSchedule {

}
PaymentDates {
    date firstPaymentDate  
    date lastRegularPaymentDate  
    PayRelativeToEnum payRelativeTo  
}
PaymentDetail {

}
PaymentRule {

}
Payout {

}
PercentageRule {
    decimal paymentPercent  
}
PerformanceValuationDates {
    DeterminationMethodEnum determinationMethod  
    TimeTypeEnum valuationTimeType  
}
Period {
    PeriodEnum period  
    integer periodMultiplier  
}
PeriodicDates {
    DayTypeEnum dayType  
}
PersonIdentifier {
    string country  
    string identifier  
    PersonIdentifierTypeEnum identifierType  
}
PhysicalSettlementPeriod {
    integer businessDays  
    boolean businessDaysNotSpecified  
    integer maximumBusinessDays  
}
PhysicalSettlementTerms {
    boolean clearedPhysicalSettlement  
    boolean escrow  
    AncillaryRoleEnum predeterminedClearingOrganizationParty  
    boolean sixtyBusinessDaySettlementCap  
}
PledgeeRepresentativeRider {
    boolean isApplicable  
    CounterpartyRoleEnum party  
    ExceptionEnum representativeEvent  
    string representativeEventTerms  
    string representativeTerms  
}
PortfolioState {

}
Position {

}
PositionIdentifier {
    TradeIdentifierTypeEnum identifierType  
    string issuer  
}
PostingObligations {
    CounterpartyRoleEnumList securityProvider  
}
PostingObligationsElection {
    string additionalLanguage  
    boolean asPermitted  
    string excludedCollateral  
    CounterpartyRoleEnum party  
}
Price {
    ArithmeticOperationEnum arithmeticOperator  
    PremiumTypeEnum premiumType  
    PriceExpressionEnum priceExpression  
    PriceSubTypeEnum priceSubType  
    PriceTypeEnum priceType  
    decimal value  
}
PriceComposite {
    ArithmeticOperationEnum arithmeticOperator  
    decimal baseValue  
    decimal operand  
    PriceOperandEnum operandType  
}
PriceMateriality {
    boolean priceMaterialityIsApplicable  
}
PriceQuantity {

}
PriceSchedule {
    ArithmeticOperationEnum arithmeticOperator  
    PremiumTypeEnum premiumType  
    PriceExpressionEnum priceExpression  
    PriceSubTypeEnum priceSubType  
    PriceTypeEnum priceType  
    decimal value  
}
PriceSourceDisruption {

}
PrimitiveInstruction {

}
PrincipalPayment {
    decimal discountFactor  
}
PrincipalPaymentSchedule {

}
PrincipalPayments {
    boolean finalPayment  
    boolean initialPayment  
    boolean intermediatePayment  
    stringList varyingLegNotionalCurrency  
}
ProcessAgent {

}
ProcessAgentElection {
    string additionalInformation  
    boolean isApplicable  
    CounterpartyRoleEnum partyReference  
}
Product {

}
ProductIdentifier {
    string identifier  
    ProductIdTypeEnum source  
}
ProductTaxonomy {
    AssetClassEnum primaryAssetClass  
    string productQualifier  
    AssetClassEnumList secondaryAssetClass  
    TaxonomySourceEnum source  
}
PubliclyAvailableInformation {
    stringList publicSource  
    integer specifiedNumber  
    boolean standardPublicSources  
}
Quantity {
    decimal value  
}
QuantityChangeInstruction {
    QuantityChangeDirectionEnum direction  
}
QuantityMultiplier {
    decimal multiplierValue  
}
Quanto {

}
QuotedCurrencyPair {
    string currency1  
    string currency2  
    QuoteBasisEnum quoteBasis  
}
RateObservation {
    date adjustedFixingDate  
    decimal forecastRate  
    integer observationWeight  
    decimal observedRate  
    date resetDate  
    decimal treatedForecastRate  
    decimal treatedRate  
}
RateSchedule {

}
RateSpecification {

}
RecalculationOfValue {

}
RecalculationOfValueElection {
    CounterpartyRoleEnum party  
    RecalculationOfValueElectionEnum recalculationOfValueElection  
    string recalculationOfValueTerms  
}
RecallProvision {
    boolean isRecallable  
}
ReferenceBank {
    string referenceBankId  
    string referenceBankName  
}
ReferenceBanks {

}
ReferenceInformation {
    boolean allGuarantees  
    boolean noReferenceObligation  
    boolean referencePolicy  
    boolean securedList  
    boolean unknownReferenceObligation  
}
ReferenceObligation {
    string guarantorReference  
    boolean standardReferenceObligation  
}
ReferenceSwapCurve {

}
Regime {
    decimal fallbackToMandatoryMethodDays  
}
RegimeTerms {
    string asSpecified  
    ExceptionEnum isApplicable  
    CounterpartyRoleEnum party  
}
RelativeDateOffset {
    date adjustedDate  
    BusinessDayConventionEnum businessDayConvention  
    date dateRelativeTo  
    DayTypeEnum dayType  
    PeriodEnum period  
    integer periodMultiplier  
}
RelativeDates {
    integer periodSkip  
    date adjustedDate  
    BusinessDayConventionEnum businessDayConvention  
    date dateRelativeTo  
    DayTypeEnum dayType  
    PeriodEnum period  
    integer periodMultiplier  
}
RelativeTime {
    integer offsetMultiplier  
    TimeUnitEnum offsetTimeUnit  
}
Representations {
    boolean additionalAcknowledgements  
    boolean agreementsRegardingHedging  
    boolean indexDisclaimer  
    boolean nonReliance  
}
Reset {
    date rateRecordDate  
    date resetDate  
}
ResetDates {
    ResetRelativeToEnum resetRelativeTo  
}
ResetFrequency {
    WeeklyRollConventionEnum weeklyRollConvention  
    PeriodExtendedEnum period  
    integer periodMultiplier  
}
ResetInstruction {
    date rateRecordDate  
    date resetDate  
}
ResolutionValue {
    string additionalLanguage  
    ValueCashEnum cash  
    boolean fallback  
    ValueSecuritiesEnum securities  
}
ResolvablePriceQuantity {
    boolean reset  
}
Resource {
    string name  
    string comments  
    string language  
    string mimeType  
    string resourceId  
    ResourceTypeEnum resourceType  
    decimal sizeInBytes  
    string string  
    string url  
}
ResourceLength {
    LengthUnitEnum lengthUnit  
    decimal lengthValue  
}
Restructuring {
    boolean applicable  
    boolean multipleCreditEventNotices  
    boolean multipleHolderObligation  
    RestructuringEnum restructuringType  
}
RetrospectiveEffect {
    string asSpecified  
    ExceptionEnum standardisedException  
}
RightsEvents {
    boolean deliveryInLieuRight  
}
Rounding {
    integer precision  
    RoundingDirectionEnum roundingDirection  
}
Schedule {
    decimal value  
}
SchedulePeriod {
    date paymentDate  
}
SecuredDebt {
    AssetBackedEnum assetBacked  
    CollateralizedObligationEnum collateralizedObligation  
    CoveredBondEnum coveredBond  
    PropertyTypeEnum propertyType  
    SecuredTypeEnum securedType  
}
SecuredPartyRightsEvent {
    boolean earlyTerminationDateOptionalLanguage  
    boolean failureToPayEarlyTermination  
}
SecuredPartyRightsEventElection {
    CounterpartyRoleEnum party  
    boolean rightsEvent  
}
Security {
    FundProductTypeEnum fundType  
    SecurityTypeEnum securityType  
    AssetTypeEnum assetType  
    boolean isExchangeListed  
}
SecurityAgreementElections {
    string additionalAmendments  
    string additionalBespokeTerms  
    boolean deliveryInLieuRight  
    boolean fullDischarge  
}
SecurityLendingInvoice {
    date billingEndDate  
    date billingStartDate  
}
SecurityLocate {
    AvailableInventoryTypeEnum availableInventoryType  
    string comment  
}
SecurityProviderRightsEvent {
    boolean automaticSetOff  
    string customElection  
    boolean fullDischarge  
    boolean includeCoolingOffLanguage  
}
SecurityProviderRightsEventElection {
    CounterpartyRoleEnum party  
    boolean rightsEvent  
}
SensitivityMethodologies {

}
SensitivityMethodologiesPartyElection {
    CounterpartyRoleEnum party  
}
SensitivityMethodology {
    string customMethodology  
    SensitivitiesEnum specifiedMethodology  
}
SensitivityToEquity {

}
SettlementDate {
    integer cashSettlementBusinessDays  
    boolean paymentDelay  
    date valueDate  
}
SettlementProvision {

}
SettlementRateOption {
    SettlementRateOptionEnum settlementRateOption  
}
SettlementTerms {
    SettlementCentreEnum settlementCentre  
    string settlementCurrency  
    SettlementTypeEnum settlementType  
    StandardSettlementStyleEnum standardSettlementStyle  
    TransferSettlementEnum transferSettlementType  
}
ShapingProvision {

}
SimmCalculationCurrency {

}
SimmException {
    string asSpecified  
    SimmExceptionApplicableEnum simmExceptionApplicable  
    ExceptionEnum standardisedException  
}
SimmVersion {
    string asSpecified  
    boolean isSpecified  
    CounterpartyRoleEnum partyVersion  
}
SingleValuationDate {
    integer businessDays  
}
SpecificInconvertibility {
    FxSubstitutionProvisionTypeEnum localSubstituteProvisionType  
    stringList relevantClass  
    boolean specificInconvertibilityIsApplicable  
}
SpecificNonTransferability {
    FxSubstitutionProvisionTypeEnum localSubstituteProvisionType  
    stringList relevantClass  
    boolean specificNonTransferabilityIsApplicable  
}
SpecifiedConditionOrAccessCondition {
    string additionalLanguage  
    boolean isApplicable  
}
SpecifiedCurrency {
    boolean applicable  
    string currency  
}
SpecifiedOrAccessConditionPartyElection {
    AdditionalTerminationEventEnumList additionalTerminationEvent  
    CounterpartyRoleEnum party  
    stringList specifiedAdditionalTerminationEvent  
    CSASpecifiedOrAccessConditionEnumList specifiedOrAccessCondition  
}
SpinOff {

}
SplitInstruction {

}
SpreadSchedule {
    SpreadScheduleTypeEnum spreadScheduleType  
}
State {
    PositionStatusEnum positionState  
}
StockSplitInstruction {
    decimal adjustmentRatio  
    date effectiveDate  
}
StrategyFeature {

}
Strike {
    PayerReceiverEnum buyer  
    PayerReceiverEnum seller  
    decimal strikeRate  
}
StrikeSchedule {
    PayerReceiverEnum buyer  
    PayerReceiverEnum seller  
}
StrikeSpread {
    decimal upperStrikeNumberOfOptions  
}
StubFloatingRate {
    FloatingRateIndexEnum floatingRateIndex  
    RateTreatmentEnum rateTreatment  
}
StubPeriod {

}
StubValue {
    decimal stubRate  
}
SubstitutedRegime {
    string additionalRegime  
    RegulatoryRegimeEnum regime  
}
SubstitutedRegimeTerms {
    boolean isApplicable  
    CounterpartyRoleEnum party  
}
Substitution {

}
SubstitutionPartyElection {
    LegacyConsentEnum legacyConsent  
    boolean needsConsent  
    CounterpartyRoleEnum party  
    string specificConsentLanguage  
    string substitutionDateLanguage  
}
SubstitutionProvisions {
    datetime noticeDeadlineDateTime  
    integer numberOfSubstitutionsAllowed  
}
SwapCurveValuation {
    FloatingRateIndexEnum floatingRateIndex  
    QuotationSideEnum side  
    decimal spread  
}
Taxonomy {
    TaxonomySourceEnum source  
}
TaxonomyClassification {
    string description  
    string className  
    integer ordinal  
    string value  
}
TaxonomyValue {
    string name  
}
TelephoneNumber {
    string number  
    TelephoneTypeEnum telephoneNumberType  
}
TerminationCurrencyAmendment {
    boolean isApplicable  
}
TerminationCurrencyElection {
    string currency  
    boolean isSpecified  
    CounterpartyRoleEnumList party  
}
TerminationProvision {

}
TermsChangeInstruction {
    NotionalAdjustmentEnum adjustment  
}
Threshold {

}
ThresholdElection {
    boolean infinity  
    string other  
    CounterpartyRoleEnum party  
}
ThresholdMinimumTransferAmountFixedAmount {
    ZeroEventEnumList event  
    boolean zeroEvent  
}
ThresholdRatingsBased {
    CreditNotationMismatchResolutionEnum compare  
    ISOCurrencyCodeEnum currency  
    string namedAffiliate  
    string namedEntity  
    boolean noRating  
    NotRatedByEnum notRatedBy  
    NumberOfRatingAgenciesEnum numberOfRatingAgencies  
    RatedPartyEnum ratedParty  
    RatingTypeEnum ratingType  
    ZeroEventEnumList event  
    boolean zeroEvent  
}
TimeRounding {
    TimeUnitEnum roundToUnit  
    RoundingDirectionEnum roundingDirection  
}
TimeZone {
    string location  
    time time  
}
TradableProduct {
    NotionalAdjustmentEnum adjustment  
}
Trade {
    date clearedDate  
    date tradeDate  
    NotionalAdjustmentEnum adjustment  
}
TradeIdentifier {
    TradeIdentifierTypeEnum identifierType  
    string issuer  
}
TradeLot {

}
TradeState {

}
TransactionAdditionalTerms {
    string commoditiesAdditionalTerms  
    string creditAdditionalTerms  
    string digitalAssetAdditionalTerms  
    string interestRateAdditionalTerms  
}
Transfer {

}
TransferInformationElection {
    CounterpartyRoleEnum partyReference  
}
TransferInstruction {

}
TransferSettlementTiming {
    string additionalLanguage  
    CashCTSTimeEnum cashCollateralTransferSettlementTime  
    SecuritiesCTSTimeEnum securititesCollateralTransferSettlementTime  
}
TransferState {
    TransferStatusEnum transferStatus  
}
Trigger {
    TriggerTimeTypeEnum triggerTimeType  
    TriggerTypeEnum triggerType  
}
TriggerEvent {

}
UmbrellaAgreement {

}
UmbrellaAgreementParty {
    CounterpartyRoleEnum actingAs  
    UmbrellaPartyRoleEnum partyRole  
}
UmbrellaAgreementSet {
    string additionalLanguage  
}
Underlier {

}
UnderlierSubstitutionProvision {
    CounterpartyRoleEnum disputingParty  
    CounterpartyRoleEnumList whoMaySubstitute  
}
UnitType {
    CapacityUnitEnum capacityUnit  
    string currency  
    FinancialUnitEnum financialUnit  
    WeatherUnitEnum weatherUnit  
}
Valuation {
    decimal delta  
    ValuationTypeEnum method  
    ValuationScopeEnum scope  
    ValuationSourceEnum source  
    datetime timestamp  
    PriceTimingEnum valuationTiming  
}
ValuationCalculationDateLocation {

}
ValuationCalculationDateLocationElection {
    BusinessCenter businessCenter  
    string customLocation  
    CounterpartyRoleEnum party  
}
ValuationDate {

}
ValuationInstruction {
    boolean replace  
}
ValuationMethod {
    QuotationRateTypeEnum quotationMethod  
    ValuationMethodEnum valuationMethod  
}
ValuationPostponement {
    integer maximumDaysOfPostponement  
}
ValuationSource {

}
Velocity {
    PeriodTimeEnum period  
    integer periodMultiplier  
}
WeightedAveragingObservation {
    datetime dateTime  
    integer observationNumber  
    decimal weight  
}
WorkflowState {
    string comment  
    WarehouseIdentityEnum warehouseIdentity  
    WorkflowStatusEnum workflowStatus  
}
WorkflowStep {
    ActionEnum action  
    boolean rejected  
}
WorkflowStepApproval {
    boolean approved  
    string rejectedReason  
}

Account ||--|o Party : "accountBeneficiary, partyReference, servicingParty"
AccrualFactor ||--|o AccrualFactorCalculationTerms : "calculationTerms"
AccrualFactor ||--|| PriceSchedule : "value"
AccrualFactorCalculationTerms ||--|o StubValue : "interpolationTerms"
AdditionalDisruptionEvents ||--}o Clause : "additionalBespokeTerms"
AdditionalRepresentation ||--}| AdditionalRepresentationElection : "partyElection"
AdditionalRepresentations ||--|o AdditionalRepresentation : "additionalRepresentation"
AddressesForTransfer ||--}| TransferInformationElection : "partyElection"
AdjustableDate ||--|o BusinessDayAdjustments : "dateAdjustments, dateAdjustmentsReference"
AdjustableDates ||--|o BusinessDayAdjustments : "dateAdjustments"
AdjustableOrAdjustedDate ||--|o BusinessDayAdjustments : "dateAdjustments"
AdjustableOrAdjustedOrRelativeDate ||--|o BusinessDayAdjustments : "dateAdjustments"
AdjustableOrAdjustedOrRelativeDate ||--|o RelativeDateOffset : "relativeDate"
AdjustableOrRelativeDate ||--|o AdjustableDate : "adjustableDate"
AdjustableOrRelativeDate ||--|o AdjustedRelativeDateOffset : "relativeDate"
AdjustableOrRelativeDates ||--|o AdjustableDates : "adjustableDates"
AdjustableOrRelativeDates ||--|o RelativeDates : "relativeDates"
AdjustableRelativeOrPeriodicDates ||--|o AdjustableDates : "adjustableDates"
AdjustableRelativeOrPeriodicDates ||--|o PeriodicDates : "periodicDates"
AdjustableRelativeOrPeriodicDates ||--|o RelativeDates : "relativeDates"
AdjustedRelativeDateOffset ||--|o BusinessCenters : "businessCenters, businessCentersReference"
AdjustedRelativeDateOffset ||--|o BusinessDayAdjustments : "relativeDateAdjustments"
AdjustmentFactor ||--|o AdjustmentFactorCalculationTerms : "calculationTerms"
AdjustmentFactorCalculationTerms ||--|o AccrualFactor : "accrualFactor"
AdjustmentFactorCalculationTerms ||--|o Merger : "merger"
AdjustmentFactorCalculationTerms ||--|o Price : "lastFixingPriceBeforeAdjustment, rightsSubscriptionPrice"
AdjustmentFactorCalculationTerms ||--|o PriceSchedule : "dividendObservation"
AdjustmentFactorCalculationTerms ||--|o SpinOff : "spinOff"
Agreement ||--|o CollateralTransferAgreementElections : "collateralTransferAgreementElections"
Agreement ||--|o CreditSupportAgreementElections : "creditSupportAgreementElections"
Agreement ||--|o MasterAgreementElections : "masterAgreementElections"
Agreement ||--|o MasterAgreementSchedule : "masterAgreementSchedule"
Agreement ||--|o SecurityAgreementElections : "securityAgreementElections"
Agreement ||--|o TransactionAdditionalTerms : "transactionAdditionalTerms"
AgreementName ||--}o ContractualMatrix : "contractualMatrix"
AgreementName ||--}o ContractualTermsSupplement : "contractualTermsSupplement"
AgreementTerms ||--|| Agreement : "agreement"
AgreementTerms ||--}| Counterparty : "counterparty"
AmountSchedule ||--}o DatedValue : "datedValue"
AncillaryEntity ||--|o LegalEntity : "legalEntity"
AncillaryParty ||--}| Party : "partyReference"
ApplicableRegime ||--}| RegimeTerms : "regimeTerms"
AssetDeliveryInformation ||--|o AssetDeliveryPeriods : "periods"
AssetDeliveryInformation ||--|o Quantity : "deliveryCapacity"
AssetDeliveryInformation ||--}o LocationIdentifier : "location"
AssetDeliveryPeriods ||--}o AssetDeliveryProfile : "profile"
AssetDeliveryProfile ||--}o AssetDeliveryProfileBlock : "block"
AssetDeliveryProfileBlock ||--|o Price : "priceTimeIntervalQuantity"
AssetDeliveryProfileBlock ||--|o Quantity : "deliveryCapacity"
AvailableInventory ||--|o AssignedIdentifier : "identifer"
AvailableInventory ||--|o MessageInformation : "messageInformation"
AvailableInventory ||--}o AvailableInventoryRecord : "availableInventoryRecord"
AvailableInventory ||--}o Party : "party"
AvailableInventory ||--}o PartyRole : "partyRole"
AvailableInventoryRecord ||--|o DividendTerms : "dividendTerms"
AvailableInventoryRecord ||--|o Price : "interestRate"
AvailableInventoryRecord ||--|o Quantity : "quantity"
AvailableInventoryRecord ||--|| AssignedIdentifier : "identifer"
AvailableInventoryRecord ||--|| Security : "security"
AvailableInventoryRecord ||--}o CollateralProvisions : "collateral"
AvailableInventoryRecord ||--}o PartyRole : "partyRole"
AverageTradingVolume ||--|| Period : "period"
AveragingCalculation ||--|| AveragingCalculationMethod : "averagingMethod"
AveragingCalculation ||--|| Rounding : "precision"
AveragingFeature ||--|o AveragingPeriod : "averagingPeriodIn, averagingPeriodOut"
AveragingFeature ||--|| AveragingCalculation : "averagingCalculation"
AveragingObservationList ||--}| WeightedAveragingObservation : "averagingObservation"
AveragingPeriod ||--|o AveragingObservationList : "averagingObservations"
AveragingPeriod ||--|o DateTimeList : "averagingDateTimes"
AveragingPeriod ||--}o AveragingSchedule : "schedule"
AveragingSchedule ||--|| CalculationPeriodFrequency : "averagingPeriodFrequency"
AveragingStrikeFeature ||--|| AveragingCalculation : "averagingCalculation"
AveragingStrikeFeature ||--|| ObservationTerms : "observationTerms"
Barrier ||--}o TriggerEvent : "knockIn, knockOut"
BasketConstituent ||--}o NonNegativeQuantitySchedule : "quantity"
BasketConstituent ||--}o PriceSchedule : "finalValuationPrice, initialValuationPrice, interimValuationPrice"
BillingRecord ||--|o Money : "minimumFee"
BillingRecord ||--|| TradeState : "tradeState"
BillingRecord ||--|| Transfer : "recordTransfer"
BillingSummary ||--|o Transfer : "summaryTransfer"
BondReference ||--|o FixedRateSpecification : "couponRate"
BondReference ||--|| Security : "bond"
BusinessCenters ||--|o BusinessCenters : "businessCentersReference"
BusinessDateRange ||--|o BusinessCenters : "businessCenters"
BusinessDayAdjustments ||--|o BusinessCenters : "businessCenters"
BusinessEvent ||--|o IdentifiedList : "packageInformation"
BusinessEvent ||--|o TimeZone : "effectiveTime, eventTime"
BusinessEvent ||--}o Instruction : "instruction"
BusinessEvent ||--}o TradeState : "after"
BusinessUnit ||--|o ContactInformation : "contactInformation"
BusinessUnit ||--|o Identifier : "identifier"
CalculationAndTimingCollateralTransferAgreement ||--|o BespokeCalculationDate : "bespokeCalculationDate"
CalculationAndTimingCollateralTransferAgreement ||--|o BespokeCalculationTime : "bespokeCalculationTime"
CalculationAndTimingCollateralTransferAgreement ||--|o CalculationAgentTerms : "calculationAgentTerms"
CalculationAndTimingCollateralTransferAgreement ||--|o ValuationCalculationDateLocation : "calculationDateLocation"
CalculationAndTimingCollateralTransferAgreement ||--|| NotificationTime : "notificationTime"
CalculationPeriod ||--|o FloatingRateDefinition : "floatingRateDefinition"
CalculationPeriod ||--|o FxLinkedNotionalAmount : "fxLinkedNotionalAmount"
CalculationPeriod ||--|o Money : "forecastAmount"
CalculationPeriodDates ||--|o AdjustableOrRelativeDate : "effectiveDate, firstPeriodStartDate, terminationDate"
CalculationPeriodDates ||--|o BusinessDayAdjustments : "calculationPeriodDatesAdjustments"
CalculationPeriodDates ||--|o CalculationPeriodFrequency : "calculationPeriodFrequency"
CalculationSchedule ||--}| SchedulePeriod : "schedulePeriod"
CalculationScheduleDeliveryPeriods ||--|o Price : "priceTimeIntervalQuantity"
CalculationScheduleDeliveryPeriods ||--|o Quantity : "deliveryCapacity"
CalculationScheduleDeliveryPeriods ||--}o AssetDeliveryProfile : "profile"
CalendarSpread ||--|| AdjustableOrRelativeDate : "expirationDateTwo"
CancelableProvision ||--|o AdjustableOrRelativeDate : "earliestDate, expirationDate"
CancelableProvision ||--|o AdjustableOrRelativeDates : "effectiveDate"
CancelableProvision ||--|o BusinessCenterTime : "earliestCancellationTime, latestCancelationTime"
CancelableProvision ||--|o CancelableProvisionAdjustedDates : "cancelableProvisionAdjustedDates"
CancelableProvision ||--|o ExerciseNotice : "exerciseNotice"
CancelableProvision ||--|o Period : "effectivePeriod"
CancelableProvision ||--|o Transfer : "initialFee"
CancelableProvision ||--|| ExerciseTerms : "exerciseTerms"
CancelableProvision ||--}o FinalCalculationPeriodDateAdjustment : "finalCalculationPeriodDateAdjustment"
CancelableProvisionAdjustedDates ||--}| CancellationEvent : "cancellationEvent"
CashSettlementTerms ||--|o BusinessCenterTime : "valuationTime"
CashSettlementTerms ||--|o Money : "cashSettlementAmount"
CashSettlementTerms ||--|o ValuationDate : "valuationDate"
CashSettlementTerms ||--|o ValuationMethod : "valuationMethod"
CashflowRepresentation ||--}o PaymentCalculationPeriod : "paymentCalculationPeriod"
Clause ||--}o Clause : "subcomponents"
Collateral ||--|o CollateralProvisions : "collateralProvisions"
Collateral ||--|o IndependentAmount : "independentAmount"
Collateral ||--}o CollateralPortfolio : "collateralPortfolio"
Collateral ||--}o Identifier : "portfolioIdentifier"
CollateralBalance ||--|| Money : "amountBaseCurrency"
CollateralBalance ||--|| PartyReferencePayerReceiver : "payerReceiver"
CollateralManagementAgreement ||--}| CollateralManagementAgreementElection : "partyElection"
CollateralPortfolio ||--|o Identifier : "portfolioIdentifier"
CollateralPortfolio ||--|o LegalAgreement : "legalAgreement"
CollateralPortfolio ||--}o CollateralBalance : "collateralBalance"
CollateralPortfolio ||--}o CollateralPosition : "collateralPosition"
CollateralPosition ||--|o Asset : "asset"
CollateralPosition ||--|o CollateralTreatment : "treatment"
CollateralPosition ||--|o Money : "cashBalance"
CollateralPosition ||--|o Product : "product"
CollateralPosition ||--|o TradeState : "tradeReference"
CollateralPosition ||--}| PriceQuantity : "priceQuantity"
CollateralProvisions ||--|o SubstitutionProvisions : "substitutionProvisions"
CollateralProvisions ||--}o EligibleCollateralCriteria : "eligibleCollateral"
CollateralTransferAgreementElections ||--|o AdditionalRepresentations : "additionalRepresentations"
CollateralTransferAgreementElections ||--|o AddressesForTransfer : "addressesForTransfer"
CollateralTransferAgreementElections ||--|o ConditionsPrecedent : "conditionsPrecedent"
CollateralTransferAgreementElections ||--|o CustodyArrangements : "custodyArrangements"
CollateralTransferAgreementElections ||--|o DemandsAndNotices : "demandsAndNotices"
CollateralTransferAgreementElections ||--|o FinalReturns : "finalReturns"
CollateralTransferAgreementElections ||--|o FxHaircutCurrency : "fxHaircutCurrency"
CollateralTransferAgreementElections ||--|o GeneralSimmElections : "generalSimmElections"
CollateralTransferAgreementElections ||--|o JurisdictionRelatedTerms : "jurisdictionRelatedTerms"
CollateralTransferAgreementElections ||--|o OtherAgreements : "otherAgreements"
CollateralTransferAgreementElections ||--|o PledgeeRepresentativeRider : "pledgeeRepresentativeRider"
CollateralTransferAgreementElections ||--|o ProcessAgent : "processAgent"
CollateralTransferAgreementElections ||--|o RightsEvents : "rightsEvents"
CollateralTransferAgreementElections ||--|o Substitution : "substitution"
CollateralTransferAgreementElections ||--|| BaseAndEligibleCurrency : "baseAndEligibleCurrency"
CollateralTransferAgreementElections ||--|| CalculationAndTimingCollateralTransferAgreement : "calculationAndTiming"
CollateralTransferAgreementElections ||--|| CreditSupportObligationsCollateralTransferAgreement : "creditSupportObligations"
CollateralTransferAgreementElections ||--|| DisputeResolution : "disputeResolution"
CollateralTransferAgreementElections ||--|| MinimumTransferAmountAmendment : "minimumTransferAmountAmendment"
CollateralTransferAgreementElections ||--|| OneWayProvisions : "oneWayProvisions"
CollateralTransferAgreementElections ||--|| PostingObligations : "postingObligations"
CollateralTransferAgreementElections ||--|| Regime : "regime"
CollateralTransferAgreementElections ||--|| SensitivityMethodologies : "sensitivityMethodologies"
CollateralTransferAgreementElections ||--|| TerminationCurrencyAmendment : "terminationCurrencyAmendment"
CollateralTransferAgreementElections ||--}o SubstitutedRegime : "substitutedRegime"
CollateralTransferTiming ||--|o CollateralTransferTimingDefinition : "collateralTransferTimingDefinition"
CollateralTransferTiming ||--|o TransferSettlementTiming : "transferSettlementTiming"
CollateralTreatment ||--|o CollateralValuationTreatment : "valuationTreatment"
CollateralTreatment ||--}o ConcentrationLimit : "concentrationLimit"
Composite ||--|o BusinessCenterTime : "fixingTime"
Composite ||--|o FxSpotRateSource : "fxSpotRateSource"
Composite ||--|o RelativeDateOffset : "relativeDate"
ConcentrationLimit ||--|o ConcentrationLimitCriteria : "concentrationLimitCriteria"
ConcentrationLimit ||--|o MoneyRange : "valueLimit"
ConcentrationLimit ||--|o NumberRange : "percentageLimit"
ConcentrationLimitCriteria ||--|o AverageTradingVolume : "averageTradingVolume"
ConcentrationLimitCriteria ||--|o CollateralCriteria : "collateralCriteria"
ConditionsPrecedent ||--|o SpecifiedConditionOrAccessCondition : "specifiedConditionOrAccessCondition"
ContactInformation ||--}o Address : "address"
ContactInformation ||--}o TelephoneNumber : "telephone"
ContractDetails ||--}o LegalAgreement : "documentation"
ContractFormationInstruction ||--}o LegalAgreement : "legalAgreement"
ControlAgreement ||--}| ControlAgreementElections : "partyElection"
ControlAgreementNecEvent ||--}| ControlAgreementNecEventElection : "controlAgreementNecEventElection"
CorporateAction ||--|o AdjustmentFactor : "adjustmentFactor"
CorporateAction ||--|o InformationSource : "informationSource"
CorporateAction ||--|o PriceSchedule : "dividendObservation"
CorporateAction ||--|| Underlier : "underlier"
Counterparty ||--|| Party : "partyReference"
CounterpartyPosition ||--|o Collateral : "collateral"
CounterpartyPosition ||--|o ContractDetails : "contractDetails"
CounterpartyPosition ||--|o ExecutionDetails : "executionDetails"
CounterpartyPosition ||--|| TradableProduct : "positionBase"
CounterpartyPosition ||--}o Party : "party"
CounterpartyPosition ||--}o PartyRole : "partyRole"
CounterpartyPosition ||--}o PositionIdentifier : "positionIdentifier"
CounterpartyPosition ||--}o TradeState : "tradeReference"
CounterpartyPositionBusinessEvent ||--|o IdentifiedList : "packageInformation"
CounterpartyPositionBusinessEvent ||--}o CounterpartyPositionState : "after"
CounterpartyPositionState ||--|o State : "state"
CounterpartyPositionState ||--|| CounterpartyPosition : "counterpartyPosition"
CounterpartyPositionState ||--}o ObservationEvent : "observationHistory"
CounterpartyPositionState ||--}o Valuation : "valuationHistory"
CreditEvent ||--|o Price : "finalPrice"
CreditEvent ||--|| ReferenceInformation : "referenceInformation"
CreditEvent ||--}o Resource : "publiclyAvailableInformation"
CreditEventNotice ||--|o PubliclyAvailableInformation : "publiclyAvailableInformation"
CreditEvents ||--|o CreditEventNotice : "creditEventNotice"
CreditEvents ||--|o FailureToPay : "failureToPay"
CreditEvents ||--|o Money : "defaultRequirement"
CreditEvents ||--|o Restructuring : "restructuring"
CreditLimitInformation ||--}| LimitApplicableExtended : "limitApplicable"
CreditLimitUtilisation ||--|o CreditLimitUtilisationPosition : "executed, pending"
CreditSupportObligationsCollateralTransferAgreement ||--|o BespokeTransferTiming : "bespokeTransferTiming"
CreditSupportObligationsCollateralTransferAgreement ||--|o CollateralRounding : "rounding"
CreditSupportObligationsCollateralTransferAgreement ||--|o CollateralTransferTiming : "collateralTransferTiming"
CreditSupportObligationsCollateralTransferAgreement ||--|| CSADeliveryAmount : "deliveryAmount"
CreditSupportObligationsCollateralTransferAgreement ||--|| CSAReturnAmount : "returnAmount"
CreditSupportObligationsCollateralTransferAgreement ||--|| CreditSupportAmount : "creditSupportAmount"
CreditSupportObligationsCollateralTransferAgreement ||--|| MarginApproach : "marginApproach"
CreditSupportObligationsCollateralTransferAgreement ||--|| MinimumTransferAmount : "minimumTransferAmount"
CreditSupportObligationsCollateralTransferAgreement ||--|| Threshold : "threshold"
Custodian ||--}| CustodianElection : "partyElection"
CustodianElection ||--|o Account : "segregatedCashAccount, segregatedSecurityAccount"
CustodianElection ||--|o LegalEntity : "custodian, legacyNamedEntity"
CustodianEvent ||--|o CustodianEventEndDate : "endDate"
CustodianEventEndDate ||--|o CustomisableOffset : "safekeepingPeriodExpiry"
CustodianEventEndDate ||--|| CustomisableOffset : "dateOfTimelyStatement, daysAfterCustodianEvent, releaseDate"
CustodianRisk ||--}| CustodianRiskElection : "partyElection"
CustodyArrangements ||--|o CollateralAccessBreach : "collateralAccessBreach"
CustodyArrangements ||--|o CollateralManagementAgreement : "collateralManagementAgreement"
CustodyArrangements ||--|o ControlAgreement : "controlAgreement"
CustodyArrangements ||--|o Custodian : "custodian"
CustodyArrangements ||--|o CustodianEvent : "custodianEvent"
CustodyArrangements ||--|o CustodianRisk : "custodianRisk"
CustomisableOffset ||--|o Offset : "offset"
DateRelativeToCalculationPeriodDates ||--}| CalculationPeriodDates : "calculationPeriodDatesReference"
DateRelativeToPaymentDates ||--}| PaymentDates : "paymentDatesReference"
DateRelativeToValuationDates ||--}| PerformanceValuationDates : "valuationDatesReference"
DebtEconomics ||--|o DebtRedemption : "redemption"
DebtEconomics ||--|o SecuredDebt : "secured"
DebtType ||--}o DebtEconomics : "debtEconomics"
DeliverableObligations ||--|o LoanParticipation : "directLoanParticipation, indirectLoanParticipation"
DeliverableObligations ||--|o NotDomesticCurrency : "notDomesticCurrency"
DeliverableObligations ||--|o PCDeliverableObligationCharac : "assignableLoan, consentRequiredLoan"
DeliverableObligations ||--|o Period : "maximumMaturity"
DeliverableObligations ||--|o SpecifiedCurrency : "specifiedCurrency"
DemandsAndNotices ||--}| NoticeInformationElection : "partyElection"
DeterminationRolesAndTerms ||--|o Clause : "fallbackLanguageBespokeTerms"
DirectOrRelativeTime ||--|o RelativeTime : "relativeTime"
DirectOrRelativeTime ||--|o TimeZone : "directTime"
DisputeResolution ||--|o BusinessCenterTime : "resolutionTime"
DisputeResolution ||--|o LegacyResolutionAlternative : "legacyAlternative"
DisputeResolution ||--|o RecalculationOfValue : "recalculationOfValue"
DisputeResolution ||--|o ResolutionValue : "value"
DividendPayoutRatio ||--|o BasketConstituent : "basketConstituent"
DividendTerms ||--|o Money : "minimumBillingAmount"
DividendTerms ||--|| DividendPayoutRatio : "manufacturedIncomeRequirement"
EarlyTerminationProvision ||--|o ExercisePeriod : "optionalEarlyTerminationParameters"
EarlyTerminationProvision ||--|o MandatoryEarlyTermination : "mandatoryEarlyTermination"
EarlyTerminationProvision ||--|o OptionalEarlyTermination : "optionalEarlyTermination"
EarlyTerminationProvision ||--|o Period : "mandatoryEarlyTerminationDateTenor"
EconomicTerms ||--|o AdjustableOrRelativeDate : "effectiveDate, terminationDate"
EconomicTerms ||--|o BusinessDayAdjustments : "dateAdjustments"
EconomicTerms ||--|o CalculationAgent : "calculationAgent"
EconomicTerms ||--|o Collateral : "collateral"
EconomicTerms ||--|o DirectOrRelativeTime : "effectiveTime, terminationTime"
EconomicTerms ||--|o TerminationProvision : "terminationProvision"
EconomicTerms ||--}| Payout : "payout"
ElectiveAmountElection ||--|o Money : "amount"
EligibleCollateralCriteria ||--|o CollateralCriteria : "collateralCriteria"
EligibleCollateralCriteria ||--|| CollateralTreatment : "treatment"
EligibleCollateralSpecification ||--}o Counterparty : "counterparty"
EligibleCollateralSpecification ||--}o Identifier : "identifier"
EligibleCollateralSpecification ||--}o Party : "party"
EligibleCollateralSpecification ||--}o PartyRole : "partyRole"
EligibleCollateralSpecification ||--}| EligibleCollateralCriteria : "criteria"
EquityAdditionalTerms ||--|o ExtraordinaryEvents : "extraordinaryEvents"
EquityAdditionalTerms ||--|o UnderlierSubstitutionProvision : "substitutionProvision"
EquityAdditionalTerms ||--}| DeterminationRolesAndTerms : "determinationTerms"
EscrowArrangement ||--|o Clause : "bespokeEscrowArrangements"
EscrowArrangement ||--|o ValuationPostponement : "maximumDaysOfDisruption"
EventCurrency ||--|o Quantity : "eventCurrentAmount"
EventCurrency ||--}o BuyerSeller : "eventCurrencyBuyerSeller"
EventInstruction ||--|o IdentifiedList : "packageInformation"
EventInstruction ||--|o TimeZone : "effectiveTime, eventTime"
EventInstruction ||--}o Instruction : "instruction"
EvergreenProvision ||--|o PartyRole : "singlePartyOption"
EvergreenProvision ||--|o Price : "finalPeriodFeeAdjustment"
EvergreenProvision ||--|o RelativeDateOffset : "noticeDeadlinePeriod"
EvergreenProvision ||--|| AdjustableRelativeOrPeriodicDates : "extensionFrequency"
EvergreenProvision ||--|| RelativeDateOffset : "noticePeriod"
ExecutionDetails ||--|o IdentifiedList : "packageReference"
ExecutionDetails ||--|o LegalEntity : "executionVenue"
ExecutionInstruction ||--|o Collateral : "collateral"
ExecutionInstruction ||--|o Identifier : "lotIdentifier"
ExecutionInstruction ||--|o TimeZone : "tradeTime"
ExecutionInstruction ||--|| ExecutionDetails : "executionDetails"
ExecutionInstruction ||--|| NonTransferableProduct : "product"
ExecutionInstruction ||--}o AncillaryParty : "ancillaryParty"
ExecutionInstruction ||--}o PartyRole : "partyRoles"
ExecutionInstruction ||--}| Counterparty : "counterparty"
ExecutionInstruction ||--}| Party : "parties"
ExecutionInstruction ||--}| PriceQuantity : "priceQuantity"
ExecutionInstruction ||--}| TradeIdentifier : "tradeIdentifier"
ExecutionTerms ||--|| ExecutionLanguage : "executionLanguage"
ExecutionTerms ||--|| ExecutionLocation : "executionLocation"
ExerciseFee ||--|| Money : "notionalReference"
ExerciseFee ||--|| RelativeDateOffset : "feePaymentDate"
ExerciseFeeSchedule ||--|o AmountSchedule : "feeAmountSchedule"
ExerciseFeeSchedule ||--|o Schedule : "feeRateSchedule"
ExerciseFeeSchedule ||--|| Money : "notionalReference"
ExerciseFeeSchedule ||--|| RelativeDateOffset : "feePaymentDate"
ExerciseInstruction ||--|o AdjustableOrAdjustedDate : "exerciseDate"
ExerciseInstruction ||--|o BusinessCenterTime : "exerciseTime"
ExerciseInstruction ||--|o OptionPayout : "exerciseOption"
ExerciseInstruction ||--|| PrimitiveInstruction : "exerciseQuantity"
ExerciseInstruction ||--}o TradeIdentifier : "replacementTradeIdentifier"
ExercisePeriod ||--|o Period : "exerciseFrequency"
ExercisePeriod ||--|| Period : "earliestExerciseDateTenor"
ExerciseProcedure ||--|o AutomaticExercise : "automaticExercise"
ExerciseProcedure ||--|o ManualExercise : "manualExercise"
ExerciseTerms ||--|o AdjustableOrRelativeDate : "commencementDate"
ExerciseTerms ||--|o AdjustableOrRelativeDates : "exerciseDates, relevantUnderlyingDate"
ExerciseTerms ||--|o BusinessCenterTime : "earliestExerciseTime, expirationTime, latestExerciseTime"
ExerciseTerms ||--|o ExerciseFee : "exerciseFee"
ExerciseTerms ||--|o ExerciseFeeSchedule : "exerciseFeeSchedule"
ExerciseTerms ||--|o ExerciseProcedure : "exerciseProcedure"
ExerciseTerms ||--|o MultipleExercise : "multipleExercise"
ExerciseTerms ||--|o PartialExercise : "partialExercise"
ExerciseTerms ||--}o AdjustableOrRelativeDate : "expirationDate"
ExtendibleProvision ||--|o AdjustableRelativeOrPeriodicDates : "extensionPeriod"
ExtendibleProvision ||--|o ExerciseNotice : "exerciseNotice"
ExtendibleProvision ||--|o ExtendibleProvisionAdjustedDates : "extendibleProvisionAdjustedDates"
ExtendibleProvision ||--|o PartyRole : "singlePartyOption"
ExtendibleProvision ||--|o RelativeDateOffset : "extensionTerm, noticeDeadlinePeriod"
ExtendibleProvision ||--|| ExerciseTerms : "exerciseTerms"
ExtendibleProvisionAdjustedDates ||--}| ExtensionEvent : "extensionEvent"
ExtraordinaryEvents ||--|o AdditionalDisruptionEvents : "additionalDisruptionEvents"
ExtraordinaryEvents ||--|o EquityCorporateEvents : "mergerEvents, tenderOfferEvents"
ExtraordinaryEvents ||--|o IndexAdjustmentEvents : "indexAdjustmentEvents"
ExtraordinaryEvents ||--|o Representations : "representations"
ExtraordinaryEvents ||--}o Clause : "additionalBespokeTerms"
FailureToPay ||--|o GracePeriodExtension : "gracePeriodExtension"
FailureToPay ||--|o Money : "paymentRequirement"
FallbackReferencePrice ||--|o CalculationAgent : "calculationAgentDetermination"
FallbackReferencePrice ||--|o ValuationPostponement : "valuationPostponement"
FeaturePayment ||--|o AdjustableOrRelativeDate : "paymentDate"
FeaturePayment ||--|| PartyReferencePayerReceiver : "payerReceiver"
FinalCalculationPeriodDateAdjustment ||--|| AdjustableOrRelativeDates : "relevantUnderlyingDateReference"
FinalCalculationPeriodDateAdjustment ||--|| InterestRatePayout : "swapStreamReference"
FixedRateSpecification ||--|o RateSchedule : "rateSchedule"
FloatingRateDefinition ||--}o RateObservation : "rateObservation"
FloatingRateDefinition ||--}o Strike : "capRate, floorRate"
FrenchLawAddendum ||--}o FrenchLawAddendumElection : "partyElection"
FutureValueAmount ||--|o NonNegativeQuantitySchedule : "quantity"
FxAdditionalTerms ||--|o DeterminationRolesAndTerms : "determinationTerms"
FxAdditionalTerms ||--|o FxDisruptionEvents : "disruptionEvents"
FxBenchmarkObligationDefault ||--|o EscrowArrangement : "escrowArrangement"
FxDisruptionEvents ||--|o Clause : "fallbackLanguageBespokeTerms"
FxDisruptionEvents ||--|o EventCurrency : "eventCurrency"
FxDisruptionEvents ||--|o FxBenchmarkObligationDefault : "benchmarkObligationDefault"
FxDisruptionEvents ||--|o FxDualExchangeRate : "dualExchangeRate"
FxDisruptionEvents ||--|o FxInconvertibilityOrNonTransferability : "inconvertibilityOrNonTransferability"
FxDisruptionEvents ||--|o FxPriceSourceDisruption : "priceSourceDisruption"
FxDisruptionEvents ||--|o GovernmentalAuthorityDefault : "governmentalAuthorityDefault"
FxDisruptionEvents ||--|o Illiquidity : "illiquidity"
FxDisruptionEvents ||--|o MaterialChangeInCircumstance : "materialChangeInCircumstance"
FxDisruptionEvents ||--|o Nationalization : "nationalization"
FxDisruptionEvents ||--|o PriceMateriality : "priceMateriality"
FxDualExchangeRate ||--|o EscrowArrangement : "escrowArrangement"
FxDualExchangeRate ||--|o FallbackReferencePrice : "fallbackReferencePrice"
FxFeature ||--|o Composite : "composite, crossCurrency"
FxFeature ||--|o Quanto : "quanto"
FxFixingDate ||--|o AdjustableOrRelativeDate : "fxFixingDate"
FxFixingDate ||--|o BusinessCenters : "businessCenters, businessCentersReference"
FxFixingDate ||--|o DateRelativeToCalculationPeriodDates : "dateRelativeToCalculationPeriodDates"
FxFixingDate ||--|o DateRelativeToPaymentDates : "dateRelativeToPaymentDates"
FxFixingDate ||--|o DateRelativeToValuationDates : "dateRelativeToValuationDates"
FxInconvertibilityOrNonTransferability ||--|o GeneralInconvertibility : "generalInconvertibility"
FxInconvertibilityOrNonTransferability ||--|o GeneralNonTransferability : "generalNonTransferability"
FxInconvertibilityOrNonTransferability ||--|o SpecificInconvertibility : "specificInconvertibility"
FxInconvertibilityOrNonTransferability ||--|o SpecificNonTransferability : "specificNonTransferability"
FxLinkedNotionalSchedule ||--|o BusinessCenterTime : "fixingTime"
FxLinkedNotionalSchedule ||--|| FxSpotRateSource : "fxSpotRateSource"
FxLinkedNotionalSchedule ||--|| RelativeDateOffset : "varyingNotionalFixingDates, varyingNotionalInterimExchangePaymentDates"
FxPriceSourceDisruption ||--|o EscrowArrangement : "escrowArrangement"
FxPriceSourceDisruption ||--|o SettlementRateOption : "fallbackReferencePrice"
FxRate ||--|| QuotedCurrencyPair : "quotedCurrencyPair"
FxSpotRateSource ||--|o InformationSource : "secondarySource"
FxSpotRateSource ||--|| InformationSource : "primarySource"
GeneralInconvertibility ||--|o EscrowArrangement : "escrowArrangement"
GeneralInconvertibility ||--|o NonDeliverableSubstitute : "nonDeliverableSubstitute"
GeneralInconvertibility ||--|o ValuationPostponement : "maximumDaysOfDisruption"
GeneralNonTransferability ||--|o EscrowArrangement : "escrowArrangement"
GeneralNonTransferability ||--|o NonDeliverableSubstitute : "nonDeliverableSubstitute"
GeneralNonTransferability ||--|o ValuationPostponement : "maximumDaysOfDisruption"
GeneralSimmElections ||--|o SimmVersion : "simmVersion"
GeneralSimmElections ||--|| SimmCalculationCurrency : "simmCalculationCurrency"
GovernmentalAuthorityDefault ||--|o EscrowArrangement : "escrowArrangement"
GovernmentalAuthorityDefault ||--|o ValuationPostponement : "maximumDaysOfDisruption"
GracePeriodExtension ||--|o Offset : "gracePeriod"
IdentifiedList ||--|o Price : "price"
IdentifiedList ||--|| Identifier : "listId"
IdentifiedList ||--}| Identifier : "componentId"
Identifier ||--|o Party : "issuerReference"
Identifier ||--}| AssignedIdentifier : "assignedIdentifier"
Illiquidity ||--|o AdjustedRelativeDateOffset : "illiquidityValuationDate"
Illiquidity ||--|o EscrowArrangement : "escrowArrangement"
Illiquidity ||--|o Quantity : "minimumAmount"
Illiquidity ||--|o SettlementRateOption : "fallbackReferencePrice"
IndependentAmount ||--|o Account : "payerAccountReference, receiverAccountReference"
IndependentAmount ||--|| Party : "payerPartyReference, receiverPartyReference"
IndependentAmount ||--}| PaymentDetail : "paymentDetail"
IndexTransitionInstruction ||--|o Transfer : "cashTransfer"
IndexTransitionInstruction ||--}| PriceQuantity : "priceQuantity"
InitialFixingDate ||--|o RelativeDateOffset : "relativeDateOffset"
Instruction ||--|o PrimitiveInstruction : "primitiveInstruction"
Instruction ||--|o TradeState : "before"
InterestRatePayout ||--|o AdjustableDate : "paymentDate"
InterestRatePayout ||--|o BondReference : "bondReference"
InterestRatePayout ||--|o CalculationPeriodDates : "calculationPeriodDates"
InterestRatePayout ||--|o CashflowRepresentation : "cashflowRepresentation"
InterestRatePayout ||--|o DiscountingMethod : "discountingMethod"
InterestRatePayout ||--|o PaymentDates : "paymentDates"
InterestRatePayout ||--|o PrincipalPayments : "principalPayment"
InterestRatePayout ||--|o RateSpecification : "rateSpecification"
InterestRatePayout ||--|o ResetDates : "resetDates"
InterestRatePayout ||--|o ResolvablePriceQuantity : "priceQuantity"
InterestRatePayout ||--|o SettlementTerms : "settlementTerms"
InterestRatePayout ||--|o StubPeriod : "stubPeriod"
InterestRatePayout ||--|| PayerReceiver : "payerReceiver"
JurisdictionRelatedTerms ||--|o FrenchLawAddendum : "frenchLawAddendum"
JurisdictionRelatedTerms ||--|o JapaneseSecuritiesProvisions : "japaneseSecuritiesProvisions"
Lag ||--|o Offset : "firstObservationDateOffset"
Lag ||--|| Offset : "lagDuration"
LegacyResolutionAlternative ||--|o Money : "amount"
LegalAgreement ||--|o AgreementTerms : "agreementTerms"
LegalAgreement ||--|o UmbrellaAgreement : "umbrellaAgreement"
LegalAgreement ||--|| LegalAgreementIdentification : "legalAgreementIdentification"
LegalAgreement ||--}o Identifier : "identifier"
LegalAgreement ||--}o LegalAgreement : "relatedAgreements"
LegalAgreement ||--}o PartyRole : "otherParty"
LegalAgreement ||--}o Resource : "attachment"
LegalAgreement ||--}| Party : "contractualParty"
LegalAgreementIdentification ||--|| AgreementName : "agreementName"
LegalEntity ||--}o EntityIdentifier : "entityIdentifier"
LimitApplicableExtended ||--|o CreditLimitUtilisation : "utilization"
LimitApplicableExtended ||--|o Velocity : "velocity"
Lineage ||--}o PortfolioState : "portfolioStateReference"
Lineage ||--}o Trade : "tradeReference"
Lineage ||--}o WorkflowStep : "eventReference"
Loan ||--|o LegalEntity : "exchange"
Loan ||--}o LegalEntity : "borrower, relatedExchange"
Loan ||--}o Taxonomy : "taxonomy"
Loan ||--}| AssetIdentifier : "identifier"
LocationIdentifier ||--|o Party : "issuerReference"
LocationIdentifier ||--}| AssignedIdentifier : "assignedIdentifier"
MakeWholeAmount ||--|o Period : "indexTenor"
MandatoryEarlyTermination ||--|o MandatoryEarlyTerminationAdjustedDates : "mandatoryEarlyTerminationAdjustedDates"
MandatoryEarlyTermination ||--|| AdjustableDate : "mandatoryEarlyTerminationDate"
MandatoryEarlyTermination ||--|| CalculationAgent : "calculationAgent"
MandatoryEarlyTermination ||--|| SettlementTerms : "cashSettlement"
ManualExercise ||--|o ExerciseNotice : "exerciseNotice"
MasterAgreementClause ||--}| MasterAgreementClauseVariant : "variant"
MasterAgreementClauseVariant ||--}o MasterAgreementVariableSet : "variableSet"
MasterAgreementSchedule ||--}| MasterAgreementClause : "clause"
MasterAgreementVariableSet ||--}o MasterAgreementVariableSet : "variableSet"
MaterialChangeInCircumstance ||--|o EscrowArrangement : "escrowArrangement"
MaterialChangeInCircumstance ||--|o ValuationPostponement : "maximumDaysOfDisruption"
Measure ||--|o UnitType : "unit"
Merger ||--|| Price : "acquiredSecurityPrice, purchaserSecurityPrice"
Merger ||--|| Security : "acquiredSecurity, purchaserSecurity"
MinimumTransferAmount ||--}| MinimumTransferAmountElection : "partyElection"
MinimumTransferAmountAmendment ||--|o AmendmentEffectiveDate : "effectiveDate"
MinimumTransferAmountAmendment ||--}o ElectiveAmountElection : "partyElections"
MinimumTransferAmountElection ||--|o MinimumTransferAmountRatingsBased : "ratingsBased"
MinimumTransferAmountElection ||--|o ThresholdMinimumTransferAmountFixedAmount : "fixedAmount"
MinimumTransferAmountRatingsBased ||--}o CSAMinimumTransferAmountVariableSet : "variableSet"
Money ||--|o Frequency : "frequency"
Money ||--|o Measure : "multiplier"
Money ||--|o UnitType : "unit"
Money ||--}o DatedValue : "datedValue"
MoneyBound ||--|| Money : "money"
MoneyRange ||--|o MoneyBound : "lowerBound, upperBound"
MultipleExercise ||--|o Money : "notionalReference"
Nationalization ||--|o EscrowArrangement : "escrowArrangement"
Nationalization ||--|o ValuationPostponement : "maximumDaysOfDisruption"
Nationalization ||--}o AncillaryEntity : "relevantAffiliate"
NaturalPerson ||--|o ContactInformation : "contactInformation"
NaturalPerson ||--}o PersonIdentifier : "personId"
NaturalPersonRole ||--|| NaturalPerson : "personReference"
NonDeliverableSubstitute ||--|o AdjustedRelativeDateOffset : "settlementDate, valuationDate"
NonDeliverableSubstitute ||--|o SettlementRateOption : "settlementRateOption"
NonNegativeQuantitySchedule ||--|o Frequency : "frequency"
NonNegativeQuantitySchedule ||--|o Measure : "multiplier"
NonNegativeQuantitySchedule ||--|o UnitType : "unit"
NonNegativeQuantitySchedule ||--}o DatedValue : "datedValue"
NonTransferableProduct ||--|| EconomicTerms : "economicTerms"
NonTransferableProduct ||--}o ProductIdentifier : "identifier"
NonTransferableProduct ||--}o ProductTaxonomy : "taxonomy"
NoticeContactInformation ||--}o Address : "address"
NoticeContactInformation ||--}o NaturalPerson : "naturalPerson"
NoticeContactInformation ||--}o TelephoneNumber : "telephone"
NoticeInformationElection ||--|o ContactInformation : "primaryContactInformation"
NoticeInformationElection ||--}o NoticeContactInformation : "additionalContactInformation"
NotificationTime ||--}| NotificationTimeElection : "partyElections"
NotificationTimeElection ||--|o BusinessCenterTime : "notificationTime"
NumberRange ||--|o NumberBound : "lowerBound, upperBound"
Observation ||--|| ObservationIdentifier : "observationIdentifier"
Observation ||--|| Price : "observedValue"
ObservationDates ||--|o ObservationSchedule : "observationSchedule"
ObservationDates ||--|o ParametricDates : "parametricDates"
ObservationDates ||--|o PeriodicDates : "periodicSchedule"
ObservationEvent ||--|o CorporateAction : "corporateAction"
ObservationEvent ||--|o CreditEvent : "creditEvent"
ObservationIdentifier ||--|o DeterminationMethodology : "determinationMethodology"
ObservationIdentifier ||--|o InformationSource : "informationSource"
ObservationIdentifier ||--|o TimeZone : "observationTime"
ObservationIdentifier ||--|| Observable : "observable"
ObservationInstruction ||--|| ObservationEvent : "observationEvent"
ObservationSchedule ||--|o BusinessDayAdjustments : "dateAdjustments"
ObservationSchedule ||--}o ObservationDate : "observationDate"
ObservationTerms ||--|o BusinessCenterTime : "observationTime"
ObservationTerms ||--|o CalculationPeriodDates : "calculationPeriodDates"
ObservationTerms ||--|o FxSpotRateSource : "informationSource"
ObservationTerms ||--|o Rounding : "precision"
ObservationTerms ||--|| ObservationDates : "observationDates"
OptionFeature ||--|o AveragingFeature : "averagingFeature"
OptionFeature ||--|o Barrier : "barrier"
OptionFeature ||--|o PassThrough : "passThrough"
OptionFeature ||--|o StrategyFeature : "strategyFeature"
OptionFeature ||--}o FxFeature : "fxFeature"
OptionPayout ||--|o AssetDeliveryInformation : "delivery"
OptionPayout ||--|o CalculationSchedule : "schedule"
OptionPayout ||--|o ObservationTerms : "observationTerms"
OptionPayout ||--|o OptionFeature : "feature"
OptionPayout ||--|o OptionStrike : "strike"
OptionPayout ||--|o PrincipalPayments : "principalPayment"
OptionPayout ||--|o ResolvablePriceQuantity : "priceQuantity"
OptionPayout ||--|o SettlementTerms : "settlementTerms"
OptionPayout ||--|| BuyerSeller : "buyerSeller"
OptionPayout ||--|| ExerciseTerms : "exerciseTerms"
OptionPayout ||--|| PayerReceiver : "payerReceiver"
OptionPayout ||--|| Underlier : "underlier"
OptionStrike ||--|o AveragingStrikeFeature : "averagingStrikeFeature"
OptionStrike ||--|o FixedRateSpecification : "strikeReference"
OptionStrike ||--|o Price : "strikePrice"
OptionStrike ||--|o ReferenceSwapCurve : "referenceSwapCurve"
OptionalEarlyTermination ||--|o BuyerSeller : "singlePartyOption"
OptionalEarlyTermination ||--|o CalculationAgent : "calculationAgent"
OptionalEarlyTermination ||--|o OptionalEarlyTerminationAdjustedDates : "optionalEarlyTerminationAdjustedDates"
OptionalEarlyTermination ||--|o SettlementTerms : "cashSettlement"
OptionalEarlyTermination ||--|| ExerciseTerms : "exerciseTerms"
OptionalEarlyTermination ||--}o ExerciseNotice : "exerciseNotice"
OptionalEarlyTerminationAdjustedDates ||--}| EarlyTerminationEvent : "earlyTerminationEvent"
OtherAgreements ||--|o OtherAgreementTerms : "japaneseLawCsa, otherCSA"
ParametricDates ||--|o Lag : "lag"
ParametricDates ||--|| BusinessCenters : "businessCenters"
PartialExercise ||--|o Money : "notionalReference"
Party ||--|o Account : "account"
Party ||--|o ContactInformation : "contactInformation"
Party ||--}o BusinessUnit : "businessUnit"
Party ||--}o NaturalPerson : "person"
Party ||--}o NaturalPersonRole : "personRole"
Party ||--}| PartyIdentifier : "partyId"
PartyChangeInstruction ||--|o AncillaryParty : "ancillaryParty"
PartyChangeInstruction ||--|o PartyRole : "partyRole"
PartyChangeInstruction ||--|| Counterparty : "counterparty"
PartyChangeInstruction ||--}| TradeIdentifier : "tradeId"
PartyCustomisedWorkflow ||--|o Party : "partyReference"
PartyCustomisedWorkflow ||--}| CustomisedWorkflow : "customisedWorkflow"
PartyReferencePayerReceiver ||--|o Account : "payerAccountReference, receiverAccountReference"
PartyReferencePayerReceiver ||--|| Party : "payerPartyReference, receiverPartyReference"
PartyRole ||--|o Party : "ownershipPartyReference"
PartyRole ||--|| Party : "partyReference"
PassThrough ||--}| PassThroughItem : "passThroughItem"
PassThroughItem ||--|| PayerReceiver : "payerReceiver"
PaymentCalculationPeriod ||--|o Money : "fixedPaymentAmount, forecastPaymentAmount, presentValueAmount"
PaymentCalculationPeriod ||--}| CalculationPeriod : "calculationPeriod"
PaymentDateSchedule ||--|o AdjustableOrRelativeDate : "finalPaymentDate"
PaymentDateSchedule ||--}o AdjustableRelativeOrPeriodicDates : "interimPaymentDates"
PaymentDates ||--|o BusinessDayAdjustments : "paymentDatesAdjustments"
PaymentDates ||--|o Frequency : "paymentFrequency"
PaymentDates ||--|o Offset : "paymentDaysOffset"
PaymentDates ||--|o PaymentDateSchedule : "paymentDateSchedule"
PaymentDetail ||--|o AdjustableOrRelativeDate : "paymentDate"
PaymentDetail ||--|o Money : "paymentAmount"
PaymentDetail ||--|| PaymentRule : "paymentRule"
PaymentRule ||--|o PercentageRule : "percentageRule"
PercentageRule ||--|| Money : "notionalAmountReference"
PerformanceValuationDates ||--|o AdjustableOrRelativeDate : "valuationDate"
PerformanceValuationDates ||--|o AdjustableRelativeOrPeriodicDates : "valuationDates"
PerformanceValuationDates ||--|o BusinessCenterTime : "valuationTime"
PeriodicDates ||--|o AdjustableOrRelativeDate : "endDate, startDate"
PeriodicDates ||--|o BusinessDayAdjustments : "periodDatesAdjustments"
PeriodicDates ||--|o CalculationPeriodFrequency : "periodFrequency"
PhysicalSettlementTerms ||--|o DeliverableObligations : "deliverableObligations"
PhysicalSettlementTerms ||--|o PhysicalSettlementPeriod : "physicalSettlementPeriod"
PledgeeRepresentativeRider ||--|o CustomisableOffset : "representativeEndDate"
PortfolioState ||--|| Lineage : "lineage"
PortfolioState ||--}o Position : "positions"
Position ||--|o Asset : "asset"
Position ||--|o Money : "cashBalance"
Position ||--|o Product : "product"
Position ||--|o TradeState : "tradeReference"
Position ||--}| PriceQuantity : "priceQuantity"
PositionIdentifier ||--|o Party : "issuerReference"
PositionIdentifier ||--}| AssignedIdentifier : "assignedIdentifier"
PostingObligations ||--}| PostingObligationsElection : "partyElection"
PostingObligationsElection ||--}o EligibleCollateralCriteria : "eligibleCollateral"
Price ||--|o PriceComposite : "composite"
Price ||--|o UnitType : "perUnitOf, unit"
Price ||--}o DatedValue : "datedValue"
PriceMateriality ||--|o EscrowArrangement : "escrowArrangement"
PriceMateriality ||--|o SettlementRateOption : "fallbackReferencePrice"
PriceQuantity ||--|o AdjustableOrRelativeDate : "effectiveDate"
PriceQuantity ||--|o Observable : "observable"
PriceQuantity ||--}o NonNegativeQuantitySchedule : "quantity"
PriceQuantity ||--}o PriceSchedule : "price"
PriceSchedule ||--|o PriceComposite : "composite"
PriceSchedule ||--|o UnitType : "perUnitOf, unit"
PriceSchedule ||--}o DatedValue : "datedValue"
PriceSourceDisruption ||--|| FallbackReferencePrice : "fallbackReferencePrice"
PrimitiveInstruction ||--|o ContractFormationInstruction : "contractFormation"
PrimitiveInstruction ||--|o ExecutionInstruction : "execution"
PrimitiveInstruction ||--|o ExerciseInstruction : "exercise"
PrimitiveInstruction ||--|o IndexTransitionInstruction : "indexTransition"
PrimitiveInstruction ||--|o ObservationInstruction : "observation"
PrimitiveInstruction ||--|o PartyChangeInstruction : "partyChange"
PrimitiveInstruction ||--|o QuantityChangeInstruction : "quantityChange"
PrimitiveInstruction ||--|o ResetInstruction : "reset"
PrimitiveInstruction ||--|o SplitInstruction : "split"
PrimitiveInstruction ||--|o StockSplitInstruction : "stockSplit"
PrimitiveInstruction ||--|o TermsChangeInstruction : "termsChange"
PrimitiveInstruction ||--|o TransferInstruction : "transfer"
PrimitiveInstruction ||--|o ValuationInstruction : "valuation"
PrincipalPayment ||--|o AdjustableDate : "principalPaymentDate"
PrincipalPayment ||--|o Money : "presentValuePrincipalAmount, principalAmount"
PrincipalPayment ||--|o PayerReceiver : "payerReceiver"
PrincipalPaymentSchedule ||--|o AdjustableRelativeOrPeriodicDates : "intermediatePrincipalPayment"
PrincipalPaymentSchedule ||--|o PrincipalPayment : "finalPrincipalPayment, initialPrincipalPayment"
PrincipalPayments ||--|o PrincipalPaymentSchedule : "principalPaymentSchedule"
ProcessAgent ||--}| ProcessAgentElection : "partyElection"
ProcessAgentElection ||--|o ContactInformation : "primaryContactInformation"
ProcessAgentElection ||--|o LegalEntity : "entity"
ProductTaxonomy ||--|o TaxonomyValue : "value"
Quantity ||--|o Frequency : "frequency"
Quantity ||--|o Measure : "multiplier"
Quantity ||--|o UnitType : "unit"
Quantity ||--}o DatedValue : "datedValue"
QuantityChangeInstruction ||--}o Identifier : "lotIdentifier"
QuantityChangeInstruction ||--}| PriceQuantity : "change"
QuantityMultiplier ||--|o FxLinkedNotionalSchedule : "fxLinkedNotionalSchedule"
Quanto ||--|o BusinessCenterTime : "fixingTime"
Quanto ||--|o FxSpotRateSource : "fxSpotRateSource"
Quanto ||--}o FxRate : "fxRate"
RateObservation ||--|o RateObservation : "rateReference"
RateSchedule ||--|| PriceSchedule : "price"
RecalculationOfValue ||--}| RecalculationOfValueElection : "partyElection"
RecallProvision ||--|o RelativeDateOffset : "intendedSettlementDate"
RecallProvision ||--|o TimeZone : "issuanceCutoffTime, notificationTime"
ReferenceBanks ||--}| ReferenceBank : "referenceBank"
ReferenceInformation ||--|o Price : "referencePrice"
ReferenceInformation ||--|| LegalEntity : "referenceEntity"
ReferenceInformation ||--}o ReferenceObligation : "referenceObligation"
ReferenceObligation ||--|o LegalEntity : "guarantor, primaryObligor, primaryObligorReference"
ReferenceObligation ||--|o Loan : "loan"
ReferenceObligation ||--|o Security : "security"
ReferenceSwapCurve ||--|o MakeWholeAmount : "makeWholeAmount"
ReferenceSwapCurve ||--|| SwapCurveValuation : "swapUnwindValue"
Regime ||--}| ApplicableRegime : "applicableRegime"
RegimeTerms ||--|o RetrospectiveEffect : "retrospectiveEffect"
RegimeTerms ||--|o SimmException : "simmException"
RelativeDateOffset ||--|o BusinessCenters : "businessCenters, businessCentersReference"
RelativeDates ||--|o BusinessCenters : "businessCenters, businessCentersReference"
RelativeDates ||--|o DateRange : "scheduleBounds"
RelativeTime ||--|o TimeRounding : "rounding"
RelativeTime ||--|o TimeZone : "timeRelativeTo"
Representations ||--}o Clause : "additionalBespokeTerms"
Reset ||--|o AveragingCalculation : "averagingMethodology"
Reset ||--|| Price : "resetValue"
Reset ||--}| Observation : "observations"
ResetDates ||--|o AdjustableDate : "finalFixingDate"
ResetDates ||--|o BusinessDayAdjustments : "resetDatesAdjustments"
ResetDates ||--|o CalculationPeriodDates : "calculationPeriodDatesReference"
ResetDates ||--|o InitialFixingDate : "initialFixingDate"
ResetDates ||--|o Offset : "rateCutOffDaysOffset"
ResetDates ||--|o RelativeDateOffset : "fixingDates"
ResetDates ||--|o ResetFrequency : "resetFrequency"
ResetInstruction ||--}| Payout : "payout"
ResolvablePriceQuantity ||--|o FutureValueAmount : "futureValueNotional"
ResolvablePriceQuantity ||--|o NonNegativeQuantitySchedule : "quantitySchedule"
ResolvablePriceQuantity ||--|o Quantity : "resolvedQuantity"
ResolvablePriceQuantity ||--|o QuantityMultiplier : "quantityMultiplier"
ResolvablePriceQuantity ||--|o ResolvablePriceQuantity : "quantityReference"
ResolvablePriceQuantity ||--}o PriceSchedule : "priceSchedule"
Resource ||--|o ResourceLength : "length"
RightsEvents ||--|o AdditionalRightsEvent : "additionalRightsEvent"
RightsEvents ||--|o ControlAgreementNecEvent : "controlAgreementNecEvent"
RightsEvents ||--|| SecuredPartyRightsEvent : "securityTakerRightsEvent"
RightsEvents ||--|| SecurityProviderRightsEvent : "securityProviderRightsEvent"
Schedule ||--}o DatedValue : "datedValue"
SchedulePeriod ||--|o CalculationScheduleDeliveryPeriods : "deliveryPeriod"
SchedulePeriod ||--|| DateRange : "calculationPeriod, fixingPeriod"
SecuredPartyRightsEvent ||--}o SecuredPartyRightsEventElection : "securedPartyRightsEventElection"
Security ||--|o DebtType : "debtType"
Security ||--|o EquityType : "equityType"
Security ||--|o LegalEntity : "exchange"
Security ||--}o LegalEntity : "relatedExchange"
Security ||--}o Taxonomy : "taxonomy"
Security ||--}| AssetIdentifier : "identifier"
SecurityAgreementElections ||--|o Account : "pledgedAccount"
SecurityAgreementElections ||--|o AppropriatedCollateralValuation : "appropriatedCollateralValuation"
SecurityAgreementElections ||--|o EnforcementEvent : "enforcementEvent"
SecurityAgreementElections ||--|o ExecutionTerms : "executionTerms"
SecurityAgreementElections ||--|o JurisdictionRelatedTerms : "jurisdictionRelatedTerms"
SecurityAgreementElections ||--|o ProcessAgent : "processAgent"
SecurityLendingInvoice ||--|| Party : "receivingParty, sendingParty"
SecurityLendingInvoice ||--}| BillingRecord : "billingRecord"
SecurityLendingInvoice ||--}| BillingSummary : "billingSummary"
SecurityLocate ||--|o AssignedIdentifier : "identifer"
SecurityLocate ||--|o MessageInformation : "messageInformation"
SecurityLocate ||--}o AvailableInventoryRecord : "availableInventoryRecord"
SecurityLocate ||--}o Party : "party"
SecurityLocate ||--}o PartyRole : "partyRole"
SecurityProviderRightsEvent ||--}o SecurityProviderRightsEventElection : "partyElection"
SensitivityMethodologies ||--}| SensitivityMethodologiesPartyElection : "partyElection"
SensitivityMethodologiesPartyElection ||--|| SensitivityMethodology : "sensitivityToCommodity"
SensitivityMethodologiesPartyElection ||--|| SensitivityToEquity : "sensitivityToEquity"
SensitivityToEquity ||--|| SensitivityMethodology : "sensitivityToETFs, sensitivityToFunds, sensitivityToIndices"
SettlementDate ||--|o AdjustableDates : "adjustableDates"
SettlementDate ||--|o AdjustableOrAdjustedOrRelativeDate : "adjustableOrRelativeDate"
SettlementDate ||--|o BusinessDateRange : "businessDateRange"
SettlementProvision ||--|o ShapingProvision : "shapingProvisions"
SettlementRateOption ||--|o PriceSourceDisruption : "priceSourceDisruption"
SettlementTerms ||--|o PhysicalSettlementTerms : "physicalSettlementTerms"
SettlementTerms ||--|o SettlementDate : "settlementDate"
SettlementTerms ||--|o SettlementProvision : "settlementProvision"
SettlementTerms ||--}o CashSettlementTerms : "cashSettlementTerms"
ShapingProvision ||--}| Money : "shapeSchedule"
SimmCalculationCurrency ||--}| CalculationCurrencyElection : "partyElection"
SpecificInconvertibility ||--|o EscrowArrangement : "escrowArrangement"
SpecificInconvertibility ||--|o NonDeliverableSubstitute : "nonDeliverableSubstitute"
SpecificInconvertibility ||--|o Quantity : "minimumAmount"
SpecificInconvertibility ||--|o ValuationPostponement : "maximumDaysOfDisruption"
SpecificNonTransferability ||--|o EscrowArrangement : "escrowArrangement"
SpecificNonTransferability ||--|o NonDeliverableSubstitute : "nonDeliverableSubstitute"
SpecificNonTransferability ||--|o ValuationPostponement : "maximumDaysOfDisruption"
SpecifiedConditionOrAccessCondition ||--}o SpecifiedOrAccessConditionPartyElection : "partyElection"
SpinOff ||--|| Price : "childSecurityPrice, parentSecurityPrice"
SpinOff ||--|| Security : "childSecurity, parentSecurity"
SplitInstruction ||--}| PrimitiveInstruction : "breakdown"
SpreadSchedule ||--|| PriceSchedule : "price"
State ||--|o ClosedState : "closedState"
StrategyFeature ||--|o CalendarSpread : "calendarSpread"
StrategyFeature ||--|o StrikeSpread : "strikeSpread"
StrikeSchedule ||--|| PriceSchedule : "price"
StrikeSpread ||--|| OptionStrike : "upperStrike"
StubFloatingRate ||--|o Period : "indexTenor"
StubFloatingRate ||--|o Schedule : "floatingRateMultiplierSchedule"
StubFloatingRate ||--}o SpreadSchedule : "spreadSchedule"
StubFloatingRate ||--}o StrikeSchedule : "capRateSchedule, floorRateSchedule"
StubPeriod ||--|o StubValue : "finalStub, initialStub"
StubPeriod ||--|| CalculationPeriodDates : "calculationPeriodDatesReference"
StubValue ||--|o Money : "stubAmount"
StubValue ||--}o StubFloatingRate : "floatingRate"
SubstitutedRegime ||--}| SubstitutedRegimeTerms : "regimeTerms"
Substitution ||--}o SubstitutionPartyElection : "partyElection"
SubstitutionProvisions ||--|o Period : "noticeDeadlinePeriod"
SwapCurveValuation ||--|o Period : "indexTenor"
Taxonomy ||--|o TaxonomyValue : "value"
TaxonomyValue ||--}o TaxonomyClassification : "classification"
TerminationCurrencyAmendment ||--|o AmendmentEffectiveDate : "effectiveDate"
TerminationCurrencyAmendment ||--}o TerminationCurrencyElection : "partyElection"
TerminationProvision ||--|o CancelableProvision : "cancelableProvision"
TerminationProvision ||--|o EarlyTerminationProvision : "earlyTerminationProvision"
TerminationProvision ||--|o EvergreenProvision : "evergreenProvision"
TerminationProvision ||--|o ExtendibleProvision : "extendibleProvision"
TerminationProvision ||--|o RecallProvision : "recallProvision"
TermsChangeInstruction ||--|o NonTransferableProduct : "product"
TermsChangeInstruction ||--}o AncillaryParty : "ancillaryParty"
Threshold ||--}| ThresholdElection : "partyElection"
ThresholdElection ||--|o ThresholdMinimumTransferAmountFixedAmount : "fixedAmount"
ThresholdElection ||--|o ThresholdRatingsBased : "ratingsBased"
ThresholdMinimumTransferAmountFixedAmount ||--|| Money : "amount"
ThresholdRatingsBased ||--}o CSAThresholdVariableSet : "variableSet"
TradableProduct ||--|| NonTransferableProduct : "product"
TradableProduct ||--}o AncillaryParty : "ancillaryParty"
TradableProduct ||--}| Counterparty : "counterparty"
TradableProduct ||--}| TradeLot : "tradeLot"
Trade ||--|o Collateral : "collateral"
Trade ||--|o ContractDetails : "contractDetails"
Trade ||--|o ExecutionDetails : "executionDetails"
Trade ||--|o TimeZone : "tradeTime"
Trade ||--|| NonTransferableProduct : "product"
Trade ||--}o Account : "account"
Trade ||--}o AncillaryParty : "ancillaryParty"
Trade ||--}o Party : "party"
Trade ||--}o PartyRole : "partyRole"
Trade ||--}| Counterparty : "counterparty"
Trade ||--}| TradeIdentifier : "tradeIdentifier"
Trade ||--}| TradeLot : "tradeLot"
TradeIdentifier ||--|o Party : "issuerReference"
TradeIdentifier ||--}| AssignedIdentifier : "assignedIdentifier"
TradeLot ||--}o Identifier : "lotIdentifier"
TradeLot ||--}| PriceQuantity : "priceQuantity"
TradeState ||--|o State : "state"
TradeState ||--|| Trade : "trade"
TradeState ||--}o ObservationEvent : "observationHistory"
TradeState ||--}o Reset : "resetHistory"
TradeState ||--}o TransferState : "transferHistory"
TradeState ||--}o Valuation : "valuationHistory"
TransactionAdditionalTerms ||--|o EquityAdditionalTerms : "equityAdditionalTerms"
TransactionAdditionalTerms ||--|o FxAdditionalTerms : "foreignExchangeAdditionalTerms"
TransferInformationElection ||--|o ContactInformation : "primaryContactInformation"
TransferInstruction ||--}o TransferState : "transferState"
TransferState ||--|| Transfer : "transfer"
Trigger ||--|o CreditEvents : "creditEvents, creditEventsReference"
Trigger ||--}o PriceSchedule : "level"
TriggerEvent ||--|o DateList : "triggerDates"
TriggerEvent ||--|o FeaturePayment : "featurePayment"
TriggerEvent ||--|| Trigger : "trigger"
TriggerEvent ||--}o AveragingSchedule : "schedule"
UmbrellaAgreement ||--}| UmbrellaAgreementSet : "agreementSet"
UmbrellaAgreementParty ||--|o NonLegalEntity : "nonLegalEntity"
UmbrellaAgreementParty ||--|o Party : "parentParty, party"
UmbrellaAgreementSet ||--|| Agreement : "agreement"
UmbrellaAgreementSet ||--}| UmbrellaAgreementParty : "party"
UnderlierSubstitutionProvision ||--}o Clause : "substitutionBeSpokeTerms"
UnderlierSubstitutionProvision ||--}o ExtraordinaryEvents : "substitutionTriggerEvents"
Valuation ||--|o Price : "priceComponent"
Valuation ||--|| Money : "amount"
ValuationCalculationDateLocation ||--}| ValuationCalculationDateLocationElection : "partyElection"
ValuationDate ||--|o AdjustableDates : "fxFixingSchedule"
ValuationDate ||--|o FxFixingDate : "fxFixingDate"
ValuationDate ||--|o MultipleValuationDates : "multipleValuationDates"
ValuationDate ||--|o RelativeDateOffset : "valuationDate"
ValuationDate ||--|o SingleValuationDate : "singleValuationDate"
ValuationInstruction ||--}| Valuation : "valuation"
ValuationMethod ||--|o CashCollateralValuationMethod : "cashCollateralValuationMethod"
ValuationMethod ||--|o Money : "minimumQuotationAmount, quotationAmount"
ValuationMethod ||--|| ValuationSource : "valuationSource"
ValuationSource ||--|o AncillaryEntity : "dealerOrCCP"
ValuationSource ||--|o FxSpotRateSource : "informationSource"
ValuationSource ||--|o QuotedCurrencyPair : "quotedCurrencyPair"
ValuationSource ||--|o ReferenceBanks : "referenceBanks"
ValuationSource ||--|o SettlementRateOption : "settlementRateOption"
WorkflowState ||--}o PartyCustomisedWorkflow : "partyCustomisedWorkflow"
WorkflowStep ||--|o BusinessEvent : "businessEvent"
WorkflowStep ||--|o CounterpartyPositionBusinessEvent : "counterpartyPositionBusinessEvent"
WorkflowStep ||--|o CreditLimitInformation : "creditLimitInformation"
WorkflowStep ||--|o EventInstruction : "nextEvent, proposedEvent"
WorkflowStep ||--|o Lineage : "lineage"
WorkflowStep ||--|o MessageInformation : "messageInformation"
WorkflowStep ||--|o WorkflowState : "workflowState"
WorkflowStep ||--|o WorkflowStep : "previousWorkflowStep"
WorkflowStep ||--}o Account : "account"
WorkflowStep ||--}o Party : "party"
WorkflowStep ||--}o WorkflowStepApproval : "approval"
WorkflowStep ||--}| EventTimestamp : "timestamp"
WorkflowStep ||--}| Identifier : "eventIdentifier"
WorkflowStepApproval ||--|| EventTimestamp : "timestamp"
WorkflowStepApproval ||--|| Party : "party"

