// import './plugins/axios'
import axios from 'axios'

export default {
    data() {
        return {
            queryString: require('querystring'),

            // content type
            urlEncoded: 'application/x-www-form-urlencoded',
            json: 'application/json',
            formData: 'multipart/form-data',

            segmentFn_DynamicFunction: 'DynamicFunction/GetData',

            // Url Function
            segmentFn_GetCurrencyRate: 'Function/GetCurrencyRate',
            segmentFn_GetTaxCurrencyRate: 'Function/GetTaxCurrencyRate',
            segmentFn_GetCurrencyMiddleRate: 'Function/GetCurrencyMiddleRate',
            segmentFn_GenerateRunningCd: 'Function/GenerateRunningCode',
            segmentFn_ValidateTrxType: 'Function/ValidateTrxType',
            segmentFn_GetCreditTermsData: 'Function/GetCreditTermsData',
            segmentFn_StampDutyValidation: 'Function/StampDutyValidation',
            segmentFn_CurrencyTaxRateValidation: 'Function/CurrencyTaxRateValidation',
            segmentFn_CurrencyRateValidation: 'Function/CurrencyRateValidation',
            segmentFn_CurrencyPageRateValidation: 'Function/CurrencyPageRateValidation',
            segmentFn_CurrencyMrRateValidation: 'Function/CurrencyMrRateValidation',
            segmentFn_CurrencyMasterTaxRateValidation: 'Function/CurrencyMasterTaxRateValidation',
            segmentFn_CurrencyMasterRateValidation: 'Function/CurrencyMasterRateValidation',
            segmentFn_CurrencyMasterPegRateValidation: 'Function/CurrencyMasterPegRateValidation',
            segmentFn_CurrencyMasterMrRateValidation: 'Function/CurrencyMasterMrRateValidation',
            segmentFn_GetContactGreeting: 'Function/GetContactGreeting',
            segmentFn_GetContactGreetingAll: 'Function/GetContactGreetingAll',
            segmentFn_ValidateCoreBusiness: 'Function/ValidateCoreBusiness',
            segmentFn_GetPaymentType: 'Function/GetPaymentType',
            segmentFn_GetTransactionAnalysisH: 'Function/GetTransactionAnalysisH',
            segmentFn_GetTrxTypeData: 'Function/GetTrxTypeData',
            segmentFn_GetTrxTypeMasterData: 'Function/GetTrxTypeMasterData',
            segmentFn_GetDiscountAmount: 'Function/GetDiscountAmount',
            segmentFn_IsValidTrxType: 'Function/IsValidTrxType',
            segmentFn_IsValidTrxTypeMaster: 'Function/IsValidTrxTypeMaster',
            segmentFn_GetDBConnection: 'Function/GetDBConnection',
            segmentFn_GetBatchInformationByUserLevelEntryType: 'Function/GetBatchInformationByUserLevelEntryType',
            segmentFn_GetGLSpecificationData: 'Function/GetGLSpecificationData',
            segmentFn_GetBaseCurrencyCd: 'Function/GetBaseCurrencyCd',
            segmentFn_GetTaxValidationErrorMessage: 'Function/GetTaxValidationErrorMessage',
            segmentFn_GetDebtorData: 'Function/GetDebtorData',
            segmentFn_GetARDiscountAmount: 'Function/GetARDiscountAmount',
            segmentFn_GetDefaultReceiptBank: 'Function/GetDefaultReceiptBank',
            segmentFn_GetRunningCdFromCMSpecification: 'Function/GetRunningCdFromCMSpecification',
            segmentFN_GetDataSpecification: 'DynamicAPI/GetDataSpec'
        }
    },
    mounted() {
    },
    methods: {
        FnDynamicSpec(param) {
           

            return axios
                .post(
                    this.url + this.segmentFN_GetDataSpecification,
                    param, {
                        headers: {
                            'Content-Type': this.json,
                            Accept: this.json,
                            Token: this.getSession().Session_Id
                        }
                    }
                )
                .then(response => {
                    let responses = response.data

                    let error = responses.Error
                    let message = responses.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return responses
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },
        FnDynamicFunction(param) {
            // return this.GetFunctionEncode(  
            // // return this.GetFunctionJSON( 
            //     this.url + this.segmentFn_DynamicFunction,
            //     param
            // ).then(responses => {
                
            //     let response = responses.data
            //     console.log(response)
            //     let error = response.Error
            //     let message = response.Message

            //     if (error) {
            //         this.alertError(message)
            //         return null
            //     }
            //     return response.Data // .What?
            // })
            // .catch(err => {
            //     this.checkResponseCode(err)
            //     return null
            // })

            return axios
                .post(
                    this.url + this.segmentFn_DynamicFunction,
                    param, {
                        headers: {
                            'Content-Type': this.json,
                            Accept: this.json,
                            Token: this.getSession().Session_Id
                        }
                    }
                )
                .then(response => {
                    let responses = response.data

                    let error = responses.Error
                    let message = responses.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return responses
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGetBatchInformationByUserLevelEntryType (BatchNo, SubPortfolioCd, UserInput, EntryType) {
            var param = {
                BatchNo: BatchNo,
                SubPortfolioCd: SubPortfolioCd,
                UserInput: UserInput,
                EntryType: EntryType
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_GetBatchInformationByUserLevelEntryType,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGetGLSpecificationData () {
            return this.GetFunctionEncode(
                this.url + this.segmentFn_GetGLSpecificationData
                )
                .then(responses => {
                    let response = responses.data[0]

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGetBaseCurrencyCd () {
            return this.GetFunctionEncode(
                this.url + this.segmentFn_GetBaseCurrencyCd
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },


        FnGetTaxValidationErrorMessage (SubPortfolioCd, DebitNo, TaxCd, InsertFlag) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                DebitNo: DebitNo,
                TaxCd: TaxCd,
                InsertFlag: InsertFlag
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_GetTaxValidationErrorMessage,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },


        FnGetDebtorData (SubPortfolioCd, DebtorCd) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                DebtorCd: DebtorCd
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_GetDebtorData,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },


        FnGetARDiscountAmount (TrxAmt, DiscountCd) {
            var param = {
                TrxAmt: TrxAmt,
                DiscountCd: DiscountCd
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_GetARDiscountAmount,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },


        FnGetDefaultReceiptBank (SubPortfolioCd) {
            var param = {
                SubPortfolioCd: SubPortfolioCd
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_GetDefaultReceiptBank,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGetCurrencyRate(SubPortfolioCd, DebitDate, CurrencyCd) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                DebitDate: DebitDate,
                CurrencyCd: CurrencyCd
            }

            return this.GetFunctionEncode(this.url + this.segmentFn_GetCurrencyRate, param)
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }

                    return response.Data
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGenerateRunningCode(SubPortfolioCd, RunningCd, UserId, DebitDate) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                RunningCd: RunningCd,
                UserInput: UserId,
                Date: DebitDate
            }

            return this.GetFunctionEncode(this.url + this.segmentFn_GenerateRunningCd, param)
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGetTaxCurrencyRate(SubPortfolioCd, TransactionDate, CurrencyCd) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                TransactionDate: TransactionDate,
                CurrencyCd: CurrencyCd
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_GetTaxCurrencyRate,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGetCurrencyMiddleRate(SubPortfolioCd, TransactionDate, CurrencyCd) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                TransactionDate: TransactionDate,
                CurrencyCd: CurrencyCd
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_GetCurrencyMiddleRate,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnValidateTrxType(SubPortfolioCd, ModuleCd, TrxType, TrxClass, JournalType) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                ModuleCd: ModuleCd,
                TrxType: TrxType,
                TrxClass: TrxClass,
                JournalType: JournalType
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_ValidateTrxType,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGetCreditTermsData(CreditTermsCd) {
            var param = {
                CreditTermsCd: CreditTermsCd
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_GetCreditTermsData,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnStampDutyValidation(SequenceNo, FromAmt, ToAmt, InsertFlag) {
            var param = {
                SequenceNo: SequenceNo,
                FromAmt: FromAmt,
                ToAmt: ToAmt,
                InsertFlag: InsertFlag
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_StampDutyValidation,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnCurrencyTaxRateValidation(SubPortfolioCd, CurrencyCd, StartDate, EndDate) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                CurrencyCd: CurrencyCd,
                StartDate: StartDate,
                EndDate: EndDate
            }
            
            return this.GetFunctionEncode(
                this.url + this.segmentFn_CurrencyTaxRateValidation,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnCurrencyRateValidation(SubPortfolioCd, CurrencyCd, StartDate, EndDate) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                CurrencyCd: CurrencyCd,
                StartDate: StartDate,
                EndDate: EndDate
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_CurrencyRateValidation,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnCurrencyPageRateValidation(SubPortfolioCd, CurrencyCd, StartDate, EndDate) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                CurrencyCd: CurrencyCd,
                StartDate: StartDate,
                EndDate: EndDate
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_CurrencyPageRateValidation,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnCurrencyMrRateValidation(SubPortfolioCd, CurrencyCd, StartDate, EndDate) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                CurrencyCd: CurrencyCd,
                StartDate: StartDate,
                EndDate: EndDate
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_CurrencyMrRateValidation,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnCurrencyMasterTaxRateValidation(SubPortfolioCd, CurrencyCd, StartDate, EndDate) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                CurrencyCd: CurrencyCd,
                StartDate: StartDate,
                EndDate: EndDate
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_CurrencyMasterTaxRateValidation,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnCurrencyMasterRateValidation(SubPortfolioCd, CurrencyCd, StartDate, EndDate) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                CurrencyCd: CurrencyCd,
                StartDate: StartDate,
                EndDate: EndDate
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_CurrencyMasterRateValidation,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnCurrencyMasterPegRateValidation(SubPortfolioCd, CurrencyCd, StartDate, EndDate) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                CurrencyCd: CurrencyCd,
                StartDate: StartDate,
                EndDate: EndDate
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_CurrencyMasterPegRateValidation,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnCurrencyMasterMrRateValidation(SubPortfolioCd, CurrencyCd, StartDate, EndDate) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                CurrencyCd: CurrencyCd,
                StartDate: StartDate,
                EndDate: EndDate
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_CurrencyMasterMrRateValidation,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGetContactGreeting(ContactID, ContactPersonnelID) {
            var param = {
                ContactID: ContactID,
                ContactPersonnelID: ContactPersonnelID
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_GetContactGreeting,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGetContactGreetingAll() {
            return this.GetFunctionEncode(this.url + this.segmentFn_GetContactGreetingAll)
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnValidateCoreBusiness(ContactID, BusinessTypeCd) {
            var param = {
                ContactID: ContactID,
                BusinessTypeCd: BusinessTypeCd
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_ValidateCoreBusiness,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },
        // Mulai
        FnGetPaymentType(PaymentCd) {
            var param = {
                PaymentCd: PaymentCd
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_GetPaymentType,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGetTransactionAnalysisH() {
            return this.GetFunctionEncode(this.url + this.segmentFn_GetTransactionAnalysisH)
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGetTrxTypeData(SubPortfolioCd, ModuleCd, TrxType) {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                ModuleCd: ModuleCd,
                TrxType: TrxType
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_GetTrxTypeData,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGetTrxTypeMasterData(ModuleCd, TrxType) {
            var param = {
                ModuleCd: ModuleCd,
                TrxType: TrxType
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_GetTrxTypeMasterData,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGetDiscountAmount(TrxAmt, DiscountCd) {
            var param = {
                TrxAmt: TrxAmt,
                DiscountCd: DiscountCd
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_GetDiscountAmount,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnIsValidTrxType(SubPortfolioCd , TrxType , ModuleCd , TrxClass , ParamWhere = "") {
            var param = {
                SubPortfolioCd: SubPortfolioCd,
                TrxType: TrxType,
                ModuleCd: ModuleCd,
                TrxClass: TrxClass,
                ParamWhere: ParamWhere
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_IsValidTrxType,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnIsValidTrxTypeMaster(TrxType , ModuleCd , TrxClass , ParamWhere = "") {
            var param = {
                TrxType: TrxType,
                ModuleCd: ModuleCd,
                TrxClass: TrxClass,
                ParamWhere: ParamWhere
            }

            return this.GetFunctionEncode(
                this.url + this.segmentFn_IsValidTrxTypeMaster,
                param
                )
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGetDBConnection() {
            return this.GetFunctionEncode(this.url + this.segmentFn_GetDBConnection)
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data // .What?
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        FnGetRunningCdFromCMSpecification() {
            return this.GetFunctionEncode(this.url + this.segmentFn_GetRunningCdFromCMSpecification)
                .then(responses => {
                    let response = responses.data

                    let error = response.Error
                    let message = response.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return response.Data
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        },

        // checkResponseCode(message) {
        //     if (String(message) === 'Error: Request failed with status code 401') {
        //         this.doClearLocalStorage()
        //         this.$router.replace({
        //           path: '/sign-in'
        //         })
        //     }

        //     if (String(message) === 'Error: Request failed with status code 404') {}
        // },

        GetFunctionEncode(fullUrl, param) {
            return axios
                .post(
                    fullUrl,
                    this.queryString.stringify(param), {
                        headers: {
                            // 'Content-Type': this.urlEncoded,
                            'Content-Type': this.json,
                            Accept: this.json,
                            Token: this.getSession().Session_Id
                        }
                    }
                )
        },

        GetFunctionJSON(fullUrl, param) {
            return axios
                .post(
                    fullUrl,
                    param, {
                        headers: {
                            'Content-Type': this.json,
                            Accept: this.json,
                            Token: this.getSession().Session_Id
                        }
                    }
                )
                .then(response => {
                    let responses = response.data

                    let error = responses.Error
                    let message = responses.Message

                    if (error) {
                        this.alertError(message)
                        return null
                    }
                    return responses
                })
                .catch(err => {
                    this.checkResponseCode(err)
                    return null
                })
        }
    }
}