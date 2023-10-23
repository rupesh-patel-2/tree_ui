<template>
    <button type="button"
        class="flex items-center w-full p-2 text-base text-gray-900 transition duration-75 rounded-lg group hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700" >
        <slot name="left"></slot>
    
    <span class="flex-1 ml-3 text-left whitespace-nowrap" sidebar-toggle-item="">
        <slot default ></slot>
    </span>
    
    <slot name="right" ></slot>

    </button>
    
</template>