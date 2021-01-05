<template>
  <div class="container-fluid">
    <div class="popular-downloads-container">
      <div class="container">
        <div class="row">
          <h2 class="popular-downloads-wrapper">
            Popular Downloads
          </h2>
        </div>
      </div>
      <MovieRow />
    </div>
    <div class="latest-movies-container">
      <div class="container">
        <row>
          <h2 class="popular-downloads-wrapper mt-40">
            Latest YIFY movies
          </h2>
        </row>
        <MovieRow />
        <MovieRow />
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import MovieRow from "@/components/MovieRow.vue";

export default {
  name: "Home",
  components: {
    MovieRow
  }  
};
</script>

<style scoped>
  .popular-downloads-container{
    background-color: #1d1d1d;
    text-align: center;
  }
  .popular-downloads-wrapper{
    border-bottom: 1px solid rgba(255,255,255,0.2);
    color: #fff;
    width: 100%;
    margin-bottom: 20px;
    margin-top: 20px;
  }
  .latest-movies-container{
    background-color: #171717;
  }
</style>
