<template>
    <li>
        <a href="javascript:void(0);">
            <div class="member-view-box">
                
                    
                <div class="member-details">
                    <h3>{{ node.name }} <EditIcon @click="editDrawerOpen = true" /></h3> 
                </div>
                <PageComponentContainer 
                    :TopComponent="props.node.top_component" 
                    :BottomComponent="props.node.bottom_component" 
                    :PageComponents="$props.node.components"
                    @componentsChanged="handleCompChange"
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
                   
                    @changeInTree="(tNode:TreeNode) => { handleChangeInTree(tNode,nodeInd)}"
                    :key="childNode.id"
                    :node="childNode"
                ></SitePageTree>
            </li>
        </ul>

        <Teleport to="body">
            <Drawer class="absolute" :is_open="editDrawerOpen" @close="editDrawerOpen = false" :max_width="'lg'"  >
                <template #content>
                    <div class="flex flex-row-reverse"> 
                        <SvgIcon name="close" @click="editDrawerOpen = false" />
                    </div>
                    <h3>{{ node?.name }} </h3>

                    <div>
                    <form>
                        <br/>
                        <div class="relative z-0 w-full mb-6 group">
                            <input  type="text" v-model="node.name"  class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
                            <label  class="peer-focus:font-medium absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Page Title</label>
                        </div>
                    </form>

                    </div>
                    
                </template>
            </Drawer>
        </Teleport>
    </li>
</template>

<script lang="ts" setup>
import { PropType } from 'vue';
import PageComponentContainer from '@/components/page/PageComponentContainer.vue';
import { RoundedPlus } from '@/components/icons'
import { TreeNode, PageComponent as PC } from './../types/TreeTypes'



const props = defineProps({
  node: {
    type: Object as PropType<TreeNode>,
    required: true,
  },
});

let node = ref(props.node);
const editDrawerOpen = ref(false);

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
    overflow-y: hidden;
    padding: 50px;
    min-height: 500px;
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