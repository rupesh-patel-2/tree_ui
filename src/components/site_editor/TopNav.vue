
import { log } from 'console';

import { viewDepthKey } from 'vue-router';
<template>
    <div class="flex pt-3">
        <div class="w-1/3"></div>
        
        <!-- Middle section -->
        <div class="w-1/3 flex justify-center">
            <ul class="hidden p-1 w-[200px] text-sm font-medium text-center text-gray-500 divide-x divide-gray-200 rounded-lg shadow sm:flex ">
                <li class="w-full" @click="()=>{changeView('sitemap')}">
                    <a v-if="siteMapStore.currentView == 'sitemap'" href="#" 
                    class="inline-block w-full p-2 text-gray-900 bg-gray-100 rounded-l-lg focus:ring-1 focus:ring-blue-300  focus:outline-none dark:bg-gray-700 dark:text-white" aria-current="page">
                        Site Map
                    </a>
                    <a v-else href="#" 
                    class="inline-block w-full p-2 bg-white rounded-l-lg hover:text-gray-700 hover:bg-gray-50 focus:ring-1 focus:outline-none focus:ring-blue-300">
                        Site Map
                    </a>
                </li>
                
                <li class="w-full" @click="()=>{changeView('wireframe')}" >
                    <a v-if="siteMapStore.currentView == 'wireframe'" href="#" 
                    class="inline-block w-full p-2 text-gray-900 bg-gray-100 rounded-l-lg focus:ring-1 focus:ring-blue-300  focus:outline-none dark:bg-gray-700 dark:text-white" aria-current="page">
                        Wireframe
                    </a>
                    <a v-else href="#" 
                    class="inline-block w-full p-2 bg-white rounded-r-lg hover:text-gray-700 hover:bg-gray-50 focus:ring-1 focus:outline-none focus:ring-blue-300">
                        Wireframe 
                    </a>
                    <button class="w-0" ><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16"><path fill="currentColor" d="M14.4 7.6v.8a.4.4 0 0 1-.4.4H8.8V14a.4.4 0 0 1-.4.4h-.8a.4.4 0 0 1-.4-.4V8.8H2a.4.4 0 0 1-.4-.4v-.8c0-.22.18-.4.4-.4h5.2V2c0-.22.18-.4.4-.4h.8c.22 0 .4.18.4.4v5.2H14c.22 0 .4.18.4.4Z"></path></svg></button>
                </li>
            </ul>
        </div>


        <div class="w-1/3">
            
        </div>
    </div>
</template>
<script lang="ts" setup>
    

    import { siteMap } from "@/stores/sitemap"

    const siteMapStore = siteMap();

    const changeView = (view:string) =>{
        
        siteMapStore.changeView(view);
        console.log(siteMapStore.currentView);
    }
</script>