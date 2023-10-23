<template>
    <div class="full py-3 px-2 mb-4 border border-gray-400 rounded-md bg-gray-50 ">
        
       
        <template  v-if="TopComponent"  >
            <PageComponent   :comp="TopComponent" ></PageComponent>
        </template>

            <Sortable ref="sortables"
                :list="compList"
                item-key="id"
                tag="div"
                :options="{ delay: 1}"
                @end="(event: Sortable.SortableEvent) => { handleSortEnd(event)}"
                >
                <template #header>
                   
                </template>
                
                <template #item="{element, index}">
                    <PageComponent   class="cursor-move" :comp="element" :key="index"></PageComponent>
                </template>

                <template #footer>
                    
                </template>
                
            </Sortable>
            <template  v-if="BottomComponent"  >
                <PageComponent   :comp="BottomComponent" ></PageComponent>
            </template>
        
    </div>
</template>
<script lang="ts" setup>
    import PageComponent from './PageComponent.vue';
    import { Sortable } from "sortablejs-vue3";
    import { PageComponent as PC } from '@/types/TreeTypes';
    
    const props = defineProps<{
        PageComponents?: Array<PC>
        TopComponent?:PC,
        BottomComponent?:PC
    }> ();

    const emit = defineEmits(['componentsChanged'])

    let compList:Array<PC>|undefined = props.PageComponents;
    const sortables = ref(null);
    const handleSortEnd = (event: Sortable.SortableEvent) => {
        compList = compList ? compList : [];
        let temp = compList[event.newIndex];
        compList[event.newIndex] = compList[event.oldIndex];
        compList[event.oldIndex] = temp;
        emit('componentsChanged', compList);
    }
</script>