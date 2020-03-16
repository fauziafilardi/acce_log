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
            @headTable="M_Head_Table"/>

        <div v-show="$parent.isDetail"  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
           <div class="div-collapse">
                <span class="master-span" v-b-toggle.collapse1>
                    Input By tes: {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div>
            <b-collapse id="collapse1" visible=true>
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                    <b-col md="5" id="col-left" class="bColMasterForm">
                        <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <ABSinputTextVuex :prop="PI_CountryCd" v-model="M_CM_Country.CountryCd"/>
                            <ABSinputTextVuex :prop="PI_Descs" v-model="M_CM_Country.Descs"/>
                        </b-form>
                    </b-col>                
                </b-row>
            </b-collapse>
        </div>
    </div>
</template>

<script>


export default {    
    props: {PageLevel: '', TabIndex: ''},
    data() {
        return {
            state:null,
            propList: {
                initialWhere: "",
                LineNo: 0,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex
            },
            isDetail: false,
            disabledBtnReset: false,
            M_CM_Country: {
                CountryCd: null,
                Descs: null,
                
            },
            IEBy: {Input: '', Edit: ''},

            PI_CountryCd: {
                cValidate: 'required|min:2|max:4',
                cName: 'CountryCd',
                cLabel: 'Country Code',
                // cLabelSize: 5,
                cOrder: 1,
                cKey: true,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            PI_Descs: {
                cValidate: 'required|min:1|max:60',
                cName: 'Descs',
                cLabel: 'Description',
                //cLabelSize: 5,
                cOrder: 2,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            },
            
            listTab: [],
            listDynamicTab: [],
            DataPost:null,
            DataDelete:null,
            EbData:{
                Key: null,
                Event: null,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex
            },
            pointer:true,
            isPointer: true,
            isDefault: false,
            isValid: []
        }
    },
    computed:{
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
            // alert(data)
        },
        M_Post(){

        },
        M_Refresh(){

        },
        M_New(){//Button new
            // alert('2121')
            // this.$parent.isPointer = false
            // this.$parent.isDefault = true
            
            this.$parent.state = 'NEW'
            this.$parent.EbData.PageLevel = this.PageLevel
            this.$parent.EbData.Event = 'new'
            // alert(this.$parent.state)

            this.FormToMasterPage().ValidasiPage()
            this.$parent.isDetail = true
            this.M_CM_Country.CountryCd =null
            this.M_CM_Country.Descs =null
        },
        M_Edit(){
            alert('edit')
        },
        M_Cancel(){
            alert('cancel')
        },
        // Classpointer(){
        //         return {
        //             // active: this.isPointer && !this.error,
        //             // 'text-danger': this.error && this.error.type === 'fatal'
        //             'cursor-default': this.pointer,
        //             'cursor-pointer': this.pointer
        //         }
        // },
        ClickForm(){
            // alert('asdfsdf')
            // if(this.pointer=='cursor: pointer;'){

                
                if(this.isPointer==true && this.isDefault ==false){
                    this.isPointer = false
                    this.isDefault = true
                    this.state = 'UPDATE'
                    var dt={
                    PageLevel : this.PageLevel,
                    TabIndex : this.TabIndex
                    }
                    EventBus.$emit('ClickForm',dt)
                }
                
                // this.pointer='cursor: arrow;'
            // }
            // alert(this.pointer)
            
        },
        M_Delete () {   
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
            LineNo: 0,
            Data: data
        }
        alert(JSON.stringify(param))
        this.postJSONMulti( this.getUrlDeleteMulti(), param )
        .then(response => {
            // // response from API
            // this.responses = response
            // // data
            // // if()
            // // if(this.responses.Data.length > 0){
            // //   //show yang error aja
            // // }
            // // else {
            // this.alertSuccess("Deleting Data Successfully")
            // this.$parent.isDetail = false
            // this.$store.commit('setEventStatus', 'delete')
            // // this.$store.commit('setLevel',this.PageLevel)
            // this.FormToMasterPage().ValidasiPage()
            // // this.EbData.TabIndex = this.TabIndex
            // this.FormToABSList().doGetList('','eb_getList')
            // // EventBus.$emit('ToOpen', this.EbData)

            // // Refresh List
            // // EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
            if (response == null) return

            this.alertSuccess("Deleting Data Successfully")
            this.$parent.isDetail = false
            this.$store.commit('setEventStatus', 'delete')
            this.FormToMasterPage().ValidasiPage()
            this.FormToABSList().doGetList('','eb_getList')
        })
        },
        M_Save(){         
        this.M_CM_Country.OptionSeq = this.getOptionSeq().OptionSeq
        this.M_CM_Country.LineNo = 0
        if(this.$parent.state !== 'NEW'){
            this.M_CM_Country.UserEdit = this.getDataUser().user_id
            this.postJSON(this.getUrlUpdate(), this.M_CM_Country)
            .then((response) => {
                if(response == null) {                    
                    return
                }

                delete this.M_CM_Country['UserEdit']
                EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
                this.alertSuccess(response.Message)
                .then(() => {
                    this.getToolbar().setButton(false)
                    this.$store.commit('setListDisable', false)
                    this.$store.commit('setStatus', 'view')
                    this.FormToABSList().doGetList('','eb_getList')
                })
            })
        }
        else {
            this.isPointer= true
            this.isDefault= false
            this.M_CM_Country.UserInput = this.getDataUser().user_id
            // alert('save api')
            // console.log(this.M_CM_Country)
            this.postJSON(this.getUrlInsert(), this.M_CM_Country)
            .then((response) => {
                if(response == null) {
                    return
                }
                delete this.M_CM_Country['UserInput']
                
                this.alertSuccess(response.Message)
                .then(() => {
                    this.getToolbar().setButton(false)
                    this.$store.commit('setListDisable', false)
                    this.$store.commit('setStatus', 'view')
                    this.FormToABSList().doGetList('','eb_getList')
                   })
            })
        }
        this.isDetail = false
        // this.getToolbar().setButton(false)
        // this.$store.commit('setListDisable', false)
        // this.$store.commit('setStatus', 'view')
        // // this.EbData.Event = 'SAVE'
        // // EventBus.$emit('ToOpen',this.EbData)
        // this.FormToABSList().doGetList('','eb_getList')
        this.FormToMasterPage().ValidasiPage(this.$parent.EbData)
        
        },        
        rowClicked (record, index) {
            // alert(this.PageLevel)
            //     this.$store.commit('setLevel', this.PageLevel)
                this.$parent.state = 'UPDATE'
                
                // this.$parent.EbData.PageLevel = this.PageLevel
                // this.$parent.EbData.Event = 'rowClick'
                // this.$parent.EbData.Key = record
                this.$store.commit('SetPage1Data', record)
                this.$store.commit('setEventStatus', 'rowClick')
                this.$store.commit('setLevel',this.PageLevel)
                this.getDataBy(record)
                this.$parent.isDetail = true
                this.FormToMasterPage().ValidasiPage()
                
            
        },
        doDoubleClick (record, index) {
            alert('doDoubleClick')
            // localStorage.setItem('statusForm', 'view')
            // localStorage.setItem('lsListtoForm', JSON.stringify({ 'CountryCd': record.CountryCd }))
            // this.$router.push('/currencyMaster/currencyMasterForm?Key='+record.CountryCd+'&Key2='+record.CountryCd)
        },
        getSelected (data) {
            // var dtPost = []
            var dtDelete = ''
            data.forEach((value) => {
                // dtPost.push({
                //     'CountryCd': value.CountryCd,
                //     'LastUpdateStamp': value.LastUpdateStamp
                // })

                dtDelete = dtDelete + value.row_id + ','
            })

            dtDelete = dtDelete.slice(0,-1)       
            // this.DataDelete = dtDelete
            // this.DataPost = dtPost    
            return dtDelete
        },
        rowLink: function(url){
            this.$refs.modalTest.show()
        },
        getDataBy (record) {            
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 0,
                CountryCd: record.CountryCd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                // console.log(data)
                this.M_CM_Country = {
                    CountryCd: data.CountryCd,
                    Descs: data.Descs,
                    LastUpdateStamp: record.LastUpdateStamp
                }

                // alert('list : '+record.LastUpdateStamp+' data : '+ data.LastUpdateStamp)
                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit

            })
        },
    },
    beforeCreate: function () {
    },
    created: function() {
        
        // let mouseTip = new MouseTip({
        //     cssZIndex        : '9999',
        //     cssPosition      : 'absolute',
        //     cssPadding       : '15px',
        //     cssBorderRadius  : '4px',
        //     cssBackground    : 'rgba(0,0,0,0.75)',
        //     cssColor         : '#fff',
        //     html             : true,
        //     position         : 'bottom right',
        //     selector         : 'mousetip',
        //     stylesheet       : false
        // })
        // mouseTip.start() 
        // console.log(mouseTip.start)


    //New 
    // EventBus.$on('New_' + this.PageLevel + '_' + this.TabIndex, (data) => {
    //     this.isPointer = false
    //     this.isDefault = true
    //     this.M_CM_Country.CountryCd = ''
    //     this.M_CM_Country.Descs = ''

    //     this.$nextTick().then(() => document.getElementById("CountryCd").focus())

    //     this.state = 'NEW'
    //     this.isDetail = true

    //     this.EbData.Event ='new'
    //     EventBus.$emit('ToOpen',this.EbData)
    // })
    // //Save
    // EventBus.$on('Save_' + this.PageLevel + '_' + this.TabIndex, (data) => {
    //     this.M_Save()
    // })
    // //Edit
    // EventBus.$on('Edit_' + this.PageLevel + '_' + this.TabIndex, (data) => {  
    //     this.state='UPDATE'
    //     this.isDetail = true
    //     //utk ke masterpage
    //     this.EbData.Event ='edit'
    //     this.$nextTick().then(() => document.getElementById("Descs").focus())
    //     EventBus.$emit('ToOpen',this.EbData)
    // });
    // //Delete
    // EventBus.$on('Delete_' + this.PageLevel + '_' + this.TabIndex, (data) => {  
    //     //call for get data selected list
    //     EventBus.$emit('ebDoDeleteList_'+this.PageLevel+'_'+ this.TabIndex)
    // });
    // //delete Get data selected from list then doDelete
    // EventBus.$on('ebGetDeleteList_'+this.PageLevel+'_'+ this.TabIndex,(data)=>{
    //         this.getSelected(data)
    //         this.M_Delete(this.DataDelete)
    // })
    // //Refresh
    // EventBus.$on('Refresh_' + this.PageLevel + '_' + this.TabIndex, (data) => {
    //     // alert('Refresh')
    //     // this.EbData.PageLevel = this.PageLevel
    //         this.EbData.Event = 'refresh'
    //         this.EbData.Key = ''
    //     EventBus.$emit('ToOpen',this.EbData)
    //     this.isDetail = false
    //     EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex, data)
    // });
    // //Search
    // EventBus.$on('Search_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
    //     // alert(this.PageLevel)
    //     // alert(data) 
    //     // alert('search')
    //     EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex, data)
    // });
    // //Cancel
    // EventBus.$on('Cancel_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
    //     if(this.state =='NEW'){
    //         this.isDetail =false
    //         // this.pointer='arrow'
    //     }else{
    //         // this.pointer='pointer'
    //                 this.isPointer = true
    //                 this.isDefault = false
    //     }
        
    //     this.EbData.Event ='cancel'
    //     EventBus.$emit('ToOpen',this.EbData)
    //     // EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex, data)
    // });

    // //OnSearchEnter
    // EventBus.$on('onSearchEnter_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
    //     // alert('onsearchEnter')
    //     this.isDetail = false
    //     this.EbData.Event = 'refresh'
    //     EventBus.$emit('ToOpen',this.EbData)
        
    // });
    // //Pagination
    // EventBus.$on('pagination_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
    //     alert('dari master')
    //     alert('Pagination_' + this.PageLevel + '_' + this.TabIndex)
    //     // alert('onsearchEnter')
    //     this.isDetail = false
    //     this.EbData.Event = data.Event
    //     EventBus.$emit('ToOpen',this.EbData)
        
    // });
    // //pageSize
    // EventBus.$on('pageSize_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
    //     // alert('onsearchEnter')
    //     // this.isDetail = false
    //     this.EbData.Event = data.Event
    //     EventBus.$emit('ToOpen',this.EbData)
        
    // });
    // //headTable
    // EventBus.$on('headTable_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
    //     // alert('onsearchEnter')        
    //     this.EbData.Event = data.Event
    //     EventBus.$emit('ToOpen',this.EbData)  
    //     // EventBus.$emit('ebActiveForm', this.PageLevel)     
    // });
    // //untuk hide/show detail dari masterpage
    // EventBus.$on('activeForm_' + this.PageLevel, (data) => { 
    //     // alert('TabIndexLocal : ' + this.TabIndex +' :: '+ data.TabIndex)
    //     // alert('onsearchEnter')  
    //     if(this.PageLevel==data.PageLevel && this.TabIndex == data.TabIndex){
    //         this.isDetail = data.active  
    //     }
                    
    // });

        // alert(this.PageLevel)

        // var tooltipSpan = document.getElementById('tooltip-span')
		// window.onmousemove = function (e) {
		// 	var x = e.clientX, y = e.clientY
		// 	tooltipSpan.style.top = (y + 20) + 'px'
		// 	tooltipSpan.style.left = (x + 20) + 'px'
		// }
    },
    beforeMount: function() {
    },
    mounted: function() {
        // this.formScope = 'FormScope_' + this.PageLevel + '_' + this.TabIndex
        // console.log(this.PI_CountryCd)
        this.hideSideBarMenu()
        this.FormToABSList().doGetList('','eb_getList')
        // EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
        
        // var tooltipSpan = document.getElementById('tooltip-span')
		// window.onmousemove = function (e) {
		// 	var x = e.clientX, y = e.clientY
		// 	tooltipSpan.style.top = (y + 20) + 'px'
		// 	tooltipSpan.style.left = (x + 20) + 'px'
        // }
        
        // let mouseTip = new MouseTip({
        //     cssZIndex        : '9999',
        //     cssPosition      : 'absolute',
        //     cssPadding       : '15px',
        //     cssBorderRadius  : '4px',
        //     cssBackground    : 'rgba(0,0,0,0.75)',
        //     cssColor         : '#fff',
        //     html             : true,
        //     position         : 'bottom right',
        //     selector         : 'mousetip',
        //     stylesheet       : false
        // })
        // mouseTip.start()
        
    },
    beforeUpdate: function() {  
    },
    updated: function() {
    },
    beforeDestroy: function() {
        // EventBus.$off('New_' + this.PageLevel + '_' + this.TabIndex)
        // EventBus.$off('Edit_' + this.PageLevel + '_' + this.TabIndex)
        // EventBus.$off('Search_' + this.PageLevel + '_' + this.TabIndex)
        // EventBus.$off('Save_' + this.PageLevel + '_' + this.TabIndex)
        // EventBus.$off('onSearchEnter_' + this.PageLevel + '_' + this.TabIndex)
        // EventBus.$off('Cancel_' + this.PageLevel + '_' + this.TabIndex)
        // EventBus.$off('Refresh_' + this.PageLevel + '_' + this.TabIndex)
        // EventBus.$off('ebGetDeleteList_' + this.PageLevel + '_' + this.TabIndex)
        // EventBus.$off('Delete_' + this.PageLevel + '_' + this.TabIndex)
        // EventBus.$off('pagination_' + this.PageLevel + '_' + this.TabIndex)
        // EventBus.$off('pageSize_' + this.PageLevel + '_' + this.TabIndex)
        // EventBus.$off('headTable_' + this.PageLevel + '_' + this.TabIndex)
        // EventBus.$off('activeForm_' + this.PageLevel)
        // EventBus.$off('ValidToSave_' + this.PageLevel + '_' + this.TabIndex)
    },
    destroyed: function() {
    }
}
</script>
