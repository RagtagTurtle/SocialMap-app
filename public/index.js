/* global Vue, VueRouter, axios */

var TripsIndexPage = {
  template: "#trips-index-page",
  data: function() {
    return {
      trips: [
              {
                first_city_trip: [{
                              city_id: "",
                              city: {
                                      name: ""
                                      }
                            }]
              }
              ],
      city_trips: [],
      recommendations: []
    };
  },
  created: function() {
    axios
      .get("/api/trips")
      .then(function(response) {
        this.trips = response.data;
      }.bind(this));
  },
  methods: {},
  computed: {}
};

var TripsShowPage = {
  template: "#trips-show-page",
  data: function() {
    return {
      trip: {
        id: "",
        climate: "",
        start_date: "",
        end_date: "",
        city_trips: [
          {
            id: "",
            city_id: "",
            trip_id: "",
            city: {
              id: "",
              geography_id: "",
              name: "",
              state: "",
              region: "",
              longitude: "",
              latitude: ""
            }
          }
        ],
        recommendations: [
          {
            id: "",
            category: "",
            name: "",
            trip_id: "",
            city_id: ""
          }
        ],
        trip_vibes: [
          {
            id: "",
            trip_id: "",
            vibe_id: "",
            vibe: [
              {
                id: "",
                name: "",
              } 
            ]
          }
        ],
        trip_activities: [
          {
            id: "",
            trip_id: "",
            activity_id: "",
            activity: [
              {
                id: "",
                name: ""
              }
            ]
          }
        ]
      },
      currentRecommendation: {
        name: ""
      }
    };
  },
  created: function() {
    axios
      .get("/api/trips/" + this.$route.params.id )
      .then(function(response) { 
        this.trip = response.data;
        this.initMap();
        // this.addMarker();
      }.bind(this));
  },
  methods: {
      addMarker: function(markerInput, mapInput) {
        var marker = new google.maps.Marker({
            position:{lat:parseFloat(markerInput.latitude), lng:parseFloat(markerInput.longitude)},
            map: mapInput,
            icon: markerInput.icon_image,
            // html: "<span v-on:click='setCurrentMarker(markerInput)' data-toggle='modal' data-target='#exampleModal'>"
          });
        marker.addListener('click', function() {
          this.setCurrentMarker(markerInput);
        }.bind(this));
        },

    initMap: function() {
        // MAP OPTIONS
        var options = {
        zoom: 12,
        center: {lat: parseFloat(this.trip.latitude), lng: parseFloat(this.trip.longitude)},
        gestureHandling: 'greedy'
      };
      // CREATING NEW MAP
      var map = new google.maps.Map(document.getElementById('map'), options);

      // THIS SHOULD CREATE AN ARRAY OF RECOMMENDATIONS
      var markers = this.trip.recommendations;

      // // LOOP THROUGH MARKERS
      for (var i = 0; i < markers.length; i++) {
        this.addMarker(markers[i], map);
      }

      // CREATING NEW MARKER
      // var marker = new google.maps.Marker({
      //   position:{lat:parseFloat(this.trip.recommendations[0].latitude), lng:parseFloat(this.trip.recommendations[0].longitude)},
      //   map:map
      // });

      // var infoWindow = new google.maps.InfoWindow({
      //   content: this.trip.recommendations[0].name
      // });

      // marker.addListener('click', function() {
      //   setCurrentMarker;
      // });
    },
    setCurrentMarker: function(inputRecommendation) {
      this.currentRecommendation = inputRecommendation;
      $('#exampleModal').modal({show: true});
    }
  },
  computed: {},
  mounted: function() {
  }
};

var TripsNewPage = {
  template: "#trips-new-page",
  data: function() {
    return {
      climate: "",
      start_date: "",
      end_date: "",
      bio: "",
      cover_image: "",
      errors: []
    };
  },
  created: function() {},
  methods: {
    submit: function() {
      var params = {
        climate: this.climate,
        start_date: this.start_date,
        end_date: this.end_date,
        bio: this.bio,
        cover_image: this.cover_image
      };
      axios
        .post("/api/trips", params)
        .then(function(response) {
          router.push("/city_trips/new");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this));
    }
  },
  computed: {}
};

var CitiesIndexPage = {
  template: "#cities-index-page",
  data: function() {
    return {
      cities: []
    };
  },
  created: function() {
    axios
      .get("/api/cities")
      .then(function(response) {
        this.cities = response.data;
      }.bind(this));
  },
  methods: {},
  computed: {}
};

var CitiesShowPage = {
  template: "#cities-show-page",
  data: function() {
    return {
      city: {
        id: "",
        name: "",
        state: "",
        geography: {
          id: "",
          name: ""
        },
        region: "",
        longitude: "",
        latitude: ""
      },
      currentRecommendation: {
        name: ""
      }
    };
  },
  created: function() {
    axios
      .get("/api/cities/" + this.$route.params.id )
      .then(function(response) { 
        this.city = response.data;
        this.initMap();
      }.bind(this));
  },
  methods: {
    addMarker: function(markerInput, mapInput) {
      var marker = new google.maps.Marker({
          position:{lat:parseFloat(markerInput.latitude), lng:parseFloat(markerInput.longitude)},
          map: mapInput,
          icon:markerInput.icon_image,
          // html: "<span v-on:click='setCurrentMarker(markerInput)' data-toggle='modal' data-target='#exampleModal'>"
        });
      marker.addListener('click', function() {
        this.setCurrentMarker(markerInput);
      }.bind(this));
      },

    initMap: function() {
        // MAP OPTIONS
        var options = {
        zoom: 12,
        center: {lat: parseFloat(this.city.latitude), lng: parseFloat(this.city.longitude)}
      };
      // CREATING NEW MAP
      var map = new google.maps.Map(document.getElementById('map'), options);

      // THIS SHOULD CREATE AN ARRAY OF RECOMMENDATIONS
      var markers = this.city.recommendations;

      // // LOOP THROUGH MARKERS
      for (var i = 0; i < markers.length; i++) {
        this.addMarker(markers[i], map);
      }
    },
    setCurrentMarker: function(inputRecommendation) {
      this.currentRecommendation = inputRecommendation;
      $('#exampleModal').modal({show: true});
    }
  },
  computed: {},
  mounted: function() {
  }
};

var CityTripsNewPage = {
  template: "#city-trips-new-page",
  data: function() {
    return {
      trip_id: "",
      city_id: ""
    };
  },
  created: function() {},
  methods: {
    submit: function() {
      var params = {
        trip_id: this.trip_id,
        city_id: this.city_id
      };
      axios
        .post("/api/city_trips", params)
        .then(function(response) {
          router.push("/trip_vibes/new");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this));
    }
  },
  computed: {}
};

var TripVibesNewPage = {
  template: "#trip-vibes-new-page",
  data: function() {
    return {
      trip_id: "",
      vibe_id: ""
    };
  },
  created: function() {},
  methods: {
    submit: function() {
      var params = {
        trip_id: this.trip_id,
        vibe_id: this.vibe_id
      };
      axios
        .post("/api/trip_vibes", params)
        .then(function(response) {
          router.push("/trip_activities/new");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this));
    }
  },
  computed: {}
};

var TripActivitiesNewPage = {
  template: "#trip-activities-new-page",
  data: function() {
    return {
      trip_id: "",
      activity_id: ""
    };
  },
  created: function() {},
  methods: {
    submit: function() {
      var params = {
        trip_id: this.trip_id,
        activity_id: this.activity_id
      };
      axios
        .post("/api/trip_activities", params)
        .then(function(response) {
          router.push("/recommendations/new");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this));
    }
  },
  computed: {}
};

var RecommendationsNewPage = {
  template: "#recommendations-new-page",
  data: function() {
    return {
      category: "",
      name: "",
      trip_id: "",
      city_id: "",
      latitude: "",
      longitude: ""
    };
  },
  created: function() {},
  methods: {
    submit: function() {
      var params = {
        category: this.category,
        name: this.name,
        trip_id: this.trip_id,
        city_id: this.city_id,
        latitude: this.latitude,
        longitude: this.longitude
      };
      axios
        .post("/api/recommendations", params)
        .then(function(response) {
          router.push("/#/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this));
    },
    submit_and_redirect: function() {
      var params = {
        category: this.category,
        name: this.name,
        trip_id: this.trip_id,
        city_id: this.city_id
      };
      axios
        .post("/api/recommendations", params)
        .then(function(response) {
          router.push("/recommendations/new");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this));
    },
  },
  computed: {}
};

var MapHomePage = {
  template: "#map-home-page",
  data: function() {
    return {};
  },
  created: function() {},
  methods: {
    initMap: function() {
        var options = {
        zoom: 12,
        center: {lat: parseFloat(this.city.latitude), lng: parseFloat(this.city.longitude)}
      };
      // CREATING NEW MAP
      var map = new google.maps.Map(document.getElementById('map'), options);
    }
  },
  computed: {}
};

// PLACEHOLDER
// var HomePage = {
//   template: "#home-page",
//   data: function() {
//     return {
//       message: "Welcome to Vue.js!"
//     };
//   },
//   created: function() {},
//   methods: {},
//   computed: {}
// };

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: TripsIndexPage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage},
    { path: "/logout", component: LogoutPage},
    { path: "/trips", component: TripsIndexPage},
    { path: "/trips/new", component: TripsNewPage},
    { path: "/trips/:id", component: TripsShowPage},
    { path: "/cities", component: CitiesIndexPage},
    { path: "/cities/:id", component: CitiesShowPage},
    { path: "/trip_vibes/new", component: TripVibesNewPage},
    { path: "/city_trips/new", component: CityTripsNewPage},
    { path: "/recommendations/new", component: RecommendationsNewPage},
    { path: "/trip_activities/new", component: TripActivitiesNewPage},
    { path: "/map", component: MapHomePage}
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});