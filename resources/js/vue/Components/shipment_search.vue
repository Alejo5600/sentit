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
                <b-form-group  label="Date:" label-for="input-date">
                    <b-form-datepicker id="input-date"  class="mb-2"></b-form-datepicker>
                </b-form-group>
            </b-col>
            <b-col cols="2">
                <b-button>
                    <b-icon-search></b-icon-search>
                </b-button>
            </b-col>
        </b-row>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                form: {
                    city : ''
                },
                cities: [{ text: 'Select One', value: null }, 'Carrots', 'Beans', 'Tomatoes', 'Corn'],
            }
        },
    }
</script>
