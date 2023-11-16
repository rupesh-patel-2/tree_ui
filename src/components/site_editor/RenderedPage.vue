<template>
    <div @click="clickHandler" :id="id" style="float: left;" class=" min-h-[500px]  w-[500px] border rounded-lg bg-white">
        {{ props.page.name }}
    </div>
</template>

<script lang="ts" setup>

    import { TreeNode } from '@/types/TreeTypes'

    const props = defineProps({
        page: {
            type: Object as PropType<TreeNode>,
            required: true,
        },
    });
    const id = makeid(10);
    function makeid(length:number) {
        let result = '';
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        const charactersLength = characters.length;
        let counter = 0;
        while (counter < length) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
        counter += 1;
        }
        return result;
    }

    const clickHandler = () => {
        const startEvent = new Event("page_clicked");
        
        document.dispatchEvent(startEvent);
    }
</script>