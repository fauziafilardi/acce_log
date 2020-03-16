<template>
    <div class="height--full">
        <HeaderFormListVuex2 :isProcess = "true" />

        <div class="content-app-form__body form-process">
            <div class="tab-form-process">
                <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">               
                    <b-collapse id="collapse1" :visible="true">
                        <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">
                            <b-col md="12" id="col-left" class="bColMasterForm">	
                                <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                                    <b-row style="padding-left:10px;">
                                        <b-col md="12" id="col-left">
                                            <b-row>
                                                <b-col md=4>
                                                    <ABSinputDateVuex :prop="PI_BillingDate" v-model="BillingDate"/>
                                                </b-col>
                                            </b-row>
                                            <!-- <b-row>
                                                <b-col md=4>
                                                    <ABSInputSelectList
                                                        @change="OnTrxTypeGroupChange"
                                                        :prop="PI_TrxTypeGroup"
                                                        :value="TrxTypeGroup"
                                                        :label="TrxTypeGroupLabel"
                                                    />
                                                </b-col>
                                            </b-row> -->
                                        </b-col>
                                    </b-row>
                                </b-form>
                            </b-col>
                        </b-row>
                    </b-collapse>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

export default {
    data() {
        return {
            propList: {
                initialWhere: "",
                LineNo: 0,
                PageLevel: 1,
                TabIndex: 1
            },
		    FormType: "Form",
       
            IEBy: {Input: '', Edit: ''},

            PI_BillingDate: {
                cValidate :'required', 
                cName: "BillingDate",
                cNameError: "Date",
                cLabel: "Date",
                cOrder: 1,
                cPageLevel: 1,
                cTabIndex: 1,
                cParentForm: "FormScope_1_1"
            },
            // PI_TrxTypeGroup: {
            //     dataLookUp: { 
            //         LookUpCd: 'GetLookupCMTransactionTypeGroup'    , 
            //         ColumnDB: 'TrxTypeGroupCd'   , 
            //         InitialWhere: "ModuleCd is null or ModuleCd = 'AR'"   , 
            //         ParamWhere: ''  
            //             }, 
            //     cValidate :'required', 
            //     cName: 'TrxTypeGroup', 
            //     cLabel: 'Trans. Type Group', 
            //     cKey: false, 
            //     cLabelSize: 4, 
            //     cOrder: 2, 
            //     cTriggered: false, 
            //     cDefault: '', 
            //     cProtect: false, 
            //     cVisible:  true, 
            //     cAsync:  false, 
            //     cFilter: true, 
            //     cPageLevel: 1, 
            //     cTabIndex: 1, 
            //     cParentForm: 'FormScope_' + 1 + '_' + 1, 
            //     cStatic: false, 
            //     cOption: [], 
            //     cMasterUrl: '' ,
            //     cDisplayColumn: 'TrxTypeGroupCd,Descs' ,
            // },
            // BillingMonthTolerance: '',
            // ToleranceDate: 0,
            BillingDate: '',
            // TrxTypeGroup: '',
            // TrxTypeGroupLabel: ''
        }
    },
	computed : {
        inputStatus() {
            if(this.$store.getters.getLevel == this.PageLevel && this.$store.getters.getTab == this.TabIndex){
                return this.$store.getters.getStatus.toUpperCase()
            }
            else {
                return 'VIEW'
            }
        },
        PageLevel () {
            return 1
        },
        TabIndex () {
            return 1
        },
  },
    methods: {
    //     OnTrxTypeGroupChange (data) {
    //        this.TrxTypeGroup = data.id  
    //        this.TrxTypeGroupLabel = data.label
    //    },
       setToolbarButton () {
        //    this.getToolbar().statusFunction[4].disabled = false
		},
        toToolbar() {
            return this.$children[0].$children[0]
        },
        toList() {
            return this.$children[1]
        },
        Loader() {
            return this.$children[3]
        },
        rowClicked (record, index) {},
        doDoubleClick () {},
        rowLink (url) {},
        M_PageSize () {},
        M_Pagination () {},
        M_Advance_Filter () {},
        M_Head_Table () {},
        M_Search(data){
       },
        M_Post() {
            // var dataPost = []
            
            // var billingdt = this.BillingDate == '' || this.BillingDate == null ? 'NULL' : this.BillingDate
            // // var trxtypegroup = this.TrxTypeGroup
            
            // dataPost.push({
            //     SubPortfolioCd: this.getDataUser().subportfolio_cd,
            //     BillingDate: billingdt,
            //     // TrxTypeGroupCd: trxtypegroup,
            //     UserInput: this.getDataUser().user_id,
            //     _Message_: "Data Saved Successfully"
            // })

            // var param = {
            //     OptionSeq: this.getOptionSeq().OptionSeq,
            //     LineNo: 0,
            //     Data: dataPost
            // }

            // this.postJSONMulti(this.getUrlPostMulti(), param).then(response => {
            //     if (response == null) return

            //     this.BillingDate = ''
            //     this.TrxTypeGroup = ''
            //     this.TrxTypeGroupLabel = ''
            //     this.$store.commit('setStatus', 'view')
            //     this.$store.commit('setStatus', 'new')
            //     this.$store.commit('setEventStatus', 'POST')
            // })
        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                Date: this.BillingDate == '' || this.BillingDate == null ? 'NULL' : this.BillingDate,
                UserInput: this.getDataUser().user_id
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

                this.alertSuccess("Generate Card Master Sucessfully")
                .then(() => {
                    this.M_ClearForm()
                    this.$store.commit('setStatus', 'view')
                    this.$store.commit('setStatus', 'edit')
                    this.getToolbar().doEdit(true)

                    this.FormToMasterPage().ValidasiPage()
                })
            })
        },
        M_ClearForm(){
            this.BillingDate = ''
        }
        // setToolbarButton() {}
    },
    beforeCreate: function () {
    },
    created: function() {
    },
    beforeMount: function() {
    },
    mounted: function() {
        // this.$store.commit('setFormType','Form')
        // this.$store.commit('setStatus', 'new')
        // this.$store.commit('setListDisable', true)
        // this.$store.commit('setLevel', 1)
        // this.$store.commit('setTab', 1)
        // this.toToolbar().ProcessPS()
        // this.hideSideBarMenu()
        this.getToolbar().doEdit(true)
        this.hideSideBarMenu()
    },
    beforeUpdate: function() {  
    },
    updated: function() {
    },
    beforeDestroy: function() {
    },
    destroyed: function() {
    }
}
</script>

