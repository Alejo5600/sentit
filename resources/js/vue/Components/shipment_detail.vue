<template>
    <div>
        <b-container>
            <b-row>
                <b-col>
                    <div class="h4 mb-0">
                        <b-row>

                            <b-col cols="3" v-for="state in states" v-bind:key="state.value">
                                <b-icon :icon="actual_state >= state.value ? 'check-circle-fill' : 'check-circle-fill' " :variant="actual_state >= state.value ? 'success':'secondary'"></b-icon>
                                <label :class="actual_state >= state.value ? 'text-success' :'text-secondary'">{{state.name}}</label>
                            </b-col>
                        </b-row>

                    </div>
                    <hr>
                </b-col>
            </b-row>
            <b-row>
                <b-col cols="6">
                    <b-img src="https://www.hostinet.com/formacion/wp-content/uploads/2016/01/googlemaps.jpg" fluid-grow></b-img>
                </b-col>
                <b-col cols="6">


                        <b-table-simple hover small>
                            <b-tbody>
                                <b-th>State</b-th>
                                <b-td></b-td>
                            </b-tbody>
                        </b-table-simple>

                </b-col>
            </b-row>

        </b-container>
    </div>
</template>

<script>
    export default {
        props : {
            shipment : Object
        },
        data(){
            return {
                states : [
                    {name : "Collected",value:1},
                    {name : "Awaiting departure",value:2},
                    {name : "In Transit",value:3},
                    {name : "Delivered",value:4}
                ],
                actual_state : 1
            }
        }
    }
</script>
