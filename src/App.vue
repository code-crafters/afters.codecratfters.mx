<template>
  <div id="app">
    <div class="horizontal-align container">
        <div class="logo-container">
            <img class="cca-logo" alt="Vue logo" src="./assets/cca_logo.jpg">
        </div>
        <h1 class="cca-title">Code Crafters Afters: El podcast de la comunidad</h1>
        <h3>Lista de episodios:</h3>
        <div class="box" v-for="episode in episodes" :key="episode.guid">
            <div>
                <a v-bind:href="episode.link" target="_blank"><img class="episode-image" src="./assets/cc_logo_play.jpg" /> </a>
            </div>
            <div class="texts">
                <div class="episode-title">
                    <p><a v-bind:href="episode.link" target="_blank"> {{ episode.title }}</a></p>
                </div>
                <div class="episode-desc">
                    {{ episode.contentSnippet }}
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
      this.episodes = await parser.parseURL('https://anchor.fm/s/13ec49d4/podcast/rss');
  }
}
</script>

<style>
#app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    margin-top: 15px;
}

.cca-title {
    font-weight: bold;
}

.container {
    text-align: center;
    margin-left: auto;
    margin-right: auto;
    display: block;
}

.horizontal-align {
    text-align: center;
    max-width: 70%;
}

.cca-logo {
    width: 40%;
}

.episode-image {
    width: 15%;
    border-radius: 1rem;
    float: left;
}

.box {
    background-color: #382a50;
    border-radius: 1rem;
    text-align: left;
    padding: 15px;
    margin-bottom: 20px;
    float: left;
    clear: both;
    width: 100%;
}

.texts {
    padding-left: 15px;
    float: left;
}

.episode-title a:link {
    font-weight: bold;
    font-size: 1rem;
    color: white;
}

.episode-desc {
    float: left;
    font-size: 0.9rem;
    color:thistle;
    max-width: 800px;
}

a:link,
a:visited,
a:hover,
a:active {
  text-decoration: none; 
  color: white;
}

@media (max-width: 1024px) {
    .cca-logo {
        width: 70%;
    }
    .episode-desc {
        display: none;
    }
}

@media (max-width: 700px) {
    .cca-logo {
        width: 100%;
    }
    .episode-image {
        display: none;
    }
    .episode-desc {
        display: none;
    }
}


</style>
