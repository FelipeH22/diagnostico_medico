<template>
    <div>
        <v-layout mt-5 row wrap justify-center align-center>
            <!--<v-flex xs11 sm4 md4 v-for="(logo,idx) in logos" :key="idx">
                <img class="img-logo" :src="require('@/assets/imagenes_compartidas/logos/'+ logo +'.png')" alt="">
            </v-flex>-->
            <v-flex xs9 sm7 md4 >
                <img class="img-logo" :src="require('@/assets/presentacion/Logos.png')" alt="">
            </v-flex>
        </v-layout>
    </div>
</template>

<script>
export default {
    data() {
        return {
            logos:[
                'logo-1',
            ]
        }
    },
}
</script>
<style lang="scss" scoped>
  
</style>