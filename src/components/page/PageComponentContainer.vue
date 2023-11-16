<template>
    <div class="full py-3 px-2 mb-4 border border-gray-400 rounded-md bg-gray-50 ">
        
       
        <template  v-if="TopComponent"  >
            <PageComponent :index="-1" @removeComponent="(index) => {removeComponent(index)}" :editable="editable"  :comp="TopComponent" ></PageComponent>
        </template>

            <Sortable ref="sortables"
            @update="onUpdate"
                :list="compList"
                item-key="id"
                tag="div"
                :options="{ delay: 1}"
                
                @end="(event: Sortable.SortableEvent) => { handleSortEnd(event)}"
                >
                <template #header>
                   
                </template>
                
                <template #item="{element, index}">
                    <PageComponent :index="index"  @removeComponent="(index) => {removeComponent(index)}" :editable="editable" class="cursor-move" :comp="element" :key="index"></PageComponent>
                </template>

                <template #footer>
                    
                </template>
                
            </Sortable>
            <template  v-if="BottomComponent"  >
                <PageComponent :index="9999999" @removeComponent="(index) => {removeComponent(index)}" :editable="editable"  :comp="BottomComponent" ></PageComponent>
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
        BottomComponent?:PC,
        editable:boolean
    }> ();

    const emit = defineEmits(['componentsChanged','propRemoved','removeComponentByIndex'])

    let compList:Array<PC>|undefined = props.PageComponents;
    const sortables = ref(null);
    const handleSortEnd = (event: Sortable.SortableEvent) => {
        console.log(event);
        //compList = compList ? compList : [];
        //let temp = compList[event.newIndex];
        //compList[event.newIndex] = compList[event.oldIndex];
        //nextTick(() => compList[event.oldIndex] = temp);
        
        //moveItemInArray(event.oldIndex, event.newIndex);
        //emit('componentsChanged', compList);
        
    }

    

    const onUpdate = (event:any) => {

        console.log(compList, event);
    }

    function removeComponent(index:any){
        
        if(index == -1){
            emit('propRemoved','top_component')
        } else if(index == 9999999){
            emit('propRemoved','bottom_component')
        } else {
            
           emit('removeComponentByIndex',index);
        }
        
    }
</script>