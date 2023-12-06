import  { ref } from "vue";
import { defineStore } from 'pinia'
import { TreeNode} from '@/types/TreeTypes';
export const siteMap = defineStore('sitemap', () => {
    const currentView = ref('sitemap');
    const siteMapJson = ref({});
    
    const showComponentEditor = ref(false);
    const eventHandlers:any = {};  
    const changeView:Function = (view:string) => {
        currentView.value = view;
    }
    const setSiteMap:Function = (siteMapJ:TreeNode) => {
        siteMapJson.value = siteMapJ;
    }
    const setShowComponentEditor:Function = (val:boolean) => {
        showComponentEditor.value = val;
    }

    const attachHandler:Function = (func:Function, eventName:string) => {
        eventHandlers[eventName] = func;
    }

    const funthing:Function = (eventName:string, data:any) => {
       
        console.log(eventName,eventHandlers[eventName]);
        if(eventHandlers[eventName]){
            eventHandlers[eventName](data);
        }
    }

    /** For Wireframe view to export the function in windows context */

    const rightWidgetContent = ref('');
    const rightMenuContent = ref('');
    const showRightMenuFlag = ref(false);
    const showRightWidgetFlag = ref(false);

    const showRightMenu:Function = (callback:Function|undefined) =>{
        showRightMenuFlag.value = true;
        if(callback) {
            nextTick(()=>{ callback()  })
        }
    }
    const hideRightMenu:Function = (callback:Function|undefined) =>{
        showRightMenuFlag.value = false;
        if(callback) {
            nextTick(()=>{ callback()  })
        }
    }
    const clearRightMenu:Function = (callback:Function|undefined) => {
        rightMenuContent.value = '';
        if(callback) {
            nextTick(()=>{ callback()  })
        }
    }
    const appendItemToRightMenu:Function = (html:string,callback:Function|undefined) => {
        rightMenuContent.value = rightMenuContent.value+html;
        if(callback) {
            nextTick(()=>{ callback()  })
        }
    }
    const showRightWidget:Function = (callback:Function|undefined) => {
        showRightWidgetFlag.value = true;
        if(callback) {
            nextTick(()=>{ callback()  })
        }
    }

    const hideRightWidget:Function = (callback:Function|undefined) => {
        showRightWidgetFlag.value = false;
        if(callback) {
            nextTick(()=>{ callback()  })
        }
    }

    const putInRightWidget:Function = (html:string, callback:Function|undefined) => {
        rightWidgetContent.value = html;
        if(callback) {
            nextTick(()=>{ callback()  })
        }
    }

    const clearRightWidget:Function = (callback:Function|undefined) => {
        rightWidgetContent.value = '';
        if(callback) {
            nextTick(()=>{ callback()  })
        }
    }

    return {currentView,changeView,setSiteMap,siteMapJson,
        showComponentEditor,setShowComponentEditor,attachHandler,
        funthing,eventHandlers,
        showRightMenu,hideRightMenu,clearRightMenu, appendItemToRightMenu, 
        showRightWidget,hideRightWidget, putInRightWidget,clearRightWidget
    };
})