<template>
    <div>
        <ABSListVuex
            :prop="propList"
            :title="$parent.data.QueryName"
            @rowClicked="rowClicked"
            @rowDblClicked="doDoubleClick"
            @rowLinkClick="rowLink"
            @pageSize="M_PageSize"
            @pagination="M_Pagination"
            @filter="M_Advance_Filter"
            @headTable="M_Head_Table" />
        
        <!-- <hr class="line-grid-border" /> -->
        
        <div v-show="$parent.isDetail" style="margin-top:10px;">
            <div class="div-collapse" v-b-toggle.collapse2>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" />  
                </span>
            </div>
            <b-collapse id="collapse2" :visible="true">
                <b-row style="padding-left: 10px; !important; padding-bottom: 5px; !important;">
                    <b-col md="5" id="col-left">
                        <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <ABSinputTextVuex :prop="PI_CityCd" v-model="M_CM_City.CityCd"/>
                            <ABSinputTextVuex :prop="PI_Descs" v-model="M_CM_City.Descs"/>
                            <ABSInputSelectVuex @change="onProvinceCdChange" :prop="PI_ProvinceCd" v-model="M_CM_City.ProvinceCd"/>
                        </b-form>
                    </b-col>
                </b-row>
            </b-collapse>            
        </div>
    </div>
</template>

<script>

import { LEVEL } from '../../../../store/mutation-types';
export default {
    props: {PageLevel:'', TabIndex: ''},
    data() {
        return {
            ValKey:null,
            state:null,
            propList: {
                initialWhere: "CountryCd = '" + this.ValKey + "'",
                LineNo: 1,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex
            },
            isDetail: false,
            M_CM_City_Temp: {},
            disabledBtnReset: false,
            M_CM_City: {
                CityCd:'',
                Descs: null,
                ProvinceCd: null
            },
            IEBy: {Input: '', Edit: ''},
            PI_CityCd: {
                cValidate: 'required|min:2|max:4',
                cName: 'CityCd',
                cLabel: 'City Code',
                //cLabelSize: 5,
                cOrder: 2,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_Descs: {
                cValidate: 'required|min:1|max:60',
                cName: 'Descs',
                cLabel: 'Description',
                //cLabelSize: 5,
                cOrder: 3,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_ProvinceCd: {
                dataLookUp: {
                        LookUpCd: 'GetProvinceCd',
                        ColumnDB: 'ProvinceCd',
                        InitialWhere: '',
                        ParamWhere: ''
                    },
                    cValidate: 'required',
                    cName: 'ProvinceCd',
                    cLabel: 'Province Code',
                    cOrder: 4,
                    cSelected: null,
                    cType: 'lookup',
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            listTab: [],
            listDynamicTab: [],
            DataPost:null,
            DataDelete:null,
            EbData:{
                Key:null,
                Event:null,
                PageLevel:this.PageLevel,
                TabIndex: this.TabIndex
            }
        }
    },
    methods: {
        M_Head_Table () {
            this.$store.commit('setEventStatus', 'HEADTABLE')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
        },
        M_PageSize(){
            this.$store.commit('setEventStatus', 'PAGESIZE')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
        },
        M_TabClick(){

        },
        M_Pagination(){
            this.$store.commit('setEventStatus', 'PAGINATION')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
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
        M_Search(data){
            this.$store.commit('setEventStatus', 'ONSEARCHENTER')
           this.$store.commit('setLevel',this.PageLevel)
           this.$parent.isDetail = false
           this.FormToMasterPage().ValidasiPage()
           this.FormToABSList().doGetList(data,'eb_getList')
       },
        M_Refresh(){
            this.$parent.isDetail = false
            this.FormToABSList().doGetList('','refresh')

        },
        M_Edit(){
            alert('edit 2')

        },
        M_New(){//Button new
        
            // let Level = this.$store.getters.getLevel
            // let TabIndex = this.$store.getters.getTab
            // this.isDetail = true
            this.$parent.state = 'NEW'
            this.$parent.EbData.PageLevel = this.PageLevel
            this.$parent.EbData.Event = 'new'

            this.FormToMasterPage().ValidasiPage(this.$parent.EbData)
            this.$parent.isDetail = true
             this.M_CM_City = {
                CityCd:'',
                Descs: null,
                ProvinceCd: null
            }
            EventBus.$emit('ebSetValue' + this.PI_ProvinceCd.cName + '_' + this.PageLevel + '_' + this.TabIndex, {data: '', action: 'new'})
            // if(Level = this.PageLevel){

            // }
        },
        M_Search(data){
            this.$store.commit('setEventStatus', 'ONSEARCHENTER')
            this.$store.commit('setLevel',this.PageLevel)
            this.$parent.isDetail = false
            this.FormToMasterPage().ValidasiPage()
            // alert(data)
            this.FormToABSList().doGetList(data,'eb_getList')
        },
        M_Cancel(){
            alert('cancel')
        },
        M_Post(){

        },
        paramFromParent(){
            //for getdataby
            alert('tayo')
            this.$parent.isDetail = false
            let data = this.$store.getters.GetPage1Data
            // console.log('paramFromParent',data)
             this.propList.initialWhere = "CountryCd = '" + data.CountryCd + "'"
            this.ValKey = data.CountryCd
            this.M_CM_City.CountryCd = data.CountryCd
        

            this.FormToABSList().doGetList('','eb_getList')
        
        },
        M_Delete(){
            //dpt all data row selected
            let dataselected =  this.FormToABSList().getRowSelected()
            //filter data rowId
            var dataRowId = this.getSelected(dataselected)
            //do Delete with data filter
            this.doDelete(dataRowId);
        },
        doDelete(data){
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                SubPortfolioCd:this.getDataUser().subportfolio_cd,
                PortfolioCd:this.getDataUser().portfolio_cd,
                LineNo: 1,
                Data: data
            }
            
            this.postJSON( this.getUrlDeleteMulti(), param )
            .then(response => {
                // response from API
                if(response == null) return

                this.responses = response
                // data
                // if()
                // if(this.responses.Data.length > 0){
                //   //show yang error aja
                // }
                // else {
                this.alertSuccess("Deleting Data Successfully")
                this.$parent.isDetail = false
                this.$store.commit('setEventStatus', 'delete')
                // this.$store.commit('setLevel',this.PageLevel)
                this.FormToMasterPage().ValidasiPage()
                // this.EbData.TabIndex = this.TabIndex
                this.FormToABSList().doGetList('','eb_getList')
            })
        },
        M_Save(){                
                this.M_CM_City.OptionSeq = this.getOptionSeq().OptionSeq
                this.M_CM_City.LineNo = 1
                // var tempRate = this.M_CM_City.Rate
                // this.M_CM_City.Rate = this.M_CM_City.Rate.replace(',','')

                // if(this.M_CM_City.CityCd !== ''){
                if(this.$parent.state !== 'NEW'){//update
                    this.M_CM_City.UserEdit = this.getDataUser().user_id
                    this.M_CM_City.LastUpdateStamp = this.M_CM_City_Temp.LastUpdateStamp
                    this.postJSON(this.getUrlUpdate(), this.M_CM_City)
                    .then((response) => {
                        if(response == null) {
                            // this.M_CM_City.Rate = tempRate
                            return
                        }

                        // this.M_CM_City.Rate = tempRate
                        delete this.M_CM_City['UserEdit']
                        // EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
                        this.alertSuccess(response.Message)
                        .then(() => {
                            // EventBus.$emit('ebToolbar', 'view')
                            // EventBus.$emit('ebSaveSuccess_' + this.PageLevel + '_' + this.TabIndex)
                            this.getToolbar().setButton(false)
                            this.$store.commit('setListDisable', false)
                            this.$store.commit('setStatus', 'view')
                            this.FormToABSList().doGetList('','eb_getList')
                        })
                    })
                }
                else {//insert
                    this.M_CM_City.UserInput = this.getDataUser().user_id
                    
                    // alert('save api')
                    // console.log(this.M_CM_City)
                    this.postJSON(this.getUrlInsert(), this.M_CM_City)
                    .then((response) => {
                        if(response == null) {
                            // this.M_CM_City.Rate = tempRate
                            return
                        }
                        // this.M_CM_City.Rate = tempRate
                        delete this.M_CM_City['UserInput']
                        EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
                        this.isDetail = false
                        this.alertSuccess(response.Message)
                        .then(() => {
                            // EventBus.$emit('ebToolbar', 'view')
                            // EventBus.$emit('ebSaveSuccess_' + this.PageLevel + '_' + this.TabIndex)
                            this.getToolbar().setButton(false)
                            this.$store.commit('setListDisable', false)
                            this.$store.commit('setStatus', 'view')
                            this.FormToABSList().doGetList('','eb_getList')
                        })
                    })
                }

                this.isDetail = false
                this.EbData.Event = 'SAVE'
                EventBus.$emit('ToOpen',this.EbData)
            
            },
            doAddNew() {
                // localStorage.setItem('statusForm', 'new')
                
                // localStorage.setItem('lsListtoForm', JSON.stringify({ 'CityCd': '' }))
                // this.$router.push('/currencyMaster/currencyMasterForm')
            },
            rowClicked (record, index) {
                this.$parent.state = 'UPDATE'
                this.$parent.isDetail = true
                // this.$parent.EbData.PageLevel = this.PageLevel
                // this.$parent.EbData.Event = 'rowClick'
                // this.$parent.EbData.Key = record
                this.$store.commit('SetPage2Data', record)
                this.$store.commit('setEventStatus', 'rowClick')
                this.$store.commit('setLevel',this.PageLevel)
                this.getDataBy(record)
                
                
                //selalu taro paling bawah
                this.FormToMasterPage().ValidasiPage()
            },
            doDoubleClick (record, index) {
                // localStorage.setItem('statusForm', 'view')
                // localStorage.setItem('lsListtoForm', JSON.stringify({ 'CityCd': record.CityCd }))
                // this.$router.push('/currencyMaster/currencyMasterForm?Key='+record.CityCd+'&Key2='+record.CityCd)
            },
            getSelected (data) {
                var dtDelete = ''
                data.forEach((value) => {

                    dtDelete = dtDelete + value.row_id + ','
                })

                dtDelete = dtDelete.slice(0,-1)         
                return dtDelete
                // this.DataPost = dtPost       
            },
            rowLink: function(url){
                this.$refs.modalTest.show()
            },
            getDataBy (record) {
                // console.log(JSON.stringify(record))
                // console.table(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 1,
                CountryCd: record.CountryCd,
                CityCd: record.CityCd
                
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                // StartDate: null,
                //     EndDate: null,
                //     Rate: null,
                //     ReferenceNo: null,
                //     ReferenceDate: null
                var data = response.Data[0]
                console.log(ProvinceCd)
                this.M_CM_City = {
                    CountryCd: data.CountryCd,
                    CityCd: data.CityCd,
                    Descs: data.Descs,
                    ProvinceCd: data.ProvinceCd
                }
                EventBus.$emit('ebSetValue' + this.PI_ProvinceCd.cName + '_' + this.PageLevel + '_' + this.TabIndex, {data: data.ProvinceCd, action: 'getDataBy'})
                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit
                this.M_CM_City_Temp = data
            })
        },
        onProvinceCdChange(data){
            // console.log(data)
            // console.log(this.M_CM_City.ProvinceCd.value.id)
            this.M_CM_City.ProvinceCd = data.value.id
             
            // console.log(data);
            // return;
            // if(data && data.id !== ''){
            //     this.M_CM_City.DebtorCd = data.id
            //     this.M_CM_City.AddressContactId = data.ContactID
            //     this.M_CM_City.CreditTermsCd = data.CreditTermsCd
            //     var where = "SubPortfolioCd = '"+ this.getDataUser().subportfolio_cd +"' AND ContactID = '"+ data.ContactID +"'"
            //     EventBus.$emit('ebSetValue' + this.PI.CreditTermsCd.cName + '_' + this.PageLevel + '_' + this.TabIndex, data.CreditTermsCd)
            //     EventBus.$emit('ebSetInitWhere' + this.PI.AddressCd.cName + '_' + this.PageLevel + '_' + this.TabIndex, where)
            // }
        }
    },
    beforeCreate: function () {
        // this.ValKey = this.$route.query.Key
        // alert(this.$route.query.Key)
    },
    created: function() {
        // dari header click
//         EventBus.$on('HeaderPage', (data) => {
//         // alert('hm')
//         // console.log(data)
//         // alert('HeaderPage '+ JSON.stringify(data))
//         // this.isDetail = true 
//         // alert(data)     
//         // if(data.PageLevel=='2'){
//         this.propList.initialWhere = "CountryCd = '" + data.CountryCd + "'"
//         // }else{
//         //     this.propList.initialWhere = "CityCd = '"+data.CityCd+"' and StartDate = '"+data.StartDate+"' and EndDate = '"+data.EndDate+"'"
//         // }
//         this.ValKey = data.CountryCd
//         this.M_CM_City.CountryCd = data.CountryCd
//         // alert(this.ValKey)
//         // alert(JSON.stringify(this.propList))
        
//         // alert(JSON.stringify(this.propList))
//         EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
//         this.isDetail = false
//     })

//    //New 
//     EventBus.$on('New_' + this.PageLevel + '_' + this.TabIndex, (data) => {
//         // alert('hahah')
//         this.M_CM_City.CityCd=''
//         this.M_CM_City.Descs=''
//         this.M_CM_City.ProvinceCd=''
//         this.state = 'NEW'
//         this.isDetail = true      
//         this.EbData.Event ='new'
//         EventBus.$emit('ToOpen',this.EbData)
//     })

//     //Save
//     EventBus.$on('Save_' + this.PageLevel + '_' + this.TabIndex, (data) => {
//         // alert('save di componenet')   
//         this.M_Save() 
//     })

//     //Edit
//     EventBus.$on('Edit_' + this.PageLevel + '_' + this.TabIndex, (data) => {
//         // alert('edit '+this.PageLevel)
//         this.state='UPDATE'
//         this.isDetail = true
//         //utk ke masterpage
//         this.EbData.Event ='edit'
//         EventBus.$emit('ToOpen',this.EbData)
//     })

//     //Delete
//     EventBus.$on('Delete_' + this.PageLevel + '_' + this.TabIndex, (data) => {
//         //call for get data selected list
//         EventBus.$emit('ebDoDeleteList_'+this.PageLevel+'_'+ this.TabIndex)
//     })
//     //delete Get data selected from list then doDelete
//     EventBus.$on('ebGetDeleteList_'+this.PageLevel+'_'+ this.TabIndex,(data)=>{
//             this.getSelected(data)
//             this.M_Delete(this.DataDelete)
//     })
//     //Refresh
//     EventBus.$on('Refresh_' + this.PageLevel + '_' + this.TabIndex, (data) => {
//         // alert('refresh dari curr')
//         this.isDetail = false
//         // this.EbData.PageLevel = this.PageLevel
//             this.EbData.Event = 'refresh'
//             this.EbData.Key = ''
//             this.EbData.TabIndex = this.TabIndex

//         EventBus.$emit('ToOpen',this.EbData)
//         EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex, data)
//     })

//     //Search
//     EventBus.$on('onSearchEnter_' + this.PageLevel + '_' + this.TabIndex, (data) => {
//         this.isDetail = false
//         this.EbData.Event = 'refresh'
//         EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex, data)
//     })
//     //Cancel
//     EventBus.$on('Cancel_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
//         alert(this.state)
//         if(this.state=='NEW'){
//             this.isDetail = false
//         }
//         this.EbData.Event ='cancel'
//         EventBus.$emit('ToOpen',this.EbData)
        
//         // EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex, data)
//     });
//     //Pagination
//     EventBus.$on('pagination_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
//         // alert('onsearchEnter')
//         this.isDetail = false
//         this.EbData.Event = data.Event
//         EventBus.$emit('ToOpen',this.EbData)
        
//     });
//     //pageSize
//     EventBus.$on('pageSize_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
//         // alert('onsearchEnter')
//         // this.isDetail = false
//         this.EbData.Event = data.Event
//         EventBus.$emit('ToOpen',this.EbData)
        
//     });
//     //headTable
//     EventBus.$on('headTable_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
//         // alert('headTable')   
//         this.EbData.Event = data.Event
//         EventBus.$emit('ToOpen',this.EbData)    
//         // EventBus.$emit('ebActiveForm', this.PageLevel)         
//     });
//     //untuk hide/show detail dari masterpage
    // EventBus.$on('activeForm_' + this.PageLevel, (data) => { 
    //     // alert('TabIndexLocal : ' + this.TabIndex +' :: '+ data.TabIndex)
    //     // alert('onsearchEnter')  
    //     if(this.PageLevel==data.PageLevel && this.TabIndex == data.TabIndex){
    //         this.isDetail = data.active  
    //     }          
    // });
        // alert(this.PageLevel)

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
        EventBus.$off('New_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('Edit_' + this.PageLevel + '_' + this.TabIndex)
        // EventBus.$off('Search_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('Save_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('onSearchEnter_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('Cancel_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('Refresh_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('ebGetDeleteList_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('Delete_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('pagination_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('pageSize_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('headTable_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('activeForm_' + this.PageLevel)
        EventBus.$off('HeaderPage')
    },
    destroyed: function() {
    }
}
</script>
