(function(){let e=document.createElement(`link`).relList;if(e&&e.supports&&e.supports(`modulepreload`))return;for(let e of document.querySelectorAll(`link[rel="modulepreload"]`))n(e);new MutationObserver(e=>{for(let t of e)if(t.type===`childList`)for(let e of t.addedNodes)e.tagName===`LINK`&&e.rel===`modulepreload`&&n(e)}).observe(document,{childList:!0,subtree:!0});function t(e){let t={};return e.integrity&&(t.integrity=e.integrity),e.referrerPolicy&&(t.referrerPolicy=e.referrerPolicy),e.crossOrigin===`use-credentials`?t.credentials=`include`:e.crossOrigin===`anonymous`?t.credentials=`omit`:t.credentials=`same-origin`,t}function n(e){if(e.ep)return;e.ep=!0;let n=t(e);fetch(e.href,n)}})();function e(){document.body.insertAdjacentHTML(`afterbegin`,`
    <header class="header">
      <a href="index.html" class="header-title">D.E.A.R</a>
      <button class="more-nav-button" aria-label="Toggle navigation">☰</button>
      <nav class="navbar">
        <ul class="nav-list">
          <li class="nav-item"><a href="index.html">Home</a></li>
          <li class="nav-item"><a href="podcasts.html">Podcasts</a></li>
          <li class="nav-item"><a href="about.html">About</a></li>
        </ul>
      </nav>
    </header>
  `);let e=document.querySelector(`.more-nav-button`),t=document.querySelector(`.navbar`);e.addEventListener(`click`,()=>{t.classList.toggle(`open`)})}function t(){document.body.insertAdjacentHTML(`beforeend`,`
    <footer>
      <ul class="footer-list">
        <li>
          <h2 class="footer-toggle" aria-expanded="false">Home <span class="footer-chevron">▼</span></h2>
          <ul class="footer-menu">
            <li><a href="index.html#intro">What is that?</a></li>
            <li><a href="index.html#latest">Latest Podcasts</a></li>
            <li><a href="index.html#categories">Categories</a></li>
          </ul>
        </li>
        <li>
          <h2 class="footer-toggle" aria-expanded="false">Podcasts <span class="footer-chevron">▼</span></h2>
          <ul class="footer-menu">
            <li><a href="podcasts.html">All Podcasts</a></li>
          </ul>
        </li>
        <li>
          <h2 class="footer-toggle" aria-expanded="false">About <span class="footer-chevron">▼</span></h2>
          <ul class="footer-menu">
            <li><a href="about.html">About this project</a></li>
            <li><a href="about.html#contact">Contact Form</a></li>
          </ul>
        </li>
      </ul>
    </footer>
  `),document.querySelectorAll(`.footer-toggle`).forEach(e=>{e.addEventListener(`click`,()=>{let t=e.nextElementSibling,n=e.getAttribute(`aria-expanded`)===`true`;e.setAttribute(`aria-expanded`,!n),t.classList.toggle(`open`)})})}function n(){document.querySelectorAll(`.expand-btn`).forEach(e=>{e.addEventListener(`click`,()=>{let t=e.parentElement;for(;t;){let e=t.querySelector(`.expandable-text`);if(e){e.classList.toggle(`expanded`);break}t=t.parentElement}})})}function r(){throw Error(`Supabase not configured. Add VITE_SUPABASE_URL and VITE_SUPABASE_ANON_KEY to .env`)}async function i(e=null){r();let t=null.from(`podcasts`).select(`
      *,
      categories (name),
      podcast_presenters (
        presenters (id, name, photo_url, bio)
      )
    `).order(`published_at`,{ascending:!1});e&&(t=t.limit(e));let{data:n,error:i}=await t;if(i)throw i;return n}async function a(e){r();let{data:t,error:n}=await null.from(`podcasts`).select(`
      *,
      categories (name),
      podcast_presenters (
        presenters (id, name, photo_url, bio)
      )
    `).eq(`id`,e).single();if(n)throw n;return t}async function o(){r();let{data:e,error:t}=await null.from(`categories`).select(`*`).order(`name`);if(t)throw t;return e}async function s(e){r();let{data:t,error:n}=await null.from(`podcasts`).select(`
      *,
      categories (name),
      podcast_presenters (
        presenters (id, name, photo_url, bio)
      )
    `).or(`title.ilike.%${e.replace(/[\-\\%_]/g,`\\$&`)}%,description.ilike.%${e.replace(/[\-\\%_]/g,`\\$&`)}%`).order(`published_at`,{ascending:!1});if(n)throw n;return t}async function c({name:e,email:t,subject:n,message:i,company:a}){r();let{data:o,error:s}=await null.functions.invoke(`contact`,{body:{name:e,email:t,subject:n,message:i,company:a}});if(s)throw s;return o}async function l(e,t=3){try{let n=await i(t);if(e.innerHTML=``,n.length===0){e.innerHTML=`<p class="loading-text">No podcasts yet.</p>`;return}n.forEach(t=>{let n=document.createElement(`a`);n.href=`podcast-detail.html?id=${t.id}`,n.className=`podcast-card`,n.innerHTML=`
        <img class="podcast-cover" src="${t.cover_url||``}" alt="${t.title}" />
        <div class="podcast-card-content">
          <h3 class="podcast-card-title">${t.title}</h3>
          <p class="podcast-card-description">${t.description}</p>
        </div>
      `,e.appendChild(n)})}catch(t){e.innerHTML=`<p class="loading-text">Error loading podcasts: ${t.message}</p>`}}async function u(e){try{let t=await o();if(e.innerHTML=``,t.length===0){e.innerHTML=`<p class="loading-text">No categories yet.</p>`;return}t.forEach(t=>{let n=document.createElement(`div`);n.className=`category-card`,n.innerHTML=`
        <h3>${t.name}</h3>
        <a href="podcasts.html?category=${t.id}">View podcasts →</a>
      `,e.appendChild(n)})}catch(t){e.innerHTML=`<p class="loading-text">Error loading categories: ${t.message}</p>`}}var d=[],f=`newest`;async function p(){let e=document.getElementById(`filter-buttons`),t=document.getElementById(`podcasts-grid`);if(!(!e||!t))try{let[n,r]=await Promise.all([o(),i()]);d=r,n.forEach(t=>{let n=document.createElement(`button`);n.className=`filter-btn`,n.dataset.category=t.id,n.textContent=t.name,n.addEventListener(`click`,()=>m(t.id,n)),e.appendChild(n)});let a=e.querySelector(`[data-category="all"]`);a&&(a.addEventListener(`click`,()=>m(`all`,a)),h(r,t));let s=document.getElementById(`sort-toggle`);s&&s.addEventListener(`click`,()=>{f=f===`newest`?`oldest`:`newest`,s.textContent=f===`newest`?`Newest first`:`Oldest first`,s.classList.toggle(`active`,f===`oldest`);let e=document.querySelector(`.filter-btn.active`);m(e?e.dataset.category:`all`,e)}),window.addEventListener(`search-clear`,()=>{let e=document.querySelector(`.filter-btn.active`);m(e?e.dataset.category:`all`,e)})}catch(e){t.innerHTML=`<p class="loading-text">Error: ${e.message}</p>`}}function m(e,t){document.querySelectorAll(`.filter-btn`).forEach(e=>e.classList.remove(`active`)),t&&t.classList.add(`active`);let n=document.getElementById(`podcasts-grid`),r;r=e===`all`?[...d]:d.filter(t=>t.category_id===e),r.sort((e,t)=>{let n=new Date(e.published_at).getTime(),r=new Date(t.published_at).getTime();return f===`newest`?r-n:n-r}),h(r,n)}function h(e,t){if(t.innerHTML=``,e.length===0){t.innerHTML=`<p class="loading-text">No podcasts found.</p>`;return}e.forEach(e=>{let n=document.createElement(`a`);n.href=`podcast-detail.html?id=${e.id}`,n.className=`podcast-card`,n.dataset.category=e.category_id,n.innerHTML=`
      <img class="podcast-cover" src="${e.cover_url||``}" alt="${e.title}" />
      <div class="podcast-card-content">
        <h3 class="podcast-card-title">${e.title}</h3>
        <p class="podcast-card-description">${e.description}</p>
      </div>
    `,t.appendChild(n)})}var g=null;function _(){let e=document.getElementById(`search-input`),t=document.getElementById(`podcasts-grid`);!e||!t||e.addEventListener(`input`,e=>{clearTimeout(g),g=setTimeout(()=>{let n=e.target.value.trim();if(n.length===0){window.location.hash=``,window.dispatchEvent(new CustomEvent(`search-clear`));return}v(n,t)},300)})}async function v(e,t){t.innerHTML=`<p class="loading-text">Searching...</p>`;try{let n=await s(e);if(t.innerHTML=``,n.length===0){t.innerHTML=`<p class="loading-text">No results found.</p>`;return}n.forEach(e=>{let n=document.createElement(`a`);n.href=`podcast-detail.html?id=${e.id}`,n.className=`podcast-card`,n.innerHTML=`
        <img class="podcast-cover" src="${e.cover_url||``}" alt="${e.title}" />
        <div class="podcast-card-content">
          <h3 class="podcast-card-title">${e.title}</h3>
          <p class="podcast-card-description">${e.description}</p>
        </div>
      `,t.appendChild(n)})}catch(e){t.innerHTML=`<p class="loading-text">Error: ${e.message}</p>`}}async function y(){let e=document.getElementById(`podcast-detail`);if(!e)return;let t=new URLSearchParams(window.location.search).get(`id`);if(!t){e.innerHTML=`<p class="loading-text">No podcast selected.</p>`;return}try{b(await a(t),e)}catch(t){e.innerHTML=`<p class="loading-text">Error: ${t.message}</p>`}}function b(e,t){let n=e.podcast_presenters?.map(e=>e.presenters).filter(Boolean)||[];t.innerHTML=`
    <img class="detail-cover" src="${e.cover_url||``}" alt="${e.title}" />

    <h1 class="detail-title">${e.title}</h1>
    <p class="detail-meta">
      ${e.categories?.name||``}
      ${e.duration?` • ${T(e.duration)}`:``}
    </p>

    <div class="detail-description">
      <p>${e.description}</p>
    </div>

    ${e.transcription?`
      <section class="detail-transcription">
        <h2>Transcription</h2>
        <div class="transcription-text">${S(e.transcription)}</div>
      </section>
    `:``}

    ${e.audio_url?`
      <section class="detail-audio">
        <audio controls src="${e.audio_url}"></audio>
      </section>
    `:``}

    ${n.length>0?`
      <section class="detail-presenter">
        <h2>Presenter${n.length>1?`s`:``}</h2>
        ${n.map(x).join(``)}
      </section>
    `:``}
  `,C(t.querySelector(`audio`),t.querySelector(`.transcription-text`))}function x(e){return`
    <div class="presenter-card">
      ${e.photo_url?`<img class="presenter-photo" src="${e.photo_url}" alt="${e.name}" />`:``}
      <div>
        <p class="presenter-name">${e.name}</p>
        ${e.bio?`<p class="presenter-bio">${e.bio}</p>`:``}
      </div>
    </div>
  `}function S(e){return e.replace(/\[([0-9]{2}:[0-9]{2})\]/g,`<span class="timestamp" data-time="$1">[$1]</span>`)}function C(e,t){if(!e||!t)return;let n=Array.from(t.querySelectorAll(`.timestamp`)).map(e=>({el:e,time:w(e.dataset.time)})).sort((e,t)=>e.time-t.time);if(n.length===0)return;let r=-1;e.addEventListener(`timeupdate`,()=>{let t=e.currentTime,i=-1;for(let e=n.length-1;e>=0;e--)if(t>=n[e].time){i=e;break}i!==r&&(r>=0&&(n[r].el.classList.remove(`active`),n[r].el.classList.remove(`pause`)),r=i,r>=0&&(e.paused?n[r].el.classList.add(`pause`):n[r].el.classList.add(`active`),n[r].el.scrollIntoView({behavior:`smooth`,block:`center`})))}),e.addEventListener(`pause`,()=>{r>=0&&(n[r].el.classList.remove(`active`),n[r].el.classList.add(`pause`))}),e.addEventListener(`play`,()=>{r>=0&&(n[r].el.classList.remove(`pause`),n[r].el.classList.add(`active`))}),e.addEventListener(`ended`,()=>{r>=0&&(n[r].el.classList.remove(`active`),r=-1)}),e.addEventListener(`seeking`,()=>{r>=0&&(n[r].el.classList.remove(`active`),n[r].el.classList.remove(`pause`),r=-1)}),n.forEach(t=>{t.el.addEventListener(`click`,()=>{e.currentTime=t.time,e.play().catch(()=>{})})})}function w(e){let t=e.split(`:`);return parseInt(t[0])*60+parseInt(t[1])}function T(e){if(!e)return``;let t=e.match(/(\d+) days? (\d+):(\d+):(\d+)/);if(t){let e=parseInt(t[2]),n=parseInt(t[3]),r=parseInt(t[4]);return e>0?`${e}h ${n}m`:`${n}m ${r}s`}return e}var E=/^[^\s@]+@[^\s@]+\.[^\s@]+$/;function D(e){let t=e.querySelector(`.form-status`),n=e.querySelector(`.submit-btn`);e.addEventListener(`submit`,async r=>{r.preventDefault();let i=new FormData(e),a=(i.get(`name`)??``).toString().trim(),o=(i.get(`email`)??``).toString().trim(),s=(i.get(`subject`)??``).toString(),l=(i.get(`message`)??``).toString().trim(),u=(i.get(`company`)??``).toString();if(!a||!o||!s||!l){O(t,`Please fill in all fields.`,`is-error`);return}if(!E.test(o)){O(t,`Please enter a valid email address.`,`is-error`);return}k(n,!0),O(t,`Sending…`,``);try{await c({name:a,email:o,subject:s,message:l,company:u}),e.reset(),O(t,`Thanks! Your message has been sent.`,`is-success`)}catch{O(t,`Something went wrong. Please try again later.`,`is-error`)}finally{k(n,!1)}})}function O(e,t,n){e.textContent=t,e.className=`form-status`,n&&e.classList.add(n)}function k(e,t){e.disabled=t,e.textContent=t?`Sending…`:`Send`}e(),t(),n(),document.getElementById(`latest-podcasts`)&&l(document.getElementById(`latest-podcasts`)),document.getElementById(`categories-list`)&&u(document.getElementById(`categories-list`)),document.getElementById(`podcasts-grid`)&&(p(),_()),document.getElementById(`podcast-detail`)&&y();var A=document.querySelector(`.contact-form`);A&&D(A);