<template>
    <div>
        <ABSListVuex
            :prop="propList"
            :title = "data.query_name"
            @rowClicked="rowClicked"
            @rowDblClicked="doDoubleClick"
            @rowLinkClick="rowLink"
        />

        <div v-show="$parent.isDetail"  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div>
            <b-collapse id="collapse1" :visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                    <b-col md="5" id="col-left" class="bColMasterForm">
                        <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <ABSinputTextVuex :prop="PI.ProvinceCd" v-model="M_CM_Province.ProvinceCd"/>
                            <ABSinputTextVuex :prop="PI.Descs" v-model="M_CM_Province.Descs"/>
                            <!-- <ABSinputTextVuex :prop="PI.CountryCd" v-model="M_CM_Province.CountryCd"/> -->
                            <ABSInputSelectVuex @change="onChange" :prop="PI.CountryCd" v-model="M_CM_Province.CountryCd"/>
                            <ABSinputTextVuex :prop="PI.Remarks" v-model="M_CM_Province.Remarks"/>
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
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
            LastUpdateStamp: null,
            propList: {
                initialWhere: "",
                LineNo: 0,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex
            },
            M_CM_Province: {
                ProvinceCd: null,                
                Descs: null,
                CountryCd: null,
                Remarks: null                
            },
            IEBy: {Input: '', Edit: ''},
            PI: {
                ProvinceCd: {
                    cValidate: 'required|min:2|max:4',
                    cName: 'ProvinceCd',
                    cLabel: 'Province Code',
                    // cLabelSize: 5,
                    cOrder: 1,
                    cKey: true,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                },
                Descs: {
                    cValidate: 'required|min:1|max:60',
                    cName: 'Descs',
                    cLabel: 'Description',
                    //cLabelSize: 5,
                    cOrder: 2,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                },
                CountryCd: {
                    dataLookUp: {
                        LookUpCd: 'GetCountryCd',
                        ColumnDB: 'CountryCd',
                        InitialWhere: '',
                        ParamWhere: ''
                    },
                    cValidate: 'required',
                    cName: 'CountryCd',
                    cLabel: 'Country Code',
                    cOrder: 3,
                    cType: 'lookup',
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                },
                Remarks: {
                    cValidate: 'min:1|max:60',
                    cName: 'Remarks',
                    cLabel: 'Remarks',
                    // cLabelSize: 5,
                    cOrder: 4,
                    cKey: false,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                }                
            },
            PTAnalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cPageMasterSeq: this.data.PageMasterSeq,
                cFormPageNo: this.data.PageOrder
            }            
        }
    },
    methods: {
        M_PageSize(){

        },
        M_TabClick(){

        },
        M_Pagination(){

        },
        M_Advance_Filter(){

        },
        M_Search(data){
            this.$store.commit('setEventStatus', 'ONSEARCHENTER')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
            this.FormToABSList().doGetList(data,'eb_getList')
        },
        M_Post(){

        },
        M_Refresh(){

        },
        M_New(){
            this.$parent.state = 'NEW'
            this.$refs.ref_provincecd.focus()
            this.M_CM_Province.ProvinceCd = ''
            this.M_CM_Province.Descs = ''
            this.M_CM_Province.CountryCd = ''
            this.M_CM_Province.Remarks = ''           

            this.FormToMasterPage().ValidasiPage()
            this.$parent.isDetail = true

            // this.$nextTick().then(() => document.getElementById("ProvinceCd").focus())
        },
        M_Edit(){
            this.$refs.ref_descs.focus()
            // this.$nextTick().then(() => document.getElementById("ProvinceCd").focus())
        },
        M_Delete(){
            var data = this.FormToABSList().getRowSelected()
            var dt = ''

            data.forEach((value) => {
                dt = dt + value.row_id + ','
            })

            dt = dt.slice(0,-1)

            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                SubPortfolioCd:this.getDataUser().subportfolio_cd,
                PortfolioCd:this.getDataUser().portfolio_cd,
                LineNo: 0,
                Data: dt
            }
            
            this.postJSONMulti( this.getUrlDeleteMulti(), param )
            .then(response => {
                if(response.Error){
                    // return
                    var html = ''
                    var fields = [
                        {key: 'Data', label: 'Data', sortable: false},
                        {key: 'Error_Message', label: 'Error Message', sortable: false}
                    ]
                    
                    html += '<table border=1>'
                    html += '<thead><tr>'
                    html += '<th> Data </th> <th> Error Message </th>'
                    html += '</tr></thead><tbody>'
                    response.Data.forEach(val => {
                        html += '<tr>'
                        html += '<td> ' + val.Data + ' </td> <td> ' + val.ErrorMsg + ' </td>'
                        html += '</tr>'
                    })

                    html += '</tbody></table>'

                    // console.log(dataError)

                    this.alertWithHtml('Error', 'error', html)
                }
                else {
                    this.alertSuccess("Deleting Data Successfully")
                    this.$parent.isDetail = false

                    // this.$parent.EbData.Event = 'delete'
                    // this.$parent.EbData.Key = ''
                    
                    // EventBus.$emit('ToOpen', this.$parent.EbData)
                    this.FormToMasterPage().ValidasiPage()

                    // Refresh List
                    // EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
                    this.FormToABSList().doGetList('','eb_getList')
                }
            })
        },
        M_Save(){
            this.M_CM_Province.OptionSeq = this.getOptionSeq().OptionSeq
            this.M_CM_Province.LineNo = 0

            if(this.$store.getters.getStatus.toUpperCase() !== 'NEW'){
                this.M_CM_Province.UserEdit = this.getDataUser().user_id
                this.M_CM_Province.LastUpdateStamp = this.LastUpdateStamp
                this.postJSON(this.getUrlUpdate(), this.M_CM_Province)
                .then((response) => {
                    if(response == null) {
                        return
                    }

                    delete this.M_CM_Province['UserEdit']
                    this.FormToABSList().doGetList('','eb_getList')

                    this.alertSuccess(response.Message)
                    .then(() => {
                        this.getToolbar().setButton(false)
                        this.$store.commit('setListDisable', false)
                        this.$store.commit('setStatus', 'view')
                        this.FormToABSList().doGetList('','eb_getList')
                        delete this.M_CM_Province['LastUpdateStamp']
                    })
                })
            }
            else {
                this.M_CM_Province.UserInput = this.getDataUser().user_id
                // alert('save api')
                // console.log(this.M_CM_Province)
                // delete this.M_CM_Province['LastUpdateStamp']
                this.postJSON(this.getUrlInsert(), this.M_CM_Province)
                .then((response) => {
                    if(response == null) {
                        return
                    }
                    delete this.M_CM_Province['UserInput']
                    this.FormToABSList().doGetList('','eb_getList')

                    this.alertSuccess(response.Message)
                    .then(() => {
                        this.getToolbar().setButton(false)
                        this.$store.commit('setListDisable', false)
                        this.$store.commit('setStatus', 'view')
                        this.FormToABSList().doGetList('','eb_getList')
                    })
                })
            }
            this.FormToMasterPage().ValidasiPage()
        
        },
        paramFromParent(){

        },
        rowClicked (record, index) {
            this.$parent.state = 'UPDATE'
            this.$store.commit('SetPage1Data', record)
            this.$store.commit('setEventStatus', 'rowClick')
            this.$store.commit('setLevel',this.PageLevel)
            this.getDataBy(record)
            this.$parent.isDetail = true

            this.LastUpdateStamp = record.LastUpdateStamp

            this.FormToMasterPage().ValidasiPage()
        },
        rowLink: function(url){
            this.$refs.modalTest.show()
        },
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 0,
                ProvinceCd: record.ProvinceCd
            }           

            this.postJSON( this.getUrlById(), param )
                .then( response => {
                // this.clearForm('edit')
                if(response == null) return
                var data = response.Data
                if(data.length > 0){
                    data = data[0]
                    this.$nextTick(() => {
                        this.M_CM_Province.ProvinceCd = data.ProvinceCd                       
                        this.M_CM_Province.Descs = data.Descs
                        this.M_CM_Province.CountryCd = data.CountryCd
                        this.M_CM_Province.Remarks = data.Remarks
                        // this.M_CM_Province.LastUpdateStamp = data.LastUpdateStamp                        

                        EventBus.$emit('ebSetValue' + this.PI.CountryCd.cName + '_' + this.PageLevel + '_' + this.TabIndex, {data: data.CountryCd, action: 'getByID'})
                       
                    })
                    
                    this.IEBy.Input = data.userinput
                    this.IEBy.Edit = data.useredit
                }
            })
        },
        onChange (data) {
            var from = data.from
            //CountryCd
            if (from == (this.PI.CountryCd.cName + "_" + this.PageLevel + "_" + this.TabIndex)) {
                if(data.value && data.value.id !== ''){
                    this.M_CM_Province.CountryCd = data.value.id
                }
            }
        },
    },
    beforeCreate: function () {
    },
    created: function() {
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