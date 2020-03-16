<template>
  <div>
    <b-row class="size-modal-content">
                <b-col sm="12" style="margin-left: 4px; margin-bottom: 10px; margin-top: 10px;">
                  <div class="modal-customize-abs__modal-header">
                  <div class="modal-customize-abs__modal-header--title">
                    View Table Lookup Detail
                  </div>
                  <div
                    class="modal-customize-abs__modal-header--icon"
                    @click="$emit('close')"
                  >
                    <i class="icon-close"></i>
                  </div>
                </div>
                  <div class="modal-customize-abs__modal-body" style="padding-right: 0px;">
                    <div class="box-category">
                      <div class="table--list" style="max-height: 500px; width:100%;">
                        <b-row style="padding-bottom:10px;">
                            <b-col md="12">
                                <b-container class="bv-example-row">
                                    <table style="font-size: 11px;" border="0px !important;">
                                        <thead style="text-align:left !important; background-color:#e9ecef;">
                                            <tr>
                                                <th style="min-width:50px; font-weight: normal !important;">Query</th>
                                            </tr>
                                        </thead>
                                        <tbody v-for="(dataH,index) in dataModal" v-bind:key="index">
                                            <tr>
                                                <td style="text-align:left;"><span>{{dataH.queryview}}</span></td>
                                            </tr>
                                        </tbody>                                                                  
                                    </table>
                                </b-container>
                            </b-col>                            
                        </b-row>
                      </div>
                    </div>
                  </div>
                </b-col>
              </b-row>
  </div>
</template>

<script>


export default {
    props: {dataModal:[]},
  data() {
    return {
        
        dataModal: [],
        M_SS_ReportParameterD :{
                optionseq: '',
                reportname: '',
                pathname: '',
                paramname: '',
                label: '',
                columntype: '',
                defaultvalue: '',
                defaultvalue2: '',
                setvalue: '',
                isrequired: 'False',
                isvisible: 'True',
                iscolumn: 'False',
                taborder: '',
                maxlength: '',
                rowno: '',
                position: '',
                lookupcd: '',
                lookupdb: '',
                lookupinitialwhere: '',
                setcolumnvalue: '',
                setcolumnwhere: '',
                onchangetriggerfield: '',
                onchangetriggerinitialwhere: '',
                userinput: '',
                useredit: this.getDataUser().user_id,
                timeinput: '',
                timeedit: '',
                displaycolumn: '',
                iscomptfail: '',
                cntreportpath: '',
                isparam: '',
                lookupsortfield: '',
                sourcefield: '',
                displaylookup: '',
                isdisabled: '',
                paramviewlookup: '',
                analysistype: '',
                id: 0,
                viewname: ''
            },

    };
  },
  methods: {
    getDataModal(record){
          var param = {
                OptionSeq:this.getOptionSeq().OptionSeq,
                UserId:this.getDataUser().user_id,
                PortfolioCd:this.getDataUser().portfolio_cd,              
                SubPortfolioCd:this.getDataUser().subportfolio_cd,
                view: this.M_SS_ReportParameterD.viewname,  
                LineNo:3,
                InitialWhere:"",
                SortField:'',
                // ParamView: "'"+this.M_SS_ReportParameterD.viewname+"'"
            }
            // alert(JSON.stringify(param))
              this.postJSON( this.getUrlById(), param).then(response => {
                  // response from API
                  if (response == null) return
                  console.log(response)
                  this.dataModal = response.Data
              })
        },
  },
  beforeCreate: function () {
      
  },
  created: function() {
      this.M_SS_ReportParameterD.viewname = this.dataModal
      console.log(JSON.stringify(this.dataModal,null,2))
      this.getDataModal(this.dataModal)
  },
  beforeMount: function() {
  },
  mounted: function() {
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
<style scoped>
    table {
    border-collapse: collapse;
    }

    table, td, th {
        border: 1px solid black;
        padding: 0px 5px 0px 5px;
    }
      .size-modal-content {
            padding: 10px;
            font-style: 13px;
        }
        .v--modal-overlay[data-modal="size-modal"] {
            background: rgba(0, 0, 0, 0.5);
        }
        .demo-modal-class {
            border-radius: 5px;
            background: #F7F7F7;
            box-shadow: 5px 5px 30px 0px rgba(46,61,73, 0.6);
        }
        .container{
            margin-left: 0px !important;
        }
</style>