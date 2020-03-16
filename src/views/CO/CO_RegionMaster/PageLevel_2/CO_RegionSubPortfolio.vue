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
                                        <ABSInputSelectList @change="OnsubportfoliocdChange" :prop="PI_subportfoliocd" :value="M_CO_RegionSubPortfolio.subportfoliocd" :label="M_CO_RegionSubPortfolio.subportfoliocdLabel" ref="ref_subportfoliocd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSTextAreaVuex @input="OndescsChange" :prop="PI_descs" v-model="M_CO_RegionSubPortfolio.descs"  ref="ref_descs" />
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
    props: {PageLevel:'', TabIndex: '', data: ''},
    data() {
        return {
			ValKey:null,
            FormType: "List",
			Module:"CO",
            propList: {
                initialWhere:"region_cd = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CO_RegionSubPortfolio :{
                regioncd: '',
                subportfoliocd: '',
                name: '',
                descs: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: '',
                controlsequenceno: 0,
                rowid: 0
                    }
            ,
            PI_subportfoliocd: { 
                dataLookUp: { 
                    LookUpCd: 'GetSubPortfolioCd'    , 
                    ColumnDB: 'SubPortfolioCd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'subportfoliocd', 
                cLabel: 'SubPortfolio', 
                cKey: true, 
                cLabelSize: 4, 
                cOrder: 1, 
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
                cDisplayColumn: 'subportfolio_cd,name' ,
            }, 
            PI_descs: { 
                cValidate :'max:150', 
                cName:'descs', 
                cLabel:'Description', 
                cLabelSize: 4, 
                cOrder:2, 
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
		return this.$store.getters.GetPage2Data
	},
    DataRowPage1(){
		return this.$store.getters.GetPage1Data
	}
  },
    methods: {
        OnsubportfoliocdChange (data) {
        if (this.M_CO_RegionSubPortfolio.subportfoliocd == data.id) return
        this.$nextTick(() => {
            this.M_CO_RegionSubPortfolio.subportfoliocd = data.id
            this.M_CO_RegionSubPortfolio.subportfoliocdLabel = data.id + ' | ' + data.label
            if (this.inputStatus != "VIEW") {
//{subportfoliocd}
            }
        })
        this.$forceUpdate()
        },
        OndescsChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{descs}
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
            this.$parent.showForm = false
			
            let data = this.$store.getters.GetPage1Data
            this.M_CO_RegionSubPortfolio.regioncd = data.region_cd 
            this.propList.initialWhere =" region_cd = '" + data.region_cd + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                region_cd: this.M_CO_RegionSubPortfolio.regioncd,
                subportfolio_cd: this.M_CO_RegionSubPortfolio.subportfoliocd,
                descs: this.M_CO_RegionSubPortfolio.descs,
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
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                region_cd: this.M_CO_RegionSubPortfolio.regioncd,
                subportfolio_cd: this.M_CO_RegionSubPortfolio.subportfoliocd,
                descs: this.M_CO_RegionSubPortfolio.descs,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CO_RegionSubPortfolio.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_CO_RegionSubPortfolio = {
                regioncd: '',
                subportfoliocd: '',
                name: '',
                descs: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: '',
                controlsequenceno: 0,
                rowid: 0
            }		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_CO_RegionSubPortfolio.regioncd = data.region_cd 

            this.$refs.ref_subportfoliocd.focus()

        },
        M_Edit(){
            this.$refs.ref_descs.focus()
        },
        M_Delete(dt){           

            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

            
            data.forEach((value) => {
                dataDelete.push({
                    region_cd: value.region_cd,
                    subportfolio_cd: this.getDataUser().subportfolio_cd,
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
                region_cd: record.region_cd,
                subportfolio_cd: record.subportfolio_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                this.M_CO_RegionSubPortfolio = {
                    regioncd: data.region_cd,
                    subportfoliocd: data.subportfolio_cd,
                    name: data.name,
                    descs: data.descs,
                    userinput: data.user_input,
                    useredit: data.user_edit,
                    timeinput: data.time_input,
                    timeedit: data.time_edit,
                    lastupdatestamp: record.lastupdatestamp,
                    controlsequenceno: data.control_sequence_no,
                    rowid: data.row_id
                }

                this.M_CO_RegionSubPortfolio.subportfoliocdLabel = this.M_CO_RegionSubPortfolio.subportfoliocd != null ? data.subportfolio_cd + this.separator + data.name :'' 

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

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

