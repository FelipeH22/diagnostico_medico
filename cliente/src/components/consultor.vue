<template>
  <div>
      <v-layout wrap row xs11 mt-5 justify-center>
          <v-flex xs3></v-flex>
          <v-flex xs8>
                <v-stepper v-model="e1">
                    <v-stepper-header >
                    <v-stepper-step v-for="(p, idx) in pasos" :key="idx" 
                                    color="blue" :complete="e1 > 1" step="1"
                        >
                        {{p.title}}
                    </v-stepper-step>
                    <v-divider></v-divider>
                    </v-stepper-header>

                    <v-stepper-items>
                    <v-stepper-content step="1">
                        <v-card
                        class="mb-5"
                        color="grey lighten-1"
                        height="200px"
                        ></v-card>

                        <v-btn
                        color="blue"
                        @click="e1 = 2"
                        >
                        Continue
                        </v-btn>

                        <v-btn flat>Cancel</v-btn>
                    </v-stepper-content>

                    <v-stepper-content step="2">
                        <v-card
                        class="mb-5"
                        color="grey lighten-1"
                        height="200px"
                        ></v-card>

                        <v-btn
                        color="primary"
                        @click="e1 = 3"
                        >
                        Continue
                        </v-btn>

                        <v-btn flat>Cancel</v-btn>
                    </v-stepper-content>

                    <v-stepper-content step="3">
                        <v-card
                        class="mb-5"
                        color="grey lighten-1"
                        height="200px"
                        ></v-card>

                        <v-btn
                            color="blue"
                            @click="e1 = 1"
                        >
                        Continue
                        </v-btn>

                        <v-btn flat>Cancel</v-btn>
                    </v-stepper-content>
                    </v-stepper-items>
                </v-stepper>
          </v-flex>
      </v-layout>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        e1: 0,
        pasos:[
            {title:'Introduction'},
            {title:'Patient'},
            {title:'Introduction'},
            {title:'Introduction'},
            {title:'Introduction'},
        ]
      }
    }
  }
</script>