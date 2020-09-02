<template>
  <div id="app">
    <div class="md-layout md-alignment-center">
        <div class="logo-container md-layout-item md-size-100">
            <img class="cca-logo" alt="Vue logo" src="./assets/cca_logo.jpg">
        </div>
        <div class="md-layout-item md-size-100"> 
            <h1 class="cca-title">Code Crafters Afters</h1>
            <h3>El podcast de la comunidad</h3>
        </div>
        <div class="md-layout-item md-size-100 md-alignment-left">
            <h4>Episodios:</h4>
        </div>
        <div class="md-layout md-alignment-center">
            <div class="box md-elevation-3 md-layout-item md-size-70" v-for="episode in episodes" :key="episode.guid">
                <div class="md-layout">
                    <div class="md-layout-item md-size-20 md-xsmall-hide md-xlarge-size-15">
                        <a v-bind:href="episode.link" target="_blank"><img class="episode-image" src="./assets/cc_logo_play.jpg" /> </a>
                    </div>
                    <div class="texts md-layout">
                        <div class="episode-title md-layout-item md-size-100">
                            <p><a v-bind:href="episode.link" target="_blank"> {{ episode.title }}</a></p>
                        </div>
                        <div class="episode-desc md-layout-item md-size-100 md-small-hide">
                            {{ episode.contentSnippet }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </div>
</template>

<script>
import Parser from 'rss-parser'
const parser = new Parser();

export default {
  name: 'App',
  data () {
      return {
          episodes: []
      }
  },
  async created () {
      var feed = await parser.parseURL('https://anchor.fm/s/13ec49d4/podcast/rss');
      this.episodes = feed.items;
  }
}
</script>

<style>
#app {
    font-family: Roboto;
    font-optical-sizing: 2px;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 15px;
}

.cca-title {
    font-weight: bold;
}

.cca-logo {
    width: 30%;
}

.episode-image {
    border-radius: 1rem;
}

.box {
    background-color: #382a50;
    border-radius: 1rem;
    text-align: left;
    padding: 10px;
    margin-bottom: 20px;
}

.texts {
    padding-left: 15px;
}

.episode-title a:link {
    font-weight: bold;
    font-size: 1.2rem;
    color: white;
}

.episode-desc {
    font-size: 0.9rem;
    color:thistle;
}

a:link,
a:visited,
a:hover,
a:active {
  text-decoration: none; 
  color: white;
}

@media (max-width: 700px) {
    .cca-logo {
        width: 70%;
    }
}
</style>
