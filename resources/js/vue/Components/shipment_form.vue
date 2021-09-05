<template>
    <div>
        <b-row class="mb-3">
            <b-col sm="12" md="6">
                <shipment_search_customer
                    id="search-sender"
                    v-on:customerAddressSelected="senderAddressSelected"
                    :cust_doc="form.sender_doc"
                    :address="form.start_address_id"
                    title="Sender"
                    label="Sender's Document" />
            </b-col>
            <b-col sm="12" md="6">
                <shipment_search_customer
                    id="search-receiver"
                    v-on:customerAddressSelected="receiverAddressSelected"
                    :cust_doc="form.receiver_doc"
                    :address="form.end_address_id"
                    title="Receiver"
                    label="Receiver's Document" />
            </b-col>

        </b-row>
        <b-row>
            <b-col cols="6">
                <b-form-group label="Shipment Date" for="input-shipment-date">
                    <b-form-datepicker id="input-shipment-date" v-model="form.shipment_date" class="mb-2"></b-form-datepicker>
                </b-form-group>
            </b-col>
            <b-col cols="6">
                <b-form-group label="Delivery Date" for="input-shipment-date">
                    <b-form-datepicker id="input-delivery-date" v-model="form.delivery_date" class="mb-2"></b-form-datepicker>
                </b-form-group>
            </b-col>
        </b-row>
        <b-form-group label="Description" for="input-shipment-description">
            <b-form-textarea  id="input-shipment-description" v-model="form.description" rows="3" max-rows="6"></b-form-textarea>
        </b-form-group>
    </div>
</template>
<script>
    import shipment_search_customer from "./shipment_search_customer";
    import {bus} from "../../app";

    export default {
        components:{
          shipment_search_customer
        },
        props : {
            shipment_id : Number
        },
        data(){
            return{
                form : {
                    shipment_date : '',
                    delivery_date : '',
                    description : '',
                    sender : '',
                    start_address_id : 0,
                    end_address_id : 0,
                    sender_doc : '',
                    receiver_doc : '',
                    shipment_id : 0
                },
                senderOptions : [],
            }
        },
        beforeDestroy() {
            bus.$off('saveShipmentEvent');
        },
        mounted(){
            bus.$on('saveShipmentEvent',this.saveShipment)
            if(this.shipment_id > 0){
                this.getData()
            }
        },
        methods : {
            senderAddressSelected(address){
                this.form.start_address_id = address
            },
            receiverAddressSelected(adress){
                this.form.end_address_id = adress
            },
            getData(){
                fetch('api/shipments/'+this.shipment_id,{
                    method : 'GET',
                    headers : {
                        'Content-Type': 'application/json',
                        'Authorization' : 'Bearer '+localStorage.getItem("jwt"),
                        'Accept': 'application/json',
                    }
                })
                .then(data=>data.json())
                .then(data => {
                    if(!data.success){
                        return false;
                    }
                    this.form.shipment_date = data.shipment.shipment_date;
                    this.form.delivery_date = data.shipment.delivery_date;
                    this.form.description = data.shipment.description;
                    this.form.start_address_id = data.shipment.start_adress_obj.customer_address_id ;
                    this.form.end_address_id = data.shipment.arrival_adress_obj.customer_address_id ;
                    this.form.sender_doc = data.shipment.start_adress_obj.customer.document;
                    this.form.receiver_doc = data.shipment.arrival_adress_obj.customer.document ;
                    this.form.shipment_id = data.shipment.shipment_id;
                })
            },
            saveShipment(){
                let data = {
                    description : this.form.description,
                    shipment_date : this.form.shipment_date,
                    delivery_date : this.form.delivery_date,
                    start_address : this.form.start_address_id,
                    arrival_address : this.form.end_address_id
                };
                for(const field in data){
                    console.log("field ",field," val ",data[field])
                    if(data[field] == '' || data[field] == null ){
                        this.$toast.error("Field " + field +' is required');
                        return false;
                    }

                }
                this.form.shipment_id > 0 ? this.updateShipment(data) : this.createShipment(data) ;
            },
            createShipment(data){
                fetch('api/shipments/',{
                    method : 'POST',
                    body : JSON.stringify(data),
                    headers : {
                        'Content-Type': 'application/json',
                        'Authorization' : 'Bearer '+localStorage.getItem("jwt"),
                        'Accept': 'application/json',
                    }
                })
                .then(data => data.json())
                .then(data => {
                    bus.$emit('getShipments');
                })
            },
            updateShipment(data){

                fetch('api/shipments/'+this.form.shipment_id,{
                    method : 'PUT',
                    body : JSON.stringify(data),
                    headers : {
                        'Content-Type': 'application/json',
                        'Authorization' : 'Bearer '+localStorage.getItem("jwt"),
                        'Accept': 'application/json',
                    }
                })
                .then(data => data.json())
                .then(data => {
                    bus.$emit('getShipments');
                })
            }
        }

    }
</script>
