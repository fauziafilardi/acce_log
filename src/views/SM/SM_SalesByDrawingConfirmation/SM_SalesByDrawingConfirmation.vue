<template>
    <div class="height--full">
        <HeaderFormListVuex2 :isProcess = "true" />

        <div class="content-app-form__body" style="background-color: white;padding-top: 35px !important;margin-left: 15px;margin-right: 15px;height: 95%;overflow-y: auto;overflow-x: hidden;padding-bottom: 80px;">
            
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
    </div>
</template>

<script>

export default {
    data() {
        return {
            propList: {
                initialWhere: "Status='N' and SubPortfolioCd='" + this.getDataUser().subportfolio_cd + "'",
                LineNo: 0,
                PageLevel: 1,
                TabIndex: 1
            },
		    FormType: "Process",
       
            IEBy: {Input: '', Edit: ''},

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
        toToolbar() {
            return this.$children[0].$children[0]
        },
        toList() {
            return this.$children[1]
        },
        Loader() {
            return this.$children[3]
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
        M_Post(dt) {
            var data = this.toList().getRowSelected()
            var dataPost = []
            
            data.forEach((value) => {
                // dt = dt + value.row_id + ','
                dataPost.push({
                    _Message_ : "Payment No = "+value.PaymentNo,
                    SubPortfolioCd : this.getDataUser().subportfolio_cd,
                    PaymentNo: value.PaymentNo,
                    UserEdit:this.getDataUser().user_id,
                    Source: value.Source
                })
            })

            var param = {
                OptionSeq: this.getOptionSeq().OptionSeq,
                LineNo: 0,
                Data:dataPost
            }

            this.postJSONMulti(this.getUrlPostMulti(), param).then(response => {
                if (response == null) return
                if(response.Data.length==0){
                }

                this.$store.commit('setEventStatus', 'POST')
                this.toList().doGetList("", "eb_getList")
            })

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

