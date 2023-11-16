<template>
    <div class="full py-2 px-1 mb-2 border border-gray-400 rounded-md bg-white justify-center item-center ">
        <div v-if="editable" class="flex h-[20px] flex-row-reverse">
            <SvgIcon class="cursor-pointer"  @click="$emit('removeComponent',index)" name="delete"></SvgIcon>
        </div>
        <span v-if="editable">
            {{ props.comp.name }}
        </span>
        <span v-else>
            {{ props.comp.name }}
        </span>
        <div v-if="!editable">
            {{ props.comp.description }}
        </div>
    </div>
</template>

<script lang="ts" setup>
    import { PageComponent } from '@/types/TreeTypes';
    import { SvgIcon } from '../functional';
    const props = defineProps<{ comp: PageComponent , editable:boolean , index:number}>();
</script>