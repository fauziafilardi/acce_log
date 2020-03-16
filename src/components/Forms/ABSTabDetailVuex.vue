<template>
  <keep-alive>
  <!-- <component :ref="tabUrl" :is="component" :data="data" :PageLevel="PageLevel" :TabIndex="TabIndex" /> -->
    <component ref="_reference_" :is="component" :data="data" :PageLevel="PageLevel" :TabIndex="TabIndex" />
  </keep-alive>
</template>

<script>
export default {
  props: {
            tabPath: String,
            tabUrl: String,
            data: [Object, Array, String],
            PageLevel: [String, Number],
            TabIndex: [String, Number]
         },
  data () {
    return {
        component: null,
        state: null,
        showForm: false,

        isPointer: true,
        isDefault: false,

        EbData: {
                Key: null,
                Event: null,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex
            },
        DataDeleteAndPost: null,
        }
    },
    computed : {
        inputStatus () {
            if (this.$store.getters.getLevel == this.PageLevel && this.$store.getters.getTab == this.TabIndex) {
                return this.$store.getters.getStatus.toUpperCase()
            } else {
                return 'VIEW'
            }
        },
        formType () {
            return this.$store.getters.getFormType
        },
        // isByPassCancel () {
        //     return this.$store.getters.getByPassCancel
        // },
    },
    mounted () {
        this.component = () => import(`../../${this.tabPath}/${this.tabUrl}.vue`)
    },
    methods: {
        checkboxChecked (data, status, index) {
            this.getChild().M_CheckboxChecked(data, status, index)
        },
        M_New () {
            this.state = 'NEW'
            // var scopeForm = "FormScope_" + this.PageLevel + "_" + this.TabIndex
            // console.log(scopeForm)
            // this.getChild().M_ClearForm()
            
            // this.$validator.pause()
            // this.$nextTick(() => {
            //     this.$validator.errors.clear(scopeForm)
            //     this.$validator.resume()
            // })

            this.FormToMasterPage2().ValidasiPage()
            this.showForm = true

            this.getChild().M_New()
            this.getChild().IEBy.Input = ''
            this.getChild().IEBy.Edit = ''
        },
        M_Edit () {
            this.getChild().M_Edit()
        },
        M_Delete () {
            // List
            // ListProcess
            // langsung set rowId
            var dt = ''
            if (this.formType == 'List' || this.formType == 'ListProcess') {
                var data = this.FormToABSList2().getRowSelected()
                data.forEach((value) => {
                    dt = dt + value.row_id + ','
                })

                dt = dt.slice(0,-1)
                // this.getChild().M_Delete(dt)
            }
            this.getChild().M_Delete(dt)
        },
        M_Save () {
            // this.getChild().M_Save()
            if (this.inputStatus == 'EDIT') {			
                // this.UpdateData()
                this.getChild().M_Update()
            } else {
                // this.SaveData()
                this.getChild().M_Insert()
            }
        },
        M_Cancel (isByPassCancel = false) {
            // var data = this.$store.getters['GetPage' + this.PageLevel + 'GetDataBy']
            // console.log(data)
            // this.getChild().M_Cancel(data)

            if (isByPassCancel || this.formType == 'Process') {
                this.getChild().M_Cancel()
            }

            // tambahan buat common spec
            if (this.formType == 'Form') {
                this.getChild().getDataBy()
                this.getChild().M_Cancel()
                return
            }
            
            var record = this.$store.getters['GetPage' + this.PageLevel + 'Data']

            if (record) {
            // edit
                this.getChild().getDataBy(record)
            } else {
            // new
                this.showForm = false
            }
            this.getChild().M_Cancel()
        },
        M_Refresh () {
            this.getChild().M_Refresh()
            if (this.PageLevel > 1) {
                if (this.formType == 'Form') {
                    this.getChild().getDataBy()
                }
                else {
                    this.showForm = false
                    this.FormToABSList2().doGetList('','refresh')
                }
            }
        },
        M_Post () {
            // ListProcess
            // langsung set rowId
            var dt = ''
            if (this.formType == 'ListProcess') {
                var data = this.FormToABSList2().getRowSelected()
                data.forEach((value) => {
                    dt = dt + value.row_id + ','
                })

                dt = dt.slice(0,-1)
            }
            this.getChild().M_Post(dt)
        },
        M_GetAllData () {
            return this.FormToABSList2().getAllItem()
        },
        M_Search (data) {
            this.$store.commit('setEventStatus', 'ONSEARCHENTER')
            this.$store.commit('setLevel', this.PageLevel)
            this.showForm = false
            this.FormToMasterPage2().ValidasiPage()
            if (this.formType == 'Process' || this.formType == 'Form') {
            } else {
                this.FormToABSList2().doGetList(data,'ONSEARCHENTER')
            }

            this.getChild().M_Search(data)
        },
        M_Head_Table () {
            this.$store.commit('setEventStatus', 'HEADTABLE')
            this.$store.commit('setLevel', this.PageLevel)
            this.showForm = false
            this.FormToMasterPage2().ValidasiPage()
            this.getChild().M_Head_Table()
        },
        M_PageSize () {
			this.$store.commit('setEventStatus', 'PAGESIZE')
            this.$store.commit('setLevel', this.PageLevel)
            this.showForm = false
            this.FormToMasterPage2().ValidasiPage()
            this.getChild().M_PageSize()
        },
        // M_TabClick () {
        //     this.getChild().M_TabClick()
        // },
        M_Pagination () {
			this.$store.commit('setEventStatus', 'PAGINATION')
            this.$store.commit('setLevel', this.PageLevel)
            this.showForm = false
            this.FormToMasterPage2().ValidasiPage()
            this.getChild().M_Pagination()
        },
        M_Advance_Filter () {
            this.getChild().M_Advance_Filter()
        },
        rowClicked (record, index) {
            this.state = 'UPDATE'
			this.showForm = true
            // this.$store.commit('SetPage1Data', record)
            this.$store.commit('setEventStatus', 'rowClick')
            this.$store.commit('setLevel', this.PageLevel)
            // this.getChild().M_ClearForm()
            this.getChild().getDataBy(record)
            
            this.getChild().rowClicked(record, index)
            this.$store.commit('setRowClickCount', this.$store.getters.getRowClickCount + 1)
            this.FormToMasterPage2().ValidasiPage()
        },
        doDoubleClick () {
            this.getChild().doDoubleClick()
        },
        rowLink (url) {
            this.getChild().rowLink(url)
        },
        setToolbarButton () {
            this.getChild().setToolbarButton()
        },
        getChild () {
            return this.$children[0] 
        },
        resultInsert (message) {
            console.log('tabdetail')
            console.log(this.getIsPopup())
            this.alertSuccess(message)
            .then(() => {
                if (this.getIsCallBack()) {
                } else if (this.getIsPopup()) {

                    // var dataParam = this.$store.getters.getParamInsertPopup

                    var data = this.$store.getters.getParamInsertPopup
                    console.log(data)

                    if (!this.getChild().cInsertKey || this.getChild().cInsertKey == '') {
                        this.alertError('Please Check cInsertKey !!!')
                        return
                    }
                    
                    var insertColumn = this.getChild().cInsertKey.split(',')
                    if (insertColumn.length == 1) {
                        this.alertError('Please Check cInsertKey !!!')
                        return
                    }
                    var keys = Object.keys(data)
                    var json = {}
                    
                    for (var j = 0; j < keys.length; j++) {

                        // add label to display column textbox
                        insertColumn.forEach(el => {
                            var dt = el.split('=')

                            var left = dt[0]
                            var right = dt[1]

                            if (right.includes('+')) {
                                var descs = right.split('+')
                                
                                var descsLeft = descs[0]
                                var separator = ' ' + descs[1] + ' '
                                var descsRight = descs[2]

                                if (keys[j] == descsLeft.trim()) {
                                    json[left] = data[descsLeft]
                                } else if (keys[j] == 'row_id' && descsLeft.trim().includes('_id')) {
                                    json[left] = data['row_id']
                                } else if (keys[j] == descsRight.trim()) {
                                    json[left] = json[left] + separator + data[descsRight]
                                } else if (keys[j] == 'row_id' && descsRight.trim().includes('_id')) {
                                    json[left] = json[left] + separator + data['row_id']
                                }
                            } else {
                                // console.log(keys[j], right)
                                if (keys[j] == 'row_id' && right.trim().includes('_id')){
                                    json[left] = data['row_id']
                                }

                                if (keys[j] == right.trim()) {
                                    json[left] = data[right]
                                }
                            }
                        })
                    }

                    json['_from'] = this.getFrom()
                    json['isLookUpOpen'] = 1 
                    // console.log('tab detail',json)
                    // console.log(this.getFrom())
                    // return
                    var pHidden = window.opener.document.getElementById(this.getFrom() + 'passingHidden')
                    console.log(json)
                    console.log('tab detail')
                    pHidden.value = JSON.stringify(json)
                    pHidden.dispatchEvent(new Event('change'))
                    // window.opener.postMessage(true, '*'); //or false
                  
                    self.close()
                    return
                }
                this.$store.commit('setListDisable', false)
                this.$store.commit('setStatus', 'view')
                if (this.formType == 'Process' || this.formType == 'Form') {
                } else {
                    this.getToolbar2().setButton(false)
                    this.FormToABSList2().doGetList('', 'save')
                }
                this.showForm = false

                this.FormToMasterPage2().ValidasiPage()
                this.getChild().M_ClearForm()
                // if (this.PageLevel == 2) {
                //     this.FormToMasterPage2().callMethodChild2GetDataBy()
                // } else if (this.PageLevel == 3) {
                //     this.FormToMasterPage2().callMethodChild3GetDataBy()
                // }
            })
        },
        resultUpdate (message) {
            this.alertSuccess(message)
            .then(() => {
                this.$store.commit('setListDisable', false)
                this.$store.commit('setStatus', 'view')

                if (this.formType == 'Process' || this.formType == 'Form') {
                } else {
                    this.getToolbar2().setButton(false)
                    this.FormToABSList2().doGetList('', 'update')
                }
                this.showForm = false

                var row = {
                    pageLevel: this.PageLevel,
                    tabIndex: this.TabIndex
                }
                this.getToolbar2().unselectRow(row)
                if (this.formType !== 'Form') {
                    this.FormToMasterPage2().ValidasiPage()
                    this.getChild().M_ClearForm()
                }
                // if (this.PageLevel == 2) {
                //     this.FormToMasterPage2().callMethodChild2GetDataBy()
                // } else if (this.PageLevel == 3) {
                //     this.FormToMasterPage2().callMethodChild3GetDataBy()
                // }
            })
        },
        resultDelete (message = 'Data Has Been Delete Successfully') {
            // this.alertSuccess(message)
            // .then(() => {
                // alert('aaa')
                this.showForm = false
                this.$store.commit('setEventStatus', 'DELETE')

                var datax = {
                    pageLevel: this.PageLevel,
                    tabIndex: this.TabIndex
                }
                this.getToolbar2().unselectRow(datax)

                // var len = this.FormToABSList2().getAllItem().length
                // if (len == 1) {
                    this.getToolbar2().setCheckBoxClick(datax)
                // }
                
                if (this.formType == 'Process' || this.formType == 'Form') {
                } else {
                    this.FormToABSList2().doGetList('', 'delete')
                }

                this.FormToMasterPage2().ValidasiPage()
            // })
        },
        resultPost () {
            // this.alertSuccess("Data Has Been Successfully Processed")
            // .then(() => {
                this.showForm = false
                this.$store.commit('setEventStatus', 'POST')
                
                if (this.formType == 'Process' || this.formType == 'Form') {
                } else {
                    this.FormToABSList2().doGetList('', 'post')
                }

                this.FormToMasterPage2().ValidasiPage()
            // })
        },
        refreshColumn () {
            this.showForm = false
            this.FormToMasterPage2().ValidasiPage()
        }
        
    },
    created () {
    }
}
</script>