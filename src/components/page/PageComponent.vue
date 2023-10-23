<template>
    <div class="full py-2 px-1 mb-2 border border-gray-400 rounded-md bg-white ">
        {{ props.comp.name }}
        <div>
            {{ props.comp.description }}
        </div>
    </div>
</template>

<script lang="ts" setup>
    import { PageComponent } from '@/types/TreeTypes';
    const props = defineProps<{ comp: PageComponent}>();
</script>