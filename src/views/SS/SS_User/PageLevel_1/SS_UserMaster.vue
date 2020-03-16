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
                                        <ABSinputTextVuex @input="OnuseridChange" :prop="PI_userid" v-model="M_SS_UserMaster.userid"  ref="ref_userid"/>
                                      </b-col>
                                      <b-col md="6">
                                        <ABSinputCheckBox @input="OnisinactiveChange" :prop="PI_isinactive" v-model="M_SS_UserMaster.isinactive"  ref="ref_isinactive" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelectList @change="OnusergroupChange" :prop="PI_usergroup" :value="M_SS_UserMaster.usergroup" :label="M_SS_UserMaster.usergroupLabel" ref="ref_usergroup" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnusernameChange" :prop="PI_username" v-model="M_SS_UserMaster.username"  ref="ref_username"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="Onhand_phoneChange" :prop="PI_hand_phone" v-model="M_SS_UserMaster.hand_phone"  ref="ref_hand_phone"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnemailChange" :prop="PI_email" v-model="M_SS_UserMaster.email"  ref="ref_email"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSInputSelect2 @change="OnuserlevelChange" :prop="PI_userlevel" :value="M_SS_UserMaster.userlevel"  ref="ref_userlevel" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnpositionChange" :prop="PI_position" v-model="M_SS_UserMaster.position"  ref="ref_position"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnreferencenoChange" :prop="PI_referenceno" v-model="M_SS_UserMaster.referenceno"  ref="ref_referenceno"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputDateVuex @input="OnexpireddateChange" :prop="PI_expireddate" v-model="M_SS_UserMaster.expireddate"  ref="ref_expireddate" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputPassword @input="OnpasswordChange" :prop="PI_password" v-model="M_SS_UserMaster.password"  ref="ref_password"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputPassword @input="OnconfirmnewpasswordChange" :prop="PI_confirmnewpassword" v-model="M_SS_UserMaster.confirmnewpassword"  ref="ref_confirmnewpassword"/>
                                      </b-col>
                                    </b-row>
                                     <b-row>
                                        <b-col md="6" v-show="err1">                                            
                                            <b-row v-show="err1">
                                                <b-col offset="4"><label class="lbl-value-view-form" style="color:red"> Incorrect Password</label></b-col>
                                            </b-row>                                           
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputRadioButtonVuex @input="OnusertypeChange" :prop="PI_usertype" v-model="M_SS_UserMaster.usertype"  ref="ref_usertype" />
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="6">
                                        <ABSinputTextVuex @input="OnfailedattemptsChange" :prop="PI_failedattempts" v-model="M_SS_UserMaster.failedattempts"  ref="ref_failedattempts"/>
                                      </b-col>
                                    </b-row>
                                </b-col> <!-- table close -->
                  
							</b-row>
							<!-- <ABSTAnalysis :prop="PTAnalysis" /> -->
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
		cInsertKey:'',
		FormType: "List",
		Module:"SS",
            propList: {
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex, 
                OrderBy: '', 
                SourceField: '', 
                ParamView: '' 
            },
       
            IEBy: {Input: '', Edit: ''},
            TempPwd: "",	

            M_SS_UserMaster :{
                userid: '',
                usergroup: '',
                usergroupLabel: '',
                username: '',
                password: '',
                email: '',
                userlevel: 'M',
                expireddate: '',
                logindate: '',
                statuslogin: '',
                isinactive: '',               
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                position: '',
                hand_phone: '',
                referenceno: '',
                controlsequenceno: 0,
                usertype: 'P',
                failedattempts: 0,
                lastchangepassword: '',
                rowid: 0,
                groupdescs: '',
                confirmnewpassword: ''
                    }
            ,
            PI_userid: { 
                cValidate :'required|max:10', 
                cName: 'userid', 
                cLabel: 'User ID ', 
                cLabelSize: 4, 
                cOrder: 1, 
                cKey: true, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_isinactive: { 
                cValidate :'', 
                cName: 'isinactive', 
                cLabel: 'Mark user as INACTIVE', 
                cLabelSize: 4, 
                cOptions: [ { text: '', value: true } ], 
                cOrder: 0, 
                cKey: false, 
                cVisible: true, 
                cProtect: false, 
                cDefault: '', 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_usergroup: { 
                dataLookUp: { 
                    LookUpCd: 'GetUserGroup'    , 
                    ColumnDB: 'user_group'   , 
                    InitialWhere: ""   , 
                    ParamWhere: ''  
                        }, 
                cValidate :'', 
                cName: 'usergroup', 
                cLabel: 'Group', 
                cKey: false, 
                cLabelSize: 4, 
                cOrder: 2, 
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
                cMasterUrl: 'SS/SS_Group' ,
                cDisplayColumn: 'user_group,descs' ,
            }, 
            PI_username: { 
                cValidate :'required|max:50', 
                cName: 'username', 
                cLabel: 'User Name ', 
                cLabelSize: 4, 
                cOrder: 3, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_hand_phone: { 
                cValidate :'', 
                cName: 'hand_phone', 
                cLabel: 'hand_phone', 
                cLabelSize: 4, 
                cOrder: 4, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_email: { 
                cValidate :'', 
                cName: 'email', 
                cLabel: 'Email Address', 
                cLabelSize: 4, 
                cOrder: 5, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_userlevel: { 
                dataLookUp: null, 
                cValidate :'', 
                cName: 'userlevel', 
                cLabel: 'User Level', 
                cLabelSize: 4, 
                cOrder: 6, 
                cKey: false, 
                cTriggered: false, 
                cDefault: 'M', 
                cProtect: false, 
                cVisible:  true, 
                cAsync:  false, 
                cFilter: true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex, 
                cStatic: true, 
                cOption: [{ label: 'Staff', id: 'S' },{ label: 'Supervisor', id: 'P' },{ label: 'Manager', id: 'M' }], 
                cMasterUrl: '' ,
                cDisplayColumn: '' ,
            }, 
            PI_position: { 
                cValidate :'', 
                cName: 'position', 
                cLabel: 'Position', 
                cLabelSize: 4, 
                cOrder: 7, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_referenceno: { 
                cValidate :'', 
                cName: 'referenceno', 
                cLabel: 'Reference No', 
                cLabelSize: 4, 
                cOrder: 8, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_expireddate: { 
                cValidate :'', 
                cName: 'expireddate', 
                cLabel: 'Expired Date (leave blank for no expiry date)', 
                cLabelSize: 4, 
                cOrder: 9, 
                cKey: false, 
                cVisible:  true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_password: { 
                cValidate :'', 
                cName: 'password', 
                cLabel: 'New Password', 
                cLabelSize: 4, 
                cOrder: 10, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_confirmnewpassword: { 
                cValidate :'', 
                cName: 'confirmnewpassword', 
                cLabel: 'Confirm New Password', 
                cLabelSize: 4, 
                cOrder: 11, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_usertype: { 
                cValidate :'', 
                cName: 'usertype', 
                cId: 'rdbusertype', 
                cRadioOptions: [{ text: 'Public', value: 'P' },{ text: 'Internal', value: 'I' },], 
                cRadioDefaultOption: 'P', 
                cLabel:'User Type', 
                cLabelSize: 4, 
                cOrder: 12, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_failedattempts: { 
                cValidate :'', 
                cName: 'failedattempts', 
                cLabel: 'Login Failed Attempt', 
                cLabelSize: 4, 
                cOrder: 13, 
                cKey: false, 
                cType: 'text',
                cVisible: true, 
                cProtect: false, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 

			PTAnalysis: {
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cPageMasterSeq: this.data.PageMasterSeq,
                cFormPageNo: this.data.PageOrder
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
		return this.$store.getters.GetPage1Data
	}
  },
    methods: {		
        OnuseridChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{userid}
            }
        })
        this.$forceUpdate()
        },
        OnisinactiveChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{isinactive}
            }
        })
        this.$forceUpdate()
        },
        OnusergroupChange (data) {
            console.log(data)
            this.M_SS_UserMaster.usergroup = data.id
            this.M_SS_UserMaster.usergroupLabel = data.label
            this.$nextTick(() => {
                if (this.inputStatus != "VIEW") {
                    //x
                }
            })
            this.$forceUpdate()
        },
        OnusernameChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{username}
            }
        })
        this.$forceUpdate()
        },
        Onhand_phoneChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{hand_phone}
            }
        })
        this.$forceUpdate()
        },
        OnemailChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{email}
            }
        })
        this.$forceUpdate()
        },
        OnuserlevelChange (data) {
            this.M_SS_UserMaster.userlevel = data.id
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{userlevel}
            }
        })
        this.$forceUpdate()
        },
        OnpositionChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{position}
            }
        })
        this.$forceUpdate()
        },
        OnreferencenoChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{referenceno}
            }
        })
        this.$forceUpdate()
        },
        OnexpireddateChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{expireddate}
            }
        })
        this.$forceUpdate()
        },
        OnpasswordChange (data) {
            if(data != this.M_SS_UserMaster.password){
                this.error = true
                this.err1 = true
            }else{
                this.err1 = false
                this.error = false
            }
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
                if (data != "") {
                    this.PI_confirmnewpassword.cValidate = "required"
                    this.$refs.ref_confirmnewpassword.isRequired = true
                }
                else {
                    this.PI_confirmnewpassword.cValidate = ""
                    this.$refs.ref_confirmnewpassword.isRequired = false
                }
            }
        })
        this.$forceUpdate()
        },
        OnconfirmnewpasswordChange (data) {
        this.$nextTick(() => {
            if(data != this.M_SS_UserMaster.confirmnewpassword){
                this.error = true
                this.err1 = true
            }else{
                this.err1 = false
                this.error = false
            }
            if (this.inputStatus != "VIEW") {
//{confirmnewpassword}
            }
        })
        this.$forceUpdate()
        },
        OnusertypeChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{usertype}
            }
        })
        this.$forceUpdate()
        },
        OnfailedattemptsChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{failedattempts}
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
        },		
        M_Post(){
        },
        M_Insert() {
            var isInActive = ""

            if (this.M_SS_UserMaster.isinactive === true) {
                isInActive = "Y"
            }
            else {
                if (this.M_SS_UserMaster.expireddate == '' || this.M_SS_UserMaster.expireddate == null) {
                    isInActive = "N"
                }
                else {
                    var intervalDate = this.datediff(new Date(), this.M_SS_UserMaster.expireddate)
                    
                    if (intervalDate <= 0) {
                        isInActive = "Y"
                    }
                    else {
                        isInActive = "N"
                    }
                }
            }

            var pwd = ''

            if (this.M_SS_UserMaster.password != "") {
                if (this.M_SS_UserMaster.confirmnewpassword != this.M_SS_UserMaster.password) {
                    this.alertWarning("Your Confirm New Password Should Be Same With New Password !")
                    return
                }
                else {
                    pwd = this.M_SS_UserMaster.password
                }
            }

            //   this.getJSON(this.getUrlAuthEncrypt() + this.M_SS_UserMaster.password)
            // .then(ress => {
            //     if (ress != null){
                    // console.log(ress.Data);
                    // this.M_SS_UserMaster.password = ress.Data
                    // console.log(this.getDataUser());

                    var param = {			
                        // OptionSeq: this.getOptionSeq().OptionSeq,
                        // LineNo: this.$parent.data.page_order,
                        portfolio_cd :this.getDataUser().portfolio_cd,
                        user_id: this.M_SS_UserMaster.userid,
                        user_group: this.M_SS_UserMaster.usergroup,
                        user_name: this.M_SS_UserMaster.username,
                        email: this.M_SS_UserMaster.email,
                        password: this.M_SS_UserMaster.password,
                        user_level: this.M_SS_UserMaster.userlevel,
                        expired_date: this.M_SS_UserMaster.expireddate == '' || this.M_SS_UserMaster.expireddate == null ? 'NULL' : this.M_SS_UserMaster.expireddate ,
                        is_inactive: isInActive,
                        user_input: this.getDataUser().user_id ,
                        position: this.M_SS_UserMaster.position,
                        hand_phone: this.M_SS_UserMaster.hand_phone,
                        reference_no: this.M_SS_UserMaster.referenceno,
                        user_type: this.M_SS_UserMaster.usertype,
                        failed_attempts: this.M_SS_UserMaster.failedattempts
                    }

                    this.postJSON(this.getUrlUserInsert(), param)
                    .then((response) => {
                        if(response == null) return

                        //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                        this.$parent.resultInsert(response.Message)
                            
                        
                    })
            //     }
                
            // })
        },
        M_Update() {
            var isInActive = ""

            if (this.M_SS_UserMaster.isinactive === true) {
                isInActive = "Y"
            }
            else {
                if (this.M_SS_UserMaster.expireddate == '' || this.M_SS_UserMaster.expireddate == null) {
                    isInActive = "N"
                }
                else {
                    var intervalDate = this.datediff(new Date(), this.M_SS_UserMaster.expireddate)

                    if (intervalDate <= 0) {
                        isInActive = "Y"
                    }
                    else {
                        isInActive = "N"
                    }
                }
            }

            var pwd = this.TempPwd

            if (this.M_SS_UserMaster.password != "") {
                if (this.M_SS_UserMaster.confirmnewpassword != this.M_SS_UserMaster.password) {
                    this.alertWarning("Your Confirm New Password Should Be Same With New Password !")
                    return
                }
            }

            //  this.getJSON(this.getUrlAuthEncrypt() + this.M_SS_UserMaster.password)
            // .then(ress => {
                // if (ress != null){

                    // this.M_SS_UserMaster.password = ress.Data
                    // console.log(this.M_SS_UserMaster.password);


                var param = {
                    // OptionSeq: this.getOptionSeq().OptionSeq,
                    // LineNo: this.$parent.data.page_order,
                    portfolio_cd :this.getDataUser().portfolio_cd,
                    user_id: this.M_SS_UserMaster.userid,
                    user_group: this.M_SS_UserMaster.usergroup,
                    user_name: this.M_SS_UserMaster.username,
                    email: this.M_SS_UserMaster.email,
                    new_password: this.M_SS_UserMaster.password,//pwd,
                    user_level: this.M_SS_UserMaster.userlevel,
                    expired_date: this.M_SS_UserMaster.expireddate == '' || this.M_SS_UserMaster.expireddate == null ? 'NULL' : this.M_SS_UserMaster.expireddate ,
                    is_inactive: isInActive,
                    user_edit: this.getDataUser().user_id ,
                    lastupdatestamp: this.M_SS_UserMaster.lastupdatestamp,
                    position: this.M_SS_UserMaster.position,
                    hand_phone: this.M_SS_UserMaster.hand_phone,
                    reference_no: this.M_SS_UserMaster.referenceno,
                    user_type: this.M_SS_UserMaster.usertype,
                    failed_attempts: this.M_SS_UserMaster.failedattempts,
                    lastupdatestamp: this.M_SS_UserMaster.lastupdatestamp
                }

                this.postJSON(this.getUrlUserUpdate(), param)
                .then((response) => {
                    if(response == null) return

                    //kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
                    this.$parent.resultUpdate(response.Message)
                    
                })
            // }
                
        //  })
        },
		M_ClearForm(){
            this.M_SS_UserMaster = {
                userid: '',
                usergroup: '',
                usergroupLabel: '',
                username: '',
                password: '',
                email: '',
                userlevel: 'M',
                expireddate: '',
                logindate: '',
                statuslogin: '',
                isinactive: '',               
                userinput: '',
                useredit: '',
                timeinput: '',
                timeedit: '',
                lastupdatestamp: 0,
                position: '',
                hand_phone: '',
                referenceno: '',
                controlsequenceno: 0,
                usertype: 'P',
                failedattempts: 0,
                lastchangepassword: '',
                rowid: 0,
                groupdescs: '',
                confirmnewpassword: ''
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
                    user_id: value.user_id,
                    user_edit: this.getDataUser().user_id,
                    last_update_stamp:  value.lastupdatestamp,
                    
                    _Message_:''
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

                this.$parent.resultDelete("Deleting Data Successfully")
            })
        },        
        getDataBy (record) {
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                user_id: record.user_id
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                this.TempPwd = data.password
                this.M_SS_UserMaster = {
                    userid: data.user_id,
                    usergroup: data.user_group,
                    username: data.user_name,
                    password: "",
                    email: data.email,
                    userlevel: data.user_level,
                    expireddate: data.expired_date,
                    logindate: data.login_date,
                    statuslogin: data.status_login,
                    isinactive: data.is_inactive === "Y" ? true : "",
                    userinput: data.user_input,
                    useredit: data.user_edit,
                    timeinput: data.time_input,
                    timeedit: data.time_edit,
                    lastupdatestamp: record.lastupdatestamp,
                    position: data.position,
                    hand_phone: data.hand_phone,
                    referenceno: data.reference_no,
                    controlsequenceno: data.control_sequence_no,
                    usertype: data.user_type,
                    failedattempts: data.failed_attempts,
                    lastchangepassword: data.last_change_password,
                    rowid: data.row_id,
                    groupdescs: data.group_descs,
                    confirmnewpassword: data.confirm_new_password
                    
                }

               

                 
                this.M_SS_UserMaster.usergroupLabel = this.M_SS_UserMaster.usergroup && this.M_SS_UserMaster.usergroup != '' ? data.user_group + this.separator + data.group_descs : ''

                this.IEBy.Input = data.user_input
                this.IEBy.Edit = data.user_edit

            })
            //  this.getJSON(this.getUrlAuthDecrypt() + this.M_SS_UserMaster.userid)
            //     .then((response) => {
            //         this.TempPwd = response.Data
            //     this.M_SS_UserMaster.password = response.Data             
            //     })
        }

    },
    beforeCreate: function () {
    },
    created: function() {
        this.$store.commit('setFormType','List')
        this.getToolbar().ProcessPS()
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

