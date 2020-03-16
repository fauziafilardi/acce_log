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
                                        <ABSinputTextVuex :prop="PI_runningcd" v-model="M_CM_RunningCd.runningcd"  ref="ref_runningcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CM_RunningCd.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnbasedonChange" :prop="PI_basedon" v-model="M_CM_RunningCd.basedon"  ref="ref_basedon" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnresetonChange" :prop="PI_reseton" v-model="M_CM_RunningCd.reseton"  ref="ref_reseton" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnNumberDigit" :prop="PI_numberdigit" v-model="M_CM_RunningCd.numberdigit"  ref="ref_numberdigit"/>
                                      </b-col>
                                    </b-row>
                                    <!-- <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnformattypeChange" :prop="PI_formattype" v-model="M_CM_RunningCd.formattype"  ref="ref_formattype"/>
                                      </b-col>
                                    </b-row> -->
                                    <b-row>
                                      <b-col  md="6">
                                        <b-row>
                                          <b-col md="4" class="lbl-col-align">
                                            <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for=""><span style="color:red;">*</span>Format</label>
                                          </b-col>
                                          <b-col md="5" style="margin-left: 10px;">
                                            <ABSTextBoxOnly @input="OnformattypeChange" :prop="PI_formattype" v-model="M_CM_RunningCd.formattype"  ref="ref_formattype"/>    
                                          </b-col>
                                          <b-col md="2">
                                            Output Length {{outPutlength}}
                                          </b-col>
                                        </b-row>
                                      </b-col>
                                    </b-row>
                                   <b-row>
                                        <b-col md="6" v-show="err1 || err2 || err3">
                                            <b-row v-show="err1">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> Format Must Contain $N </label></b-col>
                                            </b-row>
                                            <b-row v-show="err2">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> If Reset Number On Monthly, Format Must Contain $Y And $M</label></b-col>
                                            </b-row>
                                            <b-row v-show="err3">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> If Reset Number On Yearly, Format Must Contain $Y </label></b-col>
                                            </b-row>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6">
                                            <b-row>
                                                <b-col md="4" class="lbl-col-align"></b-col>                                                
                                                <b-col><label class="lbl-value-view-form">$D(Day) $M(Month) $Y(Year)</label></b-col>
                                            </b-row>                                              
                                        </b-col>
                                    </b-row>
                                    <b-row>	
                                        <b-col md="6">
                                            <b-row>
                                                <b-col md="4" class="lbl-col-align"></b-col>                                                
                                                <b-col><label class="lbl-value-view-form">$N(Running Number) $S(Subportfolio)</label></b-col>
                                            </b-row>                                              
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnyearformatChange" :prop="PI_yearformat" v-model="M_CM_RunningCd.yearformat"  ref="ref_yearformat" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnmodulecdChange" :prop="PI_modulecd" :value="M_CM_RunningCd.modulecd" :label="M_CM_RunningCd.modulecdLabel" ref="ref_modulecd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OnremarksChange" :prop="PI_remarks" v-model="M_CM_RunningCd.remarks"  ref="ref_remarks" />
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                  
							</b-row>
							<!-- <ABSTAnalysis :prop="PTAnalysis" /> -->
						</b-form>
					</b-col>
                </b-row>
            </b-collapse>
        </div>
    </div>
</template>

<script>

export default {
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
        outPutlength:0,
		cInsertKey:'id=RunningCd,label=RunningCd+|+Descs',
		FormType: "List",
        Module:"CM",
        error: false,
        err1: false,
        err2: false,
        err3: false,
            propList: {
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_RunningCd :{
                runningcd: '',
                descs: '',
                basedon: 'P',
                reseton: 'N',
                numberdigit: 0,
                formattype: '',
                yearformat: '4',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeedit: '',
                modulecd: '',
                moduledescs: '',
                remarks: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_runningcd: { 
                cValidate :'required|max:5', 
                cName: 'runningcd', 
                cLabel: 'Running Code', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_descs: { 
                cValidate :'required|max:60', 
                cName: 'descs', 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_basedon: { 
                cValidate :'', 
                cName: 'basedon', 
                cId: 'rdbbasedon', 
                cRadioOptions: [{ text: 'Portfolio', value: 'P' }, { text: 'Subportfolio', value: 'S' }], 
                cRadioDefaultOption: 'P', 
                cLabel:'Based On', 
                cLabelSize: 4, 
                cOrder: 3, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_reseton: { 
                cValidate :'', 
                cName: 'reseton', 
                cId: 'rdbreseton', 
                cRadioOptions: [{ text: 'Month', value: 'M' }, { text: 'Year', value: 'Y' }, { text: 'Never', value: 'N' }], 
                cRadioDefaultOption: 'N', 
                cLabel:'Reset Number On', 
                cLabelSize: 4, 
                cOrder: 4, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_numberdigit: { 
                cValidate :'required|max:9|min_value:1', 
                cName: 'numberdigit', 
                cLabel: 'Number of Digit', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: 'numeric',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_formattype: { 
                cValidate :'required|max:22', 
                cName: 'formattype', 
                cLabel: 'Format', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_yearformat: { 
                cValidate :'', 
                cName: 'yearformat', 
                cId: 'rdbyearformat', 
                cRadioOptions: [{ text: '4 Digit', value: '4' }, { text: '2 Digit', value: '2' }], 
                cRadioDefaultOption: '4', 
                cLabel:'		Year Format', 
                cLabelSize: 4, 
                cOrder: 7, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_modulecd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSSModule'    , 
                    ColumnDB: 'ModuleCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'modulecd', 
                cLabel: 'Module', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 8, 
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
                cMasterUrl: '' ,
                cDisplayColumn: 'module_cd,descs' ,
            }, 
            PI_remarks: { 
                cValidate :'', 
                cName:'remarks', 
                cLabel:'Remarks', 
                cLabelSize: 4, 
                cOrder:9, 
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

			// PTAnalysis: {
            //     cPageLevel: this.PageLevel,
            //     cTabIndex: this.TabIndex,
            //     cPageMasterSeq: this.data.PageMasterSeq,
            //     cFormPageNo: this.data.PageOrder
            // }
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
		return this.$store.getters.GetPage1Data
	}
  },
    methods: {
        OnNumberDigit(data){
            this.fn_changeLength()
        },
        fn_changeLength(){
            var ln = 0
            var data = this.M_CM_RunningCd.formattype
            if(data == ''){
                ln = 0
            }else{
                ln = data.length
            }
            if(data.includes('$N')){
                    if(this.M_CM_RunningCd.numberdigit > 2){
                        ln += this.M_CM_RunningCd.numberdigit - 2
                    }
            }
            if(data.includes('$Y')){
                    if(this.M_CM_RunningCd.yearformat=='4'){
                        ln += 2
                    }
                    
                }
            this.outPutlength = ln
        },
        OnformattypeChange (data) {
        this.$nextTick(() => {
            // var outPutlength = 0
            // if(data == ''){
            //     this.outPutlength = 0
            // }else{
            //     this.outPutlength = data.length
            // }
            this.fn_changeLength()
            if (this.inputStatus != "VIEW") { 
                
                if(!data.includes('$N')){
                    this.error = true
                    this.err1 = true
                } else {
                    this.err1 = false
                    this.error = false

                    // if(this.M_CM_RunningCd.numberdigit > 2){
                    //     this.outPutlength += this.M_CM_RunningCd.numberdigit - 2
                    // }
                }

                

                if (this.M_CM_RunningCd.reseton == 'M') {
                    if (!data.includes('$Y') || !data.includes('$M')) {
                        this.err2 = true
                        this.error = true
                    }
                    else {
                        this.err2 = false
                        this.error = false
                    }
                }
                else {
                    this.err2 = false
                    this.error = false
                }

                if (this.M_CM_RunningCd.reseton == 'Y') {
                    if (!data.includes('$Y')) {
                        this.err3 = true
                        this.error = true
                    }
                    else {
                        this.err3 = false
                        this.error = false
                    }
                }
                else {
                    this.err3 = false
                    this.error = false
                }
            }
        })
        this.$forceUpdate()
        },	
        OnbasedonChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{basedon}
            }
        })
        this.$forceUpdate()
        },
        OnresetonChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{reseton}
            }
        })
        this.$forceUpdate()
        },
        OnyearformatChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{yearformat}
this.fn_changeLength()
            }
        })
        this.$forceUpdate()
        },
        OnmodulecdChange (data) {
        if (this.M_CM_RunningCd.modulecd == data.id) return
        this.$nextTick(() => {
            this.M_CM_RunningCd.modulecd = data.id
            this.M_CM_RunningCd.modulecdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{modulecd}
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
           //this.getToolbar().statusFunction[4].disabled = false
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
        },		
        M_Post(){
        },
        M_Insert() {
            if (!this.M_CM_RunningCd.formattype.includes('$N')) return
            if (this.M_CM_RunningCd.reseton == 'Y') {
                if (!this.M_CM_RunningCd.formattype.includes('$Y')) {
                    return
                }
            }
            if (this.M_CM_RunningCd.reseton == 'M') {
                if (!this.M_CM_RunningCd.formattype.includes('$Y') || !this.M_CM_RunningCd.formattype.includes('$M')) {
                    return
                }
            }

            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                running_cd: this.M_CM_RunningCd.runningcd,
                descs: this.M_CM_RunningCd.descs,
                reset_on: this.M_CM_RunningCd.reseton,
                number_digit: this.M_CM_RunningCd.numberdigit,
                format_type: this.M_CM_RunningCd.formattype,
                year_format: this.M_CM_RunningCd.yearformat,
                user_input: this.getDataUser().user_id ,
                based_on: this.M_CM_RunningCd.basedon,
                module_cd: this.M_CM_RunningCd.modulecd == '' || this.M_CM_RunningCd.modulecd == null ? 'NULL' : this.M_CM_RunningCd.modulecd ,
                remarks: this.M_CM_RunningCd.remarks                
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultInsert(response.Message)
					
				
            })

        },
        M_Update() {
            if (!this.M_CM_RunningCd.formattype.includes('$N')) return
            if (this.M_CM_RunningCd.reseton == 'Y') {
                if (!this.M_CM_RunningCd.formattype.includes('$Y')) {
                    return
                }
            }
            if (this.M_CM_RunningCd.reseton == 'M') {
                if (!this.M_CM_RunningCd.formattype.includes('$Y') || !this.M_CM_RunningCd.formattype.includes('$M')) {
                    return
                }
            }
            
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                running_cd: this.M_CM_RunningCd.runningcd,
                descs: this.M_CM_RunningCd.descs,
                reset_on: this.M_CM_RunningCd.reseton,
                number_digit: this.M_CM_RunningCd.numberdigit,
                format_type: this.M_CM_RunningCd.formattype,
                year_format: this.M_CM_RunningCd.yearformat,
                based_on: this.M_CM_RunningCd.basedon,
                user_edit: this.getDataUser().user_id ,
                module_cd: this.M_CM_RunningCd.modulecd == '' || this.M_CM_RunningCd.modulecd == null ? 'NULL' : this.M_CM_RunningCd.modulecd ,
                remarks: this.M_CM_RunningCd.remarks,
                lastupdatestamp: this.M_CM_RunningCd.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_RunningCd = {
                runningcd: '',
                descs: '',
                basedon: 'P',
                reseton: 'N',
                numberdigit: '',
                formattype: '',
                yearformat: '4',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeedit: '',
                modulecd: '',
                moduledescs: '',
                remarks: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            		
		},
        M_New(){
			this.$refs.ref_runningcd.focus()
        },
        M_Edit(){
            this.$refs.ref_descs.focus()
        },
        M_Delete(dt){       

            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
                running_cd: value.running_cd,
                lastupdatestamp: value.lastupdatestamp,
                _Message_: ''
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
                LineNo: this.$parent.data.page_order,
                running_cd: record.running_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                this.M_CM_RunningCd = {
                    runningcd: data.running_cd,
                    descs: data.descs,
                    basedon: data.based_on,
                    reseton: data.reset_on,
                    numberdigit: data.number_digit,
                    formattype: data.format_type,
                    yearformat: data.year_format,
                    userinput: data.user_input,
                    useredit: data.user_edit,
                    timeedit: data.time_edit,
                    modulecd: data.module_cd,
                    moduledescs: data.module_descs,
                    remarks: data.remarks,
                    lastupdatestamp: record.lastupdatestamp,
                    rowid: data.row_id
                }
                 

                this.M_CM_RunningCd.modulecdLabel = this.M_CM_RunningCd.modulecd != null ? data.module_cd + this.separator + data.module_descs :'' 
         

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        }

    },
    beforeCreate: function () {
    },
    created: function() {
        this.$store.commit('setFormType','List')
        this.getToolbar().ProcessPS()
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.hideSideBarMenu()
        this.FormToABSList().doGetList('','eb_getList')

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

