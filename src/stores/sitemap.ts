import  { ref } from "vue";
import { defineStore } from 'pinia'
import { TreeNode} from '@/types/TreeTypes';
export const siteMap = defineStore('sitemap', () => {
    const currentView = ref('sitemap');
    const siteMapJson = ref({});
    const showComponentEditor = ref(false);
    const changeView:Function = (view:string) => {
        currentView.value = view;
    }
    const setSiteMap:Function = (siteMapJ:TreeNode) => {
        siteMapJson.value = siteMapJ;
    }
    const setShowComponentEditor:Function = (val:boolean) => {
        showComponentEditor.value = val;
    }
    return {currentView,changeView,setSiteMap,siteMapJson,showComponentEditor,setShowComponentEditor};
})