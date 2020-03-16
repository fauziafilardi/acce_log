<template>
  <div class="height--full">
    <!-- <HeaderFormListVuex2 :isProcess = "true" /> -->
    <div class="header--content">
      
    </div>
    <div class="content-app-form__body form-process" style="padding-top: 0px !important;">
      <div :style="'margin-top:10px;'" class="el" mousetip mousetip-msg="I'm a tooltip">
        <b-row  style="margin-left: 15px; padding-bottom: 10px; !important;">
        <b-col md="12" id="col-left" class="bColMasterForm">
            <b-form :data-vv-scope="'FormScope_1_1'" :data-vv-value-path="'FormScope_1_1'">
                <b-row>
                    <b-col md="6">
                        <ABSInputSelectList @change="OnmailmergecdChange" :prop="PI_mailmergecd" :value="mailmergecd" :label="mailmergecdLabel" ref="ref_mailmergecd"/>
                    </b-col>
                </b-row>
                <b-row>
                    <b-col md="6">
                        <ABSinputRadioButtonVuex @input="OnformtypeChange" :prop="PI_formtype" v-model="formtype"  ref="ref_formtype" />
                    </b-col>
                </b-row>
                <b-row>
                    <b-col md="6">
                        <ABSInputSelectList @change="OnapplicationnoChange" :prop="PI_applicationno" :value="applicationno" :label="applicationnoLabel" ref="ref_applicationno"/>
                        <ABSInputSelectList @change="OnsubleasenoChange" :prop="PI_subleaseno" :value="subleaseno" :label="subleasenoLabel" ref="ref_subleaseno"/>
                        <ABSInputSelectList @change="OnassignmentnoChange" :prop="PI_assignmentno" :value="assignmentno" :label="assignmentnoLabel" ref="ref_assignmentno"/>
                    </b-col>
                </b-row>
                <b-row>
                    <b-col md="6">
                        <span>
                            <b-row>
                                <b-col md="6" offset="6">
                                    <ABSButton
                                        text="View Report"
                                        icon=""
                                        classButton="button button--default"
                                        classIcon=""
                                        @click="getviewreport"
                                        :disabled="false"
                                    />
                                </b-col>
                            </b-row>
                        </span>
                    </b-col>
                </b-row>
            </b-form>
        </b-col>
        </b-row>

        <b-collapse id="collapse1" :visible="true">
            <b-row>
                <b-col  md="12" v-show="isShow">
                    <ABSTextEditor
                        @change="OnmailmergetemplateChange"
                        @exportDoc="OnmailmergetemplateExportDoc"
                        @exportPdf="OnmailmergetemplateExportPdf"
                        :prop="PI_mailmergetemplate"
                        v-model="mailmergetemplate"
                        ref="ref_mailmergetemplate"
                    />
                </b-col>
            </b-row>
        </b-collapse>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  components: {},
  data() {
    return {
        mailmergecd: '',
        mailmergecdLabel: '',
        formtype: 'P',
        applicationno: '',
        applicationnoLabel: '',
        subleaseno: '',
        subleasenoLabel: '',
        assignmentno: '',
        assignmentnoLabel: '',
        mailmergetemplate: '',
        isShow: false,

        PI_mailmergecd: {
            dataLookUp: {
                LookUpCd: "GetLookupMailMergeCd",
                ColumnDB: "MailMergeCd",
                InitialWhere: "",
                ParamWhere: ""
            },
            cValidate: 'required',
            cName: "MailMergeCd",
            cLabel: "Mail Merge Code",
            cType: "lookup",
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
            cMasterUrl: '' ,
            cDisplayColumn: 'MailMergeCd,MailMergeName'
        },
        PI_formtype: {
            cValidate :'', 
            cName: 'formtype', 
            cId: 'rdbformtype', 
            cRadioOptions: [{ text: 'Application No', value: 'P' }, { text: 'Sublease No', value: 'S' }, { text: 'Assignment No', value: 'A' }], 
            cRadioDefaultOption: 'P', 
            cLabel:'Form Type', 
            cLabelSize: 4, 
            cOrder: 2, 
            cProtect: false, 
            cVisible:  true, 
            cPageLevel: 1, 
            cTabIndex: 1, 
            cParentForm: 'FormScope_1_1'
        },
        PI_applicationno: { 
            dataLookUp: { 
                LookUpCd: 'GetApplicationNo'    , 
                ColumnDB: 'ApplicationNo'   , 
                InitialWhere: " SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "' "   ,
                ParamWhere: ''  
            },
            cValidate :'required', 
            cName: 'applicationno', 
            cLabel: 'Application No', 
            cKey: false, 
            cLabelSize: 4, 
            cOrder: 3, 
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
            cMasterUrl: '' ,
            cDisplayColumn: 'ApplicationNo' ,
        },
        PI_subleaseno: { 
            dataLookUp: { 
                LookUpCd: 'GetLookupSubleaseNo'    , 
                ColumnDB: 'SubleaseAssignmentNo'   , 
                InitialWhere: " SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "' AND SubleaseAssignmentType = 'S'"   ,
                ParamWhere: ''  
            },
            cValidate :'', 
            cName: 'subleaseassignmentno', 
            cLabel: 'Sublease No', 
            cKey: false, 
            cLabelSize: 4, 
            cOrder: 3, 
            cTriggered: false, 
            cDefault: '', 
            cProtect: false, 
            cVisible:  false, 
            cAsync:  false, 
            cFilter: true, 
            cPageLevel: 1, 
            cTabIndex: 1, 
            cParentForm: 'FormScope_1_1', 
            cStatic: false, 
            cOption: [], 
            cMasterUrl: '' ,
            cDisplayColumn: 'SubleaseAssignmentNo' ,
        },
        PI_assignmentno: { 
            dataLookUp: { 
                LookUpCd: 'GetLookupSubleaseNo'    , 
                ColumnDB: 'SubleaseAssignmentNo'   , 
                InitialWhere: " SubPortfolioCd = '" + this.getDataUser().subportfolio_cd + "' AND SubleaseAssignmentType = 'A'"   ,
                ParamWhere: ''  
            },
            cValidate :'', 
            cName: 'subleaseassignmentno', 
            cLabel: 'Assignment No', 
            cKey: false, 
            cLabelSize: 4, 
            cOrder: 3, 
            cTriggered: false, 
            cDefault: '', 
            cProtect: false, 
            cVisible:  false, 
            cAsync:  false, 
            cFilter: true, 
            cPageLevel: 1, 
            cTabIndex: 1, 
            cParentForm: 'FormScope_1_1', 
            cStatic: false, 
            cOption: [], 
            cMasterUrl: '' ,
            cDisplayColumn: 'SubleaseAssignmentNo' ,
        },
        PI_mailmergetemplate: {
            cName: 'mailmergetemplate', 
            cLabel: 'Mail Merge Template', 
            cLabelSize: 2,
            cOrder: 7, 
            cKey: false,
            cToolbar: [
                ['style', ['bold', 'italic', 'underline', 'strikethrough', 'superscript', 'subscript', 'clear']],
                ['font', ['fontname', 'fontsize', 'color']],
                ['para', ['ul', 'ol', 'paragraph', 'height']],
                ['table', ['table']],
                ['insert', ['link', 'picture']],
                ['edit', ['undo', 'redo']],
                ['custom', ['print']],
                ['view', ['codeview']]
            ],
            cVisible: true, 
            cProtect: false, 
            cPageLevel: 1, 
            cTabIndex: 1, 
            cParentForm: 'FormScope_1_1'
        }
    }
  },

  methods: {
    OnmailmergecdChange(data){
        this.mailmergecd = data.id
        this.mailmergecdLabel = data.label
    },
    OnformtypeChange(data){
        if (data == 'P') {
            this.PI_applicationno.cVisible = true
            this.PI_applicationno.cValidate = 'required'
            this.$refs.ref_applicationno.isRequired = true

            this.PI_subleaseno.cVisible = false
            this.PI_subleaseno.cValidate = ''
            this.$refs.ref_subleaseno.isRequired = false

            this.PI_assignmentno.cVisible = false
            this.PI_assignmentno.cValidate = ''
            this.$refs.ref_assignmentno.isRequired = false
        }
        else if (data == 'S') {
            this.PI_applicationno.cVisible = false
            this.PI_applicationno.cValidate = ''
            this.$refs.ref_applicationno.isRequired = false

            this.PI_subleaseno.cVisible = true
            this.PI_subleaseno.cValidate = 'required'
            this.$refs.ref_subleaseno.isRequired = true

            this.PI_assignmentno.cVisible = false
            this.PI_assignmentno.cValidate = ''
            this.$refs.ref_assignmentno.isRequired = false
        }
        else if (data == 'A') {
            this.PI_applicationno.cVisible = false
            this.PI_applicationno.cValidate = ''
            this.$refs.ref_applicationno.isRequired = false

            this.PI_subleaseno.cVisible = false
            this.PI_subleaseno.cValidate = ''
            this.$refs.ref_subleaseno.isRequired = false

            this.PI_assignmentno.cVisible = true
            this.PI_assignmentno.cValidate = 'required'
            this.$refs.ref_assignmentno.isRequired = true
        }
    },
    OnapplicationnoChange(data){
        this.applicationno = data.id
        this.applicationnoLabel = data.label
    },
    OnsubleasenoChange(data){
        this.subleaseno = data.id
        this.subleasenoLabel = data.label
    },
    OnassignmentnoChange(data){
        this.assignmentno = data.id
        this.assignmentnoLabel = data.label
    },
    OnmailmergetemplateChange(data) {
        this.mailmergetemplate = data
    },
    getviewreport(){
        // console.log(this.$validator)
        // return
        this.$validator._base.validateAll("FormScope_1_1").then((result) => {
            // console.log(result)
            if (!result) return
            var fromno = ''
            if (this.formtype == 'P') {
                fromno = this.applicationno
            }
            if (this.formtype == 'S') {
                fromno = this.subleaseno
            }
            if (this.formtype == 'A') {
                fromno = this.assignmentno
            }

            var param = {
                SubPortfolioCd: this.getDataUser().subportfolio_cd,
                MailMergeCd: this.mailmergecd,
                FromNo: fromno
            }

            this.postEncode( this.getUrlGetViewReport(), param )
            .then(response => {
                if(response == null) {
                    this.isShow = false
                    return
                }
                this.$refs.ref_mailmergetemplate.GetDataByStatus = true
                this.mailmergetemplate = response.Data._result
                this.isShow = true
            })
        })
    },
    OnmailmergetemplateExportDoc(data) {
        var param = {
            MailMergeCd: this.mailmergecd,
            UserId: this.getDataUser().user_id,
            MailMergeTemplate: data
        }

        this.postEncode( this.getUrlGetIdMailMerge(), param )
        .then(response => {
            // console.log(response)
            if(response == null) return

            var fromno = ''
            if (this.formtype == 'P') {
                fromno = this.applicationno
            }
            if (this.formtype == 'S') {
                fromno = this.subleaseno
            }
            if (this.formtype == 'A') {
                fromno = this.assignmentno
            }
            var url = this.getExportMailMerge(this.getDataUser().subportfolio_cd, this.mailmergecd, fromno, 'docx', response.Data.Id)

            window.location.href = url
        })

        // var preHtml = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns='http://www.w3.org/TR/REC-html40'><head><meta charset='utf-8'><title>Export HTML To Doc</title></head><body>";
        // var postHtml = "</body></html>";
        // var html = preHtml + data + postHtml;

        // var blob = new Blob(['\ufeff', html], {
        //     type: 'application/msword'
        // });
        
        // // Specify link url
        // var url = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(html);
        
        // // Specify file name
        // var filename = "MailMergeViewer.doc"; //filename?filename+'.doc':'document.doc';
        
        // // Create download link element
        // var downloadLink = document.createElement("a");

        // document.body.appendChild(downloadLink);
        
        // if(navigator.msSaveOrOpenBlob ){
        //     navigator.msSaveOrOpenBlob(blob, filename);
        // }else{
        //     // Create a link to the file
        //     downloadLink.href = url;
            
        //     // Setting the file name
        //     downloadLink.download = filename;
            
        //     //triggering the function
        //     downloadLink.click();
        // }
        
        // document.body.removeChild(downloadLink);
    },
    OnmailmergetemplateExportPdf(data) {
        var param = {
            MailMergeCd: this.mailmergecd,
            UserId: this.getDataUser().user_id,
            MailMergeTemplate: data
        }

        this.postEncode( this.getUrlGetIdMailMerge(), param )
        .then(response => {
            // console.log(response)
            if(response == null) return

            var fromno = ''
            if (this.formtype == 'P') {
                fromno = this.applicationno
            }
            if (this.formtype == 'S') {
                fromno = this.subleaseno
            }
            if (this.formtype == 'A') {
                fromno = this.assignmentno
            }
            var url = this.getExportMailMerge(this.getDataUser().subportfolio_cd, this.mailmergecd, fromno, 'pdf', response.Data.Id)
            window.location.href = url
        })
    }
  },
  created () {
    this.hideSideBarMenu()
  },
  mounted () {
    this.$store.commit('setFormType','Form')
    this.$store.commit('setStatus', 'new')
    this.$store.commit('setLevel', 1)
    this.$store.commit('setTab', 1)
    // this.$refs.ref_mailmergetemplate.IsForExport = true
  },
    
}
</script>
