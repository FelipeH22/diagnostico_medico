<template>

</template>
<script>
    export default {
        props: {
            audios: {
                type: Array,
                required: true
            },
            autoplay: {
                type: Boolean,
                required: false,
                default: false
            }
        },
        data() {
            return {
                loadedAudios: [],
                audio: {}
            }
        },
        methods: {
            loadAudio() {
                for (var i = 0; i < this.audios.length; i++) {
                    this.loadedAudios.push(this.audios[i])
                }
            },
            playAudio(id) {
                if (typeof this.audio.paused != "undefined") {
                    if (!this.audio.paused) this.audio.pause();
                }
                if (id > this.loadedAudios.length - 1) {
                    console.error("No audio for " + id);
                    return;
                }
                try {
                    var path = require('../assets/audios/' + this.loadedAudios[id] + '.mp3'); //Reproduce el audio según el texto que se muestre
                    this.audio = new Audio(path);
                    this.audio.play();
                } catch (err) {
                    console.error(err);
                }
            },
            autoPlay() {
                if (this.autoplay) this.playAudio(0);
            },
            pauseAudio() {
                if (!this.audio.paused) this.audio.pause();
            }
        },
        mounted() {
            this.loadAudio(); //Carga las rutas
            this.autoPlay();
        },
        beforeDestroy() {
            this.audio.pause(); //Previene que el audio se propage en otras pantallas
        },
    }
</script>
