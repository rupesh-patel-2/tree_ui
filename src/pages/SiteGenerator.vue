<template>
    <div class="app-container h-screen w-full "  >
      <TopLayer > 
        <template #top>
            <TopNav></TopNav>
        </template>
        <template #right>
            <RightMenu></RightMenu>
        </template>
        <template #left> <span></span></template>
      </TopLayer>
      <BottomLayer >
       
        <SiteMapView  v-if="siteMapStore.currentView == 'sitemap'"></SiteMapView>
        <Wireframe v-if="siteMapStore.currentView == 'wireframe'"></Wireframe>
      </BottomLayer>
    </div>
  </template>
  
  <script lang="ts" setup>

  import TopLayer from '@/components/site_editor/TopLayer.vue';
  import BottomLayer from '@/components/site_editor/BottomLayer.vue';
  import TopNav from '@/components/site_editor/TopNav.vue';
  import RightMenu from '@/components/site_editor/RightMenu.vue';

  import SiteMapView from '@/components/site_editor/SiteMapView.vue' ;
  import Wireframe from '@/components/site_editor/Wireframe.vue';
  import { siteMap } from "@/stores/sitemap"
  import { siteMapJson } from '@/sitemapjson';
  


  const siteMapStore = siteMap();
  siteMapStore.setSiteMap(siteMapJson);

  </script>
  
  <style>
  .app-container {
    overflow-y: auto;
    -ms-overflow-style: none;  /* Internet Explorer 10+ */
    scrollbar-width: none;  /* Firefox */
}
.app-container::-webkit-scrollbar { 
    display: none;  /* Safari and Chrome */
}

  </style>
  