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
                                        <ABSinputTextVuex :prop="PI_discount_cd" v-model="M_CM_Discount.discount_cd"  ref="ref_discount_cd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CM_Discount.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OntypeChange" :prop="PI_type" v-model="M_CM_Discount.type"  ref="ref_type" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_discount_amt" v-model="M_CM_Discount.discount_amt"  ref="ref_discount_amt"/>
                                      </b-col>
                                    </b-row>
                                    <b-row style="height: 20px !important;">
                                      <b-col md="2">
                                        <ABSLabelOnly
                                        :prop="{cLabel: '', 
                                          cLabelSize: 4, 
                                          cValue: '', 
                                          cPageLevel: PageLevel, 
                                          cTabIndex: TabIndex, 
                                          cVisible: true,
                                          cClass: 'lbl-col-align'}"
                                        />
                                      </b-col>
                                      <b-col md="1" style="text-align: center !important;">1</b-col>
                                      <!-- <b-col md="1">                                        
                                        <ABSTextBoxOnly :prop="PI_discount_rate1" v-model="M_CM_Discount.discount_rate1"  ref="ref_discount_rate1"/>
                                      </b-col> -->
                                      <b-col md="1" style="text-align: center !important;">2</b-col>
                                      <!-- <b-col md="1">
                                        <ABSTextBoxOnly :prop="PI_discount_rate2" v-model="M_CM_Discount.discount_rate2"  ref="ref_discount_rate2"/>
                                      </b-col> -->
                                      <b-col md="1" style="text-align: center !important;">3</b-col>
                                      <!-- <b-col md="1">
                                        <ABSTextBoxOnly :prop="PI_discount_rate3" v-model="M_CM_Discount.discount_rate3"  ref="ref_discount_rate3"/>
                                      </b-col> -->
                                      <b-col md="1" style="text-align: center !important;">4</b-col>
                                      <!-- <b-col md="1">
                                        <ABSTextBoxOnly :prop="PI_discount_rate4" v-model="M_CM_Discount.discount_rate4"  ref="ref_discount_rate4"/>
                                      </b-col> -->
                                      <b-col md="1" style="text-align: center !important;">5</b-col>
                                      <!-- <b-col md="1">
                                        <ABSTextBoxOnly :prop="PI_discount_rate5" v-model="M_CM_Discount.discount_rate5"  ref="ref_discount_rate5"/>
                                      </b-col> -->
                                      <b-col md="1" style="text-align: center !important;">6</b-col>
                                      <!-- <b-col md="1">
                                        <ABSTextBoxOnly :prop="PI_discount_rate6" v-model="M_CM_Discount.discount_rate6"  ref="ref_discount_rate6"/>
                                      </b-col> -->
                                    </b-row>
                                    <b-row>
                                      <b-col md="2">
                                        <ABSLabelOnly
                                        :prop="{cLabel: '% Discount Matrix', 
                                          cLabelSize: 4, 
                                          cValue: '', 
                                          cPageLevel: PageLevel, 
                                          cTabIndex: TabIndex, 
                                          cVisible: true,
                                          cClass: 'lbl-col-align'}"
                                        />
                                      </b-col>
                                      <!-- <b-col md="1" style="max-width: 2.333333% !important;">1</b-col> -->
                                      <b-col md="1">                                        
                                        <ABSTextBoxOnly @input="Ondiscount_rate1Change" :prop="PI_discount_rate1" v-model="M_CM_Discount.discount_rate1"  ref="ref_discount_rate1"/>
                                      </b-col>
                                      <!-- <b-col md="1" style="max-width: 2.333333% !important;">2</b-col> -->
                                      <b-col md="1">
                                        <ABSTextBoxOnly @input="Ondiscount_rate2Change" :prop="PI_discount_rate2" v-model="M_CM_Discount.discount_rate2"  ref="ref_discount_rate2"/>
                                      </b-col>
                                      <!-- <b-col md="1" style="max-width: 2.333333% !important;">3</b-col> -->
                                      <b-col md="1">
                                        <ABSTextBoxOnly @input="Ondiscount_rate3Change" :prop="PI_discount_rate3" v-model="M_CM_Discount.discount_rate3"  ref="ref_discount_rate3"/>
                                      </b-col>
                                      <!-- <b-col md="1" style="max-width: 2.333333% !important;">4</b-col> -->
                                      <b-col md="1">
                                        <ABSTextBoxOnly @input="Ondiscount_rate4Change" :prop="PI_discount_rate4" v-model="M_CM_Discount.discount_rate4"  ref="ref_discount_rate4"/>
                                      </b-col>
                                      <!-- <b-col md="1" style="max-width: 2.333333% !important;">5</b-col> -->
                                      <b-col md="1">
                                        <ABSTextBoxOnly @input="Ondiscount_rate5Change" :prop="PI_discount_rate5" v-model="M_CM_Discount.discount_rate5"  ref="ref_discount_rate5"/>
                                      </b-col>
                                      <!-- <b-col md="1" style="max-width: 2.333333% !important;">6</b-col> -->
                                      <b-col md="1">
                                        <ABSTextBoxOnly :prop="PI_discount_rate6" v-model="M_CM_Discount.discount_rate6"  ref="ref_discount_rate6"/>
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
		cInsertKey:'id=cm_discount_id,label=discount_cd+descs',
		FormType: "List",
		Module:"CM",
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

            M_CM_Discount :{
                discount_cd: '',
                descs: '',
                type: 'P',
                discount_amt: 0,
                discount_rate1: 0,
                discount_rate2: 0,
                discount_rate3: 0,
                discount_rate4: 0,
                discount_rate5: 0,
                discount_rate6: 0,
                account_cd: '',
                prefix_cd: '',
                deffered_account_cd: '',
                deffered_prefix_cd: '',
               
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_input: '',
                time_edit: '',
                lastupdatestamp: '',
                control_sequence_no: 0,
                row_id: 0
                    }
            ,
            PI_discount_cd: { 
                cValidate :'required|max:5', 
                cName: 'discount_cd', 
                cLabel: 'Discount Code', 
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
            PI_type: { 
                cValidate :'', 
                cName: 'type', 
                cId: 'rdbtype', 
                cRadioOptions: [{ text: 'Percent', value: 'P' }, { text: 'Fixed', value: 'F' }], 
                cRadioDefaultOption: 'P', 
                cLabel:'	Discount Type', 
                cLabelSize: 4, 
                cOrder: 3, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_discount_amt: { 
                cValidate :'max:18|min_value:1|max_value:1000000', 
                cName: 'discount_amt', 
                cLabel: 'Discount Amount', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_discount_rate1: { 
                cValidate :'max:6|max_value:100', 
                cName: 'discount_rate1', 
                cLabel: '1', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_discount_rate2: { 
                cValidate :'|max_value:100', 
                cName: 'discount_rate2', 
                cLabel: '2', 
                cLabelSize: 1, 
                cOrder: 6, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_discount_rate3: { 
                cValidate :'|max_value:100', 
                cName: 'discount_rate3', 
                cLabel: '3', 
                cLabelSize: 1, 
                cOrder: 7, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_discount_rate4: { 
                cValidate :'|max_value:100', 
                cName: 'discount_rate4', 
                cLabel: '4', 
                cLabelSize: 1, 
                cOrder: 8, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_discount_rate5: { 
                cValidate :'|max_value:100', 
                cName: 'discount_rate5', 
                cLabel: '5', 
                cLabelSize: 1, 
                cOrder: 9, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_discount_rate6: { 
                cValidate :'|max_value:100', 
                cName: 'discount_rate6', 
                cLabel: '6', 
                cLabelSize: 1, 
                cOrder:10, 
                cKey: false, 
                cType: 'decimal',
                cDecimal: 2, 
                cVisible: true, 
                cProtect: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

			// PTAnalysis: {
      //           cPageLevel: this.PageLevel,
      //           cTabIndex: this.TabIndex,
      //           cPageMasterSeq: this.data.PageMasterSeq,
      //           cFormPageNo: this.data.PageOrder
      //       }
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
        Ondiscount_rate1Change(data){
          this.$nextTick(() => {
            if(data > 0){
                this.PI_discount_rate2.cProtect = false
              }else{
                this.PI_discount_rate2.cProtect = true
                this.PI_discount_rate3.cProtect = true
                this.PI_discount_rate4.cProtect = true
                this.PI_discount_rate6.cProtect = true

                this.PI_discount_rate5.cProtect = true
                this.M_CM_Discount.discount_rate2 = ''
                this.M_CM_Discount.discount_rate3 = ''
                this.M_CM_Discount.discount_rate4 = ''
                this.M_CM_Discount.discount_rate5 = ''
                this.M_CM_Discount.discount_rate6 = ''
              }
            if (this.inputStatus != "VIEW") {
              
            }
          })
        },
        Ondiscount_rate2Change(data){
          
          this.$nextTick(() => {
            if(data > 0){
                this.PI_discount_rate3.cProtect = false
              }else{
                this.PI_discount_rate3.cProtect = true
                this.PI_discount_rate4.cProtect = true
                this.PI_discount_rate5.cProtect = true
                this.PI_discount_rate6.cProtect = true

                this.M_CM_Discount.discount_rate3 = ''
                this.M_CM_Discount.discount_rate4 = ''
                this.M_CM_Discount.discount_rate5 = ''
                this.M_CM_Discount.discount_rate6 = ''
              }
            if (this.inputStatus != "VIEW") {
              
            }
          })
        },
        Ondiscount_rate3Change(data){
          
          this.$nextTick(() => {
            if(data > 0){
                this.PI_discount_rate4.cProtect = false
              }else{
                this.PI_discount_rate4.cProtect = true
                this.PI_discount_rate5.cProtect = true
                this.PI_discount_rate6.cProtect = true

                this.M_CM_Discount.discount_rate4 = ''
                this.M_CM_Discount.discount_rate5 = ''
                this.M_CM_Discount.discount_rate6 = ''
              }
            if (this.inputStatus != "VIEW") {
              
            }
          })
        },
        Ondiscount_rate4Change(data){
          
          this.$nextTick(() => {
            if(data > 0){
                this.PI_discount_rate5.cProtect = false
              }else{
                this.PI_discount_rate5.cProtect = true
                this.PI_discount_rate6.cProtect = true

                this.M_CM_Discount.discount_rate5 = ''
                this.M_CM_Discount.discount_rate6 = '' 
              }
            if (this.inputStatus != "VIEW") {
              
            }
          })
        },
        Ondiscount_rate5Change(data){
          
          this.$nextTick(() => {
            if(data > 0){
                this.PI_discount_rate6.cProtect = false
              }else{
                this.PI_discount_rate6.cProtect = true

                this.M_CM_Discount.discount_rate6 = ''
              }
            if (this.inputStatus != "VIEW") {
              
            }
          })
        },		
        OntypeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
        if (data == "F")
             { this.PI_discount_rate1.cValidate = ""
             this.$refs.ref_discount_rate1.isRequired = false
             this.PI_discount_amt.cValidate = "required"
             this.$refs.ref_discount_amt.isRequired = true
             this.PI_discount_amt.cProtect = false
             this.M_CM_Discount.discount_rate1 = ""
             this.M_CM_Discount.discount_rate2 = ""
             this.M_CM_Discount.discount_rate3 = ""
             this.M_CM_Discount.discount_rate4 = ""
             this.M_CM_Discount.discount_rate5 = ""
             this.M_CM_Discount.discount_rate6 = ""
             this.PI_discount_rate1.cProtect = true
             this.PI_discount_rate2.cProtect = true
             this.PI_discount_rate3.cProtect = true
             this.PI_discount_rate4.cProtect = true
             this.PI_discount_rate5.cProtect = true
             this.PI_discount_rate6.cProtect = true }
        else {
             this.PI_discount_rate1.cValidate = "required"
             this.$refs.ref_discount_rate1.isRequired = true
             this.PI_discount_amt.cValidate = ""
             this.$refs.ref_discount_amt.isRequired = false
             this.M_CM_Discount.discount_amt = ""
             this.PI_discount_amt.cProtect = true
             this.PI_discount_rate1.cProtect = false
             this.PI_discount_rate2.cProtect = true
             this.PI_discount_rate3.cProtect = true
             this.PI_discount_rate4.cProtect = true
             this.PI_discount_rate5.cProtect = true
             this.PI_discount_rate6.cProtect = true }

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
        if (this.M_CM_Discount.type == "F")
             { this.M_CM_Discount.discount_rate1 = 0
             this.M_CM_Discount.discount_rate2 = 0
             this.M_CM_Discount.discount_rate3 = 0
             this.M_CM_Discount.discount_rate4 = 0
             this.M_CM_Discount.discount_rate5 = 0
             this.M_CM_Discount.discount_rate6 = 0 }
        else {
             this.M_CM_Discount.discount_amt = 0 }
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                discount_cd: this.M_CM_Discount.discount_cd,
                descs: this.M_CM_Discount.descs,
                types: this.M_CM_Discount.type,
                discount_amt: this.M_CM_Discount.discount_amt ? this.replaceAllString(this.M_CM_Discount.discount_amt,',','','number') : 0 ,
                discount_amt1: this.M_CM_Discount.discount_rate1 ? this.replaceAllString(this.M_CM_Discount.discount_rate1,',','','number') : 0 ,
                discount_amt2: this.M_CM_Discount.discount_rate2 ? this.replaceAllString(this.M_CM_Discount.discount_rate2,',','','number') : 0 ,
                discount_amt3: this.M_CM_Discount.discount_rate3 ? this.replaceAllString(this.M_CM_Discount.discount_rate3,',','','number') : 0 ,
                discount_amt4: this.M_CM_Discount.discount_rate4 ? this.replaceAllString(this.M_CM_Discount.discount_rate4,',','','number') : 0 ,
                discount_amt5: this.M_CM_Discount.discount_rate5 ? this.replaceAllString(this.M_CM_Discount.discount_rate5,',','','number') : 0 ,
                discount_amt6: this.M_CM_Discount.discount_rate6 ? this.replaceAllString(this.M_CM_Discount.discount_rate6,',','','number') : 0 ,
                user_input: this.getDataUser().user_id                 
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultInsert(response.Message)
					
				
            })


        },
        M_Update() {
        if (this.M_CM_Discount.type == "F")
             { this.M_CM_Discount.discount_rate1 = 0
             this.M_CM_Discount.discount_rate2 = 0
             this.M_CM_Discount.discount_rate3 = 0
             this.M_CM_Discount.discount_rate4 = 0
             this.M_CM_Discount.discount_rate5 = 0
             this.M_CM_Discount.discount_rate6 = 0 }
        else {
             this.M_CM_Discount.discount_amt = 0 }
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                discount_cd: this.M_CM_Discount.discount_cd,
                descs: this.M_CM_Discount.descs,
                types: this.M_CM_Discount.type,
                discount_amt: this.M_CM_Discount.discount_amt ? this.replaceAllString(this.M_CM_Discount.discount_amt,',','','number') : 0 ,
                discount_amt1: this.M_CM_Discount.discount_rate1 ? this.replaceAllString(this.M_CM_Discount.discount_rate1,',','','number') : 0 ,
                discount_amt2: this.M_CM_Discount.discount_rate2 ? this.replaceAllString(this.M_CM_Discount.discount_rate2,',','','number') : 0 ,
                discount_amt3: this.M_CM_Discount.discount_rate3 ? this.replaceAllString(this.M_CM_Discount.discount_rate3,',','','number') : 0 ,
                discount_amt4: this.M_CM_Discount.discount_rate4 ? this.replaceAllString(this.M_CM_Discount.discount_rate4,',','','number') : 0 ,
                discount_amt5: this.M_CM_Discount.discount_rate5 ? this.replaceAllString(this.M_CM_Discount.discount_rate5,',','','number') : 0 ,
                discount_amt6: this.M_CM_Discount.discount_rate6 ? this.replaceAllString(this.M_CM_Discount.discount_rate6,',','','number') : 0 ,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_Discount.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })


        },
		M_ClearForm(){
            this.M_CM_Discount = {
                discount_cd: '',
                descs: '',
                type: 'P',
                discount_amt: '',
                discount_rate1: '',
                discount_rate2: '',
                discount_rate3: '',
                discount_rate4: '',
                discount_rate5: '',
                discount_rate6: '',
                account_cd: '',
                prefix_cd: '',
                deffered_account_cd: '',
                deffered_prefix_cd: '',
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_input: '',
                time_edit: '',
                lastupdatestamp: '',
                control_sequence_no: 0,
                row_id: 0
                    }
            		
		},
        M_New(){
          this.$refs.ref_discount_cd.focus()
        },
        M_Edit(){
          this.$refs.ref_descs.focus()

          if(this.M_CM_Discount.type == 'F'){
            this.PI_discount_amt.cProtect = false
            this.PI_discount_rate1.cProtect = true
            this.PI_discount_rate2.cProtect = true
            this.PI_discount_rate3.cProtect = true
            this.PI_discount_rate4.cProtect = true
            this.PI_discount_rate5.cProtect = true
            this.PI_discount_rate6.cProtect = true
          }else{
            this.PI_discount_amt.cProtect = true
            this.PI_discount_rate1.cProtect = false
            this.PI_discount_rate2.cProtect = false
            this.PI_discount_rate3.cProtect = false
            this.PI_discount_rate4.cProtect = false
            this.PI_discount_rate5.cProtect = false
            this.PI_discount_rate6.cProtect = false

          }
        },
        M_Delete(dt){       

        var data = this.FormToABSList().getRowSelected()  
        var dataDelete = []

        
        data.forEach((value) => {
          dataDelete.push({
          discount_cd: value.discount_cd,
          lastupdatestamp: value.lastupdatestamp,
          _Message_: ""
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
,                discount_cd: record.discount_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
this.M_CM_Discount = {
                discount_cd: data.discount_cd,
                descs: data.descs,
                type: data.type,
                discount_amt: this.isCurrency(data.discount_amt, this.decimal),
                discount_rate1: this.isCurrency(data.discount_rate1, this.decimal),
                discount_rate2: this.isCurrency(data.discount_rate2, this.decimal),
                discount_rate3: this.isCurrency(data.discount_rate3, this.decimal),
                discount_rate4: this.isCurrency(data.discount_rate4, this.decimal),
                discount_rate5: this.isCurrency(data.discount_rate5, this.decimal),
                discount_rate6: this.isCurrency(data.discount_rate6, this.decimal),
                account_cd: data.account_cd,
                prefix_cd: data.prefix_cd,
                deffered_account_cd: data.deffered_account_cd,
                deffered_prefix_cd: data.deffered_prefix_cd,
                user_input: data.user_input,
                user_edit: data.user_edit,
                time_input: data.time_input,
                time_edit: data.time_edit,
                lastupdatestamp: record.lastupdatestamp,
                control_sequence_no: data.control_sequence_no,
                row_id: data.row_id
                    }

                 if(data.discount_rate1 > 0){
                  this.PI_discount_rate2.cProtect = false
                  }else{
                    this.PI_discount_rate2.cProtect = true
                    this.PI_discount_rate3.cProtect = true
                    this.PI_discount_rate4.cProtect = true
                    this.PI_discount_rate5.cProtect = true
                    this.PI_discount_rate6.cProtect = true

                    this.M_CM_Discount.discount_rate2 = ''
                    this.M_CM_Discount.discount_rate3 = ''
                    this.M_CM_Discount.discount_rate4 = ''
                    this.M_CM_Discount.discount_rate5 = ''
                    this.M_CM_Discount.discount_rate6 = ''
                  }

                  if(data.discount_rate2 > 0){
                  this.PI_discount_rate3.cProtect = true
                  }else{
                    this.PI_discount_rate3.cProtect = true
                    this.PI_discount_rate4.cProtect = true
                    this.PI_discount_rate5.cProtect = true
                    this.PI_discount_rate6.cProtect = true

                    this.M_CM_Discount.discount_rate3 = ''
                    this.M_CM_Discount.discount_rate4 = ''
                    this.M_CM_Discount.discount_rate5 = ''
                    this.M_CM_Discount.discount_rate6 = ''
                  }

                  if(data.discount_rate3 > 0){
                  this.PI_discount_rate4.cProtect = true
                  }else{
                    this.PI_discount_rate4.cProtect = true
                    this.PI_discount_rate5.cProtect = true
                    this.PI_discount_rate6.cProtect = true

                    this.M_CM_Discount.discount_rate4 = ''
                    this.M_CM_Discount.discount_rate5 = ''
                    this.M_CM_Discount.discount_rate6 = ''
                  }

                  if(data.discount_rate4 > 0){
                  this.PI_discount_rate5.cProtect = false
                  }else{
                    this.PI_discount_rate5.cProtect = true
                    this.PI_discount_rate6.cProtect = true

                    this.M_CM_Discount.discount_rate5 = ''
                    this.M_CM_Discount.discount_rate6 = ''
                  }

                  if(data.discount_rate5 > 0){
                  this.PI_discount_rate6.cProtect = false
                  }else{
                    this.PI_discount_rate6.cProtect = true

                    this.M_CM_Discount.discount_rate6 = ''
                  }

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

