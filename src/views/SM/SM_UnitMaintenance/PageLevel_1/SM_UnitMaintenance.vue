<template>
    <div>
        <div v-show="$parent.isDetail" :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
            </div>
            <b-collapse id="collapse1" :visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">     
					<b-col md="12" id="col-left" class="bColMasterForm">
                        <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <b-row style="padding-left:10px;">					
                                <b-col md="12" id="col-left">
                                    <b-row>
                                        <b-col  md="4">
                                            <ABSInputSelectList @change="OnbaselotnoChange" :prop="PI_baselotno" :value="baselotno" :label="baselotnoLabel" ref="ref_baselotno"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col  md="10" style="margin-left: -288px !important;">
                                            <ABSinputCheckBox @input="OnstatusChange" :prop="PI_status" v-model="status" ref="ref_status"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="4" style="padding-right: 15px !important;">
                                            <input
                                            v-model="search"
                                            type="text"
                                            class="form-control text-field-form"
                                            style="margin-left: 20px !important;"
                                            placeholder="Search..."
                                            :tabindex="3"
                                            autocomplete="off"
                                            @keyup.enter="onSearchEnter"
                                            >
                                        </b-col>
                                    </b-row>
                                    <b-row style="padding-top:10px; padding-right: 10px; padding-left: 20px; padding-bottom: 10px; !important;">
                                      <b-col md="4">
                                        All Unit No
                                        <ABSMultiSelect
                                            v-model="leftData"
                                            :options="leftDataOptions"
                                            size=10
                                            class="selectCustom"
                                        />
                                      </b-col>
                                      <b-col md="1" style="padding: 120px 8px;">
                                        <b-button size="sm" variant="primary" @click="moveAllToRight" style="width:50px">
                                            &gt;&gt;
                                        </b-button>
                                        <br>
                                        <b-button size="sm" variant="primary" @click="moveToRight" style="width:50px;margin-top:10px;">
                                            &gt;
                                        </b-button>
                                        <br>
                                        <b-button size="sm" variant="primary" @click="moveToLeft" style="width:50px;margin-top:10px;">
                                            &lt;
                                        </b-button>
                                        <br>
                                        <b-button size="sm" variant="primary" @click="moveAllToLeft" style="width:50px;margin-top:10px;">
                                            &lt;&lt;
                                        </b-button>
                                      </b-col>
                                      <b-col md="4">
                                        Selected Unit No
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
            FormType: "Form",
            Module:"SM",
            allDataOptions: [],
            leftData: [],
            leftDataOptions: [],
            rightData: [],
            rightDataOptions: [],
            search: '',
            baselotno: '',
            baselotnoLabel: '',
            status: [],
            headerstatus: '', 
            sellingpricestatus: '',
            paymentschemestatus: '',
            facilitystatus: '', 
            accessorystatus: '', 
            accomodationstatus: '', 
            layoutstatus: '',

            PI_baselotno: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupTNLot'    , 
                    ColumnDB: 'LotNo'   , 
                    InitialWhere: "SUBPORTFOLIOCD = '"+this.getDataUser().subportfolio_cd+"'"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'baselotno', 
                cLabel: 'Base Unit No', 
                cKey: false, 
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
                cDisplayColumn: 'LotNo,Descs' ,
            },
            PI_status: { 
                cValidate :'', 
                cName: 'status', 
                // cLabel: 'Address Category', 
                // cLabelSize: 4, 
                cOptions: [{ text: 'Header', value: 'H' }, { text: 'Selling Price', value: 'S' }, { text: 'Payment Scheme', value: 'P' }, { text: 'Facility', value: 'F' }, { text: 'Accessory', value: 'A' }, { text: 'Accomodation', value: 'C' },{ text: 'Layout', value: 'L' }], 
                cOrder: 2, 
                cKey: false, 
                cVisible: true, 
                cProtect: false, 
                cDefault: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
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
    }
  },
    methods: {
        OnbaselotnoChange (data) {
            this.baselotno = data.id
            this.baselotnoLabel = data.label
            this.getAllColumn('')
        },
        OnstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{status}
            }
        })
        this.$forceUpdate()
        },
        onSearchEnter (e) {
           if (e.keyCode === 13) {//ENTER
            this.getAllColumn(this.search)
            }
            // else if (e.keyCode === 50) {
            // alert('@ was pressed');
            // }    
        },
        getAllColumn (search) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                UserId: this.getDataUser().user_id,
                PortfolioCd: this.getDataUser().portfolio_cd, 
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                LineNo: 0,
                InitialWhere: "LotNo like '%" +search+"%' OR Descs like '%" +search+"%'",
                SortField: 'Descs',
                ParamView: "'"+this.getDataUser().subportfolio_cd+"', '"+this.baselotno+"'"
            }
            this.postEncode( this.getUrlDataList(), param )
            .then( response => {
                this.$store.commit('setStatusLoader', false)
                if (response == null) return
                this.allDataOptions = response.Data
                this.leftDataOptions = []
                this.rightDataOptions = []
                var status = false
                for (var x = 0; x < this.allDataOptions.length; x++) {
                    // status = false
                    // for (var y = 0; y < this.rightDataOptions.length; y++) {
                    //     if (this.allDataOptions[x].LotNo == this.rightDataOptions[y].value) {
                    //         status = true
                    //         break
                    //     }
                    // }
                    // if (status == false) {
                        // console.log(this.leftDataOptions.length)
                        // console.log(this.allDataOptions.length)
                        this.leftDataOptions.push({
                            value: this.allDataOptions[x].LotNo,
                            key:    this.allDataOptions[x].Descs,
                            RowId: this.allDataOptions[x].row_id
                        })
                    // }
                }
                this.$forceUpdate()
            })
            // var param = {
            //     OptionSeq: this.getOptionSeq().OptionSeq,
            //     LineNo: 0,
            //     SubPortfolioCd: this.getDataUser().subportfolio_cd,
            //     BaseLotNo: this.baselotno
            // }

            // this.postJSON( this.getUrlById(), param )
            // .then( response => {
            //     this.$store.commit('setStatusLoader', false)
            //     if (response == null) return
            //     this.allDataOptions = response.Data
            //     this.leftDataOptions = []
            //     this.rightDataOptions = []
            //     for (var x = 0; x < this.allDataOptions.length; x++) {
            //         // console.log(this.allDataOptions[x])
            //         this.leftDataOptions.push({
            //             value: this.allDataOptions[x].lotno,
            //             key: this.allDataOptions[x].descs,
            //             RowId: this.allDataOptions[x].rowid
            //         })
            //     }
            //     this.$forceUpdate()
            // })
        },
        getRightColumn () {
            this.$store.commit('setStatusLoader', true)
            this.baselotno = ''
            this.baselotnoLabel = ''
            this.status= []

            this.getAllColumn('')
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
            this.getToolbar().statusFunction[5].disabled = false
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
        M_Post(){
        },
        M_Refresh(){
        },
		doDoubleClick(){
        },
		m_ClearForm(){
		},
        M_New(){
            this.$refs.ref_baselotno.focus()
        },
        M_Edit() {
            this.$refs.ref_baselotno.focus()
        },
        M_Delete(){
        },
        M_Insert () {
        },
        M_Update () {
        },
        M_Save () {
            var param1 = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 1,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                LotNo: this.baselotno,
                HeaderStatus: this.status.indexOf('H') >= 0 ? 'Y' : 'N',
                SellingPriceStatus: this.status.indexOf('S') >= 0 ? 'Y' : 'N',
                PaymentSchemeStatus: this.status.indexOf('P') >= 0 ? 'Y' : 'N',
                FacilityStatus: this.status.indexOf('F') >= 0 ? 'Y' : 'N',
                AccessoryStatus: this.status.indexOf('A') >= 0 ? 'Y' : 'N',
                AccomodationStatus: this.status.indexOf('C') >= 0 ? 'Y' : 'N',
                LayoutStatus: this.status.indexOf('L') >= 0 ? 'Y' : 'N',
            }

            this.postJSON( this.getUrlById(), param1 )
            .then( response => {
                if (response.Data.length < 1 && this.rightDataOptions.length < 1) {
                    this.alertError('Please verify Base Unit No, Selected Unit No!')
                    return
                }

                var dataToSave = []

                // insert data
                for (var x = 0; x < this.rightDataOptions.length; x++) {
                    var data = this.rightDataOptions[x]
                    dataToSave.push({
                        SubPortfolioCd: this.getDataUser().subportfolio_cd,
                        BaseLotNo: this.baselotno,
                        LotNo: data.value,
                        HeaderStatus: this.status.indexOf('H') >= 0 ? 'Y' : 'N',
                        SellingPriceStatus: this.status.indexOf('S') >= 0 ? 'Y' : 'N',
                        PaymentSchemeStatus: this.status.indexOf('P') >= 0 ? 'Y' : 'N',
                        FacilityStatus: this.status.indexOf('F') >= 0 ? 'Y' : 'N',
                        AccessoryStatus: this.status.indexOf('A') >= 0 ? 'Y' : 'N',
                        AccomodationStatus: this.status.indexOf('C') >= 0 ? 'Y' : 'N',
                        LayoutStatus: this.status.indexOf('L') >= 0 ? 'Y' : 'N',
                        UserInput: this.getDataUser().user_id
                    })
                }

                var param2 = {			
                    OptionSeq: this.getOptionSeq().OptionSeq,
                    LineNo: 2,
                    Data: dataToSave
                }

                this.postJSONMulti(this.getUrlInsertMulti(), param2)
                .then((response) => {
                    if (response == null) return
                    
                    this.alertSuccess('Success...')
                    .then(() => {
                        this.getRightColumn()
                        this.baselotno = ''
                        this.baselotnoLabel = ''
                        this.search = ''
                    })
                })
            })
        },
        paramFromParent(){
        },
		M_Cancel() {
            this.getRightColumn()
            this.baselotno = ''
            this.baselotnoLabel = ''
            this.search = ''
        },
        rowClicked (record, index) {
        },
        rowLink: function(url){
        },
        getDataBy (record) {
        }

    },
    beforeCreate: function () {
    },
    created: function() {
        this.$parent.isDetail = true
        this.$store.commit('setStatus','new')
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.$store.commit('setFormType','Form')
        this.getToolbar().ProcessPS()
        this.hideSideBarMenu()
        this.getToolbar().doEdit(true)
        this.getRightColumn()
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

