<template>
    <div  class="fixed top-0 left-0 w-full h-full  bg-opacity-5 z-10" :style="{ pointerEvents: 'none' }">
        
        <!-- Top Section Slot -->
        <div class="justify-center items-center  ">
            <div class="top-section w-full " :style="{ pointerEvents: 'auto' }">
                <slot name="top">
                    I am top
                </slot>
            </div>
        </div>
            <!-- Left Section Slot -->
        <div class="flex ">
            <div class="left-section w-1/2 flex  " :style="{ pointerEvents: 'none' }">
                <slot name="left">
                    I am left
                </slot>
            </div>

            <!-- Right Section Slot -->
            <div class="right-section w-1/2 flex flex-row-reverse" :style="{ pointerEvents: 'none' }">
                <slot name="right">
                    I am right
                </slot>
            </div>
        </div>
        
    </div>
    
</template>

<script lang="ts" setup>
    
</script>