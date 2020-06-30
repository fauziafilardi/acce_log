// import './plugins/axios'
import axios from 'axios'

export default {
    data() {
        return {
            queryString: require('querystring'),

            // content type
            urlEncoded: 'application/x-www-form-urlencoded',
            json: 'application/json',
            formData: 'multipart/form-data',
            
        }
    },
    mounted() {
    },
    methods: {
        GetButtonStatus(ss_portfolio_id, group_id, user_id, menu_url) {
            var param = {
                option_function_cd: "GetUserMenuButtonStatus",
                module_cd: "SS",
                ss_portfolio_id: ss_portfolio_id,
                group_id: group_id,
                user_id: user_id,
                menu_url: menu_url
            }

            return this.CallFunction(param).then(response => {
                if (response == null) return null
                var data = response.Data
                
                return data;
            })
        }
    }
}