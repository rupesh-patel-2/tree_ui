<template>
    <div  class="relative w-full min-h-[900px]  z-1 " @click="clickHandler">
      
      <slot>
        <p class="text-gray-600">Your Scrollable Content</p>
      </slot>
      
    </div>
  </template>
  
  <script lang="ts" setup>
    import { siteMap } from '@/stores/sitemap';
    const siteMapStore = siteMap();

   const clickHandler = (event:any) => {
      if(event.target == event.currentTarget || event.target.classList.contains('tree')){
        siteMapStore.setShowComponentEditor(false);
      }
   }
  
  </script>
  
  <style scoped>
  /* Add any component-specific styles here */
  </style>