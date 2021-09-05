<template>
    <div>
        <b-container>
            <b-row>
                <b-col>
                    <div class="h5 mb-0">
                        <b-row>
                            <b-col cols="3" v-for="state in states" v-bind:key="state.value">
                                <b-icon :icon="actual_state >= state.value ? 'check-circle-fill' : 'circle-fill' " :variant="actual_state >= state.value ? 'success':'secondary'"></b-icon>
                                <label :class="actual_state >= state.value ? 'text-success' :'text-secondary'">{{state.name}}</label>
                            </b-col>
                        </b-row>

                    </div>
                    <hr>
                </b-col>
            </b-row>
            <b-row>
                <b-col cols="6">
                    <!--<b-img src="https://www.hostinet.com/formacion/wp-content/uploads/2016/01/googlemaps.jpg" fluid-grow></b-img>-->
                    <LeaftMap :map-address="info.receiver_address"></LeaftMap>
                </b-col>
                <b-col cols="6">


                        <b-table-simple  small>
                            <b-tbody>
                                <b-tr v-for="(value,name) in info" v-bind:key="name+'_'+value">
                                    <b-th>{{(name.charAt(0).toUpperCase()+name.slice(1)).split('_').join(' ')}}</b-th>
                                    <b-td>{{value}}</b-td>
                                </b-tr>
                            </b-tbody>
                        </b-table-simple>

                </b-col>
            </b-row>

        </b-container>
    </div>
</template>

<script>
    import leafmap from "./leafmap";
    export default {
        components :{
            'LeaftMap' : leafmap
        },
        props : {
            shipment : Object
        },
        mounted(){
            console.log(this.shipment);
          this.info.sender = this.shipment.start_adress_obj.customer.name +' '+ this.shipment.start_adress_obj.customer.surname;
          this.info.receiver = this.shipment.arrival_adress_obj.customer.name +' '+ this.shipment.arrival_adress_obj.customer.surname;
          this.info.shipment_date = this.shipment.shipment_date;
          this.info.delivery_date = this.shipment.delivery_date;
          this.info.description = this.shipment.description;
          this.info.sender_address = this.shipment.start_adress_obj.address;
          this.info.receiver_address = this.shipment.arrival_adress_obj.address;
          this.info.start_city = this.shipment.start_adress_obj.city.name;
          this.info.end_city = this.shipment.arrival_adress_obj.city.name;
          this.actual_state = this.shipment.state_id;


        },
        data(){
            return {
                states : [
                    {name : "Collected",value:1},
                    {name : "Awaiting departure",value:2},
                    {name : "In Transit",value:3},
                    {name : "Delivered",value:4}
                ],
                info : {
                    sender : '',
                    receiver : '',
                    description : '',
                    shipment_date : '',
                    delivery_date : '',
                    sender_address : '',
                    receiver_address : '',
                    start_city : '',
                    end_city : ''
                },
                actual_state : 0
            }
        }
    }
</script>
