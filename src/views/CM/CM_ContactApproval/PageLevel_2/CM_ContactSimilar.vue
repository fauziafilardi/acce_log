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

            M_CM_ContactSimilar :{
                contactid: '',
                contactclasscd: '',
                parentid: '',
                category: '',
                government: '',
                reasoncd: '',
                reasondescs: '',
                name: '',
                website: '',
                taxno: '',
                taxreferenceno: '',
                taxregistrationdate: '',
                taxcollectable: '',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                classdescs: '',
                parentname: '',
                classificationlocalid: '',
                classificationcentralid: '',
                classificationgroupid: '',
                sequenceregistrationno: 0,
                lastupdatestamp: 0,
                rowid: 0,
                insurancestatus: '',
                financierstatus: '',
                status: ''
                    }
            ,       
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
            // alert(JSON.stringify(data,null,2))
            this.M_CM_ContactSimilar.sequenceregistrationno = data.sequence_registration_no 
            this.propList.initialWhere =""
            this.propList.ParamView = "'"+data.sequence_registration_no + "','" + data.name + "'"

        // this.toList().doGetList('','eb_getList')

            this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                
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
                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_CM_ContactSimilar = {
                contactid: '',
                contactclasscd: '',
                parentid: '',
                category: '',
                government: '',
                reasoncd: '',
                reasondescs: '',
                name: '',
                website: '',
                taxno: '',
                taxreferenceno: '',
                taxregistrationdate: '',
                taxcollectable: '',
                remarks: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                classdescs: '',
                parentname: '',
                classificationlocalid: '',
                classificationcentralid: '',
                classificationgroupid: '',
                sequenceregistrationno: 0,
                lastupdatestamp: 0,
                rowid: 0,
                insurancestatus: '',
                financierstatus: '',
                status: ''
                    }
            		
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            this.M_CM_ContactSimilar.sequenceregistrationno = data.sequence_registration_no 



        },
        M_Edit(){
        },
        M_Delete(dt){           

            var data = this.FormToABSList().getRowSelected()  
            var dataDelete = []

            
            data.forEach((value) => {
            dataDelete.push({
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
                LineNo: this.$parent.data.page_order,
                sequenceregistrationno: record.sequence_registration_no,
				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_CM_ContactSimilar = {
                contactid: data.contact_id,
                contactclasscd: data.contact_class_cd,
                parentid: data.parent_id,
                category: data.category,
                government: data.government,
                reasoncd: data.reason_cd,
                reasondescs: data.reason_descs,
                name: data.name,
                website: data.website,
                taxno: data.tax_no,
                taxreferenceno: data.tax_reference_no,
                taxregistrationdate: data.tax_registration_date,
                taxcollectable: data.tax_collectable,
                remarks: data.remarks,
                userinput: data.user_input,
                useredit: data.user_edit,
                classdescs: data.class_descs,
                parentname: data.parent_name,
                classificationlocalid: data.classification_local_id,
                classificationcentralid: data.classification_central_id,
                classificationgroupid: data.classification_group_id,
                sequenceregistrationno: data.sequence_registration_no,
                lastupdatestamp: record.lastupdatestamp,
                rowid: data.row_id,
                insurancestatus: data.insurance_status,
                financierstatus: data.financier_status,
                status: data.status
                    }
                 

  

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

