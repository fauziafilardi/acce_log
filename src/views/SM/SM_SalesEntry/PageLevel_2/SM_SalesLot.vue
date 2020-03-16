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
						<b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <b-row style="padding-left:10px;">					
                                <b-col md="12" id="col-left"> <!-- table open -->
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_lotno" v-model="M_SM_SalesLot.lotno"  ref="ref_lotno" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSCompute :prop="PI_status" v-model="M_SM_SalesLot.status"  ref="ref_status" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_lottype" v-model="M_SM_SalesLot.lottype"  ref="ref_lottype" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSCompute :prop="PI_directioncd" v-model="M_SM_SalesLot.directioncd"  ref="ref_directioncd" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_propertytypecd" v-model="M_SM_SalesLot.propertytypecd"  ref="ref_propertytypecd" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSCompute :prop="PI_sectorcd" v-model="M_SM_SalesLot.sectorcd"  ref="ref_sectorcd" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnropertycategoryChange" :prop="PI_ropertycategory" v-model="M_SM_SalesLot.ropertycategory"  ref="ref_ropertycategory" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSCompute :prop="PI_viewcd" v-model="M_SM_SalesLot.viewcd"  ref="ref_viewcd" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_blockcd" v-model="M_SM_SalesLot.blockcd"  ref="ref_blockcd" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSCompute :prop="PI_measurementcd" v-model="M_SM_SalesLot.measurementcd"  ref="ref_measurementcd" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_floorcd" v-model="M_SM_SalesLot.floorcd"  ref="ref_floorcd" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_descs" v-model="M_SM_SalesLot.descs"  ref="ref_descs" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_grossarea" v-model="M_SM_SalesLot.grossarea"  ref="ref_grossarea"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_address1" v-model="M_SM_SalesLot.address1"  ref="ref_address1" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_semigrossarea" v-model="M_SM_SalesLot.semigrossarea"  ref="ref_semigrossarea"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_address2" v-model="M_SM_SalesLot.address2"  ref="ref_address2" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_netarea" v-model="M_SM_SalesLot.netarea"  ref="ref_netarea"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_address3" v-model="M_SM_SalesLot.address3"  ref="ref_address3" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_landarea" v-model="M_SM_SalesLot.landarea"  ref="ref_landarea"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_address4" v-model="M_SM_SalesLot.address4"  ref="ref_address4" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_zipcode" v-model="M_SM_SalesLot.zipcode"  ref="ref_zipcode" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputRadioButtonVuex @input="OnfurnishedChange" :prop="PI_furnished" v-model="M_SM_SalesLot.furnished"  ref="ref_furnished" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSCompute :prop="PI_citycd" v-model="M_SM_SalesLot.citycd"  ref="ref_citycd" />
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_parkinglot" v-model="M_SM_SalesLot.parkinglot"  ref="ref_parkinglot"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_totalroom" v-model="M_SM_SalesLot.totalroom"  ref="ref_totalroom"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputTextVuex :prop="PI_electricity" v-model="M_SM_SalesLot.electricity"  ref="ref_electricity"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex :prop="PI_yeardevelopment" v-model="M_SM_SalesLot.yeardevelopment"  ref="ref_yeardevelopment"/>
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
            FormType: "View",
			Module:"SM",
       
            IEBy: {Input: '', Edit: ''},   			

            M_SM_SalesLot :{
                lotno: '',
                status: '',
                lottype: '',
                directioncd: '',
                direction: '',
                propertytypecd: '',
                propertytype: '',
                sectorcd: '',
                sector: '',
                ropertycategory: '',
                viewcd: '',
                view: '',
                blockcd: '',
                block: '',
                measurementcd: '',
                measurement: '',
                floorcd: '',
                floor: '',
                descs: '',
                grossarea: 0,
                address1: '',
                semigrossarea: 0,
                address2: '',
                netarea: 0,
                address3: '',
                landarea: 0,
                address4: '',
                zipcode: '',
                furnished: '',
                citycd: '',
                city: '',
                parkinglot: 0,
                totalroom: 0,
                electricity: 0,
                yeardevelopment: 0
                    }
            ,
            PI_lotno: { 
                cLabel: 'Unit No ', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_status: { 
                cLabel: 'Status', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_lottype: { 
                cLabel: 'Unit Type', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_directioncd: { 
                cLabel: 'Direction', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_propertytypecd: { 
                cLabel: 'Property Type', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_sectorcd: { 
                cLabel: 'Sector', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_ropertycategory: { 
                cValidate :'', 
                cName: 'ropertycategory', 
                cId: 'rdbropertycategory', 
                cRadioOptions: [{ text: 'Building', value: 'B' },{ text: 'Land', value: 'L' },{ text: 'Building Land', value: 'N' },], 
                cRadioDefaultOption: '', 
                cLabel:'Property Category', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 0, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_viewcd: { 
                cLabel: 'View', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_blockcd: { 
                cLabel: 'Block', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_measurementcd: { 
                cLabel: 'Measurement', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_floorcd: { 
                cLabel: 'Floor', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_descs: { 
                cLabel: 'Description', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_grossarea: { 
                cLabel: 'Gross Area', 
                cLabelSize: 4, 
                cValue: '', 
                cType: 'decimal',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_address1: { 
                cLabel: 'Address', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_semigrossarea: { 
                cLabel: 'Semi Gross Area', 
                cLabelSize: 4, 
                cValue: '', 
                cType: 'decimal',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_address2: { 
                cLabel: '', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_netarea: { 
                cLabel: 'Net Area', 
                cLabelSize: 4, 
                cValue: '', 
                cType: 'decimal',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_address3: { 
                cLabel: '', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_landarea: { 
                cLabel: 'Land Area', 
                cLabelSize: 4, 
                cValue: '', 
                cType: 'decimal',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_address4: { 
                cLabel: '', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_zipcode: { 
                cLabel: 'Zip Code', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_furnished: { 
                cValidate :'', 
                cName: 'furnished', 
                cId: 'rdbfurnished', 
                cRadioOptions: [{ text: 'Un-Furnished', value: 'U' },{ text: 'Semi-Furnished', value: 'S' },{ text: 'Fully-Furnished', value: 'F' },], 
                cRadioDefaultOption: '', 
                cLabel:'Furnished', 
                cLabelSize: 4, 
                cDefault: '', 
                cOrder: 26, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_citycd: { 
                cLabel: 'City', 
                cLabelSize: 4, 
                cValue: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_parkinglot: { 
                cLabel: 'Parking Lot', 
                cLabelSize: 4, 
                cValue: '', 
                cType: 'decimal',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_totalroom: { 
                cLabel: 'Total Room', 
                cLabelSize: 4, 
                cValue: '', 
                cType: 'decimal',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_electricity: { 
                cLabel: 'Electricity', 
                cLabelSize: 4, 
                cValue: '', 
                cType: 'decimal',
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cVisible: true 
            }, 
            PI_yeardevelopment: { 
                cLabel: 'Year Of Development', 
                cLabelSize: 4, 
                cValue: '', 
                cType: 'decimal',
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
        OnropertycategoryChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{ropertycategory}
            }
        })
        this.$forceUpdate()
        },
        OnfurnishedChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{furnished}
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
            // this.$parent.showForm = true
			      // this.$store.commit('setNewStatus', false)
            this.FormType = "View"
                this.$store.commit('setFormType','View')
                this.getToolbar().ProcessPS()
            this.getDataBy()
            // this.FormToABSList().doGetList('','eb_getList')
        },		
		M_CheckboxChecked(data, status, index){

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
            this.M_SM_SalesLot = {
                lotno: '',
                status: '',
                lottype: '',
                directioncd: '',
                direction: '',
                propertytypecd: '',
                propertytype: '',
                sectorcd: '',
                sector: '',
                ropertycategory: '',
                viewcd: '',
                view: '',
                blockcd: '',
                block: '',
                measurementcd: '',
                measurement: '',
                floorcd: '',
                floor: '',
                descs: '',
                grossarea: 0,
                address1: '',
                semigrossarea: 0,
                address2: '',
                netarea: 0,
                address3: '',
                landarea: 0,
                address4: '',
                zipcode: '',
                furnished: '',
                citycd: '',
                city: '',
                parkinglot: 0,
                totalroom: 0,
                electricity: 0,
                yeardevelopment: 0
                    }
            	
		},
        M_New(){



        },
        M_Edit(){
        },
        M_Delete(dt){           
			var data = this.FormToABSList().getRowSelected()  
			var dataDelete = []

			
			data.forEach((value) => {

				
				dataDelete.push({
					_Message_:'',


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
        getDataBy () {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                LotNo: this.DataRowPage1.LotNo,
                OrderNo: this.DataRowPage1.OrderNo	
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                if(response == null) return

                var data = response.Data[0]
this.M_SM_SalesLot = {
                lotno: data.lotno,
                status: data.salesstatusdescs,
                lottype: data.lottype+ this.separator + data.lottypedescs,
                directioncd: data.directioncd + this.separator + data.directiondescs,
                propertytypecd: data.propertytypecd + this.separator + data.propertytypedescs,
                propertytype: data.propertytype,
                sectorcd: data.sectorcd+ this.separator + data.sectordescs,

                ropertycategory: data.propertycategory,
                viewcd: data.viewcd,
                view: data.view,
                blockcd: data.blockcd + this.separator +  data.blockdescs,
                block: data.block,
                measurementcd: data.measurementcd,
                measurement: data.measurement,
                floorcd: data.floorcd + this.separator + data.floordescs,
                floor: data.floor,
                descs: data.descs,
                grossarea: this.isCurrency(data.grossarea, this.decimal),
                address1: data.address1,
                semigrossarea: this.isCurrency(data.semigrossarea, this.decimal),
                address2: data.address2,
                netarea: this.isCurrency(data.netarea, this.decimal),
                address3: data.address3,
                landarea: this.isCurrency(data.landarea, this.decimal),
                address4: data.address4,
                zipcode: data.zipcode,
                furnished: data.furnished,
                citycd: data.citycd + this.separator + data.citydescs,
                city: data.city,
                parkinglot: this.isCurrency(data.parkinglot, this.decimal),
                totalroom: this.isCurrency(data.totalroom, this.decimal),
                electricity: this.isCurrency(data.electricity, this.decimal),
                yeardevelopment: this.isCurrency(data.yeardevelopment, this.decimal)
                    }
                 

  //cRadioOptions: [{ text: 'Building', value: 'B' },{ text: 'Land', value: 'L' },{ text: 'Building &amp; Land', value: 'N' },], 
             
              //   switch(data.propertycategory) {
              //   case "N":
              //     this.M_SM_SalesLot.ropertycategory = 'Building Land'
              //     break;
              //   case "L":
              //     this.M_SM_SalesLot.ropertycategory = 'Land'
              //     break;
              //   default:
              //     this.M_SM_SalesLot.ropertycategory = 'Building'
              // } 

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

