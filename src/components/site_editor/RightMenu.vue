<template>
    <div>
        <div class="flex w-[400px] flex-row-reverse" :style="{ pointerEvents: 'auto' }">
            <div class="w-1/5 h-full item-center">
                <div class="flex flex-col h-[500px] items-center justify-center" :style="{ pointerEvents: 'auto' }">
                    <div class="flex flex-col" v-if="siteMapStore.showComponentEditor" :style="{ pointerEvents: 'auto' }">
                        <button class="p-2 border rounded-md bg-blue-200"  @click="showMenuItem('addComp')" :style="{ pointerEvents: 'auto' }"  ><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 16 16"><path fill="currentColor" d="M14.4 7.6v.8a.4.4 0 0 1-.4.4H8.8V14a.4.4 0 0 1-.4.4h-.8a.4.4 0 0 1-.4-.4V8.8H2a.4.4 0 0 1-.4-.4v-.8c0-.22.18-.4.4-.4h5.2V2c0-.22.18-.4.4-.4h.8c.22 0 .4.18.4.4v5.2H14c.22 0 .4.18.4.4Z"></path></svg></button>
                        <button class="p-2 border rounded-md bg-blue-200"   @click="showMenuItem('editPage')"  :style="{ pointerEvents: 'auto' }">edit</button>
                    </div>
                </div>
            </div>
            <div>
                
                <div   v-show="editorVisible" id="page_editor" class=" border rounded-md mr-5" :style="{ pointerEvents: 'auto' }">
                        
                </div>
                <div v-show="addCompVisible"  id="component_adder" class=" border rounded-md mr-5" :style="{ pointerEvents: 'auto' }">
                    
                </div>
            </div>
            
        </div>
    </div>
</template>

<script lang="ts" setup>
import { siteMap } from '@/stores/sitemap';

const siteMapStore = siteMap();
const editorVisible = ref(false);
const addCompVisible = ref(false);


const showMenuItem = (showItem:string) => {
    
    editorVisible.value = false;
    addCompVisible.value = false;
    if(showItem == 'addComp'){
        addCompVisible.value = true;
    }
    
    if(showItem == 'editPage') {
        
        editorVisible.value = true;
    }
    

}

</script>