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
            @refreshColumn = "$parent.refreshColumn"
            @checkboxChecked = "$parent.checkboxChecked"
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
                                <b-col md="6" id="col-left">
                                    <b-row>
                                        <b-col md="12">
                                            <ABSinputTextVuex :prop="PI_order_no" v-model="M_SO_Order.order_no"  ref="ref_order_no"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="12">
                                            <ABSinputDateVuex @input="Onorder_dateChange" :prop="PI_order_date" v-model="M_SO_Order.order_date"  ref="ref_order_date" />
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="12">
                                            <ABSInputSelectList @change="Oncm_contact_idChange" :prop="PI_cm_contact_id" :value="M_SO_Order.cm_contact_id" :label="M_SO_Order.cm_contact_idLabel" ref="ref_cm_contact_id"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="12">
                                            <ABSinputDateVuex @input="Ondelivery_dateChange" :prop="PI_delivery_date" v-model="M_SO_Order.delivery_date"  ref="ref_delivery_date" />
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="12">
                                            <ABSinputRadioButtonVuex :prop="PI_charge_type" v-model="M_SO_Order.charge_type"  ref="ref_charge_type" />
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="12">
                                            <ABSInputSelectList @change="Onfm_fleet_type_idChange" :prop="PI_fm_fleet_type_id" :value="M_SO_Order.fm_fleet_type_id" :label="M_SO_Order.fm_fleet_type_idLabel" ref="ref_fm_fleet_type_id"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="12">
                                            <ABSinputTextVuex :prop="PI_fleet_qty" v-model="M_SO_Order.fleet_qty"  ref="ref_fleet_qty"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="12">
                                            <ABSinputTextVuex :prop="PI_item_qty" v-model="M_SO_Order.item_qty"  ref="ref_item_qty"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="12">
                                            <ABSInputSelectList @change="Oncm_uom_idChange" :prop="PI_cm_uom_id" :value="M_SO_Order.cm_uom_id" :label="M_SO_Order.cm_uom_idLabel" ref="ref_cm_uom_id"/>
                                        </b-col>
                                    </b-row>

                                    <br>
                                    <b-row>
                                        <b-col md="12">
                                            <ABSInputSelectList @change="Oncm_contact_address_id_fromChange" :prop="PI_cm_contact_address_id_from" :value="M_SO_Order_Address.cm_contact_address_id_from" :label="M_SO_Order_Address.cm_contact_address_id_fromLabel" ref="ref_cm_contact_address_id_from"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="12">
                                            <ABSTextAreaVuex :prop="PI_cm_contact_address_id_from_detail" v-model="M_SO_Order_Address.cm_contact_address_id_from_detail"  ref="ref_cm_contact_address_id_from_detail"/>
                                        </b-col>
                                    </b-row>
                                    <br>

                                    <!-- Looping Extra Pick -->
                                    <b-row v-show="DataExtraPick.length > 0" v-for="(data, index) in DataExtraPick" v-bind:key="index">
                                        <b-col md="12">
                                            <ABSGoogleMaps @change="OnMapsChange($event, index, 'extra_pick')" :prop="data.props.PI_extra_pick" v-model="data.models['extra_pick']"  :ref="data.refs['extra_pick']" />
                                        </b-col>
                                        <b-col md="12">
                                            <ABSTextAreaVuex :prop="data.props.PI_extra_pick_detail" v-model="data.models['extra_pick_detail']"  :ref="data.refs['extra_pick_detail']"/>
                                        </b-col>
                                    </b-row>
                                    <!-- End Looping Extra Pick -->

                                    <template v-if="DataExtraPick.length > 0"> <br> </template>
                                    <b-row>
                                        <b-col md="12" style="padding-left: 33% !important;">
                                            <b-button style="font-size: 10px;padding-top: 3px;padding-bottom: 3px; margin-bottom: 5px;" @click="addPick"><font-awesome-icon icon="plus" class="icon-style-1"/> Add Extra Pick</b-button>
                                        </b-col>
                                    </b-row>

                                    <!-- Looping Extra Drop -->
                                    <b-row v-show="DataExtraDrop.length > 0" v-for="(data, index) in DataExtraDrop" v-bind:key="index">
                                        <b-col md="12">
                                            <ABSGoogleMaps @change="OnMapsChange($event, index, 'extra_drop')" :prop="data.props.PI_extra_drop" v-model="data.models['extra_drop']"  :ref="data.refs['extra_drop']" />
                                        </b-col>
                                        <b-col md="12">
                                            <ABSTextAreaVuex :prop="data.props.PI_extra_drop_detail" v-model="data.models['extra_drop_detail']"  :ref="data.refs['extra_drop_detail']"/>
                                        </b-col>
                                    </b-row>
                                    <!-- End Looping Extra Drop -->

                                    <template v-if="DataExtraDrop.length > 0"> <br> </template>
                                    <b-row>
                                        <b-col md="12" style="padding-left: 33% !important;">
                                            <b-button style="font-size: 10px;padding-top: 3px;padding-bottom: 3px; margin-bottom: 5px;" @click="addDrop"><font-awesome-icon icon="plus" class="icon-style-1"/> Add Extra Drop</b-button>
                                        </b-col>
                                    </b-row>

                                    <br>
                                    <b-row>
                                        <b-col md="12">
                                            <ABSInputSelectList @change="Oncm_contact_address_id_toChange" :prop="PI_cm_contact_address_id_to" :value="M_SO_Order_Address.cm_contact_address_id_to" :label="M_SO_Order_Address.cm_contact_address_id_toLabel" ref="ref_cm_contact_address_id_to"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="12">
                                            <ABSTextAreaVuex :prop="PI_cm_contact_address_id_to_detail" v-model="M_SO_Order_Address.cm_contact_address_id_to_detail"  ref="ref_cm_contact_address_id_to_detail"/>
                                        </b-col>
                                    </b-row>
                                    <br>

                                    <b-row>
                                        <b-col md="12">
                                            <ABSInputSelectList @change="Onfm_item_category_idChange" :prop="PI_fm_item_category_id" :value="M_SO_Order.fm_item_category_id" :label="M_SO_Order.fm_item_category_idLabel" ref="ref_fm_item_category_id"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="12">
                                            <ABSinputTextVuex :prop="PI_item_detail" v-model="M_SO_Order.item_detail"  ref="ref_item_detail"/>
                                        </b-col>
                                    </b-row>
                                    <b-row>
                                        <b-col md="12">
                                            <ABSTextAreaVuex :prop="PI_remarks" v-model="M_SO_Order.remarks"  ref="ref_remarks" />
                                        </b-col>
                                    </b-row>
                                </b-col>
                            </b-row>

                            <!-- <b-button style="font-size: 10px;padding-top: 3px;padding-bottom: 3px; margin-bottom: 5px;" @click="addProspect"><font-awesome-icon icon="plus" class="icon-style-1"/> Add Prospect</b-button> -->

                <!-- <b-row style="padding-left:10px;" v-show="DataProspect.length > 0" v-for="(data, index) in DataProspect" v-bind:key="index">
                    <div style="width: 100%; border-color: black; border-width: 1px; border-style:solid; padding-top:5px; margin-bottom: 1px;">
                    <b-col md="12">
                        <b-row>
                        <b-col md="6">
                            <ABSInputSelectList @change="OnLookupChange($event, index, 'fm_fleet_type_id')" :prop="data.props.PI_fm_fleet_type_id" :value="data.models.fm_fleet_type_id" :label="data.models.fm_fleet_type_idLabel" :ref="data.refs.fm_fleet_type_id"/>
                        </b-col>
                        </b-row>
                        <b-row>
                        <b-col md="6">
                            <ABSGoogleMaps @change="OnMapsChange($event, index, 'address_from')" :prop="data.props.PI_address_from" v-model="data.models.address_from"  :ref="data.refs.address_from" />
                        </b-col>
                        <b-col md="6">
                            <ABSGoogleMaps @change="OnMapsChange($event, index, 'address_to')" :prop="data.props.PI_address_to" v-model="data.models.address_to"  :ref="data.refs.address_to" />
                        </b-col>
                        </b-row>
                        <b-row>
                        <b-col md="6">
                            <ABSTextAreaVuex :prop="data.props.PI_address_from_detail" v-model="data.models.address_from_detail"  :ref="data.refs.address_from_detail"/>
                        </b-col>
                        <b-col md="6">
                            <ABSTextAreaVuex :prop="data.props.PI_address_to_detail" v-model="data.models.address_to_detail"  :ref="data.refs.address_to_detail"/>
                        </b-col>
                        </b-row>
                        <b-row>
                        <b-col md="6">
                            <ABSTextAreaVuex :prop="data.props.PI_commodity" v-model="data.models.commodity"  :ref="data.refs.commodity"/>
                        </b-col>
                        </b-row>
                    </b-col>
                    </div>
                    <font-awesome-icon @click="removeProspect(index)" icon="minus" class="icon-style-1__iconDelete"/>
                </b-row> -->
                        </b-form>
                    </b-col>
                </b-row>
            </b-collapse>
        </div>
    </div>
</template>

<script>

export default {
    props: {PageLevel: '',TabIndex: '',data: ''},
    data() {
        return {
            cInsertKey:'',
            FormType: "List",
            Module:"SO",
            propList: {
                initialWhere: "",
                LineNo: this.$parent.data.page_order,
                PageLevel: this.PageLevel,
                TabIndex: this.TabIndex,
                OrderBy: '',
                SourceField: '',
                ParamView: ''
            },
            IEBy: {Input: '',Edit: ''},

            DataAddress: [],
            DataExtraPick: [],
            DataExtraDrop: [],
            iCount: 0,
            
            //# Model
                M_SO_Order: {
                    order_no: '',
                    order_date: this.getToday(),
                    cm_contact_id: '',
                    cm_contact_idLabel: '',
                    delivery_date: '',
                    charge_type: '',
                    fm_fleet_type_id: '',
                    fm_fleet_type_idLabel: '',
                    fleet_qty: '',
                    item_qty: '',
                    cm_uom_id: '',
                    cm_uom_idLabel: '',
                    fm_item_category_id: '',
                    fm_item_category_idLabel: '',
                    item_detail: '',
                    remarks: ''
                },

                M_SO_Order_Address: {
                    cm_contact_address_id_from: '',
                    cm_contact_address_id_fromLabel: '',
                    cm_contact_address_id_from_detail: '',
                    cm_contact_address_id_to: '',
                    cm_contact_address_id_toLabel: '',
                    cm_contact_address_id_to_detail: ''
                },
            //# End Model

            //# PI Header
                PI_order_no: {
                    cValidate: '',
                    cName: 'order_no',
                    cLabel: 'Order No',
                    cLabelSize: 4,
                    cOrder: 1,
                    cKey: false,
                    cType: 'text',
                    cVisible: true,
                    cProtect: false,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                },
                PI_order_date: {
                    cValidate: '',
                    cName: 'order_date',
                    cLabel: 'Order Date',
                    cLabelSize: 4,
                    cOrder: 2,
                    cKey: false,
                    cVisible: true,
                    cProtect: false,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
                },
                PI_cm_contact_id: {
                    dataLookUp: {
                        LookUpCd: 'GetLookupCMContact',
                        ColumnDB: 'contact_id',
                        InitialWhere: "",
                        ParamWhere: "",
                        SourceField: '',
                        DisplayLookup: 'contact_id,name'
                    },
                    cValidate: '',
                    cName: 'cm_contact_id',
                    cLabel: 'Customer',
                    cKey: false,
                    cLabelSize: 4,
                    cOrder: 3,
                    cTriggered: false,
                    cDefault: '',
                    cProtect: false,
                    cVisible: true,
                    cAsync: false,
                    cFilter: true,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                    cStatic: false,
                    cOption: [],
                    cMasterUrl: '',
                    cDisplayColumn: 'contact_id,name'
                },
                PI_delivery_date: {
                    cValidate: '',
                    cName: 'delivery_date',
                    cLabel: 'Delivery Date',
                    cLabelSize: 4,
                    cOrder: 4,
                    cKey: false,
                    cVisible: true,
                    cProtect: false,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
                },
                PI_charge_type: {
                    cValidate: '',
                    cName: 'charge_type',
                    cId: 'rdbcharge_type',
                    cRadioOptions: [{text: 'Trip',value: 'T' }, {text: 'Unit',value: 'U' }],
                    cRadioDefaultOption: '',
                    cLabel:'Charge Type',
                    cLabelSize: 4,
                    cDefault: '',
                    cOrder: 5,
                    cProtect: false,
                    cVisible: true,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
                },
                PI_fm_fleet_type_id: {
                    dataLookUp: {
                        LookUpCd: 'GetLookupMKFleetType',
                        ColumnDB: 'fleet_type_cd',
                        InitialWhere: "",
                        ParamWhere: "",
                        SourceField: '',
                        DisplayLookup: 'fleet_type_cd,descs'
                    },
                    cValidate: '',
                    cName: 'fm_fleet_type_id',
                    cLabel: 'Fleet Type',
                    cKey: false,
                    cLabelSize: 4,
                    cOrder: 6,
                    cTriggered: false,
                    cDefault: '',
                    cProtect: false,
                    cVisible: true,
                    cAsync: false,
                    cFilter: true,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                    cStatic: false,
                    cOption: [],
                    cMasterUrl: '',
                    cDisplayColumn: 'fleet_type_cd,descs'
                },
                PI_fleet_qty: {
                    cValidate: '',
                    cName: 'fleet_qty',
                    cLabel: 'Fleet Qty',
                    cLabelSize: 4,
                    cOrder: 7,
                    cKey: false,
                    cType: 'numeric',
                    cVisible: true,
                    cProtect: false,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                },
                PI_item_qty: {
                    cValidate: '',
                    cName: 'item_qty',
                    cLabel: 'Item Qty',
                    cLabelSize: 4,
                    cOrder: 8,
                    cKey: false,
                    cType: 'numeric',
                    cVisible: true,
                    cProtect: false,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                },
                PI_cm_uom_id: {
                    dataLookUp: {
                        LookUpCd: 'GetLookupCMUom',
                        ColumnDB: 'uom_cd',
                        InitialWhere: "",
                        ParamWhere: "",
                        SourceField: '',
                        DisplayLookup: 'uom_cd, descs'
                    },
                    cValidate: '',
                    cName: 'cm_uom_id',
                    cLabel: 'Item UOM',
                    cKey: false,
                    cLabelSize: 4,
                    cOrder: 9,
                    cTriggered: false,
                    cDefault: '',
                    cProtect: false,
                    cVisible: true,
                    cAsync: false,
                    cFilter: true,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                    cStatic: false,
                    cOption: [],
                    cMasterUrl: '',
                    cDisplayColumn: 'uom_cd, descs'
                },
                PI_fm_item_category_id: {
                    dataLookUp: {
                        LookUpCd: 'GetLookupFMItemCategory',
                        ColumnDB: 'item_category_cd',
                        InitialWhere: "",
                        ParamWhere: "",
                        SourceField: '',
                        DisplayLookup: 'item_category_cd, descs'
                    },
                    cValidate: '',
                    cName: 'fm_item_category_id',
                    cLabel: 'Item Category',
                    cKey: false,
                    cLabelSize: 4,
                    cOrder: 10,
                    cTriggered: false,
                    cDefault: '',
                    cProtect: false,
                    cVisible: true,
                    cAsync: false,
                    cFilter: true,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                    cStatic: false,
                    cOption: [],
                    cMasterUrl: '',
                    cDisplayColumn: 'item_category_cd, descs'
                },
                PI_item_detail: {
                    cValidate: '',
                    cName: 'item_detail',
                    cLabel: 'Item Detail',
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
                PI_remarks: {
                    cValidate: '',
                    cName:'remarks',
                    cLabel:'Remarks',
                    cLabelSize: 4,
                    cOrder:12,
                    cKey: false,
                    cDefault: '',
                    cProtect: false,
                    cVisible: true,
                    cResize: false,
                    cReadOnly: false,
                    cRows: 3,
                    cMaxRows: 3,
                    cSize: 'md',
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                },
            //# End PI Header

            //# PI Address From and To
                PI_cm_contact_address_id_from: {
                    dataLookUp: {
                        LookUpCd: 'GetLookupAddress',
                        ColumnDB: 'address_cd',
                        InitialWhere: "",
                        ParamWhere: ''
                    },
                    cValidate :'required',
                    cName: 'cm_contact_address_id_from',
                    cLabel: 'Address From',
                    cKey: false,
                    cLabelSize: 4,
                    cOrder: 13,
                    cTriggered: false,
                    cDefault: '',
                    cProtect: false,
                    cVisible: true,
                    cAsync: false,
                    cFilter: true,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                    cStatic: false,
                    cOption: [],
                    cMasterUrl: 'CM/CM_Address',
                    cDisplayColumn: 'address_cd',
                },
                PI_cm_contact_address_id_from_detail: {
                    cValidate: '',
                    cName: 'cm_contact_address_id_from_detail',
                    cLabel: 'Address From Detail',
                    cLabelSize: 4,
                    cOrder: 14,
                    cDefault: '',
                    cProtect: false,
                    cVisible: true,
                    cResize: false,
                    cReadOnly: false,
                    cRows: 3,
                    cMaxRows: 10,
                    cSize: 'md',
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                },
                PI_cm_contact_address_id_to: {
                    dataLookUp: {
                        LookUpCd: 'GetLookupAddress',
                        ColumnDB: 'address_cd',
                        InitialWhere: "",
                        ParamWhere: ''
                    },
                    cValidate :'required',
                    cName: 'cm_contact_address_id_to',
                    cLabel: 'Address To',
                    cKey: false,
                    cLabelSize: 4,
                    cOrder: 15,
                    cTriggered: false,
                    cDefault: '',
                    cProtect: false,
                    cVisible: true,
                    cAsync: false,
                    cFilter: true,
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex,
                    cStatic: false,
                    cOption: [],
                    cMasterUrl: 'CM/CM_Address',
                    cDisplayColumn: 'address_cd',
                },
                PI_cm_contact_address_id_to_detail: {
                    cValidate: '',
                    cName: 'cm_contact_address_id_to_detail',
                    cLabel: 'Address To Detail',
                    cLabelSize: 4,
                    cOrder: 16,
                    cDefault: '',
                    cProtect: false,
                    cVisible: true,
                    cResize: false,
                    cReadOnly: false,
                    cRows: 3,
                    cMaxRows: 10,
                    cSize: 'md',
                    cPageLevel: this.PageLevel,
                    cTabIndex: this.TabIndex,
                    cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
                },
            //# End PI Address From and To
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
        },
        GetDataBy1(){
            return this.$store.getters.GetPage1GetDataBy
        }
    },
    methods: {
        setToolbarButton() {},
        M_Head_Table() {},
        M_PageSize() {},
        M_TabClick() {},
        M_Pagination() {},
        M_Advance_Filter() {},
        M_Search(data) {},
        M_Refresh() {},
        M_Cancel() {},
        doDoubleClick() {},
        rowClicked(record,index) {},
        rowLink(url) {},
        paramFromParent() {},
        M_CheckboxChecked(data,status,index) {},
        M_Post(dt) {},
        M_Insert() {
            console.log(this.M_SO_Order)
            console.log(this.M_SO_Order_Address)
            console.log(this.DataExtraPick)
            console.log(this.DataExtraDrop)
        },
        M_Update() {},
        M_ClearForm() {},
        M_New() {},
        M_Edit() {},
        M_Delete(dt) {},
        getDataBy() {},
        Onorder_dateChange(data) {
            this.M_SO_Order.order_date = data
        },
        Oncm_contact_idChange(data) {
            this.M_SO_Order.cm_contact_id = data.id
            this.M_SO_Order.cm_contact_idLabel = data.label
        },
        Ondelivery_dateChange(data) {
            this.M_SO_Order.delivery_date = data
        },
        Onfm_fleet_type_idChange(data) {
            this.M_SO_Order.fm_fleet_type_id = data.id
            this.M_SO_Order.fm_fleet_type_idLabel = data.label
        },
        Oncm_uom_idChange(data) {
            this.M_SO_Order.cm_uom_id = data.id
            this.M_SO_Order.cm_uom_idLabel = data.label
        },
        Onfm_item_category_idChange(data) {
            this.M_SO_Order.fm_item_category_id = data.id
            this.M_SO_Order.fm_item_category_idLabel = data.label
        },
        OnMapsChange(data, index, name) {
            if (name.includes('_drop')) {
                this.DataExtraDrop[index].models[name+'_coord'] = data.coord
            }
            else {
                this.DataExtraPick[index].models[name+'_coord'] = data.coord
            }
        },

        Oncm_contact_address_id_fromChange(data) {
            this.M_SO_Order_Address.cm_contact_address_id_from = data.id
            this.M_SO_Order_Address.cm_contact_address_id_fromLabel = data.label
        },
        Oncm_contact_address_id_toChange(data) {
            this.M_SO_Order_Address.cm_contact_address_id_to = data.id
            this.M_SO_Order_Address.cm_contact_address_id_toLabel = data.label
        },

        addPick() {
            var numb = Math.floor(Math.random() * 100)
            var icount = this.DataExtraPick.length
            var nextCount = icount + 1
            // DataExtraPick
            const PI_extra_pick = {
                cValidate: '',
                cName: 'extra_pick_' + nextCount + '_' + numb,
                cLabel: 'Extra Pick ' + nextCount,
                cLabelSize: 4,
                cOrder: 999,
                cKey: false,
                cVisible: true,
                cProtect: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_extra_pick_detail = {
                cValidate: '',
                cName: 'extra_pick_detail_' + nextCount + '_' + numb,
                cLabel: 'Extra Pick Detail '  + nextCount,
                cLabelSize: 4,
                cOrder: 999,
                cDefault: '',
                cProtect: false,
                cVisible: true,
                cResize: false,
                cReadOnly: false,
                cRows: 3,
                cMaxRows: 10,
                cSize: 'md',
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            }

            // var models = {}, refs = {}
            // models['extra_pick_' + nextCount] = ''
            // models['extra_pick_detail_' + nextCount] = ''
            // models['extra_pick_' + nextCount + '_coord'] = ''

            // refs['extra_pick_' + nextCount] = 'ref_extra_pick_' + nextCount
            // refs['extra_pick_detail_' + nextCount] = 'ref_extra_pick_detail_' + nextCount

            this.DataExtraPick.push({
                icount: nextCount,
                randomNumb: numb,
                props: {
                    PI_extra_pick: PI_extra_pick,
                    PI_extra_pick_detail: PI_extra_pick_detail
                },
                models: {
                    extra_pick: '',
                    extra_pick_detail: '',
                    extra_pick_coord: ''
                },
                refs: {
                    extra_pick: 'ref_extra_pick',
                    extra_pick_detail: 'ref_extra_pick_detail'
                }
            })
        },
        addDrop() {
            var numb = Math.floor(Math.random() * 100)
            var icount = this.DataExtraDrop.length
            var nextCount = icount + 1
            // DataExtraDrop
            const PI_extra_drop = {
                cValidate: '',
                cName: 'extra_drop_' + nextCount + '_' + numb,
                cLabel: 'Extra Drop ' + nextCount,
                cLabelSize: 4,
                cOrder: 999,
                cKey: false,
                cVisible: true,
                cProtect: false,
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex 
            },
            PI_extra_drop_detail = {
                cValidate: '',
                cName: 'extra_drop_detail_' + nextCount + '_' + numb,
                cLabel: 'Extra Drop Detail '  + nextCount,
                cLabelSize: 4,
                cOrder: 999,
                cDefault: '',
                cProtect: false,
                cVisible: true,
                cResize: false,
                cReadOnly: false,
                cRows: 3,
                cMaxRows: 10,
                cSize: 'md',
                cPageLevel: this.PageLevel,
                cTabIndex: this.TabIndex,
                cParentForm: 'FormScope_' + this.PageLevel + '_' + this.TabIndex
            }

            // var models = {}, refs = {}
            // models['extra_drop_' + nextCount] = ''
            // models['extra_drop_detail_' + nextCount] = ''
            // models['extra_drop_' + nextCount + '_coord'] = ''

            // refs['extra_drop_' + nextCount] = 'ref_extra_drop_' + nextCount
            // refs['extra_drop_detail_' + nextCount] = 'ref_extra_drop_detail_' + nextCount

            this.DataExtraDrop.push({
                icount: nextCount,
                randomNumb: numb,
                props: {
                    PI_extra_drop: PI_extra_drop,
                    PI_extra_drop_detail: PI_extra_drop_detail
                },
                models: {
                    extra_drop: '',
                    extra_drop_detail: '',
                    extra_drop_coord: ''
                },
                refs: {
                    extra_drop: 'ref_extra_drop',
                    extra_drop_detail: 'ref_extra_drop_detail'
                }
            })
        },
    },
    beforeCreate: function() {},
    created: function() {
        this.$store.commit('setFormType','List')
        this.getToolbar().ProcessPS()
    },
    beforeMount: function() {},
    mounted: function() {
        this.hideSideBarMenu()
        this.FormToABSList().doGetList('','eb_getList')
    },
    beforeUpdate: function() {},
    updated: function() {},
    beforeDestroy: function() {},
    destroyed: function() {}
}
</script>

