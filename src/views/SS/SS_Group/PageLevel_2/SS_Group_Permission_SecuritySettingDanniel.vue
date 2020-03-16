<template>
    <div>
        <div  :style="'margin-top:10px;'">
            <!-- <div class="div-collapse" v-b-toggle.collapse3>
                <span class="master-span" v-show="IEBy.Input && IEBy.Edit">
                    Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                </span>
            </div> -->
            <keep-alive>
            <b-collapse id="collapse3" :visible="true">
                <b-row style="padding-left: 10px; padding-bottom: 10px; !important;">
                    <b-col md="5" id="col-left" class="bColMasterForm">
                        <!-- <ABSProcessInputSelect @change="onSubPortfolioChange" :prop="PI_SubPortfolio" :value="M_SubPortfolio"/> -->
                        <ABSProcessInputSelectList @change="onSubPortfolioChange" :prop="PI_SubPortfolio" :value="M_SubPortfolio" :label="M_SubPortfolioLabel"/>
                    </b-col>                
                </b-row>
                <b-row v-show="isShow" style="padding-left: 10px; padding-bottom: 10px; !important;">
                    <b-col md="12" id="col-mid" class="bColMasterForm">
                        <b-container>
                            <div v-for="(module, index) in allModules" :key="index">
                                <b-row :no-gutters="true">
                                    <b-col cols="auto"> <span @click="showEventMethod(module.ModuleSeq, index)" class="module" :id="'module_'+module.ModuleSeq"><font-awesome-icon :icon="module.icon?module.icon:'plus-circle'" class="icon-expand" /></span> </b-col>
                                    <b-col cols="auto"> <input style="vertical-align:middle !important" :disabled="!canUpdate" type="checkbox" name="cb_module" :id="'M_'+module.ModuleSeq" @click="Update('M', module.ModuleSeq)" v-model="module.Checked" > </b-col>
                                    <b-col cols="auto"> <span>{{ module.ModuleName }}</span> </b-col>
                                </b-row>
                                <b-row :no-gutters="true" v-show="showEvent == module.ModuleSeq">
                                    <b-container v-if="onFilteredEvents.length > 0">
                                        <div v-for="(event, indexEvent) in onFilteredEvents" :key="indexEvent">
                                            <!-- Event -->
                                            <b-row style="margin-left: 26px" :no-gutters="true">
                                                <b-col cols="auto"> <span @click="showOptionMethod(module.ModuleSeq, event.EventSeq, indexEvent)" class="event" :id="'event_'+event.EventSeq"><font-awesome-icon :icon="event.icon?event.icon:'plus-circle'" class="icon-expand" /></span> </b-col>
                                                <b-col cols="auto"> <input style="vertical-align:middle !important" :disabled="!canUpdate" type="checkbox" name="cb_event" :id="'E_'+event.EventSeq" @click="Update('E', event.EventSeq)" v-model="event.Checked" > </b-col>
                                                <b-col cols="auto"> <span>{{ event.EventName }}</span> </b-col>
                                            </b-row>
                                            <!-- <b-row :no-gutters="true" v-show="showOption == event.EventSeq"> -->
                                            <b-row :no-gutters="true">
                                                <!-- <b-container v-if="onFilteredOptions.length > 0"> -->
                                                <b-container>
                                                <!-- <b-container> -->
                                                    <table style="margin-left: 55px">
                                                        <tr>
                                                            <td></td>
                                                            <td></td>
                                                            <td style="text-align:center !important" class="col-auto"> Add </td>
                                                            <td style="text-align:center !important" class="col-auto"> Edit </td>
                                                            <td style="text-align:center !important" class="col-auto"> Delete </td>
                                                            <td style="text-align:center !important" class="col-auto"> Print </td>
                                                            <td style="text-align:center !important" class="col-auto"> View </td>
                                                        </tr>
                                                        {{onFilteredEvents.Options}}
                                                        <tr v-for="(option, indexOption) in onFilteredEvents.Options" :key="indexOption">
                                                            <td class="col-auto"> <input style="vertical-align:middle !important" :disabled="!canUpdate" type="checkbox" name="cb_option" :id="'O_'+option.OptionSeq" @click="Update('O', option.OptionSeq)" :checked="option.Checked" v-model="option.set" > </td>
                                                            <td class="col-auto"> <span>{{ option.OptionName }}</span> </td>
                                                            <td class="col-auto" style="text-align:center !important"> <input :disabled="!canUpdate" type="checkbox" name="cb_optionStatus" :id="'OS_Add_'+option.OptionSeq" :checked="option.add" @click="Update('OS_Add', option.OptionSeq)" v-model="option.add" > </td>
                                                            <td class="col-auto" style="text-align:center !important"> <input :disabled="!canUpdate" type="checkbox" name="cb_optionStatus" :id="'OS_Edit_'+option.OptionSeq" :checked="option.edit" @click="Update('OS_Edit', option.OptionSeq)" v-model="option.edit" > </td>
                                                            <td class="col-auto" style="text-align:center !important"> <input :disabled="!canUpdate" type="checkbox" name="cb_optionStatus" :id="'OS_Delete_'+option.OptionSeq" :checked="option.delete" @click="Update('OS_Delete', option.OptionSeq)" v-model="option.delete" > </td>
                                                            <td class="col-auto" style="text-align:center !important"> <input :disabled="!canUpdate" type="checkbox" name="cb_optionStatus" :id="'OS_Print_'+option.OptionSeq" :checked="option.print" @click="Update('OS_Print', option.OptionSeq)" v-model="option.print" > </td>
                                                            <td class="col-auto" style="text-align:center !important"> <input :disabled="!canUpdate" type="checkbox" name="cb_optionStatus" :id="'OS_View_'+option.OptionSeq" :checked="option.view" @click="Update('OS_View', option.OptionSeq)" v-model="option.view" > </td>
                                                        </tr>
                                                    </table>
                                                </b-container>
                                                <!-- <b-container v-else>
                                                    <span style="margin-left: 55px">No Option Available</span>
                                                </b-container> -->
                                            </b-row>
                                            <!-- End Event -->
                                        </div>
                                    </b-container>
                                    <b-container style="margin-left: 26px" v-else>
                                        <span>No Event Available</span>
                                    </b-container>
                                </b-row>
                                <!-- End Module -->
                            </div>
                        </b-container>
                    </b-col>
                </b-row>
            </b-collapse>
            </keep-alive>
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
                cDisplayColumn:'SubPortfolioCd,Name' ,
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

            indexModuleOld: -1,
            indexEventOld: -1
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
                    el.print == true ||
                    el.view == true
                ) {
                    dataPost.push({
                        OptionSeq: el.OptionSeq,
                        AddStatus: el.add==true?1:0,
                        EditStatus: el.edit==true?1:0,
                        DeleteStatus: el.delete==true?1:0,
                        PrintStatus: el.print==true?1:0,
                        ViewStatus: el.view==true?1:0
                    })
                }
            })
            
            var param = {
                UserGroup: this.DataFromParent.UserGroup,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                UserInput: this.getDataUser().user_id,
                data: dataPost
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

            // this.getAllAccess()
        },
        resetButtonExpand (act, string) {
            act = act.toUpperCase()
            var dcM =  this.allModules_Temp //document.getElementsByClassName('module')
            var dcE =  this.allEvents_Temp //document.getElementsByClassName('event')
            var dcO =  this.allOptions_Temp //document.getElementsByClassName('option')
            var stringg = string == "+"?"plus-circle":"minus-circle"

            if (act == 'ALL') {
                if (this.showOption !== null) {
                    var eventIdx = this.allEvents.map(x => x.EventSeq).indexOf(this.showOption)
                    this.allEvents[eventIdx].icon = "plus-circle"
                    // document.getElementById('event_'+this.showOption).innerHTML = "<font-awesome-icon icon='plus-circle' class='icon-expand' />"
                    this.showOption = null
                    this.onFilteredOptions = []
                }

                if (this.showEvent !== null) {
                    var moduleIdx = this.allModules.map(x => x.ModuleSeq).indexOf(this.showEvent)
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
        expand (from, param) {
            this.$store.commit('setStatusLoader', true)

            setTimeout(() => {
                if(from == 'M'){
                    if(param == this.showEvent){
                        this.onFilteredEvents = []
                        this.onFilteredOptions = []
                        var moduleIdx = this.allModules.map(x => x.ModuleSeq).indexOf(param)
                        var eventIdx = this.allEvents.map(x => x.EventSeq).indexOf(this.showOption)
                        this.allModules[moduleIdx].icon = "plus-circle"
                        if (eventIdx > -1) this.allEvents[eventIdx].icon = "plus-circle"
                        // document.getElementById('module_'+param).innerHTML = "<font-awesome-icon icon='plus-circle' class='icon-expand' />"
                        this.showEvent = null
                        this.showOption = null
                    }
                    else {
                        // this.onFilteredEvents = this.allEvents.filter(val => { return val.ModuleSeq == param })

                        for (let x = 0 ; x < this.allEvents.length ; x ++) {
                            if (this.allEvents[x].ModuleSeq == param) {
                                this.onFilteredEvents.push(this.allEvents[x])
                            }
                        }

                        this.showEvent = param
                        this.resetButtonExpand(from, "+")
                        var moduleIdx = this.allModules.map(x => x.ModuleSeq).indexOf(param)
                        this.allModules[moduleIdx].icon = "minus-circle"
                        // document.getElementById('module_'+param).innerHTML = "<font-awesome-icon icon='minus-circle' class='icon-expand' />"
                    }
                }
                else {
                    if(param == this.showOption){
                        this.showOption = null
                        this.onFilteredOptions = []
                        var eventIdx = this.allEvents.map(x => x.EventSeq).indexOf(param)
                        this.allEvents[eventIdx].icon = "plus-circle"
                        // document.getElementById('event_'+param).innerHTML = "<font-awesome-icon icon='plus-circle' class='icon-expand' />"
                    }
                    else {
                        // alert('woi')
                        // console.log(this.showEvent, param)
                        // this.onFilteredOptions = this.allOptions.filter(val => { return val.ModuleSeq == this.showEvent && val.EventSeq == param })
                        for (let x = 0 ; x < this.allOptions.length ; x ++) {
                            if (this.allOptions[x].ModuleSeq == this.showEvent && this.allOptions[x].EventSeq == param) {
                                this.onFilteredOptions.push(this.allOptions[x])
                            }
                        }
                        // console.log(this.onFilteredOptions)
                        this.showOption = param
                        this.resetButtonExpand(from, "+")
                        var eventIdx = this.allEvents.map(x => x.EventSeq).indexOf(param)
                        this.allEvents[eventIdx].icon = "minus-circle"
                        // document.getElementById('event_'+param).innerHTML = "<font-awesome-icon icon='minus-circle' class='icon-expand' />"
                    }
                }

                this.$store.commit('setStatusLoader', false)
            }, 1000)
        },
        onSubPortfolioChange (data) {
            // console.log(data)
            // if (data.id == null || data.id == '') {
            //     this.isShow = false
            //     this.resetButtonExpand("ALL", "+")
            //     this.M_SubPortfolio = data.id
            //     this.M_SubPortfolioLabel = data.label
            //     return
            // }

            this.M_SubPortfolio = data.id
            this.M_SubPortfolioLabel = data.label
            // this.resetButtonExpand("ALL", "+")
            this.showEvent = null
            // this.showOption = null
            // this.onFilteredEvents = []
            // this.onFilteredOptions = []

            // this.allOptions.map(x => {
            //     x.set = false
            //     x.add = false
            //     x.edit = false
            //     x.delete = false
            //     x.print = false
            //     x.view = false
            //     return true 
            // })
            // this.allEvents.map(x => { x.set = false; return true })
            // this.allModules.map(x => { x.set = false; return true })
            // this.getGroupSubPortfolio()

            var param = {
                // OptionSeq: this.getOptionSeq().OptionSeq,
                // LineNo: 2,
                // UserGroup: this.DataFromParent.UserGroup,
                // SubPortfolioCd: this.M_SubPortfolio

                SubPortfolioCd: this.M_SubPortfolio,
                Usergroup: this.DataFromParent.UserGroup,
                UserId: this.getDataUser().user_id
            }
            
            this.postEncode( this.getUrlGetGroupPermisionModule(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data
                // this.allOptions = this.allOptions_Temp
                // var allO = this.allOptions
                // var allE = this.allEvents
                // var allM = this.allModules

                this.$nextTick(() => {
                    // console.table(data)
                    var x
                    var l = data.length
                    for (x = 0; x < l; x++) {
                        if (data[x].Checked == '0') {
                            data[x].Checked = false
                        } else {
                            data[x].Checked = true
                        }
                    }
                    this.allModules = data
                    // alert(this.allModules.length)
                //     data.forEach(element => {
                //         var idx = allO.map(el => { return el.OptionSeq }).indexOf(element.optionseq)
                //         if (idx > -1) {
                //             this.allOptions[idx].set = true
                //             this.allOptions[idx].add = element.addstatus==1?true:false
                //             this.allOptions[idx].edit = element.editstatus==1?true:false
                //             this.allOptions[idx].delete = element.deletestatus==1?true:false
                //             this.allOptions[idx].print = element.printstatus==1?true:false
                //             this.allOptions[idx].view = element.viewstatus==1?true:false

                //             var idxEvent = allE.map(el => { return el.EventSeq }).indexOf(this.allOptions[idx].EventSeq)
                //             this.allEvents[idxEvent].set = true

                //             var idxModule = allM.map(el => { return el.ModuleSeq }).indexOf(this.allOptions[idx].ModuleSeq)
                //             this.allModules[idxModule].set = true
                //         }
                //     })
                    this.canUpdate = true
                    this.isShow = true
                })

                this.$forceUpdate()
            })
        },
        showEventMethod (data, index) {
            if (this.indexModuleOld != -1) {
                this.allModules[this.indexModuleOld].icon = "plus-circle"
            }
            this.indexModuleOld = index
            this.allModules[index].icon = "minus-circle"

            this.onFilteredEvents = []
            this.showEvent = data
            var param = {
                SubPortfolioCd: this.M_SubPortfolio,
                Usergroup: this.DataFromParent.UserGroup,
                ModuleSeq: data,
                UserId: this.getDataUser().user_id
            }
            
            this.postEncode( this.getUrlGetGroupPermisionEvent(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data

                this.$nextTick(() => {
                    // console.table(data)
                    var x
                    var l = data.length
                    for (x = 0; x < l; x++) {
                        if (data[x].Checked == '0') {
                            data[x].Checked = false
                        } else {
                            data[x].Checked = true
                        }
                        data[x].Options = []
                    }
                    this.onFilteredEvents = data

                    // this.canUpdate = true
                    // this.isShow = true
                })

                this.$forceUpdate()
            })
        },
        showOptionMethod (moduleSeq, eventSeq, index) {
            if (this.indexEventOld != -1) {
                this.onFilteredEvents[this.indexEventOld].icon = "plus-circle"
            }
            this.indexEventOld = index
            this.onFilteredEvents[index].icon = "minus-circle"

            this.onFilteredOptions = []
            this.showOption = eventSeq
            var param = {
                SubPortfolioCd: this.M_SubPortfolio,
                Usergroup: this.DataFromParent.UserGroup,
                ModuleSeq: moduleSeq,
                EventSeq: eventSeq,
                UserId: this.getDataUser().user_id
            }
            
            this.postEncode( this.getUrlGetGroupPermisionOption(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data

                this.$nextTick(() => {
                    // console.table(data)
                    var x
                    var l = data.length
                    for (x = 0; x < l; x++) {
                        if (data[x].Checked == '0') {
                            data[x].Checked = false
                        } else {
                            data[x].Checked = true
                        }
                    }
                    // this.onFilteredOptions = data
                    this.onFilteredEvents[index].Options = data

                    // this.canUpdate = true
                    // this.isShow = true
                })

                this.$forceUpdate()
            })
        },
        getGroupSubPortfolio () {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 2,
                UserGroup: this.DataFromParent.UserGroup,
                SubPortfolioCd: this.M_SubPortfolio
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
                    data.forEach(element => {
                        var idx = allO.map(el => { return el.OptionSeq }).indexOf(element.optionseq)
                        if (idx > -1) {
                            this.allOptions[idx].set = true
                            this.allOptions[idx].add = element.addstatus==1?true:false
                            this.allOptions[idx].edit = element.editstatus==1?true:false
                            this.allOptions[idx].delete = element.deletestatus==1?true:false
                            this.allOptions[idx].print = element.printstatus==1?true:false
                            this.allOptions[idx].view = element.viewstatus==1?true:false

                            var idxEvent = allE.map(el => { return el.EventSeq }).indexOf(this.allOptions[idx].EventSeq)
                            this.allEvents[idxEvent].set = true

                            var idxModule = allM.map(el => { return el.ModuleSeq }).indexOf(this.allOptions[idx].ModuleSeq)
                            this.allModules[idxModule].set = true
                        }
                    })
                    this.canUpdate = true
                    this.isShow = true
                })

                this.$forceUpdate()
            })
        },
        // getAllAccess () {
        //     var param = {
        //         UserId: this.getDataUser().user_id,
        //         SubPortfolioCd: this.record.SubPortfolio
        //     }
            
        //     this.postJSON( this.getUrlGetGroupPermission(), param )
        //     .then(response => {
        //         if(response == null) return
                
        //         var data = response.Data
                
        //         this.allModules = data.Module
        //         this.allEvents = data.Event
        //         this.allOptions = data.Option
        //         this.allModules_Temp = data.Module
        //         this.allEvents_Temp = data.Event
        //         this.allOptions_Temp = data.Option

        //         this.resetButtonExpand('ALL', '+')
        //     })
        // },
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
                var idE = this.allEvents_Temp.map(x => { return x.EventSeq }).indexOf(param)
                var idEFiltered = this.onFilteredEvents.map(x => { return x.EventSeq }).indexOf(param)

                var idM = this.allModules_Temp.map(x => { return x.ModuleSeq }).indexOf(this.allEvents[idE].ModuleSeq)

                // set Module
                var isCheckMdl = this.isUnCheckAll('E', this.allEvents[idE].ModuleSeq)
                this.allModules[idM].set = isCheckMdl
                document.getElementById('M_' + this.allEvents[idE].ModuleSeq).checked = isCheckMdl

                this.checkedTheChild('E', param, null, this.allEvents[idE].ModuleSeq)
            }
            else if (from == 'O') {
                var idO = this.allOptions_Temp.map(x => { return x.OptionSeq }).indexOf(param)
                var idOFiltered = this.onFilteredOptions.map(x => { return x.OptionSeq }).indexOf(param)

                var idE = this.allEvents_Temp.map(x => { return x.EventSeq }).indexOf(this.allOptions[idO].EventSeq)
                var idEFiltered = this.onFilteredEvents.map(x => { return x.EventSeq }).indexOf(this.allOptions[idO].EventSeq)

                var idM = this.allModules_Temp.map(x => { return x.ModuleSeq }).indexOf(this.allOptions[idO].ModuleSeq)

                // set Event
                var isCheckEvt = this.isUnCheckAll('O', this.allOptions[idO].EventSeq)
                this.allEvents[idE].set = isCheckEvt
                this.onFilteredEvents[idEFiltered].set = isCheckEvt
                document.getElementById('E_' + this.allOptions[idO].EventSeq).checked = isCheckEvt

                // set Module
                var isCheckMdl = this.isUnCheckAll('E', this.allOptions[idO].ModuleSeq)
                this.allModules[idM].set = isCheckMdl
                document.getElementById('M_' + this.allOptions[idO].ModuleSeq).checked = isCheckMdl

                this.checkedTheChild('O', param, this.showOption, this.showEvent)
            }
            else if (from == 'OS') {
                var idO = this.allOptions_Temp.map(x => { return x.OptionSeq }).indexOf(param)
                var idOFiltered = this.onFilteredOptions.map(x => { return x.OptionSeq }).indexOf(param)

                var idE = this.allEvents_Temp.map(x => { return x.EventSeq }).indexOf(this.allOptions[idO].EventSeq)
                var idEFiltered = this.onFilteredEvents.map(x => { return x.EventSeq }).indexOf(this.allOptions[idO].EventSeq)

                var idM = this.allModules_Temp.map(x => { return x.ModuleSeq }).indexOf(this.allOptions[idO].ModuleSeq)

                // set Option
                var isCheckOpt = this.isUnCheckAll('OS', param)
                this.allOptions[idO].set = isCheckOpt
                this.onFilteredOptions[idOFiltered].set = isCheckOpt
                document.getElementById('O_' + param).checked = isCheckOpt

                // set Event
                var isCheckEvt = this.isUnCheckAll('O', this.allOptions[idO].EventSeq)
                this.allEvents[idE].set = isCheckEvt
                this.onFilteredEvents[idEFiltered].set = isCheckEvt
                document.getElementById('E_' + this.allOptions[idO].EventSeq).checked = isCheckEvt

                // set Module
                var isCheckMdl = this.isUnCheckAll('E', this.allOptions[idO].ModuleSeq)
                this.allModules[idM].set = isCheckMdl
                document.getElementById('M_' + this.allOptions[idO].ModuleSeq).checked = isCheckMdl
            }
        },
        checkedTheChild (from, param, E=null, M=null) {
            if (from == 'O') {
                var idO = this.allOptions_Temp.map(x => { return x.OptionSeq }).indexOf(param)

                // Efect To Status
                this.allOptions[idO].add = this.allOptions[idO].set
                this.allOptions[idO].edit = this.allOptions[idO].set
                this.allOptions[idO].delete = this.allOptions[idO].set
                this.allOptions[idO].print = this.allOptions[idO].set
                this.allOptions[idO].view = this.allOptions[idO].set

                if (this.showOption == param) {
                    document.getElementById('OS_Add_' + param).checked = this.allOptions[idO].set
                    document.getElementById('OS_Edit_' + param).checked = this.allOptions[idO].set
                    document.getElementById('OS_Delete_' + param).checked = this.allOptions[idO].set
                    document.getElementById('OS_Print_' + param).checked = this.allOptions[idO].set
                    document.getElementById('OS_View_' + param).checked = this.allOptions[idO].set
                }
            }
            else if (from == 'E') {
                var idE = this.allEvents_Temp.map(x => { return x.EventSeq }).indexOf(param)
                var allOpt = this.allOptions.filter(x => { return x.ModuleSeq == M && x.EventSeq == param })
                allOpt.forEach((el, i) => {
                    var idO = this.allOptions.map(x => { return x.OptionSeq }).indexOf(el.OptionSeq)
                    this.allOptions[idO].set = this.allEvents[idE].set
                    if(el.EventSeq == this.showOption){
                        document.getElementById('O_' + el.OptionSeq).checked = this.allEvents[idE].set
                    }
                    this.checkedTheChild('O', el.OptionSeq, param, M)
                })
            }
            else if (from == 'M') {
                var idM = this.allModules_Temp.map(x => { return x.ModuleSeq }).indexOf(param)
                var allEvt = this.allEvents.filter(x => { return x.ModuleSeq == param })
                allEvt.forEach((el, i) => {
                    var idE = this.allEvents.map(x => { return x.EventSeq }).indexOf(el.EventSeq)
                    this.allEvents[idE].set = this.allModules[idM].set
                    if (el.ModuleSeq == this.showEvent) {
                        document.getElementById('E_' + el.EventSeq).checked = this.allModules[idM].set
                    }
                    this.checkedTheChild('E', this.allEvents[idE].EventSeq, null, param)
                })
            }
        },
        isUnCheckAll (from, param = null) {
            if (from == 'OS') {
                var idO = this.allOptions_Temp.map(x => { return x.OptionSeq }).indexOf(param)

                if (
                    this.allOptions[idO].add !== true &&
                    this.allOptions[idO].edit !== true &&
                    this.allOptions[idO].delete !== true &&
                    this.allOptions[idO].print !== true &&
                    this.allOptions[idO].view !== true
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