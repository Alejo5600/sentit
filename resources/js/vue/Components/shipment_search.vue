<template>
    <div>
        <b-row>
            <b-col cols="4">
                <b-form-group id="input-group-3" label="City:" label-for="input-3">
                    <b-form-select
                        id="input-3"
                        v-model="form.city"
                        :options="cities"
                        required
                    ></b-form-select>
                </b-form-group>
            </b-col>
            <b-col cols="6">
                <b-form-group  label="Delivery date:" label-for="input-date">
                    <b-form-datepicker id="input-date" v-model="form.delivery_date"  class="mb-2"></b-form-datepicker>
                </b-form-group>
            </b-col>
            <b-col cols="2">
                <br>
                <b-button class="mt-2" v-on:click="getShipments">
                    <b-icon-search></b-icon-search>
                </b-button>
            </b-col>
        </b-row>

    </div>
</template>
<script>
    export default {
        mounted(){
          this.getCities()
        },
        data() {
            return {
                form: {
                    city : '',
                    delivery_date : '',
                },
                cities: [],
            }
        },
        methods : {
            getShipments(){

              fetch(`api/shipmentsByCity/${this.form.city}/${this.form.delivery_date}`,{
                  method : 'GET',
                  headers : {
                      'Content-Type': 'application/json',
                      'Authorization' : 'Bearer '+localStorage.getItem("jwt")
                  }
              })
              .then(data => data.json())
              .then(data => {
                  if(!data.success){
                      return false;
                  }
                  this.$emit('shipmentsReceived',data.shipments);
              })
            },
            getCities(){
                fetch('api/cities',{
                    method : 'GET',
                    headers : {
                        'Content-Type': 'application/json',
                        'Authorization' : 'Bearer '+localStorage.getItem("jwt")
                    }
                })
                    .then(data => data.json())
                    .then(data => {
                        if(!data.success){
                            return false;
                        }
                        this.cities = [];
                        data.cities.forEach(city => {
                            this.cities.push({
                                text : city.name + ' ('+city.code+')',
                                value : city.city_id
                            })
                        })
                    });
            },

        }
    }
</script>
