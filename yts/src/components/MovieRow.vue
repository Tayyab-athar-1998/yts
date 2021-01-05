<template>
  <v-container>
    <v-row>
      <v-col class="mb-3">
        <MovieBrick />
      </v-col>
      <v-col class="mb-3">
        <MovieBrick />
      </v-col>
      <v-col class="mb-3">
        <MovieBrick />
      </v-col>
      <v-col class="mb-3">
        <MovieBrick />
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
  import MovieBrick from "@/components/MovieBrick.vue"
  export default {
    name: 'MovieRow',
    components: {
      MovieBrick
    } 
  }
</script>
