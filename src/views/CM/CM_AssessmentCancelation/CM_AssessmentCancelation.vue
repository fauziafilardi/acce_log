    <template>
    <div class="height--full">
        <HeaderFormListVuex2 :isProcess = "true" />

       <div class="content-app-form__body form-process">
            <div class="tab-list-process">
            <ABSListVuex
                :prop = "propList"
                :title = "''"
                :isProcess = "true"
                @rowClicked = "rowClicked"
                @rowDblClicked = "doDoubleClick"
                @rowLinkClick = "rowLink"
                @pageSize = "M_PageSize"
                @pagination = "M_Pagination"
                @filter = "M_Advance_Filter"
                @headTable = "M_Head_Table"
            />
            </div>

            <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">               
                <div class="div-collapse" v-b-toggle.collapse1>
                <span>
                    <span style="float:Left; color: #81b3e9 !important;letter-spacing: 1px;margin-top: 2px;margin-left: 3px" >
                        Process Information <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                    </span>
                </span>
            </div>
                <b-collapse id="collapse1" :visible="true">
                    <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">
                        <b-col md="12" id="col-left" class="bColMasterForm">	
                            <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                                <b-row style="padding-left:10px;">
                                    <b-col md="12" id="col-left">
                                        <b-row>
                                            <b-col md="6">
                                                <ABSInputSelectList @change="OnreasoncdChange" :prop="PI_reasoncd" :value="M_CM_AssessmentCancelation.reasoncd" :label="M_CM_AssessmentCancelation.reasoncdLabel" ref="ref_reasoncd" />
                                            </b-col>
                                        </b-row>
                                        <b-row>
                                            <b-col md="6">
                                                <ABSinputTextVuex :prop="PI_reasondescs" v-model="M_CM_AssessmentCancelation.reasondescs"  ref="ref_reasondescs"/>
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
    </div>
</template>

<script>

export default {
    data() {
        return {
            propList: {
                initialWhere: "Status = 'C'",
                LineNo: 0,
                PageLevel: 1,
                TabIndex: 1
            },
		    FormType: "Process",
       
            IEBy: {Input: '', Edit: ''},

            M_CM_AssessmentCancelation :{
                reasoncd: '',
                reasondescs: ''
            },

            PI_reasoncd: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupCMReason'    , 
                    ColumnDB: 'ReasonCd'   , 
                    InitialWhere: "ModuleCd = 'CM' OR ModuleCd IS NULL"   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'required', 
                cName: 'reasoncd', 
                cLabel: 'Reason Code', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 1, 
                cTriggered: false, 
                cDefault: '', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_1_1', 
                cStatic: false, 
                cOption: [], 
                cMasterUrl: 'CM/CM_Reason' ,
                cDisplayColumn: 'ReasonCd,Descs' ,
            }, 
            PI_reasondescs: { 
                cValidate :'required|max:150', 
                cName: 'reasondescs', 
                cLabel: 'Reason Description', 
                cLabelSize: 4, 
                cOrder: 2, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: 1, 
                cTabIndex: 1, 
                cParentForm: 'FormScope_1_1' 
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
        PageLevel () {
            return 1
        },
        TabIndex () {
            return 1
        },
  },
    methods: {
        OnreasoncdChange (data) {
            this.M_CM_AssessmentCancelation.reasoncd = data.id
            this.M_CM_AssessmentCancelation.reasoncdLabel = data.label
            this.M_CM_AssessmentCancelation.reasondescs = data.Descs
        },
        toToolbar() {
            return this.$children[0].$children[0]
        },
        toList() {
            return this.$children[1]
        },
        rowClicked (record, index) {},
        doDoubleClick () {},
        rowLink (url) {},
        M_PageSize () {},
        M_Pagination () {},
        M_Advance_Filter () {},
        M_Head_Table () {},
        M_Search(data){
           this.toList().doGetList(data,'eb_getList')
        },
        M_ClearForm(){
            this.M_CM_AssessmentCancelation = {
                reasoncd: '',
                reasondescs: ''
            }
        },
        M_Post() {
            var data = this.toList().getRowSelected()  //this.FormToABSList().getRowSelected()
            var dataPost = []

            data.forEach((value) => {
                // dt = dt + value.row_id + ','
                dataPost.push({
                    _Message_: "",
                    SubPortfolioCd : this.getDataUser().subportfolio_cd,
                    Status: 'X',
                    ReasonCd: this.M_CM_AssessmentCancelation.reasoncd,
                    ReasonDescs: this.M_CM_AssessmentCancelation.reasondescs,
                    AssessmentNo : value.AssessmentNo,
                    CancelDate: this.getToday(),
                    UserInput : this.getDataUser().user_id,
                    _Message_: ''
                })
            })

            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 0,
                Data: dataPost
            }
            
            this.postJSONMulti( this.getUrlPostMulti(), param )
            .then(response => {
                if (response == null) return
                this.$store.commit('setEventStatus', 'POST')
                this.M_ClearForm()
                this.$store.commit('setStatus', 'view')
                this.$store.commit('setStatus', 'new')
                this.toList().doGetList("", "eb_getList")
            })
            
            // this.M_ClearForm()
            // var data = this.toList().getRowSelected()
            // var dt = ''
            
            // data.forEach((value) => {
            //     dt = dt + value.row_id + ','
            // })

            // dt = dt.slice(0,-1)

            // var param = {
            //     OptionSeq: this.getOptionSeq().OptionSeq,
            //     SubPortfolioCd:this.getDataUser().subportfolio_cd,
            //     PortfolioCd:this.getDataUser().portfolio_cd,
            //     LineNo: 0,
            //     Data: dt,
            //     SourceValue:"SubPortfolioCd,Status = 'X',ReasonCd = '" + this.M_CM_AssessmentCancelation.reasoncd + "',ReasonDescs = '" + this.M_CM_AssessmentCancelation.reasondescs + "',AssessmentNo,CancelDate = '" + this.getToday() + "',UserInput",
            //     IsDetailMessage :false
            // };
            
            // this.postJSONMulti(this.getUrlPostMulti(), param).then(response => {
            //     if (response == null) return
            //     if(response.Data.length==0){
            //         this.alertSuccess("Posting Data Successfully")
            //     }

            //     this.$store.commit('setEventStatus', 'POST')
            //     this.toList().doGetList("", "eb_getList")
            // })
        },
        setToolbarButton() {},
    },
    beforeCreate: function () {
    },
    created: function() {
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.$store.commit('setFormType','Process')
        this.$store.commit('setStatus', 'new')
        this.$store.commit('setListDisable', false)
        this.$store.commit('setLevel', 1)
        this.$store.commit('setTab', 1)
        this.toToolbar().ProcessPS()
        this.hideSideBarMenu()
        this.toList().doGetList('','eb_getList')
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

