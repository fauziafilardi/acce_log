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
      @checkboxChecked = "$parent.checkboxChecked"
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
                                        <ABSinputTextVuex :prop="PI_floorcd" v-model="M_SM_Floor.floorcd"  ref="ref_floorcd"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_descs" v-model="M_SM_Floor.descs"  ref="ref_descs"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col  md="12">
                                          <b-row>
                                            <b-col md="2" class="lbl-col-align">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Gross Area</label>
                                            </b-col>
                                            <b-col md="2" style="margin-left: 10px;">
                                                <ABSTextBoxOnly @input="OngrossareaChange" :prop="PI_grossarea" v-model="M_SM_Floor.grossarea"  ref="ref_grossarea"/>
                                            </b-col>
                                            <b-col md="6">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">( Available = {{M_SM_Floor.grossarea}} ) ( Occupied = {{M_SM_Floor.occupiedgross}} ) ( Assigned = {{M_SM_Floor.assignedgross}} )  </label>
                                            </b-col> 
                                          </b-row>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                       <b-col  md="12">
                                          <b-row>
                                            <b-col md="2" class="lbl-col-align">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Semi Gross Area</label>
                                            </b-col>
                                            <b-col md="2" style="margin-left: 10px;">
                                                <ABSTextBoxOnly @input="OnsemigrossChange" :prop="PI_semigrossarea" v-model="M_SM_Floor.semigrossarea"  ref="ref_semigrossarea"/>
                                            </b-col>
                                            <b-col md="6">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">( Available = {{M_SM_Floor.semigrossarea}} ) ( Occupied = {{M_SM_Floor.occupiedsemigross}} ) ( Assigned = {{M_SM_Floor.assignedsemigross}} )  </label>
                                            </b-col> 
                                          </b-row>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="6" v-show="err1">
                                            <b-row v-show="err1">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> * Semi Gross Area must be less than or equal Gross Area </label></b-col>
                                            </b-row>                                            
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="12">
                                          <b-row>
                                            <b-col md="2" class="lbl-col-align">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Net Area</label>
                                            </b-col>
                                            <b-col md="2" style="margin-left: 10px;">
                                                <ABSTextBoxOnly @input="OnnetareaChange" :prop="PI_netarea" v-model="M_SM_Floor.netarea"  ref="ref_netarea"/>
                                            </b-col>
                                            <b-col md="6">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">( Available = {{M_SM_Floor.netarea}} ) ( Occupied = {{M_SM_Floor.occupiednet}} ) ( Assigned = {{M_SM_Floor.assignednet}} )  </label>
                                            </b-col> 
                                          </b-row>
                                      </b-col>
                                    </b-row>
                                     <b-row>
                                        <b-col md="6" v-show="err2">
                                            <b-row v-show="err2">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> * Net Area must be less than or equal Gross Area </label></b-col>
                                            </b-row>                                            
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSFileUpload :prop="PI_referencefilename" @fileName="getFileName" 
                                                                        v-model="M_SM_Floor.referencefilename" 
                                                                        :file="M_SM_Floor.picturefilename" 
                                                                        :image="M_SM_Floor.referencefilename"
                                                                         ref="ref_referencefilename" />
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
            FormType: "List",
            Module:"SM",
            error: false,
            err1: false,
            err2: false,
            propList: {
                initialWhere:"BlockCd = '" + this.ValKey + "' AND SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"'",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_Floor :{
                floorcd: '',
                blockc: '',
                descs: '',
                grossarea: '0',
                semigrossarea: '0',
                netarea: '0',
                occupiedgross: '0',
                occupiedsemigross: '0',
                occupiednet: '0',
                assignedgross: '0',
                assignedsemigross: '0',
                assignednet: '0',
                referencefilename: '',
                picturefilename: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            ,
            PI_floorcd: { 
                cValidate :'required|max:5', 
                cName: 'floorcd', 
                cLabel: 'Floor Code', 
                cLabelSize: 4, 
                cOrder: 5, 
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
                cName: 'descsss', 
                cLabel: 'Description', 
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
            PI_grossarea: { 
                cValidate :'required', 
                cName: 'grossarea', 
                cLabel: 'Gross Area', 
                cLabelSize: 4, 
                cOrder: 7, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_occupiedgross: { 
                cLabel: '', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_semigrossarea: { 
                cValidate :'required', 
                cName: 'semigrossarea', 
                cLabel: 'Semi Gross Area', 
                cLabelSize: 4, 
                cOrder: 8, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_occupiedsemigross: { 
                cLabel: '', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_netarea: { 
                cValidate :'required', 
                cName: 'netarea', 
                cLabel: 'Net Area', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cType: 'decimal',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_occupiednet: { 
                cLabel: '', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_referencefilename: { 
                cValidate :'', 
                cName:'referencefilename', 
                cLabel: 'Picture File', 
                cSubPortfolio:this.getDataUser().subportfolio_cd,
                cPath:"SaveLocation/SubPortfolio",
                cLabelSize: 4, 
                cOrder:10, 
                cVisible: true, 
                cModule: 'SM', 
                cPlaceholder: 'Choose a file...', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 

			PTAnalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cPageMasterSeq: this.data.PageMasterSeq,
                cFormPageNo: this.data.PageOrder,
				cProtect: false
            }         
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
	,GetDataBy1(){
		return this.$store.getters.GetPage1GetDataBy
	}
  },
    methods: {
        OngrossareaChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                var gross = parseFloat(this.replaceAllString(data, ',', '', 'number'))
                var semigross = parseFloat(this.replaceAllString(this.M_SM_Floor.semigrossarea, ',', '', 'number'))
                var netarea = parseFloat(this.replaceAllString(this.M_SM_Floor.netarea, ',', '', 'number'))

                this.err1 = semigross > gross ? true : false
                this.err2 = netarea > gross ? true : false
            }
            
        })
        this.$forceUpdate()
        },
		OnsemigrossChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                var gross = parseFloat(this.replaceAllString(this.M_SM_Floor.grossarea, ',', '', 'number'))
                var semigross = parseFloat(this.replaceAllString(data, ',', '', 'number'))
                var netarea = parseFloat(this.replaceAllString(this.M_SM_Floor.netarea, ',', '', 'number'))

                this.err1 = semigross > gross ? true : false
            }
        })
        this.$forceUpdate()
        },
        OnnetareaChange (data) {
        this.$nextTick(() => { 
            if (this.inputStatus != "VIEW") {
                var gross = parseFloat(this.replaceAllString(this.M_SM_Floor.grossarea, ',', '', 'number'))
                var semigross = parseFloat(this.replaceAllString(this.M_SM_Floor.semigrossarea, ',', '', 'number'))
                var netarea = parseFloat(this.replaceAllString(data, ',', '', 'number'))

                this.err2 = netarea > gross ? true : false
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
            this.M_SM_Floor.blockcd = data.BlockCd 
            this.propList.initialWhere =" BlockCd = '" + data.BlockCd + "' AND SubPortfolioCd='"+this.getDataUser().subportfolio_cd+"' "
        

            this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

        },		
        M_Insert() {
            if(this.M_SM_Floor.semigrossarea > this.M_SM_Floor.grossarea){
                this.error = true
                this.err1 = true                
                return
            } else {
                this.err1 = false                
                this.error = false
                if(this.M_SM_Floor.netarea > this.M_SM_Floor.grossarea){
                    this.error = true
                    this.err2 = true                
                    return
                } else {
                    this.err2= false                
                    this.error = false
                }
            }
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                FloorCD: this.M_SM_Floor.floorcd,
                BlockCD: this.M_SM_Floor.blockcd,
                Descs: this.M_SM_Floor.descs,
                GrossArea: this.M_SM_Floor.grossarea ? this.replaceAllString(this.M_SM_Floor.grossarea,',','','number') : 0 ,
                SemiGrossArea: this.M_SM_Floor.semigrossarea ? this.replaceAllString(this.M_SM_Floor.semigrossarea,',','','number') : 0 ,
                NetArea: this.M_SM_Floor.netarea ? this.replaceAllString(this.M_SM_Floor.netarea,',','','number') : 0 ,
                ParkingFloor: this.M_SM_Floor.parkingfloor,
                TotalInBuildingParkingArea: this.M_SM_Floor.total,
                TotalPublicArea: this.M_SM_Floor.totalpub,
                DefaultRentalRate: this.M_SM_Floor.default,
                PictureFileName: this.M_SM_Floor.picturefilename,
                ReferenceFileName: this.M_SM_Floor.referencefilename,
                UserInput: this.getDataUser().user_id                 
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return

				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultInsert(response.Message)
					
				
            })
        },
        M_Update() {
            if(this.M_SM_Floor.semigrossarea > this.M_SM_Floor.grossarea){
                this.error = true
                this.err1 = true                
                return
            } else {
                this.err1 = false                
                this.error = false
                if(this.M_SM_Floor.netarea > this.M_SM_Floor.grossarea){
                    this.error = true
                    this.err2 = true                
                    return
                } else {
                    this.err2= false                
                    this.error = false
                }
            }
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                FloorCD: this.M_SM_Floor.floorcd,
                BlockCD: this.M_SM_Floor.blockcd,
                Descs: this.M_SM_Floor.descs,
                ParkingFloor: this.M_SM_Floor.parkingfloor,
                TotalInBuildingParkingArea: this.M_SM_Floor.total,
                TotalPublicArea: this.M_SM_Floor.totalp,
                DefaultRentalRate: this.M_SM_Floor.default,
                PictureFileName: this.M_SM_Floor.picturefilename,
                ReferenceFileName: this.M_SM_Floor.referencefilename,
                GrossArea: this.M_SM_Floor.grossarea ? this.replaceAllString(this.M_SM_Floor.grossarea,',','','number') : 0 ,
                SemiGrossArea: this.M_SM_Floor.semigrossarea ? this.replaceAllString(this.M_SM_Floor.semigrossarea,',','','number') : 0 ,
                NetArea: this.M_SM_Floor.netarea ? this.replaceAllString(this.M_SM_Floor.netarea,',','','number') : 0 ,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_Floor.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                this.$parent.resultUpdate(response.Message)
				
            })
        },
		M_ClearForm(){
            this.M_SM_Floor = {
                floorcd: '',
                blockcd: '',
                descs: '',
                grossarea: '',
                semigrossarea: '',
                netarea: '',
                occupiedgross: '0',
                occupiedsemigross: '0',
                occupiednet: '0',
                assignedgross: '0',
                assignedsemigross: '0',
                assignednet: '0',
                referencefilename: '',
                picturefilename: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                rowid: 0
                    }
            	
		},
        M_New(){
            let data = this.$store.getters.GetPage1Data
            // console.log(data)
            this.M_SM_Floor.blockcd = data.BlockCd 

            this.$refs.ref_floorcd.focus()

        },
        M_Edit(){
            let data = this.$store.getters.GetPage1Data
            this.M_SM_Floor.blockcd = data.BlockCd
            // console.log(data) 
            this.$refs.ref_descs.focus()
        },
        M_Delete(dt){           
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {
                // console.log(value)
				dataDelete.push({
					_Message_:'',
                    SubPortfolioCd: this.getDataUser().subportfolio_cd,
                    FloorCD: value.FloorCd,
                    BlockCD: value.BlockCD,
                    LastUpdateStamp: value.LastUpdateStamp,


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
,                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                blockcd: record.BlockCd,
                floorcd: record.FloorCd				
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
                // console.log(data)
this.M_SM_Floor = {
    blockcd: data.blockcd,
                floorcd: data.floorcd,
                descs: data.descs,
                grossarea: this.isCurrency(data.grossarea, data.decimal),
                semigrossarea: this.isCurrency(data.semigrossarea, data.decimal),
                netarea: this.isCurrency(data.netarea, data.decimal),
                picturefilename: data.picturefilename,
                referencefilename: data.referencefilename,
                assignedgross: this.isCurrency(data.assignedgross, data.decimal),
                assignednet: this.isCurrency(data.assignednet, data.decimal),
                assignedsemigross: this.isCurrency(data.assignedsemigross, data.decimal),
                availablegross: this.isCurrency(data.availablegross, data.decimal),
                availablenet: this.isCurrency(data.availablenet, data.decimal),
                availablesemigross: this.isCurrency(data.availablesemigross, data.decimal),
                occupiedgross: this.isCurrency(data.occupiedgross, data.decimal),
                occupiednet: this.isCurrency(data.occupiednet, data.decimal),
                occupiedsemigross: this.isCurrency(data.occupiedsemigross, data.decimal),
                userinput: data.userinput,
                useredit: data.useredit,
                timeinput: data.timeinput,
                timeedit: data.timeedit,
                lastupdatestamp: record.LastUpdateStamp,
                rowid: this.isCurrency(data.rowid, this.decimal)
                    }
                 

  

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        }
        ,getFileName(fileName) {
         this.M_SM_Floor.picturefilename = fileName 
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

