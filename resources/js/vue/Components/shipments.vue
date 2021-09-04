<template>
    <div>
        <shipment_search></shipment_search>
        <div>
            <b-table striped hover :items="shipments">
                <template #cell(state)="row">
                    <b-badge :variant="colors[row.item.state.state_id -1 ]">{{row.item.state.name}}</b-badge>
                </template>
                <template #cell(options)="row">
                    <b-button size="sm" @click="info(row.item, row.index, $event.target)" class="mr-1">
                        Detail
                    </b-button>
                </template>
            </b-table>
        </div>
        <!-- Info modal -->
        <b-modal size="xl" :id="infoModal.id" :title="infoModal.title" ok-only @hide="resetInfoModal">
            <shipment_detail></shipment_detail>

        </b-modal>
    </div>
</template>
<script>
    import shipment_search from "./shipment_search";
    import shipment_detail from "./shipment_detail";
    export default {
        data() {
            return {
                infoModal: {
                    id: 'info-modal',
                    title: '',
                    content: ''
                },
                shipments: [],
                colors : [
                    'primary',
                    'info',
                    'warning',
                    'success'
                ]
            }
        },
        mounted(){
          this.getShipments()
        },
        methods : {
            resetInfoModal() {
                this.infoModal.title = ''
                this.infoModal.content = ''
            },
            info(item, index, button) {
                this.infoModal.title = `Row index: ${index}`
                this.infoModal.content = JSON.stringify(item, null, 2)
                this.$root.$emit('bv::show::modal', this.infoModal.id, button)
            },
            showShipments(shipments){
                shipments.forEach(sh => {
                    let shipment = {};
                    shipment.state = sh.state,
                    shipment.sender = sh.sender.name +' '+sh.sender.surname;
                    shipment.receiver = sh.receiver.name +' '+sh.receiver.surname;
                    shipment.description = sh.description;
                    shipment.shipment_date = sh.shipment_date;
                    shipment.delivery_date = sh.delivery_date;
                    shipment.options = sh;
                    this.shipments.push(shipment);
                })
            },
            getShipments(){
                fetch('api/shipments',{
                    method : 'GET',
                    headers : {
                        'Content-Type': 'application/json',
                        'Authorization' : 'Bearer '+localStorage.getItem("jwt")
                    }
                })
                .then(data => data.json())
                .then(data =>{
                    if(!data.success){

                    }
                    this.showShipments(data.shipments);
                }).catch(err => {
                    console.error(err);
                });
            }
        },
        components :{
            shipment_search,
            shipment_detail
        }
    }
</script>
