<template>
    <div id="myLogin">
        <b-container>

            <b-row>
                <b-col class="text-center">
                    <h1>Sent.It</h1>
                </b-col>
            </b-row>
            <b-row>
                <b-col align-h="center" >

                    <b-card-group deck>
                        <b-card
                            header="Login"
                            id="loginCard"
                        >
                            <div>
                                <b-alert :show="hasAlert"   variant="danger">{{alertMsg}}</b-alert>
                                <b-form @submit="onSubmit" @reset="onReset" v-if="show">
                                    <b-form-group
                                        id="input-group-1"
                                        label="Email address:"
                                        label-for="input-1"
                                    >
                                        <b-form-input
                                            id="input-1"
                                            v-model="form.email"
                                            type="email"
                                            placeholder="Enter email"
                                            required
                                        ></b-form-input>
                                    </b-form-group>

                                    <b-form-group id="input-group-2" label="Your Name:" label-for="input-2">
                                        <b-form-input
                                            id="input-2"
                                            type="password"
                                            v-model="form.password"
                                            placeholder="Enter name"
                                            required
                                        ></b-form-input>

                                    </b-form-group>
                                    <b-form-group class="m-3" align="end">
                                        <b-button type="submit" variant="primary">Login</b-button>
                                    </b-form-group>
                                </b-form>
                            </div>
                        </b-card>

                    </b-card-group>
                </b-col>
            </b-row>
        </b-container>

        <div>
            <router-link to="/">Home</router-link>
            <router-link to="/header">Header</router-link>

        </div>

    </div>


</template>

<script>
    export default {
        data() {
            return {
                form: {
                    email: '',
                    password: '',
                },

                show: true,
                hasAlert : false,
                alertMsg : ''
            }
        },
        methods: {
            onSubmit(event) {
                event.preventDefault()
                alert(JSON.stringify(this.form))
                fetch('api/login',{
                    method : 'POST',
                    body : JSON.stringify(this.form),
                    headers : {
                        'Content-Type': 'application/json'
                    }
                })
                .then(data => data.json())
                .then(data => {
                    if(!data.success){
                        this.alertMsg= data.msg || 'Wrong email or password';
                        this.hasAlert = true;
                        return false;
                    }
                    this.alertMsg= '';
                    this.hasAlert = false;

                })

            },
            onReset(event) {
                event.preventDefault()
                // Reset our form values
                this.form.email = ''
                this.form.password = ''
                // Trick to reset/clear native browser form validation state
                this.show = false
                this.$nextTick(() => {
                    this.show = true
                })
            }
        }
    }
</script>

<style scoped>
    h1 {
        color: white;
        font-weight: bold;
        font-size: 150px;
        text-decoration: underline;
        text-shadow: -11px 9px 3px rgba(0,0,0,0.64);

    }
    #myLogin{
        background-image: url("https://cdn.pixabay.com/photo/2013/07/12/17/59/cargo-ship-152745_960_720.png/");
        background-color: cadetblue;
        height: 100vh;
        background-repeat: no-repeat;

    }
    #loginCard{
        background-color: rgba(255,255,255,0.8);
    }

</style>
