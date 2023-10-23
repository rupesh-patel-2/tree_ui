<script setup lang="ts">
import Zoomer from '@/components/Zoomer.vue'
import SitePageTree from '@/components/SitePageTree.vue'
import { TreeNode } from '@/types/TreeTypes';

// useRoute, useHead, and HelloWorld are automatically imported. See vite.config.ts for details.
const route = useRoute()

useHead({
  title: route.meta.title,
  meta: [
    {
      property: 'og:title',
      content: route.meta.title,
    },
    {
      name: 'twitter:title',
      content: route.meta.title,
    },
  ],
})

const BUILD_DATE = import.meta.env.VITE_APP_BUILD_EPOCH
  ? new Date(Number(import.meta.env.VITE_APP_BUILD_EPOCH))
  : undefined
const thisYear = new Date().getFullYear()

let siteMap:TreeNode = {
  name: "Home Page", 
  id: 1,
  components: [
    
    {name:"container", 'description' : "I have your page dynamic content"},
    {name:"container2", 'description' : "I have your page dynamic content"},
    {name:"container3", 'description' : "I have your page dynamic content"},
    {name:"container4", 'description' : "I have your page dynamic content"},
    
  ],
  top_component : {name:"header", 'description' : "I contain the logo and nav bar"},
  bottom_component : {name:"footer", 'description' : "I am your page footer"},
    
    children: [
      {
        name: "About Us", 
        id: 2,
      },
      {
        name: "Contact Us", 
        id: 3,
      },
      
      {
        name: "Cart", 
        id: 3,
        children: [
          {
            name: "Shipping", 
            id: 4,
            
          },
          {
            name: "Payment", 
            id: 5,
          },
          {
            name: "Checkout", 
            id: 6,
          },
        ]
      }
    ]
  }

  const handleChangeInTree = (tNode:TreeNode) => {
    console.log(tNode, "Seeing change from root page");
    siteMap = tNode;
  }

  const downloadJson = () => {
    let dataStr = "data:text/json;charset=utf-8," + encodeURIComponent(JSON.stringify(siteMap));
    let dlAnchorElem = document.getElementById('downloadAnchorElem');
    if(dlAnchorElem) {
      dlAnchorElem.setAttribute("href",     dataStr     );
      dlAnchorElem.setAttribute("download", "site_map.json");
      dlAnchorElem.click();
    }
  } 

</script>



<template>
  <div class="relative py-8">
    
    <div class="body min-h-screen genealogy-body  absolute inset-0 container relative  mx-auto bg-white shadow-xl shadow-slate-700/10 ring-1 ring-gray-900/5 
    bg-[url(/img/grid.svg)] bg-top " >
    <Zoomer>
      <div class="">
        <div class="genealogy-tree">
          <ul class="tree">
          <SitePageTree :node="siteMap" 
          @changeInTree="handleChangeInTree" >
          </SitePageTree>
        </ul>
        </div>
      </div>
    </Zoomer>

    
    
    </div>

    <div class="action flex flex-row-reverse">
      <a id="downloadAnchorElem" style="display:none"></a>
      <button type="button" @click="downloadJson"
        class="text-white bg-yellow-400 hover:bg-yellow-500 focus:outline-none focus:ring-4 focus:ring-yellow-300 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:focus:ring-yellow-900">
        Download Json
      </button>
    </div>
  
    <footer class="py-6 text-sm text-center text-gray-700">
        <p>
          Site Editor by
          <a class="underline" href="">@Rupesh</a> &copy; 2022-{{
            thisYear
          }}.
          <template v-if="BUILD_DATE"> Site built {{ BUILD_DATE.toLocaleDateString() }}. </template>
          <template v-else> Development mode. </template>
        </p>
      </footer>
  </div>
</template>
