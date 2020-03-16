<template>
    <div>        


        <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div>
            <b-collapse id="collapse1" :visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">     
					<b-col md="12" id="col-left" class="bColMasterForm">	
						<b-form v-on:submit.prevent :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <b-row style="padding-left:10px;">					
                                <b-col md="12" id="col-left"> <!-- table open -->
                                   <b-row style="padding-left:10px;">					
                                <b-col md="12" id="col-left">                                    
                                    <b-row style="padding-top:10px; padding-right: 10px; padding-left: 25px; padding-bottom: 10px; !important;">
                                        Subportfolio : {{subportfolio}}
                                    </b-row>
                                    <b-row>
                                    <b-col md="4" style="padding-right: 15px !important;">
                                        <input
                                            v-model="search"
                                            type="text"
                                            class="form-control text-field-form"
                                            style="margin-left: 20px !important;"
                                            placeholder="Search..."
                                            autofocus
                                            autocomplete="off"                                            
                                            v-on:keyup="onSearchEnter"
                                            ref="ref_search"
                                            >
                                    </b-col>
                                        <b-col offset="1" >
                                            <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Total Unit yang dipilih : {{this.rightDataOptions.length}}</label>
                                        </b-col>
                                    </b-row>
                                    <b-row style="padding-top:10px; padding-right: 10px; padding-left: 20px; padding-bottom: 10px; !important;">                                        
                                      <b-col md="4">
                                        Unit Tersedia
                                        <ABSMultiSelect
                                            v-model="leftData"
                                            :options="leftDataOptions"
                                            size=10
                                            class="selectCustom"
                                        />
                                      </b-col>
                                      <b-col md="1" style="padding: 120px 8px;">
                                        <b-button id="satu" :disabled="false" size="sm" variant="primary" @click="moveAllToRight" style="width:50px">
                                            &gt;&gt;
                                        </b-button>
                                        <br>
                                        <b-button :disabled="false" size="sm" variant="primary" @click="moveToRight" style="width:50px;margin-top:10px;">
                                            &gt;
                                        </b-button>
                                        <br>
                                        <b-button :disabled="false" size="sm" variant="primary" @click="moveToLeft" style="width:50px;margin-top:10px;">
                                            &lt;
                                        </b-button>
                                        <br>
                                        <b-button :disabled="false" size="sm" variant="primary" @click="moveAllToLeft" style="width:50px;margin-top:10px;">
                                            &lt;&lt;
                                        </b-button>
                                      </b-col>
                                      <b-col md="4">
                                        Unit yang dipilih
                                        <ABSMultiSelect
                                            v-model="rightData"
                                            :options="rightDataOptions"
                                            size=10
                                            class="selectCustom"
                                        />
                                      </b-col>
                                    </b-row>
                                </b-col>
                  
							</b-row>
                                </b-col> <!-- table close -->
							</b-row>
							<ABSTAnalysis :prop="PTAnalysis" />
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
            FormType: "Form",
            Module:"SM",
            subportfolio: '',
            allDataOptions: [],
            leftData: [],
            leftDataOptions: [],
            rightData: [],
            rightDataOptions: [],
            search: '',
            DataRow: [],
       
            IEBy: {Input: '', Edit: ''},   			

            
			PTAnalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cPageMasterSeq: this.data.PageMasterSeq,
                cFormPageNo: this.data.PageOrder
            }         
        }
    },
    watch : {
        leftDataOptions (newData, oldData) {
            this.tempLeftFilter = newData
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
		onSearchEnter (e) {   

        if (e.keyCode === 13) {//ENTER
        this.getRightColumn(this.search)
        }
        // else if (e.keyCode === 50) {
        // alert('@ was pressed');
        // }         
        },
        getDataList (search) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                UserId: this.getDataUser().user_id,
                PortfolioCd: this.getDataUser().portfolio_cd,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                BlockCd: this.DataRowPage1.Cluster,
                LineNo: 1,
                InitialWhere: search && search != '' ? ("LotNo like '%" + search + "%'") : '',
                ParamView: "'"+this.getDataUser().subportfolio_cd+"', '"+this.DataRowPage1.Cluster+"'" ,
                SortField: 'LotNo'
                
            }
            
            this.postEncode( this.getUrlDataList(), param )
            .then( response => {
                this.$store.commit('setStatusLoader', false)
                if (response == null) return
                this.allDataOptions = response.Data
                // console.log(this.allDataOptions)
                this.leftDataOptions = []
                var status = false
                for (var x = 0; x < this.allDataOptions.length; x++) {
                    status = false
                    for (var y = 0; y < this.rightDataOptions.length; y++) {
                        if (this.allDataOptions[x].LotNo == this.rightDataOptions[y].value) {  
                            status = true
                            break
                        }
                    }
                    if (status == false) {
                        this.leftDataOptions.push({
                            value: this.allDataOptions[x].LotNo,                             
                            key: this.allDataOptions[x].LotNo
                            // ,
                            // RowId: this.allDataOptions[x].rowid
                        })
                    }
                }
                this.$forceUpdate()
            })
        },
        getRightColumn (search) {
            this.$store.commit('setStatusLoader', true)           
            
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 2,  
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                EventCd: this.DataRowPage1.EventCd
            }

            this.postJSON( this.getUrlById(), param )
            .then( response => {
                if (response == null) return
                var data = response.Data
                this.rightDataOptions = []
                for (var x = 0; x < data.length; x++) {
                    this.rightDataOptions.push({
                        value: data[x].lotno,                        
                        key: data[x].lotno,
                        RowId: data[x].lotno,
                    })
                }
                this.getDataList(search)
            })
        },
        moveAllToRight () {
            for (var x = 0; x < this.leftDataOptions.length; x++) {
                var data = this.leftDataOptions[x]
                this.rightDataOptions.push({
                    value: data.value,
                    key: data.key,
                    RowId: data.row_id,
                })
            }
            this.leftDataOptions = []
            this.$forceUpdate()
        },
        moveToRight () {
            for (var x = 0; x < this.leftData.length; x++) {
                var index = -1
                var data
                for (var y = 0; y < this.leftDataOptions.length; y++) {
                    if (this.leftData[x] == this.leftDataOptions[y].value) {
                        data = this.leftDataOptions[y]
                        index = y
                    }
                }
                this.rightDataOptions.push({
                    value: data.value,
                    key: data.key,
                    RowId: data.row_id,
                })
                this.leftDataOptions.splice(index, 1)
            }
            this.$forceUpdate()
        },
        moveToLeft () {
            for (var x = 0; x < this.rightData.length; x++) {
                var index = -1
                var data
                for (var y = 0; y < this.rightDataOptions.length; y++) {
                    if (this.rightData[x] == this.rightDataOptions[y].value) {
                        data = this.rightDataOptions[y]
                        index = y
                    }
                }
                this.leftDataOptions.push({
                    value: data.value,
                    key: data.key,
                    RowId: data.row_id,
                })
                this.rightDataOptions.splice(index, 1)
            }
            this.$forceUpdate()
        },
        moveAllToLeft () {
            for (var x = 0; x < this.rightDataOptions.length; x++) {
                var data = this.rightDataOptions[x]
                this.leftDataOptions.push({
                    value: data.value,
                    key: data.key,
                    RowId: data.row_id,
                })
            }
            this.rightDataOptions = []
            this.$forceUpdate()
        },
		setToolbarButton () {
           this.getToolbar().isNew = true
            this.getToolbar().statusFunction[6].disabled = false
            this.getToolbar().statusFunction[7].disabled = true
            this.getToolbar().isByPassCancel = true
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
            this.search = ''
            this.getRightColumn('')			
		},		
		doDoubleClick(){
        },
		rowClicked (record, index) {
        },
        rowLink: function(url){
            this.$refs.modalTest.show()
        },
		paramFromParent(){
            // this.$parent.showForm = false
            let data = this.$store.getters.GetPage1Data
            this.DataRow = data
            
            this.getRightColumn('')
			

            // this.FormToABSList().doGetList('','eb_getList')
        },		       
        M_Insert() {
            var dataPost = []
            var param1 = []
            var param2 = []
            // console.log(this.leftDataOptions) 
            // console.log(this.rightDataOptions) 
            // return

            for (let x = 0 ; x < this.leftDataOptions.length ; x ++) {
                param1.push({
                    _Method_: 'DELETE',
                    _LineNo_: this.$parent.data.page_order,
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    EventCd: this.DataRow.EventCd,
                    // AddressCd: this.leftDataOptions[x].value
                })
            }

            for (let x = 0 ; x < this.rightDataOptions.length ; x ++) {
                param2.push({
                    _Method_: 'SAVE',
                    _LineNo_: this.$parent.data.page_order,
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    EventCd: this.DataRow.EventCd,
                    LotNo: this.rightDataOptions[x].value,
                    UserInput: this.getDataUser().user_id
                })
            }

            dataPost.push({
                A_Looping: param1,
                B_Looping: param2
            })

            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                Data: dataPost
            }
                
            this.postJSONMulti (this.getUrlProsesDataPostMulti(), param)
            .then(response => {
                if (response == null) return
                this.alertSuccess('Success...!')
                this.getRightColumn('')
                this.search = ''
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
            
            		
		},
        M_New(){

            this.$refs.ref_search.focus()
        },
        M_Edit(){
            this.$refs.ref_search.focus()
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

        }
		
    },
    created: function() {
        this.subportfolio = this.getDataUser().label
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

