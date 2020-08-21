<template>
    <div>
        <v-toolbar class="header" dark>
            <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
            <v-toolbar-title>Diagnóstico</v-toolbar-title>
            <v-spacer></v-spacer>
            <v-toolbar-items class="hidden-sm-and-down">
            <v-btn flat>Link One</v-btn>
            <v-btn flat>Link Two</v-btn>
            <v-btn flat>Link Three</v-btn>
            </v-toolbar-items>
        </v-toolbar>

        <v-navigation-drawer
            v-model="drawer"
            :mini-variant="mini"
            absolute
            dark class="menulateral"
            >
            <v-list class="pa-1">
                <v-list-tile v-if="mini" @click.stop="mini = !mini">
                <v-list-tile-action>
                    <v-icon>chevron_right</v-icon>
                </v-list-tile-action>
                </v-list-tile>

                <v-list-tile avatar tag="div">
                <v-list-tile-avatar>
                    <img src="https://randomuser.me/api/portraits/men/85.jpg">
                </v-list-tile-avatar>

                <v-list-tile-content>
                    <v-list-tile-title>John Leider</v-list-tile-title>
                </v-list-tile-content>

                <v-list-tile-action>
                    <v-btn icon @click.stop="mini = !mini">
                    <v-icon>chevron_left</v-icon>
                    </v-btn>
                </v-list-tile-action>
                </v-list-tile>
            </v-list>

            <v-list class="pt-0" dense>
                <v-divider light></v-divider>

                <v-list-tile
                v-for="item in items"
                :key="item.title"
                >
                <v-list-tile-action>
                    <v-icon>{{ item.icon }}</v-icon>
                </v-list-tile-action>

                <v-list-tile-content>
                    <v-list-tile-title>{{ item.title }}</v-list-tile-title>
                </v-list-tile-content>
                </v-list-tile>
            </v-list>
            </v-navigation-drawer>
    </div>
</template>

<script>
  export default {
    data () {
      return {
        drawer: null,
        items: [
          { title: 'Home', icon: 'dashboard' },
          { title: 'About', icon: 'question_answer' }
        ],
        mini: false,
        right: null
      }
    }
  }
</script>
<style lang="css" scoped>

.header{
    background: #0671c9;
}
.menulateral{
    background: #0360ac;
}
</style>