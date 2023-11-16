<template>
    <li>
        <a href="javascript:void(0);" :class="editDrawerOpen ? 'ring-blue-300 ring-2' : '' " class=" focus:ring-2 focus:ring-blue-300">
            <div class="member-view-box  ">
                
                    
                <div class="member-details">
                    <h3 @click="selectPage" class="cursor-pointer">{{ node.name }} </h3> 
                </div>
                <PageComponentContainer 
                    :TopComponent="props.node.top_component" 
                    :BottomComponent="props.node.bottom_component" 
                    :PageComponents="$props.node.components"
                    @componentsChanged="handleCompChange"
                    :editable="false"
                    @removeComponentByIndex="removeComponentByIndex"
                    >
                </PageComponentContainer>
                
            </div>
            <div class="flex justify-center">
                <RoundedPlus @click="addNewChild"></RoundedPlus>
            </div>
        </a>
   
        
        <ul v-if="node.children">
            <li v-for="(childNode,nodeInd) in node.children">
                <SitePageTree
                    @changeInTree="(tNode:TreeNode) => { handleChangeInTree(tNode,nodeInd) }"
                    :key="childNode.id"
                    :node="childNode"
                ></SitePageTree>
            </li>
        </ul>
        <Teleport v-if="editDrawerOpen && siteMapStore.showComponentEditor" to="#page_editor">
            <div class="w-[300px] h-[450px] overflow-y-scroll">    
               
                    

                    <div>
                    <form>
                        <br/>
                        <div class="relative z-0 w-full mb-6 group">
                            <input  type="text" v-model="node.name"  class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
                            
                        </div>
                        
                        <div>
                            <PageComponentContainer v-if="editDrawerOpen" 
                                :TopComponent="props.node.top_component" 
                                :BottomComponent="props.node.bottom_component" 
                                :PageComponents="$props.node.components"
                                @componentsChanged="handleCompChange"
                                @propRemoved="handlePropRemoved"
                                @removeComponentByIndex="removeComponentByIndex"
                                :editable="true"
                                >
                            </PageComponentContainer>
                        </div>
                        
                    </form>
                    
                    </div>
                    
            </div>
        </Teleport>
        
        <Teleport v-if="addNewCompOpen && siteMapStore.showComponentEditor" to="#component_adder">
            <div class="w-[300px] h-[450px] overflow-y-scroll">    
               
                    
                Here we will add 
                    
                    
            </div>
        </Teleport>

    </li>
</template>

<script lang="ts" setup>
import { PropType } from 'vue';
import PageComponentContainer from '@/components/page/PageComponentContainer.vue';
import { RoundedPlus } from '@/components/icons'
import { TreeNode, PageComponent as PC } from '@/types/TreeTypes'
import { onClickOutside } from '@vueuse/core'
import { siteMap } from '@/stores/sitemap';
const siteMapStore = siteMap();
const target = ref(null);
const props = defineProps({
  node: {
    type: Object as PropType<TreeNode>,
    required: true,
  },
});
onClickOutside(target, (event) => console.log(event))
let node = ref(props.node);
const editDrawerOpen = ref(false);
const addNewCompOpen = ref(false);
watch(() => props.node, (newValue) => {
      node.value = newValue;

    });

watch(
    () => siteMapStore.showComponentEditor,
    () => {
        
        if(siteMapStore.showComponentEditor == false){
            editDrawerOpen.value = false;
            addNewCompOpen.value = false;
        }
      console.log('isLoggedIn state changed, do something!')
});

const selectPage = () => {
    siteMapStore.setShowComponentEditor(false)
    
    nextTick(()=>{
        editDrawerOpen.value = true;
        addNewCompOpen.value = true;
        siteMapStore.setShowComponentEditor(true);
    })
}

const emit = defineEmits(['changeInTree','editPage']);
const handleCompChange = ( changedComponents:Array<PC> ) => {
    node.value.components = changedComponents;
    emit('changeInTree',node.value);
}
const handleChangeInTree = (tNode:TreeNode,nodeInex:number) => {
    if(node.value.children){
        node.value.children[nodeInex] = tNode;
    }
    emit('changeInTree',node.value);
}

const handlePropRemoved = (propName:any)=>{
    
    if(propName == 'bottom_component')
        delete  node.value.bottom_component;
    else if( propName == 'top_component')
        delete  node.value.top_component;

    emit('changeInTree',node.value);
}

const removeComponentByIndex = (index:number) => {
    
    node.value.components?.splice(index,1);
   
    emit('changeInTree',node.value);
}

const addNewChild = () => {
    node.value.children = node.value.children ? node.value.children : []
    node.value.children?.push({
        id: new Date().getTime(),
        name: "New Page"
    })
    //node.value.children = []; 
    //node.value  = JSON.parse(JSON.stringify(node.value));
}



</script>


<style>

/*----------------genealogy-scroll----------*/

.genealogy-scroll::-webkit-scrollbar {
    width: 5px;
    height: 8px;
}
.genealogy-scroll::-webkit-scrollbar-track {
    border-radius: 10px;
    background-color: #e4e4e4;
}
.genealogy-scroll::-webkit-scrollbar-thumb {
    background: #212121;
    border-radius: 10px;
    transition: 0.5s;
}
.genealogy-scroll::-webkit-scrollbar-thumb:hover {
    background: #d5b14c;
    transition: 0.5s;
}


/*----------------genealogy-tree----------*/
.genealogy-body{
    white-space: nowrap;
    overflow: hidden;
    padding: 50px;
    height: 500px;
    padding-top: 10px;
}
.genealogy-tree ul  {
    padding-top: 20px; 
    position: relative;
    padding-left: 0px;
    display: flex;
}
.genealogy-tree li  {
    float: left; text-align: center;
    list-style-type: none;
    position: relative;
    padding: 20px 5px 0 5px;
}
.genealogy-tree li::before, .genealogy-tree li::after{
    content: '';
    position: absolute; 
  top: 0; 
  right: 50%;
    border-top: 2px solid #ccc;
    width: 50%; 
  height: 18px;
}
.genealogy-tree li::after{
    right: auto; left: 50%;
    border-left: 2px solid #ccc;
}
.genealogy-tree li:only-child::after, .genealogy-tree li:only-child::before {
    display: none;
}
.genealogy-tree li:only-child{ 
    padding-top: 0;
}
.genealogy-tree li:first-child::before, .genealogy-tree li:last-child::after{
    border: 0 none;
}
.genealogy-tree li:last-child::before{
    border-right: 2px solid #ccc;
    border-radius: 0 5px 0 0;
    -webkit-border-radius: 0 5px 0 0;
    -moz-border-radius: 0 5px 0 0;
}
.genealogy-tree li:first-child::after{
    border-radius: 5px 0 0 0;
    -webkit-border-radius: 5px 0 0 0;
    -moz-border-radius: 5px 0 0 0;
}
.genealogy-tree ul ul::before{
    content: '';
    position: absolute; top: 0; left: 50%;
    border-left: 2px solid #ccc;
    width: 0; height: 20px;
}
.genealogy-tree li a{
    text-decoration: none;
    color: #666;
    font-family: arial, verdana, tahoma;
    font-size: 11px;
    display: inline-block;
    border-radius: 5px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
}

.genealogy-tree li a:hover+ul li::after, 
.genealogy-tree li a:hover+ul li::before, 
.genealogy-tree li a:hover+ul::before, 
.genealogy-tree li a:hover+ul ul::before{
    border-color:  #fbba00;
}

/*--------------memeber-card-design----------*/
.member-view-box{
    padding:0px 20px;
    text-align: center;
    border-radius: 4px;
    position: relative;
}
.member-image{
    width: 60px;
    position: relative;
}
.member-image img{
    width: 60px;
    height: 60px;
    border-radius: 6px;
  background-color :#000;
  z-index: 1;
}

</style>