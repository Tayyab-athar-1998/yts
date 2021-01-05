<template>
  <div class="d-flex flex-column">
    <div>
      <v-img
        lazy-src="https://picsum.photos/id/11/10/6"
        height="315"
        width="210"
        src="https://picsum.photos/id/11/500/300"
      />
    </div>
    <div class="text-left">
      <p class="movie-title">
        Title
      </p>
      <p class="release-date">
        2020
      </p>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'MovieBrick',
  }
</script>

<style scoped>
  .movie-title{
    color: #fff;
    margin-top: 8px;
    margin-bottom: 0px;
  }
  .release-date{
    color: #919191;
    margin-top: 0px;
  }
</style>
