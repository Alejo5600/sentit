<template>
    <div>

        <div style="height: 500px; width: 100%">

            <l-map
                v-if="showMap"
                :zoom="zoom"
                :center="center"
                :options="mapOptions"
                style="height: 80%"
                @update:center="centerUpdate"
                @update:zoom="zoomUpdate"
            >
                <l-tile-layer
                    :url="url"
                    :attribution="attribution"
                />
                <l-marker :lat-lng="withPopup" :icon="icon">
                    <l-popup>
                        <div @click="innerClick">
                            {{this.mapAddress}}

                        </div>
                    </l-popup>
                </l-marker>
            </l-map>
        </div>
    </div>
</template>
    <script>
        import { latLng } from "leaflet";
        import { LMap, LTileLayer, LMarker, LPopup, LTooltip } from "vue2-leaflet";
        export default {
            name: "LeafMap",
            props : {
                mapAddress : String
            },
            components: {
                LMap,
                LTileLayer,
                LMarker,
                LPopup,
                LTooltip
            },

            mounted() {
                setTimeout(function() { window.dispatchEvent(new Event('resize')) }, 250);
                //let address = "carrera%2012%2312-31%20Pereira%20Risaralda%20Colombia";
                let address = this.mapAddress;
                address = address.split(' ').join('%20');
                address = address.split('#').join('%23');
                //$.get(, function(data){
                    //const map = L.map('mimapa').setView([data[0].lat, data[0].lon], 18)
                    fetch('https://nominatim.openstreetmap.org/search?q='+address+'&format=json')
                        .then(data => data.json())
                        .then(data => {
                            var pos = []
                            if(data.length > 0){
                                pos = [data[0].lat, data[0].lon]
                            }else{
                                pos = ["6.2520181", "-75.5684403"]
                            }
                            console.log("pos",pos)
                            this.withPopup = pos
                            this.center = pos


                        })


            },
            data() {

                const myMarkerIcon = L.icon({
                    iconUrl: 'https://img2.freepng.es/20180516/jse/kisspng-dog-walking-pet-sitting-cartoon-5afc187a875756.1829221915264707785544.jpg',
                    shadowUrl: require('leaflet/dist/images/marker-shadow.png'),
                    iconRetinaUrl: require('leaflet/dist/images/marker-icon-2x.png')
                });
                return {
                    myMarkerIcon: myMarkerIcon,
                    zoom: 18,
                    center: latLng(47.41322, -1.219482),
                    url: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    attribution:
                        '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors',
                    withPopup: latLng(47.41322, -1.219482),
                    withTooltip: latLng(47.41422, -1.250482),
                    currentZoom: 18,
                    currentCenter: latLng(47.41322, -1.219482),
                    showParagraph: false,
                    mapOptions: {
                        zoomSnap: 0.5
                    },
                    icon: L.icon({
                        iconUrl: 'https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678111-map-marker-512.png',
                        iconSize: [32, 37],
                        iconAnchor: [16, 37]
                    }),
                    showMap: true

                };
            },
            methods: {
                zoomUpdate(zoom) {
                    this.currentZoom = zoom;
                },
                centerUpdate(center) {
                    this.currentCenter = center;
                },
                showLongText() {
                    this.showParagraph = !this.showParagraph;
                },
                innerClick() {
                    alert("Click!");
                }
            }
        }

    </script>

