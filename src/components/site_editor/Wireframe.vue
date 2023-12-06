<template>
    <div>  
        <div class="body h-auto min-h-[1500px] genealogy-body    container relative " style="white-space: inherit;">
        <Zoomer>
            <div class="   max-w-screen pt-20 mx-10">
                <div style="" class=" flex    ">
                    <RenderedPage class="shrink-0 ml-2" v-for="page in pages" :page="page"></RenderedPage>
                </div>
            </div>
        </Zoomer>
</div>
    </div>
</template>

<script lang="ts" setup>
    import { siteMap } from '@/stores/sitemap';
    import RenderedPage from './RenderedPage.vue';
    import Zoomer from '@/components/Zoomer.vue'

    const siteMapStore = siteMap();

    const pages = ref<Array<any>>([]);

    const retrievePages = (node:any ) => {
        pages.value.push(node)
        if(node.children){
            for(let i in node.children){
                retrievePages(node.children[i])
            }
        }
    }
    retrievePages(siteMapStore.siteMapJson);
    
</script>