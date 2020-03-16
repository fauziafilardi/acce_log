<template>
    <span>
        <b-modal
            id="modalgmaps"
            :hide-footer="true"
            :hide-header-close="true"
            size="lg"
            ref="modalgmaps"
            class="modal-customize-abs"
            style="position:absolute;"
            >
            <b-row>
                <b-col sm="12" style="margin-left: 10px;margin-bottom: 10px;">
                <div class="modal-customize-abs__modal-body" style="padding-right: 0px;">
                    <div class="table--list">
                        <div>
                            <label for="maps">
                                <gmap-autocomplete
                                    @place_changed="setPlace"
                                    ref="searchMap"
                                />
                                <b-button style="font-size: 10px;padding-top: 3px;padding-bottom: 3px;" @click="addMarker2"><font-awesome-icon icon="plus" class="icon-style-1"/> Add</b-button>
                            </label>
                        </div>
                        <gmap-map
                            :center="center"
                            :zoom="zoomMap"
                            style="width:100%;  height: 400px;"
                            @click="addMarkerOnMapClick"
                            @zoom_changed="zoomChanged"
                            ref="maps"
                        >
                            <gmap-marker
                                v-for="(m, index) in markers"
                                :key="index"
                                :icon="m.icon == null ? 'http://maps.google.com/mapfiles/ms/icons/red-dot.png' : m.icon"
                                :position="m.position"
                                :clickable="true"
                                :draggable="m.draggable"
                                @dragend="dragMarker"
                                @click="deleteMap(m)"
                            ></gmap-marker>

                        </gmap-map>
                    </div>
                </div>
                </b-col>
            </b-row>
        </b-modal>

        <b-row v-if="prop.cVisible">
        <b-col :md="prop.cLabelSize" class="lbl-col-align">
            <template v-if="languageStatus">
                <label v-show="inputStatus=='new' || inputStatus=='edit'" class="lbl-text-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
                <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ $t(prop.cName) == prop.cName ? prop.cLabel : $t(prop.cName)}} </label>
            </template>
            <template v-else>
                <label v-show="inputStatus=='new' || inputStatus=='edit'" class="lbl-text-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
                <label v-show="inputStatus=='view'" class="lbl-view-form"><span v-if="isRequired" style="color:red;">*</span> {{ prop.cLabel }} </label>
            </template>
        </b-col>
        <b-col md="7">
            <!-- <b-form-input
                v-validate="prop.cValidate"
                :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
                type="text"
                v-bind:data-vv-name="prop.cName"
                v-bind:data-vv-as="prop.cLabel"
                v-model="value"
                class="text-field-form"
                :tabindex="prop.cOrder"
                :disabled="false"
                :style="inputStatus=='edit' && prop.cKey || prop.cProtect ? 'background-color:  #e9ecef;' : 'background-color: #FFF;'"
                :ref="prop.cName"
                :id="prop.cName"
                :readonly="true"
            /> -->

            <b-form-textarea
                v-validate="prop.cValidate"
                :class="{'input': true, 'error-text-field': errors.has(prop.cParentForm+'.'+prop.cName)}"
                v-bind:name="prop.cName"
                v-bind:data-vv-as="prop.cLabel"
                v-model="value"
                :tabindex="prop.cOrder"
                :disabled="inputStatus=='edit' && prop.cKey || prop.cProtect"
                :plaintext="inputStatus=='view'"
                :style="inputStatus=='edit' && prop.cKey || prop.cProtect ? 'background-color:  #e9ecef;' : 'background-color: #FFF;'"
                :ref="prop.cName"
                :id="prop.cName"
                :no-resize="true"
                :rows="1"
                :max-rows="10"
                :readonly="false"
                :size="'md'"
            />

            <span v-show="errors.has(prop.cParentForm+'.'+prop.cName)" class="error-span">
                {{ errors.first(prop.cParentForm+'.'+prop.cName) }}
            </span>
        </b-col>
        <b-col md="1">
            <div class="add-icon--location-pin" v-show="inputStatus!=='view'" @click="openMaps">
                <i class="icon-location-pin"></i>
            </div>
        </b-col>
        </b-row>
    </span>
</template>

<script>
    export default {
        props: {
            prop: {
                cValidate: String,
                cName: String,
                cLabel: String,
                cLabelSize: String,
                cOrder: Number,
                cKey: Boolean,
                cDefault: String,
                cProtect: Boolean,
                cReadOnly: Boolean,
                cVisible: Boolean,
                cPageLevel: String,
                cTabIndex: String,
                cParentForm: String,
                cStyle: String,
                cIsAlwaysShow: Boolean
            },
            value: [String, Number]
        },
        data() {
            return {
                center: { lat: -6.240243, lng: 106.808181 },
                markers: [],
                places: [],
                currentPlace: null,
                zoomMap: 15,
                markerTemporary: null,
                isAddMarker: false,
            }
        },
        watch: {},
        computed: {
            inputStatus() {
                this.$validator.pause()
                this.$nextTick(() => {
                    this.$validator.errors.clear(this.prop.cParentForm)
                    this.$validator.resume()
                })

                if(this.$store.getters.getLevel == this.prop.cPageLevel && this.$store.getters.getTab == this.prop.cTabIndex){
                    return this.$store.getters.getStatus
                }
                else {
                    return 'view'
                }
            },
            languageStatus () {
                return this.$store.getters.languageStatus
            },
            mapvalue () {
                let latlng = null
                if (this.markerTemporary) {
                    if (this.markerTemporary.status == 'none') {
                        latlng = {
                            coord: this.markerTemporary.lat + ',' + this.markerTemporary.lng,
                            descs: ''
                        }
                    }
                    else {
                        if (this.markerTemporary.placeData) {
                            latlng = {
                                coord: this.markerTemporary.lat + ',' + this.markerTemporary.lng,
                                descs: this.markerTemporary.placeData.name + "\n" + this.markerTemporary.placeData.formatted_address
                            }
                        }
                    }
                }
                return latlng
            }
        },
        methods: {
            zoomChanged (zoom) {
                this.zoomMap = zoom
            },
            getPlaceData (place) {
                var placeServices = new google.maps.places.PlacesService(this.$refs.maps.$mapObject)
                var results = null
                let vn = this

                if (!place.placeId) {
                    results = {
                        lat: place.latLng.lat(),
                        lng: place.latLng.lng(),
                        placeData: null,
                        status: 'none'
                    }

                    vn.addMarker(results)
                } 
                else {

                    var req = {
                        placeId: place.placeId
                    }

                    placeServices.getDetails(req, function(result, status) {
                        console.log(result)
                        if (status == "OK") {
                            results = {
                                lat: place.latLng.lat(),
                                lng: place.latLng.lng(),
                                placeData: result,
                                status: 'ok'
                            }

                            vn.addMarker(results)
                        }
                    })
                }
            },
            dragMarker (place) {
                this.markers.splice(-1,1)
                this.getPlaceData(place)
                // this.addMarker()
            },
            addMarkerOnMapClick (place) {
                // console.log(place)
                // console.log(this.$refs.maps)
                
                if (place.placeId && place.placeId !== '') {
                    this.getPlaceData(place)
                }
                
                // this.addMarker()
            },
            setPlace(place) {
                // this.currentPlace = place;

                // const marker = {
                //     lat: this.currentPlace.geometry.location.lat(),
                //     lng: this.currentPlace.geometry.location.lng()
                // }
                // this.center = marker
            },
            addMarker (ress) {
                if (!ress) return
                this.markerTemporary = ress

                this.markers = [
                    {
                        position: {
                            lat: ress.lat,
                            lng: ress.lng
                        },
                        icon: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png",
                        draggable: false
                    }
                ]
            },
            addMarker_bk () {
                // auto complete
                if (this.currentPlace) {
                    this.markerTemporary = {
                        lat: this.currentPlace.geometry.location.lat(),
                        lng: this.currentPlace.geometry.location.lng()
                    }
                    this.center = this.markerTemporary
                    this.currentPlace = null
                } else {
                    // onclick add marker
                }
                this.isAddMarker = true
                this.markers = [
                    {
                        position: this.markerTemporary,
                        icon: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png",
                        draggable: true
                    }
                ]
                // this.markers.push({
                //     position: this.markerTemporary,
                //     icon: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png",
                //     draggable: true
                // })
            },
            addMarker2 () {
                this.value = this.mapvalue.descs
                this.$emit('input', this.value)
                this.$emit('change', this.mapvalue)
                this.$refs.modalgmaps.hide()
            },
            deleteMap (marker) {
                console.log(marker)
                if (this.markers && this.markers.length > 0) {
                    if (this.markers[0].position.lat == marker.position.lat && this.markers[0].position.lng == marker.position.lng) {
                        this.markers.splice(0, 1)
                        this.markerTemporary = null
                        this.addMarker2()
                    }
                }
                else {}
            },
            openMaps() {
                this.getLocation()
                this.zoomMap = 15
                this.$refs.modalgmaps.show()
            },
            getLocation() {
                navigator.geolocation.getCurrentPosition(position => {
                    this.center = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };
                });
            }
        },
        created: function() {
            this.getLocation()
        },
        mounted: function () {},
        beforeDestroy: function() {},
        updated: function () {}
    }
</script>