<template>
    <div class="flex items-start">
        <div class="flex items-center h-5">
            <input id="remember" aria-describedby="remember" name="remember" type="checkbox" class="w-4 h-4 border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-primary-300 dark:focus:ring-primary-600 dark:ring-offset-gray-800 dark:bg-gray-700 dark:border-gray-600" :required="required" v-model="value">
        </div>
        <div class="ml-3 text-sm">
            <label for="remember" class="font-medium text-gray-900 dark:text-white">{{label ? label : 'Remember me'}}</label>
        </div>
    </div>
    <span class="error text-red-400 text-xs" v-show="!valid">{{ errorMessage }}</span>
</template>

<script setup lang="ts" >

import { watch } from 'vue';
    import type { fieldChange } from '@/components/crud/interface/crud-essentials'

    const emit = defineEmits<{
        (e: 'change', change: fieldChange): void
    }>()

    const props = defineProps<{
        name: string,
        label: string,
        required?: Boolean,
        is_valid?:Function,
        error_message? : String ,
        type?:string ,
        value?: String
    }>();

    const isValid = () =>{
        let v = true;
        v  = props.required && !value.value ? false : true;
        v = props.is_valid ? props.is_valid(value.value) :v;
        valid.value = v;
        return valid.value;
    }

    let errorMessage:any= props.error_message ? props.error_message : "Please select checkbox";
    let valid  = ref<boolean>(true);
    let value = ref<String>(props.value ? props.value : '');

    defineExpose({
        isValid,
        props,
        value
    });

    watch(value, (n,o) => {
        isValid()
        emit('change',{
            new : n,
            old: o
        })
    });

    watch(() => props.error_message, (n,o) => {
        errorMessage = n;
    });
</script>