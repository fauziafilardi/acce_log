<template>
    <div>
        <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
            <div class="div-collapse" v-b-toggle.collapse1>
                <span>
                    <span style="float:Left; color: #81b3e9 !important;letter-spacing: 1px;margin-top: 2px;margin-left: 3px" >
                        Notifications Specification <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                    </span>
                    <span v-show="IEBy.Input && IEBy.Edit" class="master-span">
                        Input By : {{IEBy.Input}} | Edit By : {{IEBy.Edit}} <font-awesome-icon icon="sort-down" class="icon-style-1__master" /> 
                    </span>
                </span>
            </div>
            <b-collapse id="collapse1" :visible="true">
                <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                    <b-col md="12" id="col-left" class="bColMasterForm">
                        <b-form :data-vv-scope="'FormScope_' + PageLevel + '_' + TabIndex" :data-vv-value-path="'FormScope_' + PageLevel + '_' + TabIndex">
                            <b-row  style="padding-left: 10px; padding-bottom: 10px; !important;">              
                                <b-col md="12" id="col-left"> <!-- table open -->
                                <div style="width: 164px !important;padding-top: 18px;padding-left: 20px !important;padding-right: 0px !important;">
                                    <table border="1" cellpadding="3" cellspacing="1" style="border-style: solid; border-width: 1px; width: 1000px; height: 500px;">
                                        <tr>
                                            <td style="text-align: right;width: 150px; ">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for=""></label>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Email</label>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">SMS</label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right;width: 150px; ">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Agent Registration</label>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <ABSinputRadioButtonOnly @input="OnmailagentregistrationstatusChange" :prop="PI_mailagentregistrationstatus" v-model="M_SM_NotifSpecification.mailagentregistrationstatus"  ref="ref_mailagentregistrationstatus" />
                                                <ABSInputSelectListOnly @change="OnmailagentregistrationChange" :prop="PI_mailagentregistration" :value="M_SM_NotifSpecification.mailagentregistration" :label="M_SM_NotifSpecification.mailagentregistrationLabel" ref="ref_mailagentregistration"/>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <ABSinputRadioButtonOnly @input="OnsmsagentregistrationstatusChange" :prop="PI_smsagentregistrationstatus" v-model="M_SM_NotifSpecification.smsagentregistrationstatus"  ref="ref_smsagentregistrationstatus" />
                                                <ABSInputSelectListOnly @change="OnsmsagentregistrationChange" :prop="PI_smsagentregistration" :value="M_SM_NotifSpecification.smsagentregistration" :label="M_SM_NotifSpecification.smsagentregistrationLabel" ref="ref_smsagentregistration"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right;width: 150px; ">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Master Registration</label>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <ABSinputRadioButtonOnly @input="OnmailmasterregistrationstatusChange" :prop="PI_mailmasterregistrationstatus" v-model="M_SM_NotifSpecification.mailmasterregistrationstatus"  ref="ref_mailmasterregistrationstatus" />
                                                <ABSInputSelectListOnly @change="OnmailmasterregistrationChange" :prop="PI_mailmasterregistration" :value="M_SM_NotifSpecification.mailmasterregistration" :label="M_SM_NotifSpecification.mailmasterregistrationLabel" ref="ref_mailmasterregistration"/>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <ABSinputRadioButtonOnly @input="OnsmsmasterregistrationstatusChange" :prop="PI_smsmasterregistrationstatus" v-model="M_SM_NotifSpecification.smsmasterregistrationstatus"  ref="ref_smsmasterregistrationstatus" />
                                                <ABSInputSelectListOnly @change="OnsmsmasterregistrationChange" :prop="PI_smsmasterregistration" :value="M_SM_NotifSpecification.smsmasterregistration" :label="M_SM_NotifSpecification.smsmasterregistrationLabel" ref="ref_smsmasterregistration"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right;width: 150px; ">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Developer Registration</label>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <ABSinputRadioButtonOnly @input="OnmaildeveloperregistrationstatusChange" :prop="PI_maildeveloperregistrationstatus" v-model="M_SM_NotifSpecification.maildeveloperregistrationstatus"  ref="ref_maildeveloperregistrationstatus" />
                                                <ABSInputSelectListOnly @change="OnmaildeveloperregistrationChange" :prop="PI_maildeveloperregistration" :value="M_SM_NotifSpecification.maildeveloperregistration" :label="M_SM_NotifSpecification.maildeveloperregistrationLabel" ref="ref_maildeveloperregistration"/>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <ABSinputRadioButtonOnly @input="OnsmsdeveloperregistrationstatusChange" :prop="PI_smsdeveloperregistrationstatus" v-model="M_SM_NotifSpecification.smsdeveloperregistrationstatus"  ref="ref_smsdeveloperregistrationstatus" />
                                                <ABSInputSelectListOnly @change="OnsmsdeveloperregistrationChange" :prop="PI_smsdeveloperregistration" :value="M_SM_NotifSpecification.smsdeveloperregistration" :label="M_SM_NotifSpecification.smsdeveloperregistrationLabel" ref="ref_smsdeveloperregistration"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right;width: 150px; ">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Principle Registration</label>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <ABSinputRadioButtonOnly @input="OnmailprincipleregistrationstatusChange" :prop="PI_mailprincipleregistrationstatus" v-model="M_SM_NotifSpecification.mailprincipleregistrationstatus"  ref="ref_mailprincipleregistrationstatus" />
                                                <ABSInputSelectListOnly @change="OnmailprincipleregistrationChange" :prop="PI_mailprincipleregistration" :value="M_SM_NotifSpecification.mailprincipleregistration" :label="M_SM_NotifSpecification.mailprincipleregistrationLabel" ref="ref_mailprincipleregistration"/>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <ABSinputRadioButtonOnly @input="OnsmsprincipleregistrationstatusChange" :prop="PI_smsprincipleregistrationstatus" v-model="M_SM_NotifSpecification.smsprincipleregistrationstatus"  ref="ref_smsprincipleregistrationstatus" />
                                                <ABSInputSelectListOnly @change="OnsmsprincipleregistrationChange" :prop="PI_smsprincipleregistration" :value="M_SM_NotifSpecification.smsprincipleregistration" :label="M_SM_NotifSpecification.smsprincipleregistrationLabel" ref="ref_smsprincipleregistration"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right;width: 150px; ">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Buyer NUP</label>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <ABSinputRadioButtonOnly @input="OnmailbuyerregistrationstatusChange" :prop="PI_mailbuyerregistrationstatus" v-model="M_SM_NotifSpecification.mailbuyerregistrationstatus"  ref="ref_mailbuyerregistrationstatus" />
                                                <ABSInputSelectListOnly @change="OnmailbuyerregistrationChange" :prop="PI_mailbuyerregistration" :value="M_SM_NotifSpecification.mailbuyerregistration" :label="M_SM_NotifSpecification.mailbuyerregistrationLabel" ref="ref_mailbuyerregistration"/>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <ABSinputRadioButtonOnly @input="OnsmsbuyerregistrationstatusChange" :prop="PI_smsbuyerregistrationstatus" v-model="M_SM_NotifSpecification.smsbuyerregistrationstatus"  ref="ref_smsbuyerregistrationstatus" />
                                                <ABSInputSelectListOnly @change="OnsmsbuyerregistrationChange" :prop="PI_smsbuyerregistration" :value="M_SM_NotifSpecification.smsbuyerregistration" :label="M_SM_NotifSpecification.smsbuyerregistrationLabel" ref="ref_smsbuyerregistration"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right;width: 150px; ">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Change Buyer's Phone Number</label>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <ABSinputRadioButtonOnly @input="OnmailchangebuyerstatusChange" :prop="PI_mailchangebuyerstatus" v-model="M_SM_NotifSpecification.mailchangebuyerstatus"  ref="ref_mailchangebuyerstatus" />
                                                <ABSInputSelectListOnly @change="OnmailchangebuyerChange" :prop="PI_mailchangebuyer" :value="M_SM_NotifSpecification.mailchangebuyer" :label="M_SM_NotifSpecification.mailchangebuyerLabel" ref="ref_mailchangebuyer"/>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <ABSinputRadioButtonOnly @input="OnsmschangebuyerstatusChange" :prop="PI_smschangebuyerstatus" v-model="M_SM_NotifSpecification.smschangebuyerstatus"  ref="ref_smschangebuyerstatus" />
                                                <ABSInputSelectListOnly @change="OnsmschangebuyerChange" :prop="PI_smschangebuyer" :value="M_SM_NotifSpecification.smschangebuyer" :label="M_SM_NotifSpecification.smschangebuyerLabel" ref="ref_smschangebuyer"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right;width: 150px; ">
                                                <label :class="inputStatus=='VIEW' ? 'lbl-view-form' : 'text-field-form'" for="">Change Agent's Phone Number</label>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <ABSinputRadioButtonOnly @input="OnmailchangeagentstatusChange" :prop="PI_mailchangeagentstatus" v-model="M_SM_NotifSpecification.mailchangeagentstatus"  ref="ref_mailchangeagentstatus" />        
                                                <ABSInputSelectListOnly @change="OnmailchangeagentChange" :prop="PI_mailchangeagent" :value="M_SM_NotifSpecification.mailchangeagent" :label="M_SM_NotifSpecification.mailchangeagentLabel" ref="ref_mailchangeagent"/>
                                            </td>
                                            <td style="text-align: left; padding-left: 20px !important;">
                                                <ABSinputRadioButtonOnly @input="OnsmschangeagentstatusChange" :prop="PI_smschangeagentstatus" v-model="M_SM_NotifSpecification.smschangeagentstatus"  ref="ref_smschangeagentstatus" />        
                                                <ABSInputSelectListOnly @change="OnsmschangeagentChange" :prop="PI_smschangeagent" :value="M_SM_NotifSpecification.smschangeagent" :label="M_SM_NotifSpecification.smschangeagentLabel" ref="ref_smschangeagent"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                    <!-- <b-row>
                                      <b-col  md="3">
                                        <ABSinputRadioButtonOnly @input="OnmailagentregistrationstatusChange" :prop="PI_mailagentregistrationstatus" v-model="M_SM_NotifSpecification.mailagentregistrationstatus"  ref="ref_mailagentregistrationstatus" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSInputSelectListOnly @change="OnmailagentregistrationChange" :prop="PI_mailagentregistration" :value="M_SM_NotifSpecification.mailagentregistration" :label="M_SM_NotifSpecification.mailagentregistrationLabel" ref="ref_mailagentregistration"/>
                                      </b-col>
                                      <b-col md="3">
                                        <ABSinputRadioButtonOnly @input="OnsmsagentregistrationstatusChange" :prop="PI_smsagentregistrationstatus" v-model="M_SM_NotifSpecification.smsagentregistrationstatus"  ref="ref_smsagentregistrationstatus" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSInputSelectListOnly @change="OnsmsagentregistrationChange" :prop="PI_smsagentregistration" :value="M_SM_NotifSpecification.smsagentregistration" :label="M_SM_NotifSpecification.smsagentregistrationLabel" ref="ref_smsagentregistration"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="3">
                                        <ABSinputRadioButtonOnly @input="OnmailmasterregistrationstatusChange" :prop="PI_mailmasterregistrationstatus" v-model="M_SM_NotifSpecification.mailmasterregistrationstatus"  ref="ref_mailmasterregistrationstatus" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSInputSelectListOnly @change="OnmailmasterregistrationChange" :prop="PI_mailmasterregistration" :value="M_SM_NotifSpecification.mailmasterregistration" :label="M_SM_NotifSpecification.mailmasterregistrationLabel" ref="ref_mailmasterregistration"/>
                                      </b-col>
                                      <b-col md="3">
                                        <ABSinputRadioButtonOnly @input="OnsmsmasterregistrationstatusChange" :prop="PI_smsmasterregistrationstatus" v-model="M_SM_NotifSpecification.smsmasterregistrationstatus"  ref="ref_smsmasterregistrationstatus" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSInputSelectListOnly @change="OnsmsmasterregistrationChange" :prop="PI_smsmasterregistration" :value="M_SM_NotifSpecification.smsmasterregistration" :label="M_SM_NotifSpecification.smsmasterregistrationLabel" ref="ref_smsmasterregistration"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="3">
                                        <ABSinputRadioButtonOnly @input="OnmaildeveloperregistrationstatusChange" :prop="PI_maildeveloperregistrationstatus" v-model="M_SM_NotifSpecification.maildeveloperregistrationstatus"  ref="ref_maildeveloperregistrationstatus" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSInputSelectListOnly @change="OnmaildeveloperregistrationChange" :prop="PI_maildeveloperregistration" :value="M_SM_NotifSpecification.maildeveloperregistration" :label="M_SM_NotifSpecification.maildeveloperregistrationLabel" ref="ref_maildeveloperregistration"/>
                                      </b-col>
                                      <b-col md="3">
                                        <ABSinputRadioButtonOnly @input="OnsmsdeveloperregistrationstatusChange" :prop="PI_smsdeveloperregistrationstatus" v-model="M_SM_NotifSpecification.smsdeveloperregistrationstatus"  ref="ref_smsdeveloperregistrationstatus" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSInputSelectListOnly @change="OnsmsdeveloperregistrationChange" :prop="PI_smsdeveloperregistration" :value="M_SM_NotifSpecification.smsdeveloperregistration" :label="M_SM_NotifSpecification.smsdeveloperregistrationLabel" ref="ref_smsdeveloperregistration"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="3">
                                        <ABSinputRadioButtonOnly @input="OnmailprincipleregistrationstatusChange" :prop="PI_mailprincipleregistrationstatus" v-model="M_SM_NotifSpecification.mailprincipleregistrationstatus"  ref="ref_mailprincipleregistrationstatus" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSInputSelectListOnly @change="OnmailprincipleregistrationChange" :prop="PI_mailprincipleregistration" :value="M_SM_NotifSpecification.mailprincipleregistration" :label="M_SM_NotifSpecification.mailprincipleregistrationLabel" ref="ref_mailprincipleregistration"/>
                                      </b-col>
                                      <b-col md="3">
                                        <ABSinputRadioButtonOnly @input="OnsmsprincipleregistrationstatusChange" :prop="PI_smsprincipleregistrationstatus" v-model="M_SM_NotifSpecification.smsprincipleregistrationstatus"  ref="ref_smsprincipleregistrationstatus" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSInputSelectListOnly @change="OnsmsprincipleregistrationChange" :prop="PI_smsprincipleregistration" :value="M_SM_NotifSpecification.smsprincipleregistration" :label="M_SM_NotifSpecification.smsprincipleregistrationLabel" ref="ref_smsprincipleregistration"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="3">
                                        <ABSinputRadioButtonOnly @input="OnmailbuyerregistrationstatusChange" :prop="PI_mailbuyerregistrationstatus" v-model="M_SM_NotifSpecification.mailbuyerregistrationstatus"  ref="ref_mailbuyerregistrationstatus" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSInputSelectListOnly @change="OnmailbuyerregistrationChange" :prop="PI_mailbuyerregistration" :value="M_SM_NotifSpecification.mailbuyerregistration" :label="M_SM_NotifSpecification.mailbuyerregistrationLabel" ref="ref_mailbuyerregistration"/>
                                      </b-col>
                                      <b-col md="3">
                                        <ABSinputRadioButtonOnly @input="OnsmsbuyerregistrationstatusChange" :prop="PI_smsbuyerregistrationstatus" v-model="M_SM_NotifSpecification.smsbuyerregistrationstatus"  ref="ref_smsbuyerregistrationstatus" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSInputSelectListOnly @change="OnsmsbuyerregistrationChange" :prop="PI_smsbuyerregistration" :value="M_SM_NotifSpecification.smsbuyerregistration" :label="M_SM_NotifSpecification.smsbuyerregistrationLabel" ref="ref_smsbuyerregistration"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="3">
                                        <ABSinputRadioButtonOnly @input="OnmailchangebuyerstatusChange" :prop="PI_mailchangebuyerstatus" v-model="M_SM_NotifSpecification.mailchangebuyerstatus"  ref="ref_mailchangebuyerstatus" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSInputSelectListOnly @change="OnmailchangebuyerChange" :prop="PI_mailchangebuyer" :value="M_SM_NotifSpecification.mailchangebuyer" :label="M_SM_NotifSpecification.mailchangebuyerLabel" ref="ref_mailchangebuyer"/>
                                      </b-col>
                                      <b-col md="3">
                                        <ABSinputRadioButtonOnly @input="OnsmschangebuyerstatusChange" :prop="PI_smschangebuyerstatus" v-model="M_SM_NotifSpecification.smschangebuyerstatus"  ref="ref_smschangebuyerstatus" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSInputSelectListOnly @change="OnsmschangebuyerChange" :prop="PI_smschangebuyer" :value="M_SM_NotifSpecification.smschangebuyer" :label="M_SM_NotifSpecification.smschangebuyerLabel" ref="ref_smschangebuyer"/>
                                      </b-col>
                                    </b-row>
                                    <b-row>
                                      <b-col  md="3">
                                        <ABSinputRadioButtonOnly @input="OnmailchangeagentstatusChange" :prop="PI_mailchangeagentstatus" v-model="M_SM_NotifSpecification.mailchangeagentstatus"  ref="ref_mailchangeagentstatus" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSInputSelectListOnly @change="OnmailchangeagentChange" :prop="PI_mailchangeagent" :value="M_SM_NotifSpecification.mailchangeagent" :label="M_SM_NotifSpecification.mailchangeagentLabel" ref="ref_mailchangeagent"/>
                                      </b-col>
                                      <b-col md="3">
                                        <ABSinputRadioButtonOnly @input="OnsmschangeagentstatusChange" :prop="PI_smschangeagentstatus" v-model="M_SM_NotifSpecification.smschangeagentstatus"  ref="ref_smschangeagentstatus" />
                                      </b-col>
                                      <b-col md="3">
                                        <ABSInputSelectListOnly @change="OnsmschangeagentChange" :prop="PI_smschangeagent" :value="M_SM_NotifSpecification.smschangeagent" :label="M_SM_NotifSpecification.smschangeagentLabel" ref="ref_smschangeagent"/>
                                      </b-col>
                                    </b-row> -->
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
    props: {PageLevel: '', TabIndex: '', data: ''},
    data() {
        return {
			cInsertKey:'',
            FormType: "Form",
			Module:"SM",	
            IEBy: {Input: '', Edit: ''},

            M_SM_NotifSpecification :{
                                    lastupdatestamp: 0,
                    mailagentregistration: '',
                    mailagentregistrationdescs: '',
                    mailagentregistrationstatus: '',
                    mailbuyerregistration: '',
                    mailbuyerregistrationdescs: '',
                    mailbuyerregistrationstatus: '',
                    mailchangeagent: '',
                    mailchangeagentdescs: '',
                    mailchangeagentstatus: '',
                    mailchangebuyer: '',
                    mailchangebuyerdescs: '',
                    mailchangebuyerstatus: '',
                    maildeveloperregistration: '',
                    maildeveloperregistrationdescs: '',
                    maildeveloperregistrationstatus: '',
                    mailmasterregistration: '',
                    mailmasterregistrationdescs: '',
                    mailmasterregistrationstatus: '',
                    mailprincipleregistration: '',
                    mailprincipleregistrationdescs: '',
                    mailprincipleregistrationstatus: '',
                    smsagentregistration: '',
                    smsagentregistrationdescs: '',
                    smsagentregistrationstatus: '',
                    smsbuyerregistration: '',
                    smsbuyerregistrationdescs: '',
                    smsbuyerregistrationstatus: '',
                    smschangeagent: '',
                    smschangeagentdescs: '',
                    smschangeagentstatus: '',
                    smschangebuyer: '',
                    smschangebuyerdescs: '',
                    smschangebuyerstatus: '',
                    smsdeveloperregistration: '',
                    smsdeveloperregistrationdescs: '',
                    smsdeveloperregistrationstatus: '',
                    smsmasterregistration: '',
                    smsmasterregistrationdescs: '',
                    smsmasterregistrationstatus: '',
                    smsprincipleregistration: '',
                    smsprincipleregistrationdescs: '',
                    smsprincipleregistrationstatus: '',
                    subportfoliocd: '',
                    timeedit: '',
                    timeinput: '',
                    useredit: this.getDataUser().user_id,
                    userinput: '',
                    }
            ,					
            PI_mailagentregistrationstatus: { 
                cValidate :'', 
                cName: 'mailagentregistrationstatus', 
                cId: 'rdbmailagentregistrationstatus', 
                cRadioOptions: [{ text: 'On', value: 'Y' },{ text: 'Off', value: 'N' },], 
                cRadioDefaultOption: '', 
                // cLabel:'Agent Registration', 
                // cLabelSize: 0, 
                cDefault: '', 
                cOrder: 1, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_mailagentregistration: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupMailSetting'    , 
                    ColumnDB: 'MailSettingCd'   , 
                    InitialWhere: "ISNULL(isSMS,'')='N'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MailSettingCd,MailFrom' 
                        }, 
                cValidate :'', 
                cName: 'mailagentregistration', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 0, 
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
                cMasterUrl: 'SM/SM_MailSetting' ,
                cDisplayColumn: 'MailSettingCd,MailFrom' ,
            }, 
            PI_smsagentregistrationstatus: { 
                cValidate :'', 
                cName: 'smsagentregistrationstatus', 
                cId: 'rdbsmsagentregistrationstatus', 
                cRadioOptions: [{ text: 'On', value: 'Y' },{ text: 'Off', value: 'N' },], 
                cRadioDefaultOption: '', 
                cLabel:'', 
                cLabelSize: 0, 
                cDefault: '', 
                cOrder: 3, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_smsagentregistration: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupMailSetting'    , 
                    ColumnDB: 'MailSettingCd'   , 
                    InitialWhere: "ISNULL(isSMS,'')='N'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MailSettingCd,MailFrom' 
                        }, 
                cValidate :'', 
                cName: 'smsagentregistration', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 0, 
                cOrder: 4, 
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
                cMasterUrl: 'SM/SM_MailSetting' ,
                cDisplayColumn: 'MailSettingCd,MailFrom' ,
            }, 
            PI_mailmasterregistrationstatus: { 
                cValidate :'', 
                cName: 'mailmasterregistrationstatus', 
                cId: 'rdbmailmasterregistrationstatus', 
                cRadioOptions: [{ text: 'On', value: 'Y' },{ text: 'Off', value: 'N' },], 
                cRadioDefaultOption: '', 
                // cLabel:'Master Registration', 
                // cLabelSize: 0, 
                cDefault: '', 
                cOrder: 5, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_mailmasterregistration: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupMailSetting'    , 
                    ColumnDB: 'MailSettingCd'   , 
                    InitialWhere: "ISNULL(isSMS,'')='N'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MailSettingCd,MailFrom' 
                        }, 
                cValidate :'', 
                cName: 'mailmasterregistration', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 0, 
                cOrder: 6, 
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
                cMasterUrl: 'SM/SM_MailSetting' ,
                cDisplayColumn: 'MailSettingCd,MailFrom' ,
            }, 
            PI_smsmasterregistrationstatus: { 
                cValidate :'', 
                cName: 'smsmasterregistrationstatus', 
                cId: 'rdbsmsmasterregistrationstatus', 
                cRadioOptions: [{ text: 'On', value: 'Y' },{ text: 'Off', value: 'N' },], 
                cRadioDefaultOption: '', 
                cLabel:'', 
                cLabelSize: 0, 
                cDefault: '', 
                cOrder: 7, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_smsmasterregistration: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSMSSetting'    , 
                    ColumnDB: 'MailSettingCd'   , 
                    InitialWhere: "ISNULL(isSMS,'')='Y'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MailSettingCd,MailFrom' 
                        }, 
                cValidate :'', 
                cName: 'smsmasterregistration', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 0, 
                cOrder: 8, 
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
                cMasterUrl: 'SM/SM_MailSetting' ,
                cDisplayColumn: 'MailSettingCd,MailFrom' ,
            }, 
            PI_maildeveloperregistrationstatus: { 
                cValidate :'', 
                cName: 'maildeveloperregistrationstatus', 
                cId: 'rdbmaildeveloperregistrationstatus', 
                cRadioOptions: [{ text: 'On', value: 'Y' },{ text: 'Off', value: 'N' },], 
                cRadioDefaultOption: '', 
                // cLabel:'Developer Registration', 
                cLabelSize: 0, 
                cDefault: '', 
                cOrder: 9, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_maildeveloperregistration: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupMailSetting'    , 
                    ColumnDB: 'MailSettingCd'   , 
                    InitialWhere: "ISNULL(isSMS,'')='N'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MailSettingCd,MailFrom' 
                        }, 
                cValidate :'', 
                cName: 'maildeveloperregistration', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 0, 
                cOrder: 10, 
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
                cMasterUrl: 'SM/SM_MailSetting' ,
                cDisplayColumn: 'MailSettingCd,MailFrom' ,
            }, 
            PI_smsdeveloperregistrationstatus: { 
                cValidate :'', 
                cName: 'smsdeveloperregistrationstatus', 
                cId: 'rdbsmsdeveloperregistrationstatus', 
                cRadioOptions: [{ text: 'On', value: 'Y' },{ text: 'Off', value: 'N' },], 
                cRadioDefaultOption: '', 
                cLabel:'', 
                cLabelSize: 0, 
                cDefault: '', 
                cOrder: 11, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_smsdeveloperregistration: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSMSSetting'    , 
                    ColumnDB: 'MailSettingCd'   , 
                    InitialWhere: "ISNULL(isSMS,'')='Y'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MailSettingCd,MailFrom' 
                        }, 
                cValidate :'', 
                cName: 'smsdeveloperregistration', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 0, 
                cOrder: 12, 
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
                cMasterUrl: 'SM/SM_MailSetting' ,
                cDisplayColumn: 'MailSettingCd,MailFrom' ,
            }, 
            PI_mailprincipleregistrationstatus: { 
                cValidate :'', 
                cName: 'mailprincipleregistrationstatus', 
                cId: 'rdbmailprincipleregistrationstatus', 
                cRadioOptions: [{ text: 'On', value: 'Y' },{ text: 'Off', value: 'N' },], 
                cRadioDefaultOption: '', 
                // cLabel:'Principle Registration', 
                cLabelSize: 0, 
                cDefault: '', 
                cOrder: 13, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_mailprincipleregistration: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupMailSetting'    , 
                    ColumnDB: 'MailSettingCd'   , 
                    InitialWhere: "ISNULL(isSMS,'')='N'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MailSettingCd,MailFrom' 
                        }, 
                cValidate :'', 
                cName: 'mailprincipleregistration', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 0, 
                cOrder: 14, 
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
                cMasterUrl: 'SM/SM_MailSetting' ,
                cDisplayColumn: 'MailSettingCd,MailFrom' ,
            }, 
            PI_smsprincipleregistrationstatus: { 
                cValidate :'', 
                cName: 'smsprincipleregistrationstatus', 
                cId: 'rdbsmsprincipleregistrationstatus', 
                cRadioOptions: [{ text: 'On', value: 'Y' },{ text: 'Off', value: 'N' },], 
                cRadioDefaultOption: '', 
                cLabel:'', 
                cLabelSize: 0, 
                cDefault: '', 
                cOrder: 15, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_smsprincipleregistration: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSMSSetting'    , 
                    ColumnDB: 'MailSettingCd'   , 
                    InitialWhere: "ISNULL(isSMS,'')='Y'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MailSettingCd,MailFrom' 
                        }, 
                cValidate :'', 
                cName: 'smsprincipleregistration', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 0, 
                cOrder: 16, 
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
                cMasterUrl: 'SM/SM_MailSetting' ,
                cDisplayColumn: 'MailSettingCd,MailFrom' ,
            }, 
            PI_mailbuyerregistrationstatus: { 
                cValidate :'', 
                cName: 'mailbuyerregistrationstatus', 
                cId: 'rdbmailbuyerregistrationstatus', 
                cRadioOptions: [{ text: 'On', value: 'Y' },{ text: 'Off', value: 'N' },], 
                cRadioDefaultOption: '', 
                cLabel:'Buyer NUP', 
                cLabelSize: 0, 
                cDefault: '', 
                cOrder: 17, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_mailbuyerregistration: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupMailSetting'    , 
                    ColumnDB: 'MailSettingCd'   , 
                    InitialWhere: "ISNULL(isSMS,'')='N'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MailSettingCd,MailFrom' 
                        }, 
                cValidate :'', 
                cName: 'mailbuyerregistration', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 0, 
                cOrder: 18, 
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
                cMasterUrl: 'SM/SM_MailSetting' ,
                cDisplayColumn: 'MailSettingCd,MailFrom' ,
            }, 
            PI_smsbuyerregistrationstatus: { 
                cValidate :'', 
                cName: 'smsbuyerregistrationstatus', 
                cId: 'rdbsmsbuyerregistrationstatus', 
                cRadioOptions: [{ text: 'On', value: 'Y' },{ text: 'Off', value: 'N' },], 
                cRadioDefaultOption: '', 
                cLabel:'', 
                cLabelSize: 0, 
                cDefault: '', 
                cOrder: 19, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_smsbuyerregistration: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSMSSetting'    , 
                    ColumnDB: 'MailSettingCd'   , 
                    InitialWhere: "ISNULL(isSMS,'')='Y'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MailSettingCd,MailFrom' 
                        }, 
                cValidate :'', 
                cName: 'smsbuyerregistration', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 0, 
                cOrder: 20, 
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
                cMasterUrl: 'SM/SM_MailSetting' ,
                cDisplayColumn: 'MailSettingCd,MailFrom' ,
            }, 
            PI_mailchangebuyerstatus: { 
                cValidate :'', 
                cName: 'mailchangebuyerstatus', 
                cId: 'rdbmailchangebuyerstatus', 
                cRadioOptions: [{ text: 'On', value: 'Y' },{ text: 'Off', value: 'N' },], 
                cRadioDefaultOption: '', 
                // cLabel:"Change Buyer's Phone Number", 
                cLabelSize: 0, 
                cDefault: '', 
                cOrder: 21, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_mailchangebuyer: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupMailSetting'    , 
                    ColumnDB: 'MailSettingCd'   , 
                    InitialWhere: "ISNULL(isSMS,'')='N'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MailSettingCd,MailFrom' 
                        }, 
                cValidate :'', 
                cName: 'mailchangebuyer', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 0, 
                cOrder:22, 
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
                cMasterUrl: 'SM/SM_MailSetting' ,
                cDisplayColumn: 'MailSettingCd,MailFrom' ,
            }, 
            PI_smschangebuyerstatus: { 
                cValidate :'', 
                cName: 'smschangebuyerstatus', 
                cId: 'rdbsmschangebuyerstatus', 
                cRadioOptions: [{ text: 'On', value: 'Y' },{ text: 'Off', value: 'N' },], 
                cRadioDefaultOption: '', 
                cLabel:'', 
                cLabelSize: 0, 
                cDefault: '', 
                cOrder: 23, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_smschangebuyer: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSMSSetting'    , 
                    ColumnDB: 'MailSettingCd'   , 
                    InitialWhere: "ISNULL(isSMS,'')='Y'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MailSettingCd,MailFrom' 
                        }, 
                cValidate :'', 
                cName: 'smschangebuyer', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 0, 
                cOrder: 24, 
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
                cMasterUrl: 'SM/SM_MailSetting' ,
                cDisplayColumn: 'MailSettingCd,MailFrom' ,
            }, 
            PI_mailchangeagentstatus: { 
                cValidate :'', 
                cName: 'mailchangeagentstatus', 
                cId: 'rdbmailchangeagentstatus', 
                cRadioOptions: [{ text: 'On', value: 'Y' },{ text: 'Off', value: 'N' },], 
                cRadioDefaultOption: '', 
                // cLabel:'Change Agent Phone Number', 
                cLabelSize: 0, 
                cDefault: '', 
                cOrder: 25, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_mailchangeagent: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupMailSetting'    , 
                    ColumnDB: 'MailSettingCd'   , 
                    InitialWhere: "ISNULL(isSMS,'')='N'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MailSettingCd,MailFrom' 
                        }, 
                cValidate :'', 
                cName: 'mailchangeagent', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 0, 
                cOrder: 26, 
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
                cMasterUrl: 'SM/SM_MailSetting' ,
                cDisplayColumn: 'MailSettingCd,MailFrom' ,
            }, 
            PI_smschangeagentstatus: { 
                cValidate :'', 
                cName: 'smschangeagentstatus', 
                cId: 'rdbsmschangeagentstatus', 
                cRadioOptions: [{ text: 'On', value: 'Y' },{ text: 'Off', value: 'N' },], 
                cRadioDefaultOption: '', 
                cLabel:'', 
                cLabelSize: 0, 
                cDefault: '', 
                cOrder: 27, 
                cProtect: false, 
                cVisible:  true, 
                cPageLevel: this.PageLevel, 
                cTabIndex: this.TabIndex, 
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            }, 
            PI_smschangeagent: { 
                dataLookUp: { 
                    LookUpCd: 'GetLookupSMSSetting'    , 
                    ColumnDB: 'MailSettingCd'   , 
                    InitialWhere: "ISNULL(isSMS,'')='Y'"   , 
                    ParamWhere: '' ,
                    SourceField: ''  ,
                    DisplayLookup: 'MailSettingCd,MailFrom' 
                        }, 
                cValidate :'', 
                cName: 'smschangeagent', 
                cLabel: '', 
                cKey: false, 
                cLabelSize: 0, 
                cOrder: 28, 
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
                cMasterUrl: 'SM/SM_MailSetting' ,
                cDisplayColumn: 'MailSettingCd,MailFrom' ,
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
    }
  },
    methods: {		
        OnmailagentregistrationstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{mailagentregistrationstatus}
            }
        })
        this.$forceUpdate()
        },
        OnmailagentregistrationChange (data) {
        this.$nextTick(() => {
            this.M_SM_NotifSpecification.mailagentregistration = data.id
            this.M_SM_NotifSpecification.mailagentregistrationLabel = data.label
            if (this.inputStatus != "VIEW") {
//{mailagentregistration}
            }
        })
        this.$forceUpdate()
        },
        OnsmsagentregistrationstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{smsagentregistrationstatus}
            }
        })
        this.$forceUpdate()
        },
        OnsmsagentregistrationChange (data) {
        this.$nextTick(() => {
            this.M_SM_NotifSpecification.smsagentregistration = data.id
            this.M_SM_NotifSpecification.smsagentregistrationLabel = data.label
            if (this.inputStatus != "VIEW") {
//{smsagentregistration}
            }
        })
        this.$forceUpdate()
        },
        OnmailmasterregistrationstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{mailmasterregistrationstatus}
            }
        })
        this.$forceUpdate()
        },
        OnmailmasterregistrationChange (data) {
        this.$nextTick(() => {
            this.M_SM_NotifSpecification.mailmasterregistration = data.id
            this.M_SM_NotifSpecification.mailmasterregistrationLabel = data.label
            if (this.inputStatus != "VIEW") {
//{mailmasterregistration}
            }
        })
        this.$forceUpdate()
        },
        OnsmsmasterregistrationstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{smsmasterregistrationstatus}
            }
        })
        this.$forceUpdate()
        },
        OnsmsmasterregistrationChange (data) {
        this.$nextTick(() => {
            this.M_SM_NotifSpecification.smsmasterregistration = data.id
            this.M_SM_NotifSpecification.smsmasterregistrationLabel = data.label
            if (this.inputStatus != "VIEW") {
//{smsmasterregistration}
            }
        })
        this.$forceUpdate()
        },
        OnmaildeveloperregistrationstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{maildeveloperregistrationstatus}
            }
        })
        this.$forceUpdate()
        },
        OnmaildeveloperregistrationChange (data) {
        this.$nextTick(() => {
            this.M_SM_NotifSpecification.maildeveloperregistration = data.id
            this.M_SM_NotifSpecification.maildeveloperregistrationLabel = data.label
            if (this.inputStatus != "VIEW") {
//{maildeveloperregistration}
            }
        })
        this.$forceUpdate()
        },
        OnsmsdeveloperregistrationstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{smsdeveloperregistrationstatus}
            }
        })
        this.$forceUpdate()
        },
        OnsmsdeveloperregistrationChange (data) {
        this.$nextTick(() => {
            this.M_SM_NotifSpecification.smsdeveloperregistration = data.id
            this.M_SM_NotifSpecification.smsdeveloperregistrationLabel = data.label
            if (this.inputStatus != "VIEW") {
//{smsdeveloperregistration}
            }
        })
        this.$forceUpdate()
        },
        OnmailprincipleregistrationstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{mailprincipleregistrationstatus}
            }
        })
        this.$forceUpdate()
        },
        OnmailprincipleregistrationChange (data) {
        this.$nextTick(() => {
            this.M_SM_NotifSpecification.mailprincipleregistration = data.id
            this.M_SM_NotifSpecification.mailprincipleregistrationLabel = data.label
            if (this.inputStatus != "VIEW") {
//{mailprincipleregistration}
            }
        })
        this.$forceUpdate()
        },
        OnsmsprincipleregistrationstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{smsprincipleregistrationstatus}
            }
        })
        this.$forceUpdate()
        },
        OnsmsprincipleregistrationChange (data) {
        this.$nextTick(() => {
            this.M_SM_NotifSpecification.smsprincipleregistration = data.id
            this.M_SM_NotifSpecification.smsprincipleregistrationLabel = data.label
            if (this.inputStatus != "VIEW") {
//{smsprincipleregistration}
            }
        })
        this.$forceUpdate()
        },
        OnmailbuyerregistrationstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{mailbuyerregistrationstatus}
            }
        })
        this.$forceUpdate()
        },
        OnmailbuyerregistrationChange (data) {
        this.$nextTick(() => {
            this.M_SM_NotifSpecification.mailbuyerregistration = data.id
            this.M_SM_NotifSpecification.mailbuyerregistrationLabel = data.label
            if (this.inputStatus != "VIEW") {
//{mailbuyerregistration}
            }
        })
        this.$forceUpdate()
        },
        OnsmsbuyerregistrationstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{smsbuyerregistrationstatus}
            }
        })
        this.$forceUpdate()
        },
        OnsmsbuyerregistrationChange (data) {
        this.$nextTick(() => {
            this.M_SM_NotifSpecification.smsbuyerregistration = data.id
            this.M_SM_NotifSpecification.smsbuyerregistrationLabel = data.label
            if (this.inputStatus != "VIEW") {
//{smsbuyerregistration}
            }
        })
        this.$forceUpdate()
        },
        OnmailchangebuyerstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{mailchangebuyerstatus}
            }
        })
        this.$forceUpdate()
        },
        OnmailchangebuyerChange (data) {
        this.$nextTick(() => {
            this.M_SM_NotifSpecification.mailchangebuyer = data.id
            this.M_SM_NotifSpecification.mailchangebuyerLabel = data.label
            if (this.inputStatus != "VIEW") {
//{mailchangebuyer}
            }
        })
        this.$forceUpdate()
        },
        OnsmschangebuyerstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{smschangebuyerstatus}
            }
        })
        this.$forceUpdate()
        },
        OnsmschangebuyerChange (data) {
        this.$nextTick(() => {
            this.M_SM_NotifSpecification.smschangebuyer = data.id
            this.M_SM_NotifSpecification.smschangebuyerLabel = data.label
            if (this.inputStatus != "VIEW") {
//{smschangebuyer}
            }
        })
        this.$forceUpdate()
        },
        OnmailchangeagentstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{mailchangeagentstatus}
            }
        })
        this.$forceUpdate()
        },
        OnmailchangeagentChange (data) {
        this.$nextTick(() => {
            this.M_SM_NotifSpecification.mailchangeagent = data.id
            this.M_SM_NotifSpecification.mailchangeagentLabel = data.label
            if (this.inputStatus != "VIEW") {
//{mailchangeagent}
            }
        })
        this.$forceUpdate()
        },
        OnsmschangeagentstatusChange (data) {
        this.$nextTick(() => {
            if (this.inputStatus != "VIEW") {
//{smschangeagentstatus}
            }
        })
        this.$forceUpdate()
        },
        OnsmschangeagentChange (data) {
        this.$nextTick(() => {
            this.M_SM_NotifSpecification.smschangeagent = data.id
            this.M_SM_NotifSpecification.smschangeagentLabel = data.label
            if (this.inputStatus != "VIEW") {
//{smschangeagent}
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
        M_Post(dt){
        },
        M_Insert() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                MailAgentRegistration: this.M_SM_NotifSpecification.mailagentregistration == '' || this.M_SM_NotifSpecification.mailagentregistration == null ? 'NULL' : this.M_SM_NotifSpecification.mailagentregistration ,
                MailMasterRegistration: this.M_SM_NotifSpecification.mailmasterregistration == '' || this.M_SM_NotifSpecification.mailmasterregistration == null ? 'NULL' : this.M_SM_NotifSpecification.mailmasterregistration ,
                MailDeveloperRegistration: this.M_SM_NotifSpecification.maildeveloperregistration == '' || this.M_SM_NotifSpecification.maildeveloperregistration == null ? 'NULL' : this.M_SM_NotifSpecification.maildeveloperregistration ,
                MailPrincipleRegistration: this.M_SM_NotifSpecification.mailprincipleregistration == '' || this.M_SM_NotifSpecification.mailprincipleregistration == null ? 'NULL' : this.M_SM_NotifSpecification.mailprincipleregistration ,
                MailBuyerRegistration: this.M_SM_NotifSpecification.mailbuyerregistration == '' || this.M_SM_NotifSpecification.mailbuyerregistration == null ? 'NULL' : this.M_SM_NotifSpecification.mailbuyerregistration ,
                MailChangeBuyer: this.M_SM_NotifSpecification.mailchangebuyer == '' || this.M_SM_NotifSpecification.mailchangebuyer == null ? 'NULL' : this.M_SM_NotifSpecification.mailchangebuyer ,
                MailChangeAgent: this.M_SM_NotifSpecification.mailchangeagent == '' || this.M_SM_NotifSpecification.mailchangeagent == null ? 'NULL' : this.M_SM_NotifSpecification.mailchangeagent ,
                SMSAgentRegistration: this.M_SM_NotifSpecification.smsagentregistration == '' || this.M_SM_NotifSpecification.smsagentregistration == null ? 'NULL' : this.M_SM_NotifSpecification.smsagentregistration ,
                SMSMasterRegistration: this.M_SM_NotifSpecification.smsmasterregistration == '' || this.M_SM_NotifSpecification.smsmasterregistration == null ? 'NULL' : this.M_SM_NotifSpecification.smsmasterregistration ,
                SMSDeveloperRegistration: this.M_SM_NotifSpecification.smsdeveloperregistration == '' || this.M_SM_NotifSpecification.smsdeveloperregistration == null ? 'NULL' : this.M_SM_NotifSpecification.smsdeveloperregistration ,
                SMSPrincipleRegistration: this.M_SM_NotifSpecification.smsprincipleregistration == '' || this.M_SM_NotifSpecification.smsprincipleregistration == null ? 'NULL' : this.M_SM_NotifSpecification.smsprincipleregistration ,
                SMSBuyerRegistration: this.M_SM_NotifSpecification.smsbuyerregistration == '' || this.M_SM_NotifSpecification.smsbuyerregistration == null ? 'NULL' : this.M_SM_NotifSpecification.smsbuyerregistration ,
                SMSChangeBuyer: this.M_SM_NotifSpecification.smschangebuyer == '' || this.M_SM_NotifSpecification.smschangebuyer == null ? 'NULL' : this.M_SM_NotifSpecification.smschangebuyer ,
                SMSChangeAgent: this.M_SM_NotifSpecification.smschangeagent == '' || this.M_SM_NotifSpecification.smschangeagent == null ? 'NULL' : this.M_SM_NotifSpecification.smschangeagent ,
                MailAgentRegistrationStatus: this.M_SM_NotifSpecification.mailagentregistrationstatus,
                MailMasterRegistrationStatus: this.M_SM_NotifSpecification.mailmasterregistrationstatus,
                MailDeveloperRegistrationStatus: this.M_SM_NotifSpecification.maildeveloperregistrationstatus,
                MailPrincipleRegistrationStatus: this.M_SM_NotifSpecification.mailprincipleregistrationstatus,
                MailBuyerRegistrationStatus: this.M_SM_NotifSpecification.mailbuyerregistrationstatus,
                MailChangeBuyerStatus: this.M_SM_NotifSpecification.mailchangebuyerstatus,
                MailChangeAgentStatus: this.M_SM_NotifSpecification.mailchangeagentstatus,
                SMSAgentRegistrationStatus: this.M_SM_NotifSpecification.smsagentregistrationstatus,
                SMSMasterRegistrationStatus: this.M_SM_NotifSpecification.smsmasterregistrationstatus,
                SMSDeveloperRegistrationStatus: this.M_SM_NotifSpecification.smsdeveloperregistrationstatus,
                SMSPrincipleRegistrationStatus: this.M_SM_NotifSpecification.smsprincipleregistrationstatus,
                SMSBuyerRegistrationStatus: this.M_SM_NotifSpecification.smsbuyerregistrationstatus,
                SMSChangeBuyerStatus: this.M_SM_NotifSpecification.smschangebuyerstatus,
                SMSChangeAgentStatus: this.M_SM_NotifSpecification.smschangeagentstatus                
            }

            this.postJSON(this.getUrlInsert(), param)
            .then((response) => {
                if(response == null) return
                
                this.alertSuccess(response.Message)
                .then(() => {
                    this.getToolbar().FormStatus = 'EDIT'
                    this.getToolbar().ProcessPS()
                    this.$store.commit('setStatus', 'view')
					this.$store.commit('setEventStatus', 'Save')

                    this.FormToMasterPage().ValidasiPage()
										
					
                })
            })
        },
        M_Update() {
            var param = {			
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order,
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                MailAgentRegistration: this.M_SM_NotifSpecification.mailagentregistration == '' || this.M_SM_NotifSpecification.mailagentregistration == null ? 'NULL' : this.M_SM_NotifSpecification.mailagentregistration ,
                MailMasterRegistration: this.M_SM_NotifSpecification.mailmasterregistration == '' || this.M_SM_NotifSpecification.mailmasterregistration == null ? 'NULL' : this.M_SM_NotifSpecification.mailmasterregistration ,
                MailDeveloperRegistration: this.M_SM_NotifSpecification.maildeveloperregistration == '' || this.M_SM_NotifSpecification.maildeveloperregistration == null ? 'NULL' : this.M_SM_NotifSpecification.maildeveloperregistration ,
                MailPrincipleRegistration: this.M_SM_NotifSpecification.mailprincipleregistration == '' || this.M_SM_NotifSpecification.mailprincipleregistration == null ? 'NULL' : this.M_SM_NotifSpecification.mailprincipleregistration ,
                MailBuyerRegistration: this.M_SM_NotifSpecification.mailbuyerregistration == '' || this.M_SM_NotifSpecification.mailbuyerregistration == null ? 'NULL' : this.M_SM_NotifSpecification.mailbuyerregistration ,
                MailChangeBuyer: this.M_SM_NotifSpecification.mailchangebuyer == '' || this.M_SM_NotifSpecification.mailchangebuyer == null ? 'NULL' : this.M_SM_NotifSpecification.mailchangebuyer ,
                MailChangeAgent: this.M_SM_NotifSpecification.mailchangeagent == '' || this.M_SM_NotifSpecification.mailchangeagent == null ? 'NULL' : this.M_SM_NotifSpecification.mailchangeagent ,
                SMSAgentRegistration: this.M_SM_NotifSpecification.smsagentregistration == '' || this.M_SM_NotifSpecification.smsagentregistration == null ? 'NULL' : this.M_SM_NotifSpecification.smsagentregistration ,
                SMSMasterRegistration: this.M_SM_NotifSpecification.smsmasterregistration == '' || this.M_SM_NotifSpecification.smsmasterregistration == null ? 'NULL' : this.M_SM_NotifSpecification.smsmasterregistration ,
                SMSDeveloperRegistration: this.M_SM_NotifSpecification.smsdeveloperregistration == '' || this.M_SM_NotifSpecification.smsdeveloperregistration == null ? 'NULL' : this.M_SM_NotifSpecification.smsdeveloperregistration ,
                SMSPrincipleRegistration: this.M_SM_NotifSpecification.smsprincipleregistration == '' || this.M_SM_NotifSpecification.smsprincipleregistration == null ? 'NULL' : this.M_SM_NotifSpecification.smsprincipleregistration ,
                SMSBuyerRegistration: this.M_SM_NotifSpecification.smsbuyerregistration == '' || this.M_SM_NotifSpecification.smsbuyerregistration == null ? 'NULL' : this.M_SM_NotifSpecification.smsbuyerregistration ,
                SMSChangeBuyer: this.M_SM_NotifSpecification.smschangebuyer == '' || this.M_SM_NotifSpecification.smschangebuyer == null ? 'NULL' : this.M_SM_NotifSpecification.smschangebuyer ,
                SMSChangeAgent: this.M_SM_NotifSpecification.smschangeagent == '' || this.M_SM_NotifSpecification.smschangeagent == null ? 'NULL' : this.M_SM_NotifSpecification.smschangeagent ,
                MailAgentRegistrationStatus: this.M_SM_NotifSpecification.mailagentregistrationstatus,
                MailMasterRegistrationStatus: this.M_SM_NotifSpecification.mailmasterregistrationstatus,
                MailDeveloperRegistrationStatus: this.M_SM_NotifSpecification.maildeveloperregistrationstatus,
                MailPrincipleRegistrationStatus: this.M_SM_NotifSpecification.mailprincipleregistrationstatus,
                MailBuyerRegistrationStatus: this.M_SM_NotifSpecification.mailbuyerregistrationstatus,
                MailChangeBuyerStatus: this.M_SM_NotifSpecification.mailchangebuyerstatus,
                MailChangeAgentStatus: this.M_SM_NotifSpecification.mailchangeagentstatus,
                SMSAgentRegistrationStatus: this.M_SM_NotifSpecification.smsagentregistrationstatus,
                SMSMasterRegistrationStatus: this.M_SM_NotifSpecification.smsmasterregistrationstatus,
                SMSDeveloperRegistrationStatus: this.M_SM_NotifSpecification.smsdeveloperregistrationstatus,
                SMSPrincipleRegistrationStatus: this.M_SM_NotifSpecification.smsprincipleregistrationstatus,
                SMSBuyerRegistrationStatus: this.M_SM_NotifSpecification.smsbuyerregistrationstatus,
                SMSChangeBuyerStatus: this.M_SM_NotifSpecification.smschangebuyerstatus,
                SMSChangeAgentStatus: this.M_SM_NotifSpecification.smschangeagentstatus,
                UserEdit: this.getDataUser().user_id ,
                LastUpdateStamp: this.M_SM_NotifSpecification.lastupdatestamp                
            }

            this.postJSON(this.getUrlUpdate(), param)
            .then((response) => {
                if(response == null) return

                this.alertSuccess(response.Message)
                .then(() => {
                    this.getToolbar().setButton(false)
                    this.$store.commit('setStatus', 'view')

                    this.FormToMasterPage().ValidasiPage()
					
                })
            })
        },
		M_ClearForm(){
			this.$nextTick(() => {
            this.M_SM_NotifSpecification = {
                    lastupdatestamp: 0,
                    mailagentregistration: '',
                    mailagentregistrationdescs: '',
                    mailagentregistrationstatus: '',
                    mailbuyerregistration: '',
                    mailbuyerregistrationdescs: '',
                    mailbuyerregistrationstatus: '',
                    mailchangeagent: '',
                    mailchangeagentdescs: '',
                    mailchangeagentstatus: '',
                    mailchangebuyer: '',
                    mailchangebuyerdescs: '',
                    mailchangebuyerstatus: '',
                    maildeveloperregistration: '',
                    maildeveloperregistrationdescs: '',
                    maildeveloperregistrationstatus: '',
                    mailmasterregistration: '',
                    mailmasterregistrationdescs: '',
                    mailmasterregistrationstatus: '',
                    mailprincipleregistration: '',
                    mailprincipleregistrationdescs: '',
                    mailprincipleregistrationstatus: '',
                    smsagentregistration: '',
                    smsagentregistrationdescs: '',
                    smsagentregistrationstatus: '',
                    smsbuyerregistration: '',
                    smsbuyerregistrationdescs: '',
                    smsbuyerregistrationstatus: '',
                    smschangeagent: '',
                    smschangeagentdescs: '',
                    smschangeagentstatus: '',
                    smschangebuyer: '',
                    smschangebuyerdescs: '',
                    smschangebuyerstatus: '',
                    smsdeveloperregistration: '',
                    smsdeveloperregistrationdescs: '',
                    smsdeveloperregistrationstatus: '',
                    smsmasterregistration: '',
                    smsmasterregistrationdescs: '',
                    smsmasterregistrationstatus: '',
                    smsprincipleregistration: '',
                    smsprincipleregistrationdescs: '',
                    smsprincipleregistrationstatus: '',
                    subportfoliocd: '',
                    timeedit: '',
                    timeinput: '',
                    useredit: this.getDataUser().user_id,
                    userinput: '',
                    }
            	
		   })
		   this.$forceUpdate()	
		},
        M_New(){
			
        },
        M_Edit(){
        },
        M_Delete(dt){       

            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                SubPortfolioCd:this.getDataUser().subportfolio_cd,
                PortfolioCd:this.getDataUser().portfolio_cd,
                LineNo: this.$parent.data.page_order,
                Data: dt
				//,SourceValue:''
            }
            
            this.postJSONMulti( this.getUrlDeleteMulti(), param )
            .then(response => {
                if (response == null) return
				var message = "Deleting Data Successfully"   				
				//kalo ada hit api lagi,tolong script dibawah ini dipindahkan di dalam then'a ,setelah itu hapus comment ini
				this.$parent.resultDelete(message)
				


            })
        },        
        getDataBy (record) {
            // console.log(record)
            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: this.$parent.data.page_order
,                SubPortfolioCd: this.getDataUser().subportfolio_cd
            }

            this.postJSON( this.getUrlById(), param )
            .then(response => {
                // response from API
                if(response == null) return
                
                var data = response.Data[0]
                console.log(data)
                if(response.Data.length > 0){

                    // this.$store.commit('setStatus', 'EDIT')
                    this.getToolbar().FormStatus = 'EDIT'
                    this.getToolbar().ProcessPS()
this.M_SM_NotifSpecification = {
            lastupdatestamp: data.lastupdatestamp,
            mailagentregistration: data.mailagentregistration,
            mailagentregistrationdescs: data.mailagentregistrationdescs,
            mailagentregistrationstatus: data.mailagentregistrationstatus,
            mailbuyerregistration: data.mailbuyerregistration,
            mailbuyerregistrationdescs: data.mailbuyerregistrationdescs,
            mailbuyerregistrationstatus: data.mailbuyerregistrationstatus,
            mailchangeagent: data.mailchangeagent,
            mailchangeagentdescs: data.mailchangeagentdescs,
            mailchangeagentstatus: data.mailchangeagentstatus,
            mailchangebuyer: data.mailchangebuyer,
            mailchangebuyerdescs: data.mailchangebuyerdescs,
            mailchangebuyerstatus: data.mailchangebuyerstatus,
            maildeveloperregistration: data.maildeveloperregistration,
            maildeveloperregistrationdescs: data.maildeveloperregistrationdescs,
            maildeveloperregistrationstatus: data.maildeveloperregistrationstatus,
            mailmasterregistration: data.mailmasterregistration,
            mailmasterregistrationdescs: data.mailmasterregistrationdescs,
            mailmasterregistrationstatus: data.mailmasterregistrationstatus,
            mailprincipleregistration: data.mailprincipleregistration,
            mailprincipleregistrationdescs: data.mailprincipleregistrationdescs,
            mailprincipleregistrationstatus: data.mailprincipleregistrationstatus,
            smsagentregistration: data.smsagentregistration,
            smsagentregistrationdescs: data.smsagentregistrationdescs,
            smsagentregistrationstatus: data.smsagentregistrationstatus,
            smsbuyerregistration: data.smsbuyerregistration,
            smsbuyerregistrationdescs: data.smsbuyerregistrationdescs,
            smsbuyerregistrationstatus: data.smsbuyerregistrationstatus,
            smschangeagent: data.smschangeagent,
            smschangeagentdescs: data.smschangeagentdescs,
            smschangeagentstatus: data.smschangeagentstatus,
            smschangebuyer: data.smschangebuyer,
            smschangebuyerdescs: data.smschangebuyerdescs,
            smschangebuyerstatus: data.smschangebuyerstatus,
            smsdeveloperregistration: data.smsdeveloperregistration,
            smsdeveloperregistrationdescs: data.smsdeveloperregistrationdescs,
            smsdeveloperregistrationstatus: data.smsdeveloperregistrationstatus,
            smsmasterregistration: data.smsmasterregistration,
            smsmasterregistrationdescs: data.smsmasterregistrationdescs,
            smsmasterregistrationstatus: data.smsmasterregistrationstatus,
            smsprincipleregistration: data.smsprincipleregistration,
            smsprincipleregistrationdescs: data.smsprincipleregistrationdescs,
            smsprincipleregistrationstatus: data.smsprincipleregistrationstatus,
            subportfoliocd: data.subportfoliocd,
            timeedit: data.timeedit,
            timeinput: data.timeinput,
            useredit: data.useredit,
            userinput: data.userinput,
                    }
                 

                this.M_SM_NotifSpecification.mailagentregistrationLabel = this.M_SM_NotifSpecification.mailagentregistration != null && this.M_SM_NotifSpecification.mailagentregistration != '' ? data.mailagentregistration + this.separator + data.mailagentregistrationdescs :'' 
                this.M_SM_NotifSpecification.smsagentregistrationLabel = this.M_SM_NotifSpecification.smsagentregistration != null && this.M_SM_NotifSpecification.smsagentregistration != '' ? data.smsagentregistration + this.separator + data.smsagentregistrationdescs :'' 
                this.M_SM_NotifSpecification.mailmasterregistrationLabel = this.M_SM_NotifSpecification.mailmasterregistration != null && this.M_SM_NotifSpecification.mailmasterregistration != '' ? data.mailmasterregistration + this.separator + data.mailmasterregistrationdescs :'' 
                this.M_SM_NotifSpecification.smsmasterregistrationLabel = this.M_SM_NotifSpecification.smsmasterregistration != null && this.M_SM_NotifSpecification.smsmasterregistration != '' ? data.smsmasterregistration + this.separator + data.smsmasterregistrationdescs :'' 
                this.M_SM_NotifSpecification.maildeveloperregistrationLabel = this.M_SM_NotifSpecification.maildeveloperregistration != null && this.M_SM_NotifSpecification.maildeveloperregistration != '' ? data.maildeveloperregistration + this.separator + data.maildeveloperregistrationdescs :'' 
                this.M_SM_NotifSpecification.smsdeveloperregistrationLabel = this.M_SM_NotifSpecification.smsdeveloperregistration != null && this.M_SM_NotifSpecification.smsdeveloperregistration != '' ? data.smsdeveloperregistration + this.separator + data.smsdeveloperregistrationdescs :'' 
                this.M_SM_NotifSpecification.mailprincipleregistrationLabel = this.M_SM_NotifSpecification.mailprincipleregistration != null && this.M_SM_NotifSpecification.mailprincipleregistration != '' ? data.mailprincipleregistration + this.separator + data.mailprincipleregistrationdescs :'' 
                this.M_SM_NotifSpecification.smsprincipleregistrationLabel = this.M_SM_NotifSpecification.smsprincipleregistration != null && this.M_SM_NotifSpecification.smsprincipleregistration != '' ? data.smsprincipleregistration + this.separator + data.smsprincipleregistrationdescs :'' 
                this.M_SM_NotifSpecification.mailbuyerregistrationLabel = this.M_SM_NotifSpecification.mailbuyerregistration != null && this.M_SM_NotifSpecification.mailbuyerregistration != '' ? data.mailbuyerregistration + this.separator + data.mailbuyerregistrationdescs :'' 
                this.M_SM_NotifSpecification.smsbuyerregistrationLabel = this.M_SM_NotifSpecification.smsbuyerregistration != null && this.M_SM_NotifSpecification.smsbuyerregistration != '' ? data.smsbuyerregistration + this.separator + data.smsbuyerregistrationdescs :'' 
                this.M_SM_NotifSpecification.mailchangebuyerLabel = this.M_SM_NotifSpecification.mailchangebuyer != null && this.M_SM_NotifSpecification.mailchangebuyer != '' ? data.mailchangebuyer + this.separator + data.mailchangebuyerdescs :'' 
                this.M_SM_NotifSpecification.smschangebuyerLabel = this.M_SM_NotifSpecification.smschangebuyer != null && this.M_SM_NotifSpecification.smschangebuyer != '' ? data.smschangebuyer + this.separator + data.smschangebuyerdescs :'' 
                this.M_SM_NotifSpecification.mailchangeagentLabel = this.M_SM_NotifSpecification.mailchangeagent != null && this.M_SM_NotifSpecification.mailchangeagent != '' ? data.mailchangeagent + this.separator + data.mailchangeagentdescs :'' 
                this.M_SM_NotifSpecification.smschangeagentLabel = this.M_SM_NotifSpecification.smschangeagent != null && this.M_SM_NotifSpecification.smschangeagent != '' ? data.smschangeagent + this.separator + data.smschangeagentdescs :'' 
         

                this.IEBy.Input = data.userinput
                this.IEBy.Edit = data.useredit
                }
            else {
                    // this.$store.commit('setStatus', 'NEW')
                    this.getToolbar().FormStatus = 'NEW'
                    this.getToolbar().ProcessPS()
                }
            })
        }
		
    },
    beforeCreate: function () {
    },
    created: function() {
        this.$store.commit('setFormType','Form')
        // this.isDetail = true
    },
    beforeMount: function() {
    },
    mounted: function() {
        this.getDataBy()
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
