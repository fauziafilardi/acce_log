<template>
    <div class="card" style="height: 95%;">
        <div class="card__title">
            <b-row>
                <b-col style="max-width:fit-content !important;">
                    <span>To Do List</span>
                </b-col>
                <b-col style="text-align: right;">
                    <span style="padding-right:10px">
                    <font-awesome-icon
                        style="font-size: medium; color: #333399;"
                        icon="circle"
                        size="sm"
                    />
                    </span>
                    <span
                    style="padding-right:10px; font-size: 12px !important; font-weight: normal !important; color: #666666;"
                    >Prospect</span>

                    <span style="padding-right:10px">
                    <font-awesome-icon
                        style="font-size: medium; color: #00cc33;"
                        icon="circle"
                        size="sm"
                    />
                    </span>
                    <span
                    style="padding-right:10px; font-size: 12px !important; font-weight: normal !important; color: #666666;"
                    >Customer</span>

                    <span>
                    <ABSButton
                        :text="'View All'"
                        classButton="button button--new"
                        classIcon="icon-style-1"
                        :disabled="false"
                        @click="doViewAllToDoList"
                    />
                    </span>
                </b-col>
            </b-row>
        </div>
        <div class="card__body">
            <div class="bedge-container" style>
                <b-row style="flex-wrap: unset !important" class="badgeHeader">
                    <b-col style="text-align: center;padding-top: 9px;" class="bordered" md="2">Status</b-col>
                    <b-col style="text-align: center;padding-top: 9px;" class="bordered" md="3">Customer Name</b-col>
                    <b-col style="text-align: center;padding-top: 9px;" class="bordered" md="2">Last Action</b-col>
                    <b-col style="text-align: center;padding-top: 9px;" class="bordered" md="2">Next Action</b-col>
                    <b-col style="text-align: center;padding-top: 9px;" class="bordered">Action</b-col>
                </b-row>
                <b-row class="badgeContent"
                style="flex-wrap: unset !important;"
                v-for="(data, index) in ToDoList"
                v-bind:key="index">
                    <b-col class="ContentFillBadge bordered" style="text-align: center;" md="2">
                        <span>
                        <b-badge
                            :style="`background-color:`+data.status_colour+`; width: 75px; padding: 6px !important; border-radius: 4px !important; font-weight: normal !important;`"
                        >{{data.status}}</b-badge>
                        </span>
                    </b-col>
                    <b-col class="contentFill bordered" md="3">
                        <span>{{data.name}}</span>
                    </b-col>
                    <b-col class="contentFill bordered" style="text-align: center;" md="2">
                        <span>{{data.last_action && data.last_action !== '' ? momentDateFormatting(data.last_action, 'DD/MM/YYYY') : '-'}}</span>
                    </b-col>
                    <b-col class="contentFill__nextaction bordered" style="text-align: center;" md="2">
                        <span>
                        <font-awesome-icon
                            v-if="IsWarning(data.next_action)"
                            style="color: red;"
                            icon="exclamation-triangle"
                            size="sm"
                        />
                        {{ data.next_action && data.next_action !== '' ? momentDateFormatting(data.next_action,'DD/MM/YYYY') : '-'}}
                        </span>
                    </b-col>
                    <b-col class="contentFill bordered">
                        <b-row>
                            <b-col style="padding-left: 20% !important; padding-top: 2px;">
                                <span>
                                <b-badge
                                    style="width: 15px; height: 15px; padding: 6px !important; border-radius: 15px !important;"
                                    :variant="data.status == 'New' ? 'primary' : 'success'"
                                >&nbsp;</b-badge>
                                </span>
                            </b-col>
                            <b-col style="padding-left: 20% !important; padding-top: 2px;">
                                <span @click="ToDoListEdit(data)" style="cursor:pointer;">
                                <font-awesome-icon
                                    class="icon-style-default"
                                    :icon="data.action=='C' ? 'phone-square-alt' : (data.action=='V' ? 'hand-paper' : 'utensils')"
                                    size="lg"
                                />
                                </span>
                            </b-col>
                        </b-row>
                    </b-col>
                </b-row>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            ToDoList: [],
        }
    },
    methods: {
        IsWarning(date) {
            var arrDate = date.split("/");
            date = arrDate[1] + "/" + arrDate[0] + "/" + arrDate[2];

            var next_action = new Date(date);
            var now = new Date();

            if (next_action < now) {
                return true;
            }
            return false;
        },
        doViewAllToDoList() {
            var url = "MK_ToDoList";
            if (!url || url == "" || url == undefined) return;
            var param = {
                // option_url: this.getOptionUrl(),
                // title: this.title,
                isEdit: false
            };
            this.$router.push({ name: url, params: param });
        },
        ToDoListEdit(data) {
            var param = data;
            param.isEdit = true;
            this.$router.push({ name: "MK_EditToDoList", params: param });
        },
        getDataToDoList() {
            var param = {
                option_function_cd: "GenToDoListDash",
                module_cd: "MK",
                ss_portfolio_id: this.getDataUser().portfolio_id,
                user_id: this.getDataUser().user_id
            };
            this.CallFunction(param).then(ress => {
                if (ress == null) return;
                this.ToDoList = [];
                var now = new Date();
                for (let i = 0; i < ress.Data.length; i++) {
                var next_action = new Date(ress.Data[i].next_action);
                // console.log(next_action);
                this.ToDoList.push({
                    cm_contact_id: ress.Data[i].cm_contact_id,
                    name: ress.Data[i].customer_name,
                    status: ress.Data[i].status,
                    status_colour: ress.Data[i].customer_status_colour,
                    warning: next_action < now ? true : false,
                    next_action: ress.Data[i].next_action,
                    last_action: ress.Data[i].last_action,
                    action: ress.Data[i].action,
                    appointment_type: ress.Data[i].appointment_type,
                    row_id: ress.Data[i].row_id,
                    lastupdatestamp: ress.Data[i].lastupdatestamp
                });
                }
            });
        },
    },
    mounted() {
        this.getDataToDoList();
    }
}
</script>