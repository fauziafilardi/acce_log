<template>
    <div>
        <div  :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse3>
            </div>
            <b-collapse id="collapse3" :visible="true">
                <b-row style="padding-left: 10px; padding-bottom: 10px; !important;">
                    <b-col md="5" id="col-left" class="bColMasterForm">
                        <!-- <ABSProcessInputSelect @change="onSubPortfolioChange" :prop="PI_SubPortfolio" :value="M_SubPortfolio"/> -->
                        <ABSProcessInputSelectList @change="onSubPortfolioChange" :prop="PI_SubPortfolio" :value="M_SubPortfolio" :label="M_SubPortfolioLabel"/>
                    </b-col>                
                </b-row>
                <b-row v-show="isShow" style="padding-left: 10px; padding-bottom: 10px; !important;">
                    <b-col md="12" id="col-mid" class="bColMasterForm">
                        <b-container class="bv-example-row">
                            <div v-for="(module, indexModule) in allModules" v-bind:key="module.module_seq">
                                <!-- Module -->
                                <b-row :no-gutters="true">
                                    <b-col cols="auto"> <span @click="expand('M', module.module_seq, indexModule)" class="module" :id="'module_'+module.module_seq"><font-awesome-icon :icon="module.icon?module.icon:'plus-circle'" class="icon-expand" /></span> </b-col>
                                    <b-col cols="auto"> <input style="vertical-align:middle !important" :disabled="!canUpdate" type="checkbox" name="cb_module" :id="'M_'+module.module_seq" @click="Update('M', module.module_seq)" :checked="module.set" v-model="module.set" > </b-col>
                                    <b-col cols="auto"> <span>{{ module.module_name }}</span> </b-col>
                                </b-row>
                                <b-row :no-gutters="true" v-show="showEvent == module.module_seq">
                                    <b-container class="bv-example-row" v-show="onFilteredEvents.length > 0">
                                        <div v-for="(event, indexEvent) in onFilteredEvents" v-bind:key="event.event_seq">
                                            <!-- Event -->
                                            <b-row style="margin-left: 26px" :no-gutters="true">
                                                <b-col cols="auto"> <span @click="expand('E', event.event_seq, indexEvent)" class="event" :id="'event_'+event.event_seq"><font-awesome-icon :icon="event.icon?event.icon:'plus-circle'" class="icon-expand" /></span> </b-col>
                                                <b-col cols="auto"> <input style="vertical-align:middle !important" :disabled="!canUpdate" type="checkbox" name="cb_event" :id="'E_'+event.event_seq" @click="Update('E', event.event_seq)" :checked="event.set" v-model="event.set" > </b-col>
                                                <b-col cols="auto"> <span>{{ event.event_name }}</span> </b-col>
                                            </b-row>
                                            <b-row :no-gutters="true" v-show="showOption == event.event_seq">
                                                <!-- <b-container class="bv-example-row" v-show="onFilteredOptions.length > 0"> -->
                                                <!-- {{onFilteredEvents[indexEvent].options}} -->
                                                <b-container class="bv-example-row" v-show="onFilteredEvents[indexEvent].options.length > 0">
                                                    <table style="margin-left: 55px">
                                                        <tr>    
                                                            <td></td> <td></td>
                                                            <td style="text-align:center !important" class="col-auto"> Add </td>
                                                            <td style="text-align:center !important" class="col-auto"> Edit </td>
                                                            <td style="text-align:center !important" class="col-auto"> Delete </td>
                                                            <td style="text-align:center !important" class="col-auto"> Post </td>
                                                            <!-- <td style="text-align:center !important" class="col-auto"> View </td> -->
                                                        </tr>
                                                    <tr v-for="(option, indexOption) in onFilteredEvents[indexEvent].options" v-bind:key="option.option_seq">
                                                        <!-- Option -->
                                                        <td class="col-auto"> <input style="vertical-align:middle !important" :disabled="!canUpdate" type="checkbox" name="cb_option" :id="'O_'+option.option_seq" @click="Update('O', option.option_seq)" :checked="option.set" v-model="option.set" > </td>
                                                        <td class="col-auto"> <span>{{ option.option_name }}</span> </td>
                                                        <td class="col-auto" style="text-align:center !important"> <input :disabled="!canUpdate" type="checkbox" name="cb_optionStatus" :id="'OS_Add_'+option.option_seq" :checked="option.add" @click="Update('OS_Add', option.option_seq)" v-model="option.add" > </td>
                                                        <td class="col-auto" style="text-align:center !important"> <input :disabled="!canUpdate" type="checkbox" name="cb_optionStatus" :id="'OS_Edit_'+option.option_seq" :checked="option.edit" @click="Update('OS_Edit', option.option_seq)" v-model="option.edit" > </td>
                                                        <td class="col-auto" style="text-align:center !important"> <input :disabled="!canUpdate" type="checkbox" name="cb_optionStatus" :id="'OS_Delete_'+option.option_seq" :checked="option.delete" @click="Update('OS_Delete', option.option_seq)" v-model="option.delete" > </td>
                                                        <!-- <td class="col-auto" style="text-align:center !important"> <input :disabled="!canUpdate" type="checkbox" name="cb_optionStatus" :id="'OS_Print_'+option.option_seq" :checked="option.print" @click="Update('OS_Print', option.option_seq)" v-model="option.print" > </td>
                                                        <td class="col-auto" style="text-align:center !important"> <input :disabled="!canUpdate" type="checkbox" name="cb_optionStatus" :id="'OS_View_'+option.option_seq" :checked="option.view" @click="Update('OS_View', option.option_seq)" v-model="option.view" > </td> -->
                                                        <td class="col-auto" style="text-align:center !important"> <input :disabled="!canUpdate" type="checkbox" name="cb_optionStatus" :id="'OS_Post_'+option.option_seq" :checked="option.print" @click="Update('OS_Post', option.option_seq)" v-model="option.post" > </td>
                                                        <!-- End Option -->
                                                    </tr>
                                                    <!-- </div> -->
                                                    </table>
                                                </b-container>
                                                <b-container class="bv-example-row" v-show="onFilteredEvents[indexEvent].options.length <= 0">
                                                    <span style="margin-left: 55px">No Option Available</span>
                                                </b-container>
                                            </b-row>
                                            <!-- End Event -->
                                        </div>
                                    </b-container>
                                    <b-container style="margin-left: 26px" class="bv-example-row" v-show="onFilteredEvents.length <= 0">
                                        <span>No Event Available</span>
                                    </b-container>
                                </b-row>
                                <!-- End Module -->
                            </div>
                        </b-container>
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
            FormType: "Form",
            propList: {
                initialWhere: "",
                LineNo: 1,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex
            },
            M_SubPortfolio: '',
            M_SubPortfolioLabel: '',
            IEBy: {Input: '', Edit: ''},
            PI_SubPortfolio: {
                dataLookUp: {
                    LookUpCd: 'GetSubPortfolioCd',
                    ColumnDB: 'SubPortfolioCd',
                    InitialWhere: "",
                    ParamWhere: ''
                },
                cValidate: '',
                cName: 'SubPortfolio',
                cLabel: 'SubPortfolio',
                cOrder: 2,
                cSelected: null,
                cType: 'lookup',
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                // cMasterUrl:'CM/CM_CurrencyMaster' ,
                cDisplayColumn:'subportfolio,name' ,
            },
            record: {
                UserGroup: null,
                SubPortfolio: null
            },
            DataFromParent: null,
            isShow: false,

            // Untuk Tree View
            allModules: [],         // Isinnya Semua Data Module dari API
            allEvents: [],          // Isinnya Semua Data Event dari API
            allOptions: [],         // Isinnya Semua Data Option dari API
            allModules_Temp: [],    // Isinnya Semua Data Module dari API (Temporary) *buat ancang2
            allEvents_Temp: [],     // Isinnya Semua Data Event dari API (Temporary) *buat ancang2
            allOptions_Temp: [],    // Isinnya Semua Data Option dari API (Temporary) *buat ancang2
            onFilteredEvents: [],   // Isinya Data Event Dari Module yang Di Expand
            onFilteredOptions: [],  // Isinya Data Option Dari Event yang Di Expand
            showEvent: null,        // Isinya ModuleSeq
            showOption: null,       // Isinya EventSeq
            canUpdate: false,       // Checkbox Bisa Di Click atau Tidak
            indexOldEvent: -1
        }
    },
    computed: {
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
        M_PageSize() {
        },
        M_TabClick() {
        },
        M_Pagination() {
        },
        M_Advance_Filter() {
        },
        M_Search(data){
        },
        M_Post() {
        },
        M_Refresh() {
        },
        M_Delete() {
        },
        M_New() {
        },
        M_Cancel() {
        },
        M_Insert() {
            var dataPost = []
            this.allOptions.forEach(el => {
                if (
                    el.add == true ||
                    el.edit == true ||
                    el.delete == true ||
                    // el.print == true ||
                    // el.view == true
                    el.post == true
                ) {
                    dataPost.push({
                        option_seq: el.option_seq,
                        add_status: el.add==true?1:0,
                        edit_status: el.edit==true?1:0,
                        delete_status: el.delete==true?1:0,
                        // PrintStatus: el.print==true?1:0,
                        // ViewStatus: el.view==true?1:0,
                        print_status: 1,
                        view_status: 1,
                        post_status: el.post == true ? 1 : 0
                    })
                }
            })
            
            var param = {
                user_group: this.DataFromParent.user_group,
                subportfolio_cd: this.getDataUser().subportfolio_cd,
                user_input: this.getDataUser().user_id,
                Data: dataPost
            }
        
            this.postJSON( this.getUrlSaveSecuritySetting(), param )
            .then(response => {
                if(response == null) return

                this.alertSuccess(response.Message)
            })
        },
        M_Update () {
        },
        M_ClearForm(){
            this.M_SubPortfolio = ''
            this.M_SubPortfolioLabel = ''
        },
        paramFromParent () {
            this.isShow = false
            this.M_ClearForm()
            this.DataFromParent = this.$store.getters.GetPage1Data
            this.allOptions = this.allOptions_Temp
            this.canUpdate = false

            this.getAllAccess()
        },
        resetButtonExpand (act, string, index) {
            act = act.toUpperCase()
            var dcM =  this.allModules_Temp //document.getElementsByClassName('module')
            var dcE =  this.allEvents_Temp //document.getElementsByClassName('event')
            var dcO =  this.allOptions_Temp //document.getElementsByClassName('option')
            var stringg = string == "+"?"plus-circle":"minus-circle"

            if (act == 'ALL') {
                if (this.showOption !== null) {
                    var eventIdx = this.allEvents.map(x => x.event_seq).indexOf(this.showOption)
                    this.allEvents[eventIdx].icon = "plus-circle"
                    // document.getElementById('event_'+this.showOption).innerHTML = "<font-awesome-icon icon='plus-circle' class='icon-expand' />"
                    this.showOption = null
                    this.onFilteredOptions = []
                    // for (let x = 0 ; x < this.onFilteredEvents.length ; x ++) {
                    //     this.onFilteredEvents[x].options = []
                    // }
                }

                if (this.showEvent !== null) {
                    var moduleIdx = this.allModules.map(x => x.module_seq).indexOf(this.showEvent)
                    this.allModules[moduleIdx].icon = "plus-circle"
                    // document.getElementById('module_'+this.showEvent).innerHTML = "<font-awesome-icon icon='plus-circle' class='icon-expand' />"
                    this.showEvent = null
                    this.onFilteredEvents = []
                }
            }
            else if (act == 'M') {
                for(var x = 0; x < dcM.length; x++){
                    dcM[x].icon = stringg
                }
            }
            else if (act == 'E') {
                for(var x = 0; x < dcE.length; x++){
                    dcE[x].icon = stringg
                }
            }
            else if (act == 'O') {
                for(var x = 0; x < dcO.length; x++){
                    dcO[x].icon = stringg
                }
            }
        },
        expand (from, param, index) {
            this.$store.commit('setStatusLoader', true)
            
            setTimeout(() => {
                if(from == 'M'){
                    this.onFilteredEvents = []
                    this.onFilteredOptions = []
                    if(param == this.showEvent){
                        // this.onFilteredEvents = []
                        // this.onFilteredOptions = []
                        var moduleIdx = this.allModules.map(x => x.module_seq).indexOf(param)
                        var eventIdx = this.allEvents.map(x => x.event_seq).indexOf(this.showOption)
                        this.allModules[moduleIdx].icon = "plus-circle"
                        if (eventIdx > -1) this.allEvents[eventIdx].icon = "plus-circle"
                        // document.getElementById('module_'+param).innerHTML = "<font-awesome-icon icon='plus-circle' class='icon-expand' />"
                        this.showEvent = null
                        this.showOption = null
                    }
                    else {
                        // this.onFilteredEvents = this.allEvents.filter(val => { return val.module_seq == param })

                        for (let x = 0 ; x < this.allEvents.length ; x ++) {
                            if (this.allEvents[x].module_seq == param) {
                                this.allEvents[x].options = []
                                this.onFilteredEvents.push(this.allEvents[x])
                            }
                        }

                        this.showEvent = param
                        this.resetButtonExpand(from, "+", index)
                        var moduleIdx = this.allModules.map(x => x.module_seq).indexOf(param)
                        this.allModules[moduleIdx].icon = "minus-circle"
                        // document.getElementById('module_'+param).innerHTML = "<font-awesome-icon icon='minus-circle' class='icon-expand' />"
                    }
                }
                else {
                    if(param == this.showOption){
                        this.showOption = null
                        this.onFilteredOptions = []
                        this.onFilteredEvents[index].options = []
                        var eventIdx = this.allEvents.map(x => x.event_seq).indexOf(param)
                        this.allEvents[eventIdx].icon = "plus-circle"
                        // document.getElementById('event_'+param).innerHTML = "<font-awesome-icon icon='plus-circle' class='icon-expand' />"
                    }
                    else {
            
                        // alert('woi')
                        // console.log(this.showEvent, param)
                        // this.onFilteredOptions = this.allOptions.filter(val => { return val.module_seq == this.showEvent && val.event_seq == param })
                        
                        // reset options, because don't know index before
                        // for (let x = 0 ; x < this.onFilteredEvents.length ; x ++) {
                        //     this.onFilteredEvents[x].options = []
                        // }
                        this.onFilteredOptions = []
                        if (this.indexOldEvent != -1) {
                            // console.log(this.onFilteredEvents[this.indexOldEvent].options)
                            this.onFilteredEvents[this.indexOldEvent].options = []
                            // console.log(this.onFilteredEvents[this.indexOldEvent].options)
                        }
                        this.indexOldEvent = index
                        for (let x = 0 ; x < this.allOptions.length ; x ++) {
                            if (this.allOptions[x].module_seq == this.showEvent && this.allOptions[x].event_seq == param) {
                                this.onFilteredOptions.push(this.allOptions[x])
                            }
                        }
                        // console.log(this.onFilteredOptions)
                        this.showOption = param
                        this.resetButtonExpand(from, "+", index)
                        var eventIdx = this.allEvents.map(x => x.event_seq).indexOf(param)
                        this.allEvents[eventIdx].icon = "minus-circle"
                        this.onFilteredEvents[index].options = this.onFilteredOptions
                        // alert(this.onFilteredOptions.length)
                        // document.getElementById('event_'+param).innerHTML = "<font-awesome-icon icon='minus-circle' class='icon-expand' />"
                    }
                }

                this.$store.commit('setStatusLoader', false)
            }, 100)
        },
        onSubPortfolioChange (data) {
            console.log(data)
            if (data.id == null || data.id == '') {
                this.isShow = false
                this.resetButtonExpand("ALL", "+")
                this.M_SubPortfolio = data.id
                this.M_SubPortfolioLabel = data.label
                return
            }
            // else {
            //     this.isShow = true
            // }

            this.M_SubPortfolio = data.id
            this.M_SubPortfolioLabel = data.label
            this.resetButtonExpand("ALL", "+")
            this.showEvent = null
            this.showOption = null
            this.onFilteredEvents = []
            this.onFilteredOptions = []

            this.allOptions.map(x => {
                x.set = false
                x.add = false
                x.edit = false
                x.delete = false
                // x.print = false
                // x.view = false
                x.post = false
                return true 
            })
            this.allEvents.map(x => { x.set = false; return true })
            this.allModules.map(x => { x.set = false; return true })
            this.getGroupSubPortfolio()
        },
        getGroupSubPortfolio () {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 2,
                user_group: this.DataFromParent.user_group,
                subportfolio_cd: this.M_SubPortfolio
            }
            
            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data
                this.allOptions = this.allOptions_Temp
                var allO = this.allOptions
                var allE = this.allEvents
                var allM = this.allModules
                // console.log("allOptions",this.allOptions)
                // console.log("allEvents",this.allEvents)
                // console.log("allModules",this.allModules)

                this.$nextTick(() => {
                    // for(let dt = 0; dt < data.length; dt++){
                    //     var idx = allO.map(o => o.option_seq.toString()).indexOf(data[dt].option_seq.toString())
                    //     if (idx > -1) {
                    //         this.allOptions[idx].set = true
                    //         this.allOptions[idx].add = data[dt].addstatus==1?true:false
                    //         this.allOptions[idx].edit = data[dt].editstatus==1?true:false
                    //         this.allOptions[idx].delete = data[dt].deletestatus==1?true:false
                    //         this.allOptions[idx].print = data[dt].printstatus==1?true:false
                    //         this.allOptions[idx].view = data[dt].viewstatus==1?true:false

                    //         var idxEvent = allE.map(e => e.event_seq.toString()).indexOf(this.allOptions[idx].event_seq.toString())
                    //         this.allEvents[idxEvent].set = true

                    //         var idxModule = allM.map(m => m.module_seq.toString()).indexOf(this.allOptions[idx].module_seq.toString())
                    //         this.allModules[idxModule].set = true
                    //     }
                    // }
                    data.forEach(element => {
                        var idx = allO.map(el => { return el.option_seq.toString() }).indexOf(element.option_seq.toString())
                        if (idx > -1) {
                            this.allOptions[idx].set = true
                            this.allOptions[idx].add = element.add_status==1?true:false
                            this.allOptions[idx].edit = element.edit_status==1?true:false
                            this.allOptions[idx].delete = element.delete_status==1?true:false
                            // this.allOptions[idx].print = element.print_status==1?true:false
                            // this.allOptions[idx].view = element.view_status==1?true:false
                            this.allOptions[idx].post = element.post_status==1?true:false

                            var idxEvent = allE.map(el => { return el.event_seq.toString() }).indexOf(this.allOptions[idx].event_seq.toString())
                            this.allEvents[idxEvent].set = true

                            var idxModule = allM.map(el => { return el.module_seq.toString() }).indexOf(this.allOptions[idx].module_seq.toString())
                            this.allModules[idxModule].set = true
                        }
                    })
                    this.canUpdate = true
                    this.isShow = true
                })

                this.$forceUpdate()
                // console.log('module', this.allModules)
                // console.log('event', this.allEvents)
                // console.log('option', this.allOptions)
            })
        },
        getAllAccess () {
            var param = {
                user_id: this.getDataUser().user_id,
                subportfolio_cd: this.record.SubPortfolio
            }
            
            this.postJSON( this.getUrlGetGroupPermission(), param )
            .then(response => {
                if(response == null) return
                
                var data = response.Data
                
                this.allModules = data.Module
                this.allEvents = data.Event
                this.allOptions = data.Option
                this.allModules_Temp = data.Module
                this.allEvents_Temp = data.Event
                this.allOptions_Temp = data.Option

                this.resetButtonExpand('ALL', '+')
            })
        },
        Update (from, param) {
            this.$nextTick(() => {
                if (from == 'M') {
                    this.checkedTheChild('M', param)
                }
                else if (from == 'E') {
                    this.checkedTheParent('E', param)
                }
                else if (from == 'O') {
                    this.checkedTheParent('O', param)
                }
                else {
                    this.checkedTheParent('OS', param)
                }
            })

            this.$forceUpdate()
        },
        checkedTheParent (from, param) {
            if (from == 'E') {
                var idE = this.allEvents_Temp.map(x => { return x.event_seq }).indexOf(param)
                var idEFiltered = this.onFilteredEvents.map(x => { return x.event_seq }).indexOf(param)

                var idM = this.allModules_Temp.map(x => { return x.module_seq }).indexOf(this.allEvents[idE].module_seq)

                // set Module
                var isCheckMdl = this.isUnCheckAll('E', this.allEvents[idE].module_seq)
                this.allModules[idM].set = isCheckMdl
                document.getElementById('M_' + this.allEvents[idE].module_seq).checked = isCheckMdl

                this.checkedTheChild('E', param, null, this.allEvents[idE].module_seq)
            }
            else if (from == 'O') {
                var idO = this.allOptions_Temp.map(x => { return x.option_seq }).indexOf(param)
                var idOFiltered = this.onFilteredOptions.map(x => { return x.option_seq }).indexOf(param)

                var idE = this.allEvents_Temp.map(x => { return x.event_seq }).indexOf(this.allOptions[idO].event_seq)
                var idEFiltered = this.onFilteredEvents.map(x => { return x.event_seq }).indexOf(this.allOptions[idO].event_seq)

                var idM = this.allModules_Temp.map(x => { return x.module_seq }).indexOf(this.allOptions[idO].module_seq)

                // set Event
                var isCheckEvt = this.isUnCheckAll('O', this.allOptions[idO].event_seq)
                this.allEvents[idE].set = isCheckEvt
                this.onFilteredEvents[idEFiltered].set = isCheckEvt
                document.getElementById('E_' + this.allOptions[idO].event_seq).checked = isCheckEvt

                // set Module
                var isCheckMdl = this.isUnCheckAll('E', this.allOptions[idO].module_seq)
                this.allModules[idM].set = isCheckMdl
                document.getElementById('M_' + this.allOptions[idO].module_seq).checked = isCheckMdl

                this.checkedTheChild('O', param, this.showOption, this.showEvent)
            }
            else if (from == 'OS') {
                var idO = this.allOptions_Temp.map(x => { return x.option_seq }).indexOf(param)
                var idOFiltered = this.onFilteredOptions.map(x => { return x.option_seq }).indexOf(param)

                var idE = this.allEvents_Temp.map(x => { return x.event_seq }).indexOf(this.allOptions[idO].event_seq)
                var idEFiltered = this.onFilteredEvents.map(x => { return x.event_seq }).indexOf(this.allOptions[idO].event_seq)

                var idM = this.allModules_Temp.map(x => { return x.module_seq }).indexOf(this.allOptions[idO].module_seq)

                // set Option
                var isCheckOpt = this.isUnCheckAll('OS', param)
                this.allOptions[idO].set = isCheckOpt
                this.onFilteredOptions[idOFiltered].set = isCheckOpt
                document.getElementById('O_' + param).checked = isCheckOpt

                // set Event
                var isCheckEvt = this.isUnCheckAll('O', this.allOptions[idO].event_seq)
                this.allEvents[idE].set = isCheckEvt
                this.onFilteredEvents[idEFiltered].set = isCheckEvt
                document.getElementById('E_' + this.allOptions[idO].event_seq).checked = isCheckEvt

                // set Module
                var isCheckMdl = this.isUnCheckAll('E', this.allOptions[idO].module_seq)
                this.allModules[idM].set = isCheckMdl
                document.getElementById('M_' + this.allOptions[idO].module_seq).checked = isCheckMdl
            }
        },
        checkedTheChild (from, param, E=null, M=null) {
            if (from == 'O') {
                var idO = this.allOptions_Temp.map(x => { return x.option_seq }).indexOf(param)

                // Efect To Status
                this.allOptions[idO].add = this.allOptions[idO].set
                this.allOptions[idO].edit = this.allOptions[idO].set
                this.allOptions[idO].delete = this.allOptions[idO].set
                // this.allOptions[idO].print = this.allOptions[idO].set
                // this.allOptions[idO].view = this.allOptions[idO].set
                this.allOptions[idO].post = this.allOptions[idO].set

                if (this.showOption == param) {
                    document.getElementById('OS_Add_' + param).checked = this.allOptions[idO].set
                    document.getElementById('OS_Edit_' + param).checked = this.allOptions[idO].set
                    document.getElementById('OS_Delete_' + param).checked = this.allOptions[idO].set
                    // document.getElementById('OS_Print_' + param).checked = this.allOptions[idO].set
                    // document.getElementById('OS_View_' + param).checked = this.allOptions[idO].set
                    document.getElementById('OS_Post_' + param).checked = this.allOptions[idO].set
                }
            }
            else if (from == 'E') {
                var idE = this.allEvents_Temp.map(x => { return x.event_seq }).indexOf(param)
                var allOpt = this.allOptions.filter(x => { return x.module_seq == M && x.event_seq == param })
                allOpt.forEach((el, i) => {
                    var idO = this.allOptions.map(x => { return x.option_seq }).indexOf(el.option_seq)
                    this.allOptions[idO].set = this.allEvents[idE].set
                    if(el.event_seq == this.showOption){
                        document.getElementById('O_' + el.option_seq).checked = this.allEvents[idE].set
                    }
                    this.checkedTheChild('O', el.option_seq, param, M)
                })
            }
            else if (from == 'M') {
                var idM = this.allModules_Temp.map(x => { return x.module_seq }).indexOf(param)
                var allEvt = this.allEvents.filter(x => { return x.module_seq == param })
                allEvt.forEach((el, i) => {
                    var idE = this.allEvents.map(x => { return x.event_seq }).indexOf(el.event_seq)
                    this.allEvents[idE].set = this.allModules[idM].set
                    if (el.module_seq == this.showEvent) {
                        document.getElementById('E_' + el.event_seq).checked = this.allModules[idM].set
                    }
                    this.checkedTheChild('E', this.allEvents[idE].event_seq, null, param)
                })
            }
        },
        isUnCheckAll (from, param = null) {
            if (from == 'OS') {
                var idO = this.allOptions_Temp.map(x => { return x.option_seq }).indexOf(param)

                if (
                    this.allOptions[idO].add !== true &&
                    this.allOptions[idO].edit !== true &&
                    this.allOptions[idO].delete !== true &&
                    // this.allOptions[idO].print !== true &&
                    // this.allOptions[idO].view !== true
                    this.allOptions[idO].post !== true
                ) {
                    return false
                }
                else {
                    return true
                }
            }
            else if (from == 'O') {
                for (let x = 0; x < this.onFilteredOptions.length; x++) {
                    if(this.onFilteredOptions[x].set == true){
                        return true
                        break
                    }
                    else {
                        return false
                    }
                }
            }
            else if (from == 'E') {
                for (let x = 0; x < this.onFilteredEvents.length; x++) {
                    if(this.onFilteredEvents[x].set == true){
                        return true
                    }
                    else {
                        return false
                    }
                }
            }
        },
        setToolbarButton () { // Wajib Ada Dipake atau Engga
            // this.$store.commit('setStatus', 'new')
            this.getToolbar().isNew = true
            this.getToolbar().statusFunction[6].disabled = true
        }
    },
    beforeCreate: function () {
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

<style>
    .icon-expand {
        cursor: pointer;
        color: green;
    }
</style>