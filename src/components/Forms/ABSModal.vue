<template>
    <div v-show="isShow" class="modal-multiple">
        <template v-show="!hasHeaderSlot">
            <!-- <slot name="headerDefault"> -->

                <div :class="'modal-header-multiple-' + size">
                    <h5 style="margin:0px !important;">
                        <slot name="headerTitle">
                        </slot>
                    </h5>
                    <span @click="_hide" class="close-multiple">&times;</span>
                </div>

            <!-- </slot> -->
            
            <!-- <slot name="headerDefault2">
                <div :class="'modal-header-multiple-' + size">
                    <slot name="headerTitle">
                        <h5 style="margin:0px !important;">header text default</h5>
                    </slot>
                    <span @click="close1" class="close-multiple">&times;</span>
                </div>
            </slot> -->
        </template>
        <!-- <template v-else>
            <div :class="'modal-header-multiple-' + size">
                <h5 style="margin:0px !important;">
                    <slot name="headerTitle">
                    </slot>
                </h5>
                <span @click="close1" class="close-multiple">&times;</span>
            </div>
        </template> -->

        <slot name="header">
        </slot>

        <div :class="'modal-content-multiple-' + size">
            <slot name="content">
            </slot>
        </div>

        <template v-if="!hasFooterSlot">
            <template v-if="okOnly">
                <div :class="'modal-footer-multiple-' + size">
                    <ABSButton
                        text="Ok"
                        icon=""
                        classButton="btn btn-primary"
                        classIcon=""
                        @click="onOkClicked"
                    />
                </div>
            </template>

            <template v-else-if="okCancel">
                <div :class="'modal-footer-multiple-' + size">
                    <ABSButton
                        text="Ok"
                        icon=""
                        classButton="btn btn-primary"
                        classIcon=""
                        @click="onOkClicked"
                    />

                    <ABSButton
                        text="Cancel"
                        icon=""
                        classButton="btn btn-secondary"
                        classIcon=""
                        @click="onCancelClicked"
                    />
                </div>
            </template>

            <template v-else-if="yesNo">
                <div :class="'modal-footer-multiple-' + size">
                    <ABSButton
                        text="Yes"
                        icon=""
                        classButton="btn btn-danger"
                        classIcon=""
                        @click="onOkClicked"
                    />

                    <ABSButton
                        text="No"
                        icon=""
                        classButton="btn btn-secondary"
                        classIcon=""
                        @click="onCancelClicked"
                    />
                </div>
            </template>

            <template v-else-if="saveCancel">
                <div :class="'modal-footer-multiple-' + size">
                    <ABSButton
                        text="Cancel"
                        icon=""
                        classButton="btn btn-secondary"
                        classIcon=""
                        @click="onCancelClicked"
                    />

                    <ABSButton
                        text="Save"
                        icon=""
                        classButton="btn btn-success"
                        classIcon=""
                        @click="onOkClicked"
                    />
                </div>
            </template>

            <template v-else-if="customButton">
                <div :class="'modal-footer-multiple-' + size">
                    <slot name="customButton"></slot>
                </div>
            </template>
        </template>
        <template v-else>
            <slot name="footer"></slot>
        </template>
    </div>
</template>

<script>
    export default {
        name: 'ABSModal',
        props: {
            'id': String,
            'size': {type: String, default: 'md'},
            'okOnly': {type: Boolean, default: false},
            'okCancel': {type: Boolean, default: false},
            'yesNo': {type: Boolean, default: false},
            'saveCancel': {type: Boolean, default: false},
            'customButton': {type: Boolean, default: false}
        },
        data () {
            return {
                isShow: false
            }
        },
        computed: {
            hasHeaderSlot () {
                return !!this.$slots['header']
            },
            hasHeaderDefaultSlot () {
                return !!this.$slots['headerDefault']
            },
            hasHeaderDefault2Slot () {
                return !!this.$slots['headerDefault2']
            },
            hasHeaderTitleSlot () {
                return !!this.$slots['headerTitle']
            },
            hasContentSlot () {
                return !!this.$slots['content']
            },
            hasContentDefaultSlot () {
                return !!this.$slots['contentDefault']
            },
            hasFooterSlot () {
                return !!this.$slots['footer']
            },
            hasOkOnlySlot () {
                return !!this.$slots['okOnly']
            }
        },
        methods: {
            _show() {
                this.isShow = true
            },
            _hide() {
                this.isShow = false
            },
            onOkClicked() {
                // this._hide()

                this.$emit('modalOkClicked')
            },
            onCancelClicked() {
                this._hide()

                this.$emit('modalCancelClicked')
            }
        },
        watch: {},
        created: function() {},
        mounted: function() {
            // console.log(this.okOnly)
            // console.log(this.okCancel)
            // console.log(this.yesNo)
            // console.log(this.saveCancel)
            // console.log(this.hasHeaderSlot)
            // console.log(this.hasHeaderDefaultSlot)
            // console.log(this.hasHeaderDefault2Slot)
            // console.log(this.hasHeaderTitleSlot)
            // console.log(this.hasContentSlot)
            // console.log(this.hasContentDefaultSlot)
            // console.log(this.hasFooterSlot)
            // console.log(this.hasOkOnlySlot)
        }
    }
</script>