// Por lo general las pantallas permiten avanzar cuando se han clickeado o checado varios items
// para evitar la repeticioón se utiliza este mixin.
// el estado de cada item se guarda en la variable vistos,
// cuando todos los items se han visto, es decir todos los eslemento del arreglo vistos son verdaderos, se llama la
// función todosVistos.
// Tanto el arreglo como la función se pueden reescribir en cada componente
export default {
    data() {
        return {
            vistos: [false]
        }
    },
    methods: {
        showNext(){
            this.$store.commit('nextShow', true)
        }
    },
    created() {
        this.$store.commit('nextShow', false) //Oculta la flecha al inicio
    },
    watch: {
        vistos(value) {
            if (value.every(el => el)) {
                this.showNext()
            }
        }
    }
}