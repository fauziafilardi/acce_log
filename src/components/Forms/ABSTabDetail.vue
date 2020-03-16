<template>
  <keep-alive>
  <!-- <component :ref="tabUrl" :is="component" :data="data" :PageLevel="PageLevel" :TabIndex="TabIndex" /> -->
    <component ref="_reference_" :is="component" :data="data" :PageLevel="PageLevel" :TabIndex="TabIndex" />
  </keep-alive>
</template>

<script>
import {EventBus} from '../../main'
export default {
  props: {
            tabPath: String,
            tabUrl: String,
            data: Object,
            PageLevel: String,
            TabIndex: String
         },
  data () {
    return {
        component: null,
        state: null,
        isDetail: false,

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
    mounted () {
        this.component = () => import(`../../${this.tabPath}/${this.tabUrl}.vue`)
    },
    methods: {
        getSelected (data) {
            var dt = ''
            data.forEach((value) => {
                dt = dt + value.row_id + ','
            })

            dt = dt.slice(0,-1)
            this.DataDeleteAndPost = dt 
        },
    },
    created () {
        //HeaderPage
        EventBus.$on('HeaderPage', (data) => {
            // alert(JSON.stringify(data))
            // this.propList.initialWhere = "CurrencyCd = '" + data.CurrencyCd + "'"
            // this.ValKey = data.CurrencyCd
            // this.M_CM_CurrencyMasterRate.CurrencyCd = data.CurrencyCd
            this.$refs._reference_.M_HeaderPage(data)
            EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
            // this.isDetail = false
        })

        //HeaderChildPage
        EventBus.$on('HeaderChildPage', (data) => {
            // alert(JSON.stringify(data))
            // this.propList.initialWhere = "CurrencyCd = '" + data.CurrencyCd + "'"
            // this.ValKey = data.CurrencyCd
            // this.M_CM_CurrencyMasterRate.CurrencyCd = data.CurrencyCd
            this.$refs._reference_.M_HeaderChildPage(data)
            EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex)
            // this.isDetail = false
        })

        //New 
        EventBus.$on('New_' + this.PageLevel + '_' + this.TabIndex, (data) => {
            // alert(this.tabUrl)
            this.isPointer = false
            this.isDefault = true
            
            // this.$refs._reference_.aa()
            // this.$refs.CM_CurrencyMaster.aa()
            
            // this.M_CM_CurrencyMaster.CurrencyCd = ''
            // this.M_CM_CurrencyMaster.Descs = ''
            // this.M_CM_CurrencyMaster.CurrencySign = ''
            // this.M_CM_CurrencyMaster.Operator = ''
            // this.M_CM_CurrencyMaster.Rate = ''
            // this.M_CM_CurrencyMaster.UnitName = ''
            // this.M_CM_CurrencyMaster.SubUnitName = ''

            // this.$nextTick().then(() => document.getElementById("CurrencyCd").focus())

            this.state = 'NEW'
            this.isDetail = true

            this.EbData.Event ='new'
            EventBus.$emit('ToOpen',this.EbData)
            this.$refs._reference_.M_New()
        })
        //Save
        EventBus.$on('Save_' + this.PageLevel + '_' + this.TabIndex, (data) => {
            // this.M_Save()
            this.$refs._reference_.M_Save()
        })
        //Edit
        EventBus.$on('Edit_' + this.PageLevel + '_' + this.TabIndex, (data) => {  
            this.state='UPDATE'
            this.isDetail = true
            //utk ke masterpage
            this.EbData.Event ='edit'
            // this.$nextTick().then(() => document.getElementById("Descs").focus())
            EventBus.$emit('ToOpen',this.EbData)
            this.$refs._reference_.M_Edit()
        });
        //Delete
        EventBus.$on('Delete_' + this.PageLevel + '_' + this.TabIndex, (data) => {  
            //call for get data selected list
            EventBus.$emit('ebDoDeleteList_'+this.PageLevel+'_'+ this.TabIndex)
        });
        //delete Get data selected from list then doDelete
        EventBus.$on('ebGetDeleteList_' + this.PageLevel + '_' + this.TabIndex, (data) => {
                // this.getSelected(data)
                // this.M_Delete(this.DataDelete)
            // this.$refs._reference_.getSelected(data)
            this.getSelected(data)
            // this.$refs._reference_.M_Delete(this.DataDelete)
            this.$refs._reference_.M_Delete(this.DataDeleteAndPost)
        })
        EventBus.$on('ebGetPostList_' + this.PageLevel + '_' + this.TabIndex, (data) => {
            // alert(JSON.stringify(data))
            this.getSelected(data)
            this.$refs._reference_.M_Post(this.DataDeleteAndPost)
        })

        // Delete And Post Modified By Akmal
        EventBus.$on('ebProcessPostAndDelete' + this.PageLevel + '_' + this.TabIndex, (data) => {
            console.log(data)
            // this.getSelected(data.Data)
            if(data.Act == 'post' || data.Act == 'process'){
                this.$refs._reference_.M_Post(this.DataDeleteAndPost)
            } else if(data.Act == 'delete'){
                this.$refs._reference_.M_Delete(this.DataDeleteAndPost)
            }
        })

        //Refresh
        EventBus.$on('Refresh_' + this.PageLevel + '_' + this.TabIndex, (data) => {
            // alert('Refresh')
            // this.EbData.PageLevel = this.PageLevel
                this.EbData.Event = 'refresh'
                this.EbData.Key = ''
            EventBus.$emit('ToOpen',this.EbData)
            this.isDetail = false
            EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex, data)
        });
        //Search
        EventBus.$on('Search_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
            // alert(this.PageLevel)
            // alert(data) 
            // alert('search')
            EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex, data)
        });
        //Cancel
        EventBus.$on('Cancel_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
            if(this.state =='NEW'){
                this.isDetail =false
                // this.pointer='arrow'
            }else{
                // this.pointer='pointer'
                        this.isPointer = true
                        this.isDefault = false
            }
            
            this.EbData.Event ='cancel'
            EventBus.$emit('ToOpen',this.EbData)
            // EventBus.$emit('ebGetList_' + this.PageLevel + '_' + this.TabIndex, data)
        });

        //OnSearchEnter
        EventBus.$on('onSearchEnter_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
            // alert('onsearchEnter')
            this.isDetail = false
            this.EbData.Event = 'refresh'
            EventBus.$emit('ToOpen',this.EbData)
            
        });
        //Pagination
        EventBus.$on('pagination_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
            alert('dari master')
            alert('Pagination_' + this.PageLevel + '_' + this.TabIndex)
            // alert('onsearchEnter')
            this.isDetail = false
            this.EbData.Event = data.Event
            EventBus.$emit('ToOpen',this.EbData)
            
        });
        //pageSize
        EventBus.$on('pageSize_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
            // alert('onsearchEnter')
            // this.isDetail = false
            this.EbData.Event = data.Event
            EventBus.$emit('ToOpen',this.EbData)
            
        });
        //headTable
        EventBus.$on('headTable_' + this.PageLevel + '_' + this.TabIndex, (data) => { 
            // alert('onsearchEnter')        
            this.EbData.Event = data.Event
            EventBus.$emit('ToOpen',this.EbData)  
            // EventBus.$emit('ebActiveForm', this.PageLevel)     
        });
        //untuk hide/show detail dari masterpage
        EventBus.$on('activeForm_' + this.PageLevel, (data) => { 
            // alert('TabIndexLocal : ' + this.TabIndex +' :: '+ data.TabIndex)
            // alert('onsearchEnter')  
            if(this.PageLevel==data.PageLevel && this.TabIndex == data.TabIndex){
                this.isDetail = data.active  
            }
                        
        });
    },
    beforeDestroy(){
        EventBus.$off('HeaderPage')
        EventBus.$off('HeaderChildPage')
        EventBus.$off('New_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('Save_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('Edit_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('Delete_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('ebGetDeleteList_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('ebGetPostList_' + this.PageLevel + '_' + this.TabIndex)
        
        //New Post And Delete - Akmal
        EventBus.$off('ebProcessPostAndDelete' + this.PageLevel + '_' + this.TabIndex)

        EventBus.$off('Refresh_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('Search_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('Cancel_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('onSearchEnter_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('pagination_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('pageSize_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('headTable_' + this.PageLevel + '_' + this.TabIndex)
        EventBus.$off('activeForm_' + this.PageLevel)
    }
}
</script>