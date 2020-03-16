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
                                    <!-- <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_city_cd" v-model="M_CM_CountryCity_Detail.city_cd"  ref="ref_city_cd"/>
                                      </b-col>
                                    </b-row> -->
                                    <b-row>
                                        <b-col md="6">
                                            <b-row>
                                                <b-col md="4" class="lbl-col-align">
                                                    <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">City Code</label>
                                                </b-col>
                                                <b-col md="1" style="margin-left: 10px;">
                                                    {{M_CM_CountryCity_Detail.country_cd}}    
                                                </b-col>  
                                                <b-col md="4">
                                                    <ABSTextBoxOnly :prop="PI_city_cd" v-model="M_CM_CountryCity_Detail.city_cd"  ref="ref_city_cd"/>                                            
                                                </b-col>
                                            </b-row>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_CM_CountryCity_Detail.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="Onprovince_cdChange" :prop="PI_province_cd" :value="M_CM_CountryCity_Detail.province_cd" :label="M_CM_CountryCity_Detail.province_cdLabel" ref="ref_province_cd"/>
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
			Module:"CM",
            propList: {
                initialWhere:"country_cd = '" + this.ValKey + "'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_CM_CountryCity_Detail :{
                city_cd: '',
                country_cd: '',
                province_cd: '',
                descs: '',
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_input: '',
                time_edit: '',
                province_descs: '',
                lastupdatestamp: 0,
                row_id: 0
                    }
            ,
            PI_city_cd: { 
                cValidate :'required|max:3', 
                cName: 'city_cd', 
                cLabel: 'City Code', 
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
            PI_province_cd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMProvince'    , 
                    ColumnDB: 'province_cd'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'province_cd', 
                cLabel: 'Province', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 3, 
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
                cMasterUrl: 'CM/CM_Province' ,
                cDisplayColumn: 'province_cd,province_descs' ,
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
        Onprovince_cdChange (data) {
        if (this.M_CM_CountryCity_Detail.province_cd == data.id) return
        this.$nextTick(() => {
            this.M_CM_CountryCity_Detail.province_cd = data.id
            this.M_CM_CountryCity_Detail.province_cdLabel = data.label
            if (this.inputStatus != "VIEW") {
//{province_cd}
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
            this.M_CM_CountryCity_Detail.country_cd = data.country_cd 
            this.propList.initialWhere =" country_cd = '" + data.country_cd + "' "
            this.PI_province_cd.dataLookUp.InitialWhere = " country_cd = '" + data.country_cd + "' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
        var city_cd =  this.M_CM_CountryCity_Detail.city_cd
        this.M_CM_CountryCity_Detail.city_cd = city_cd
        
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                country_cd: this.M_CM_CountryCity_Detail.country_cd,
                city_cd: this.M_CM_CountryCity_Detail.city_cd,
                province_id: this.M_CM_CountryCity_Detail.province_cd == '' || this.M_CM_CountryCity_Detail.province_cd == null ? 'NULL' : this.M_CM_CountryCity_Detail.province_cd ,
                descs: this.M_CM_CountryCity_Detail.descs,
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
                country_cd: this.M_CM_CountryCity_Detail.country_cd,
                province_id: this.M_CM_CountryCity_Detail.province_cd == '' || this.M_CM_CountryCity_Detail.province_cd == null ? 'NULL' : this.M_CM_CountryCity_Detail.province_cd ,
                city_cd: this.M_CM_CountryCity_Detail.city_cd,
                descs: this.M_CM_CountryCity_Detail.descs,
                user_edit: this.getDataUser().user_id ,
                lastupdatestamp: this.M_CM_CountryCity_Detail.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })

        },
		M_ClearForm(){
            this.M_CM_CountryCity_Detail = {
                city_cd: '',
                country_cd: '',
                province_cd: '',
                descs: '',
                user_input: '',
                user_edit: this.getDataUser().user_id,
                time_input: '',
                time_edit: '',
                province_descs: '',
                lastupdatestamp: 0,
                row_id: 0
                    }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_CM_CountryCity_Detail.country_cd = data.country_cd 
            this.$refs.ref_city_cd.focus()


        },
        M_Edit(){
            this.$refs.ref_province_cd.focus()
        },
        M_Delete(dt){ 
            var data = this.FormToABSList().getRowSelected()
            var dataDelete = []

            data.forEach((value) => {
                dataDelete.push({
                country_cd: value.country_cd,
                city_cd: value.city_cd,
                lastupdatestamp: value.lastupdatestamp,
                _Message_: "Data "
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
,                country_cd: record.country_cd,
                city_cd: record.city_cd				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_CM_CountryCity_Detail = {
                city_cd: data.city_cd,
                country_cd: data.country_cd,
                province_cd: data.province_id,
                descs: data.descs,
                user_input: data.user_input,
                user_edit: data.user_edit,
                time_input: data.time_input,
                time_edit: data.time_edit,
                province_descs: data.province_descs,
                lastupdatestamp: data.lastupdatestamp,
                row_id: data.row_id
                    }
                 

                this.M_CM_CountryCity_Detail.province_cdLabel = this.M_CM_CountryCity_Detail.province_cd != null ? data.province_cd + this.separator + data.province_descs :'' 
  

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

