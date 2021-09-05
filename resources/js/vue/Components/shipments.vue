<template>
    <div>
        <shipment_search v-on:shipmentsReceived="shipmentsReceived"></shipment_search>
        <b-button variant="success" @click="shipmentForm(0)">Create Shipment</b-button>
        <div>
            <b-table responsive  striped hover :busy="isBusy" :items="shipments">
                <template #cell(state)="row">
                    <b-badge :variant="colors[row.item.state.state_id -1 ]">{{row.item.state.name}}</b-badge>
                </template>
                <template #cell(options)="row">
                    <b-button size="sm" @click="info(row.item, row.index, $event.target)" class="mr-1">
                        Detail
                    </b-button>
                    <b-dropdown size="sm" id="dropdown-1" text="State" class="m-md-2">
                        <b-dropdown-item @click="changeState(row.item.options.shipment_id,1)">Collected</b-dropdown-item>
                        <b-dropdown-item @click="changeState(row.item.options.shipment_id,2)">Awaiting departure</b-dropdown-item>
                        <b-dropdown-item @click="changeState(row.item.options.shipment_id,3)">In transit</b-dropdown-item>
                        <b-dropdown-item @click="changeState(row.item.options.shipment_id,4)">Delivered</b-dropdown-item>
                    </b-dropdown>
                    <b-button size="sm" @click="shipmentForm(row.item.options.shipment_id)">Editar</b-button>

                </template>
                <template #table-busy>
                    <div class="text-center text-danger my-2">
                        <b-spinner class="align-middle"></b-spinner>
                        <strong>Loading...</strong>
                    </div>
                </template>
            </b-table>
        </div>
        <!-- Info modal -->
        <b-modal size="xl" :id="infoModal.id" title="Shipment Detail" ok-only @hide="resetInfoModal">
            <shipment_detail :shipment="infoModal.item"></shipment_detail>

        </b-modal>
        <!-- Add / Edit modal -->
        <b-modal size="xl" title="Add/edit" id="modal-shipment-form" @ok="saveShipment">
            <shipment_form :shipment_id="form_shipment_id"></shipment_form>
        </b-modal>
    </div>
</template>
<script>
    import shipment_search from "./shipment_search";
    import shipment_detail from "./shipment_detail";
    import shipment_form from "./shipment_form";
    import {bus} from "../../app";

    export default {
        data() {
            return {
                infoModal: {
                    id: 'info-modal',
                    title: '',
                    content: '',
                    item : null
                },
                shipments: [],
                colors : [
                    'primary',
                    'info',
                    'warning',
                    'success'
                ],
                form_shipment_id : 0,
                isBusy : false,

            }
        },
        mounted(){
            this.getShipments();
            bus.$on('getShipments',this.getShipments)
        },
        methods : {
            saveShipment(){
              bus.$emit('saveShipment');
            },
            changeState(shipment,state){
                let data = {
                    state : state ,
                    shipment :shipment,
                };
                fetch('api/shipmentState',{
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
                    if(!data.success){
                        return false;
                    }
                    this.getShipments();
                })
            },
            shipmentsReceived(shipments){
                this.shipments = [];
                this.showShipments(shipments);
            },
            resetInfoModal() {
                this.infoModal.title = ''
                this.infoModal.content = ''
                this.infoModal.item = null;
            },
            info(item, index, button) {
                this.infoModal.title = `Row index: ${index}`
                this.infoModal.content = JSON.stringify(item, null, 2)
                this.infoModal.item = item.options;
                this.$root.$emit('bv::show::modal', this.infoModal.id, button)
            },
            shipmentForm(id){
                this.form_shipment_id = id;
                this.$root.$emit('bv::show::modal', 'modal-shipment-form');
            },
            showShipments(shipments){
                shipments.forEach(sh => {
                    let shipment = {};
                    shipment.state = sh.state,
                    shipment.sender = sh.start_adress_obj.customer?.name +'  '+(sh.start_adress_obj.customer?.surname);
                    shipment.receiver = sh.arrival_adress_obj.customer?.name +' '+(sh.arrival_adress_obj.customer?.surname);
                    shipment.description = sh.description;
                    shipment.shipment_date = sh.shipment_date;
                    shipment.delivery_date = sh.delivery_date;
                    shipment.options = sh;
                    this.shipments.push(shipment);
                })
            },
            getShipments(){
                this.isBusy = true;
                fetch('api/shipments',{
                    method : 'GET',
                    headers : {
                        'Content-Type': 'application/json',
                        'Authorization' : 'Bearer '+localStorage.getItem("jwt")
                    }
                })
                .then(data => data.json())
                .then(data =>{
                    this.isBusy = false;
                    if(!data.success){
                        return false;
                    }
                    this.showShipments(data.shipments);
                }).catch(err => {
                    this.isBusy = false;
                    console.error(err);
                });
            }
        },
        components :{
            shipment_search,
            shipment_detail,
            shipment_form
        }
    }
</script>
