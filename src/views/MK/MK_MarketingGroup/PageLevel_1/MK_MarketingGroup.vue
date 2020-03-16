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
                                        <ABSinputTextVuex :prop="PI_groupcode" v-model="M_MK_MarketingGroup.groupcode"  ref="ref_groupcode"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_MK_MarketingGroup.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OntypeChange" :prop="PI_type" v-model="M_MK_MarketingGroup.type"  ref="ref_type"/>
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
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
		FormType: "List",
        Module:"MK",
        ValKey:null,
        cInsertKey:'id=group_code,label=group_code+|+descs',
       propList: {
                initialWhere:"",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
            IEBy: {Input: '', Edit: ''},   			
            ContactApproval: '',
            ContactRunningCd: '',

            M_MK_MarketingGroup :{
                rowid: 0,
                subportfoliocd: this.getDataUser().subportfolio_cd,
                groupcode: '',
                marketinggroupcode: '',
                descs: '',
                type: 'I',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0
                    }
            ,
            PI_groupcode: {
                cValidate :'required|max:5', 
                cName: 'groupcode', 
                cLabel: 'Marketing Group Code', 
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
                cValidate :'max:150', 
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
                cRadioOptions: [{ text: 'Internal', value: 'I' }, { text: 'Eksternal', value: 'E' }], 
                cLabel:'Type', 
                cLabelSize: 4, 
                cOrder: 3, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex  
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
		return this.$store.getters.GetPage1Data
	}
  },
    methods: {
      OntypeChange(data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{type}
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
          var param = {			
              OptionSeq: this.getOptionSeq().OptionSeq,
              LineNo: this.$parent.data.page_order,
              subportfolio_code: this.getDataUser().subportfolio_cd,
              group_code: this.M_MK_MarketingGroup.groupcode,
              descs: this.M_MK_MarketingGroup.descs,
              type: this.M_MK_MarketingGroup.type,
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
                mk_marketing_group_id: this.M_MK_MarketingGroup.rowid,
                subportfolio_code: this.getDataUser().subportfolio_cd,
                group_code: this.M_MK_MarketingGroup.groupcode,
                descs: this.M_MK_MarketingGroup.descs,
                type: this.M_MK_MarketingGroup.type,
                user_edit: this.getDataUser().user_id,
                lastupdatestamp: this.M_MK_MarketingGroup.lastupdatestamp
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
            })

        },
		M_ClearForm(){
      this.M_MK_MarketingGroup = {
          rowid: 0,
          subportfoliocd: this.getDataUser().subportfolio_cd,
          groupcode: '',
          marketinggroupcode: '',
          descs: '',
          type: 'I',
          userinput: '',
          useredit: this.getDataUser().user_id,
          timeinput: '',
          timeedit: '',
          lastupdatestamp: 0
              }
            		
		},
        M_New(){
            this.$refs.ref_groupcode.focus()      
        },
        M_Edit(){
            this.$refs.ref_descs.focus()
        },
        M_Delete(dt){       

        var data = this.FormToABSList().getRowSelected()  
        var dataDelete = []

        
        data.forEach((value) => {
            // console.log(value);
          dataDelete.push({
          mk_marketing_group_id: value.mk_marketing_group_id,
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
            // console.log(record);
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                mk_marketing_group_id: record.mk_marketing_group_id
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                // console.log(data);
this.M_MK_MarketingGroup = {
                  rowid: data.mk_marketing_group_id,
                  subportfoliocd: data.subportfolio_code,
                  groupcode: data.group_code,
                  marketinggroupcode: data.marketing_group_code,
                  descs: data.descs,
                  type: data.type,
                  userinput: data.user_input,
                  useredit: data.user_edit,
                  timeinput: data.time_input,
                  timeedit: data.time_edit,
                  lastupdatestamp: data.lastupdatestamp
                }

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
        },

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

