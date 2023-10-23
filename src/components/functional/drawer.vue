<template>
    <span class="max-w-xs">
        <div class="hidden max-w-xs max-w-sm max-w-lg"></div>
        <div id="drawer-create-product-default" class=" fixed top-0 right-0 z-40 w-full h-screen  p-4 overflow-y-auto transition-transform bg-white dark:bg-gray-800" :class="className" >
            <slot name="content">
                Drawer content {{  props.is_open   }}
            </slot>
        </div>
        <div  v-if="is_open" @click="$emit('close')" class="bg-gray-600 bg-opacity-50 dark:bg-opacity-80 fixed inset-0 z-30"></div>
    </span>
</template>

<script setup lang="ts">
    const props = defineProps({
        is_open: { type: Boolean, default: false },
        max_width: {type: String, default : 'xs'}
    })

    const className = computed(() => {
        return props.is_open 
        ? "transform-none max-w-"+props.max_width
        : "translate-x-full max-w-"+props.max_width;
    })
</script>