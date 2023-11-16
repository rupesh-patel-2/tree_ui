
<template>
    
    <div class="genealogy-tree pt-20">
        <ul class="tree">
            <SitePageTree @changeInTree="handleChangeInTree"  :node="siteMapStore.siteMapJson" ></SitePageTree>
        </ul>
    </div>
</template>

<script lang="ts" setup>
    import SitePageTree from '@/components/SitePageTree.vue'
    import { siteMap } from "@/stores/sitemap"
    
    const siteMapStore = siteMap();
    const handleChangeInTree = (tree:any) => {
        
        siteMapStore.setSiteMap(tree);
    }
</script>