
<template>
    <div class="body h-auto min-h-[1500px] genealogy-body    container relative ">
        <Zoomer>
            <div class="genealogy-tree pt-20 justify-center flex items-center">
                <ul class="tree">
                    <SitePageTree @changeInTree="handleChangeInTree"  :node="siteMapStore.siteMapJson" ></SitePageTree>
                </ul>
            </div>
        </Zoomer>
    </div>
</template>

<script lang="ts" setup>
    import SitePageTree from '@/components/SitePageTree.vue'
    import { siteMap } from "@/stores/sitemap"
    import Zoomer from '@/components/Zoomer.vue'
    
    const siteMapStore = siteMap();
    const handleChangeInTree = (tree:any) => {
        
        siteMapStore.setSiteMap(tree);
    }
</script>