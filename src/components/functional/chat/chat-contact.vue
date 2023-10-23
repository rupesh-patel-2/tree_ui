<template>
     <div  class="px-3 flex items-center bg-grey-light cursor-pointer">
        <div>
            <img class="h-12 w-12 rounded-full"
                    :src="contact.profile_image"/>
        </div>
        <div class="ml-4 flex-1 border-b border-grey-lighter py-4">
            <div class="flex items-bottom justify-between">
                <p class="text-grey-darkest">
                    {{ contact.name }}
                </p>
                <p class="text-xs text-grey-darkest">
                    12:45 pm
                </p>
            </div>
            <p class="text-grey-dark mt-1 text-sm">
                {{ contact.status }}
            </p>
        </div>
    </div>
</template>

<script lang="ts" setup >

    defineProps<{
        contact: any
    }>();
</script>