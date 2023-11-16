<template>
    <div>  
        <div class="   mx-10">
            <div style="overflow-x: scroll; width: 5000px;" class="   items-stretch">
                <RenderedPage v-for="page in pages" :page="page"></RenderedPage>
            </div>
        </div>
    </div>
</template>

<script lang="ts" setup>
    import { siteMap } from '@/stores/sitemap';
    import RenderedPage from './RenderedPage.vue';

    const siteMapStore = siteMap();

    const pages = ref<Array<any>>([]);

    const retrivePages = (node:any ) => {
        pages.value.push(node)
        if(node.children){
            for(let i in node.children){
                 retrivePages(node.children[i])
            }
        }
    }

    retrivePages(siteMapStore.siteMapJson);
    
</script>