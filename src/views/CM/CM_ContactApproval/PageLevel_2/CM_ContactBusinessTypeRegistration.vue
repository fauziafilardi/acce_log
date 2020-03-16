<template>
    <div>        
    <ABSListVuex
      :prop = "propList"
      :title = "data.query_name"
      @rowClicked = "$parent.rowClicked"
      @rowDblClicked = "$parent.doDoubleClick"
      @rowLinkClick = "$parent.rowLink"
      @pageSize = "$parent.M_PageSize"
      @pagination = "$parent.M_Pagination"
      @filter = "$parent.M_Advance_Filter"
      @headTable = "$parent.M_Head_Table"
      @refreshColumn = "$parent.refreshColumn"
    />


        <div v-show="$parent.showForm"  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div>
            <b-collapse id="collapse1" :visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">     
					<b-col md="12" id="col-left" class="bColMasterForm">	
						<b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <b-row style="padding-left:10px;">					
                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnbusinesstypecdChange" :prop="PI_businesstypecd" :value="M_CM_ContactBusinessTypeRegistration.businesstypecd" :label="M_CM_ContactBusinessTypeRegistration.businesstypecdLabel" ref="ref_businesstypecd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OncorebusinessChange" :prop="PI_corebusiness" v-model="M_CM_ContactBusinessTypeRegistration.corebusiness"  ref="ref_corebusiness" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_businessname" v-model="M_CM_ContactBusinessTypeRegistration.businessname"  ref="ref_businessname"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CM_ContactBusinessTypeRegistration.remarks"  ref="ref_remarks" />
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                  
							</b-row>
						</b-form>
					</b-col>
                </b-row>
            </b-collapse>
        </div>
    </div>
</template>

<script>

export default {
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "List",
			Module:"CM",
            propList: {
                initialWhere:"sequence_registration_no = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_ContactBusinessTypeRegistration :{
                sequenceregistrationno: 0,
                businesstypecd: '',
                businessname: '',
                corebusiness: 'Y',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                businesstypedescs: '',
                debtorcd: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_businesstypecd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMBusinessType'    , 
                    ColumnDB: 'business_type_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'businesstypecd', 
                cLabel: 'Business Type', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 101, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: 'CM/CM_BusinessType' ,
                cDisplayColumn: 'business_type_cd,descs' ,
            }, 
            PI_corebusiness: { 
                cValidate :'', 
                cName: 'corebusiness', 
                cId: 'rdbcorebusiness', 
                cRadioOptions: [{ text: 'Yes', value: 'Y' }, { text: 'No', value: 'N' }], 
                cRadioDefaultOption: 'Y', 
                cLabel:'Core Business', 
                cLabelSize: 4, 
                cOrder: 103, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_businessname: { 
                cValidate :'required|max:50', 
                cName: 'businessname', 
                cLabel: 'Business Name', 
                cLabelSize: 4, 
                cOrder: 104, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder: 105, 
                cKey: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible: true, 
                cResize: false, 
                cReadOnly: false, 
                cRows: 3, 
                cMaxRows: 3, 
                cSize: 'md', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
            },       
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
	DataRow(){
		return this.$store.getters.GetPage2Data
	},
    DataRowPage1(){
		return this.$store.getters.GetPage1Data
	}
  },
    methods: {
        OnbusinesstypecdChange (data) {
        this.$nextTick(() => {
            this.M_CM_ContactBusinessTypeRegistration.businesstypecd = data.id
            this.M_CM_ContactBusinessTypeRegistration.businesstypecdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{businesstypecd}
            }
        })
        this.$forceUpdate()
        },
        OncorebusinessChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{corebusiness}
            }
        })
        this.$forceUpdate()
        },
        OnremarksChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{remarks}
            }
        })
        this.$forceUpdate()
        },
		
		setToolbarButton () {
           this.getToolbar().statusFunction[0].disabled = true
		},
        M_Head_Table () {
        },
        M_PageSize(){
        },
        M_TabClick(){
        },
        M_Pagination(){
        },
        M_Advance_Filter(){
        },
		M_Search(data){
        },
        M_Refresh(){
        },
		M_Cancel() {			
		},		
		doDoubleClick(){
        },
		rowClicked (record, index) {
        },
        rowLink: function(url){
            this.$refs.modalTest.show()
        },
		paramFromParent(){
            this.$parent.showForm = false
			
            let data = this.$store.getters.GetPage1Data
            this.M_CM_ContactBusinessTypeRegistration.sequenceregistrationno = data.sequence_registration_no 
            this.propList.initialWhere =" sequence_registration_no = '" + data.sequence_registration_no + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
        if (this.M_CM_ContactBusinessTypeRegistration.corebusiness == "Y")
             { this.FnValidateCoreBusiness().then(dt28 =>
         { if (dt28 != null) { } 
         })  }
        else {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                sequence_registration_no: this.M_CM_ContactBusinessTypeRegistration.sequenceregistrationno,
                business_type: this.M_CM_ContactBusinessTypeRegistration.businesstypecd == '' || this.M_CM_ContactBusinessTypeRegistration.businesstypecd == null ? 'NULL' : this.M_CM_ContactBusinessTypeRegistration.businesstypecd ,
                business_name: this.M_CM_ContactBusinessTypeRegistration.businessname,
                core_business: this.M_CM_ContactBusinessTypeRegistration.corebusiness,
                remarks: this.M_CM_ContactBusinessTypeRegistration.remarks,
                user_input: this.getDataUser().user_id ,
                debtor_cd: this.M_CM_ContactBusinessTypeRegistration.debtorcd                
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultInsert(response.Message)
					
				
            })
      }

        },
        M_Update() {
        if (this.M_CM_ContactBusinessTypeRegistration.corebusiness == "Y")
             { this.FnValidateCoreBusiness().then(dt28 =>
         { if (dt28 != null) { } 
            })  }
        else {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                sequence_registration_no: this.M_CM_ContactBusinessTypeRegistration.sequenceregistrationno,
                business_type: this.M_CM_ContactBusinessTypeRegistration.businesstypecd == '' || this.M_CM_ContactBusinessTypeRegistration.businesstypecd == null ? 'NULL' : this.M_CM_ContactBusinessTypeRegistration.businesstypecd ,
                business_name: this.M_CM_ContactBusinessTypeRegistration.businessname,
                core_business: this.M_CM_ContactBusinessTypeRegistration.corebusiness,
                remarks: this.M_CM_ContactBusinessTypeRegistration.remarks,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_ContactBusinessTypeRegistration.lastupdatestamp,
                debtor_cd: this.M_CM_ContactBusinessTypeRegistration.debtorcd                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
      }

        },
		M_ClearForm(){
            this.M_CM_ContactBusinessTypeRegistration = {
                sequenceregistrationno: 0,
                businesstypecd: '',
                businessname: '',
                corebusiness: 'Y',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                businesstypedescs: '',
                debtorcd: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_CM_ContactBusinessTypeRegistration.sequenceregistrationno = data.sequence_registration_no 

            this.$refs.ref_businesstypecd.focus()

        },
        M_Edit(){
            this.$refs.ref_corebusiness.focus()
        },
        M_Delete(dt){           

            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

            
            data.forEach((value) => {
            dataDelete.push({
            sequence_registration_no: value.sequence_registration_no,
            business_type: value.business_type,
            lastupdatestamp: value.lastupdatestamp,
            _Message_: "",
            debtor_cd: ''
                    })
            })
            
            var param = {
                    OptionSeq: this.getOptionSeq().OptionSeq,
                    LineNo: this.$parent.data.page_order,
                    Data: dataDelete
                }
                
                this.postJSONMulti( this.getUrlDeleteMulti(), param )
                .then(response => {
                    if (response == null) return

                    this.$parent.resultDelete()
                }) 
        },        
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                sequence_registration_no: record.sequence_registration_no,
                business_type_cd: record.business_type_cd,
                debtor_cd: record.debtor_cd				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_CM_ContactBusinessTypeRegistration = {
                sequenceregistrationno: data.sequence_registration_no,
                businesstypecd: data.business_type_cd,
                businessname: data.business_name,
                corebusiness: data.core_business,
                remarks: data.remarks,
                userinput: data.user_input,
                useredit: data.user_edit,
                businesstypedescs: data.business_type_descs,
                debtorcd: data.debtor_cd,
                lastupdatestamp: record.lastupdatestamp,
                rowid: data.row_id
                    }
                 

                this.M_CM_ContactBusinessTypeRegistration.businesstypecdLabel = this.M_CM_ContactBusinessTypeRegistration.businesstypecd != null ? data.business_type_cd + this.separator + data.business_type_descs :'' 
  

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        }
		
    },
    created: function() {
    },
    beforeMount: function() {
    },
    mounted: function() {
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

