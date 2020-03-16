<template>
    <span>
        <b-row v-show="cVisible">
            <!-- <b-col md="12" style="background-color: white;padding-top: 1px !important;margin-left: 15px;margin-right: 15px;height: 95%;overflow-y: auto;overflow-x: hidden;padding-bottom: 1%;"> -->
            <b-col md="12">
                <!-- <iframe :src="cSrc" :style="iFrame"></iframe> -->
                <iframe :src="cSrc" class="i-frame-eport"></iframe>
            </b-col>
        </b-row>
    </span>
</template>
<script>
export default {
    props: {
        //         cVisible: true,
        // src: '',
        // height: '550',
        // width: '1000',

        cVisible: {
            type: Boolean,
            default: false
        },
        cSrc: {
            type: String,
            default: 'https://www.google.com&rs:Command=Render&rs:ClearSession=true&rc:Toolbar=false'// + '&rs:embed=true'
        },
        cHeight: {
            type: String,
            default: '550'
        },
        cWidth: {
            type: String,
            default: '100'
        }
    },
    data() {
        return {
        // value: null
        // valueFrom: '',
        // valueTo: ''
            // iFrame: 'border:none;height:550px;width:1000px;'
            iFrame: 'border: none;height: ' + this.cHeight + 'px;width: ' + this.cWidth + '%;'
            // iFrame: {
            //     border: 'none;',
            //     height: '100px',
            //     width: '200px'
            //     // height:  this.height + 'px',
            //     // width: this.width + 'px'
            // }
        }
    },
    created: function() {
        console.log(this.cSrc)
        // alert(this.cHeight)
    }
}
</script>


