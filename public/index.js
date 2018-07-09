/* global Vue, VueRouter, axios */

var TripsIndexPage = {
  template: "#trips-index-page",
  data: function() {
    return {
      trips: [],
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
      }
    };
  },
  created: function() {
    axios
      .get("/api/trips/" + this.$route.params.id )
      .then(function(response) { 
        this.trip = response.data;
      }.bind(this));
  },
  methods: {},
  computed: {}
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
          router.push("/#/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this));
    }
  },
  computed: {}
};

// placeholder
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
    { path: "/trip_vibes/new", component: TripVibesNewPage},
    { path: "/trip_activities/new", component: TripActivitiesNewPage}
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