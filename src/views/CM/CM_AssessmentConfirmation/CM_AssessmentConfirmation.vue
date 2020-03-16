<template>
    <div class="height--full">
        <HeaderFormListVuex :isProcess = "true" />

        
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
        </div>
    </div>
</template>

<script>

export default {
    data() {
        return {
            propList: {
                initialWhere: "Status = 'N'",
                LineNo: 0,
                PageLevel: 1,
                TabIndex: 1
            },
		    FormType: "Process",
       
            IEBy: {Input: '', Edit: ''}
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
        M_Post() {
            var data = this.toList().getRowSelected()  //this.FormToABSList().getRowSelected()
            var dataPost = []

            data.forEach((value) => {
                // dt = dt + value.row_id + ','
                console.log(value)
                dataPost.push({
                    _Message_: "Assement No = "+value.AssessmentNo ,
                    SubPortfolioCd : this.getDataUser().subportfolio_cd,
                    AssessmentNo : value.AssessmentNo,
                    User : this.getDataUser().user_id
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
                // this.M_POST2()
                this.toList().doGetList("", "eb_getList")
                this.$parent.resultPost()
                this.$store.commit('setEventStatus', 'POST')
                
            })


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
            //     SourceValue:"AssessmentNo,SubPortfolioCd,User",
            //     IsDetailMessage :false
            // };
            
            // this.postJSONMulti(this.getUrlPostMulti(), param).then(response => {
            //     // response from API
            //     if (response == null) return
            //     if(response.Data.length==0){
            //         this.alertSuccess("Posting Data Successfully")
            //     }

            //     // this.alertSuccess("Posting Data Successfully")
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

