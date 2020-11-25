<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    html {
        font-family: 'Inter', sans-serif;
    }

    .app {
        display: flex;
        place-items: center;
        min-height: 100vh;
    }

    main {
        width: 90%;
        max-width: 900px;
        margin: 0 auto;
        background-color: #FFFFFF;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 20px 40px 0 rgba(0, 0, 0, 0.1);
        border: 1px solid rgba(0, 0, 0, 0.1);
    }

    section {
        display: flex;
        align-items: center;
        height: 80vh;
    }

    aside,
    article {
        height: 100%;
    }

    aside {
        position: relative;
        background: rgba(76,167,252, 0.08);
        max-width: 35%;
        min-width: 35%;
        border-right: 1px solid rgba(0, 0, 0, 0.1);
    }

    article {
        overflow: scroll;
    }

    ul {
        list-style: none;
    }

    li {
        padding: 24px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.05);
        cursor: pointer;
        transition: 150ms linear;
        display: flex;
        justify-content: space-between;
    }

    li span {
        background: #4C7BFC;
        border-radius: 100px;
        font-size: 12px;
        min-width: 30px;
        height: 20px;
        display: block;
        padding-top: 4px;
        color: #FFFFFF;
        text-align: center;
    }

    li:hover {
        background: #4C7BFC;
        color: #FFF;
    }

    .article {
        display: block;
        width: 100%;
        text-decoration: none;
        color: black;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        padding: 16px;
        transition: 150ms linear;
    }

    .article:hover {
        background: linear-gradient(-90deg, rgba(76,167,252, 0.1) 10%, transparent);
    }

    .article:visited {
        color: gray;
    }

    .active {
        background: #4C7BFC;
        color: #FFFFFF;
    }

    .active span {
        background: #FFF;
        color: #4C7BFC;
    }

    time {
        display: block;
        font-size: 12px;
        opacity: 0.3;
        margin-top: 2px;
        font-weight: 600;
    }

    header {
        font-size: 18px;
        line-height: 24px;
        font-weight: 600;
    }

    p {
        font-size: 13px;
        margin-top: 6px;
        line-height: 17px;
        opacity: 0.6;
    }

    button {
        position: absolute;
        bottom: 32px;
        left: 0;
        right: 0;
        margin: auto;
        background: #4C7BFC;
        font-family: inherit;
        font-size: 16px;
        border: 0;
        box-shadow: none;
        -webkit-appearance: none;
        padding: 15px 30px;
        border-radius: 100px;
        color: white;
        box-shadow: 0 10px 15px 0 rgba(76,167,252, 0.1);
        cursor: not-allowed;
        outline: 0;
    }

    .bar {
        display: block;
        width: 100%;
        padding: 10px 15px;
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    }

    .bar i {
        font-size: 0;
        width: 12px;
        height: 12px;
        display: inline-block;
        vertical-align: middle;
        background: rgba(0, 0, 0, 0.3);
        border-radius: 100px;
        margin-right: 8px;
        border: 1px solid rgba(0, 0, 0, 0.1);
    }
</style>

<div class="container">

    <div class="app" id="app">
        <main>
            <div class="bar">
                <i v-for="i in 3">{{ i }}</i>
            </div>
            <section>
                <aside>
                    <ul v-for="(item, index) in items">
                        <li :class="{ active: active === index }" @click="selectNews(index)" key="index">
                            {{ item.name }}
                            <span>{{ item.news.length }}</span>
                        </li>
                    </ul>

                    <button data-tip="Coming Soon">Add Feed -></button>
                </aside>
                <article>
                    <a target="_blank" class="article" v-for="article in getNews" :href="article.url || article.webUrl">
                        <header>
                            <span v-if="!article.webTitle">{{ article.title }}</span>
                            <span v-else>{{ article.webTitle }}</span>
                            <time>{{ formatDate(article.webPublicationDate || article.published_date) }}</time>
                        </header>

                        <p v-if="article.abstract">{{ article.abstract }}</p>
                    </a>
                </article>
            </section>
        </main>
    </div>

</div>

<script>
    const NYT_URL = `https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=8cbrJsMqn1Gx83nGwPVv2Vvviq1xvGHJ`;

    const GUARDIAN_URL = `https://content.guardianapis.com/search?q=world&api-key=02ca7bf7-26a7-4e9d-b238-1172dead0938`;

    new Vue({
        el: "#app",
        data: {
            items: [
                { id: 0, name: `New York Times`, news: [] },
                { id: 1, name: `The Guardian`, news: [] }
            ],
            getNews: [],
            active: 0
        },

        methods: {
            selectNews(i) {
                this.active = i;
                this.getNews = this.items[i].news;
            },

            formatDate(date) {
                const buildDate = new Date(date);

                return buildDate.toLocaleString("en-US", {
                    weekday: "short",
                    month: "long",
                    day: "2-digit",
                    year: "numeric",
                    hour: '2-digit',
                    minute:'2-digit',
                });
            }
        },

        created() {
            fetch(NYT_URL)
                .then((res) => res.json())
                .then((res) => {
                    this.items[0].news = res.results;
                    console.log(res.results);
                    this.getNews = this.items[0].news;
                })
                .catch((err) => console.log(err));

            fetch(GUARDIAN_URL)
                .then((res) => res.json())
                .then((res) => {
                    this.items[1].news = res.response.results;
                })
                .catch((err) => console.log(err));
        }
    });

</script>

</body>
</html>


