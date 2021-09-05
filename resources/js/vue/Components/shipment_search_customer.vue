<template>

    <b-card border-variant="secondary"
            :header="title"
            header-border-variant="secondary"
            align="center">


        <b-row>
            <b-col cols="12">

                <b-input-group :prepend="label" >
                    <b-form-input v-model="document_number"></b-form-input>
                    <b-input-group-append>
                        <b-button variant="info" type="button" @click="searchCustomer">
                            search
                        </b-button>
                    </b-input-group-append>
                </b-input-group>
            </b-col>
            <b-col>

                <b-col md="12" class="mb-3 mt-3 text-center" v-show="show_loading">
                    <b-icon icon="circle-fill" animation="throb" font-scale="4"></b-icon>
                </b-col>
                <b-row class="mt-3" v-show="(customer_name != '') && !show_loading ">

                    <b-col cols="6">
                        <h4>{{customer_name}}</h4>
                    </b-col>
                    <b-col cols="6">
                        <b-select v-model="address_id" :options="addresses_options" @change="changeAddress"></b-select>
                    </b-col>
                </b-row>
            </b-col>
        </b-row>




    </b-card>

</template>
<script>
    export default {
        props:{
            title : String,
            label : String,
            address : Number,
            cust_doc : String
        },
        mounted(){

            if(this.address){
              this.document_number = this.cust_doc;
              this.searchCustomer();
          }
        },
        watch:{
            address(oldAddress,newAddress){
                this.document_number = this.cust_doc;
                this.searchCustomer();
            }
        },
        data() {
            return {
                document_number : '',
                show_loading :false,
                customer_name : '',
                customer_city : '',
                addresses_options : [],
                address_id : '',
            }
        },

        methods : {
            changeAddress(){
                this.$emit('customerAddressSelected',this.address_id);
            },
            searchCustomer(){
                this.show_loading = true;
                fetch('api/Customer/getByDocument/'+this.document_number,{
                    headers : {
                        'Content-Type': 'application/json',
                        'Authorization' : 'Bearer '+localStorage.getItem("jwt"),
                        'Accept': 'application/json',
                    }
                })
                .then(data => data.json())
                .then(data => {
                    if(!data.customer){
                        this.$toast.warning("Document not found");
                    }
                    data = data.customer;
                    this.customer_name = data.name + ' ' +data.surname;
                    this.addresses_options = [];

                    data.addresses.forEach(address => {

                        this.addresses_options.push({
                            text : address.address,
                            value : address.customer_address_id
                        });
                    });
                    if(this.address){
                        this.address_id = this.address;
                    }
                    this.show_loading = false;
                }).catch(err=>{
                    this.show_loading = false;
                })
            }
        }

    }
</script>
