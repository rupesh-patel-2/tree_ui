<template>
    <label for="dropzone" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ label ? label : "Select or Drag File" }}</label>
    <div id="dropzone" class="flex items-start">
        <label for="dropzone-file" class="flex flex-col items-center justify-center w-full h-64 border-2 border-gray-300 border-dashed rounded-lg cursor-pointer bg-gray-50 dark:hover:bg-bray-800 dark:bg-gray-700 hover:bg-gray-100 dark:border-gray-600 dark:hover:border-gray-500 dark:hover:bg-gray-600">
            
            <div class="flex flex-col items-center justify-center pt-5 pb-6">
                <svg class="w-8 h-8 mb-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 16">
                    <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 13h3a3 3 0 0 0 0-6h-.025A5.56 5.56 0 0 0 16 6.5 5.5 5.5 0 0 0 5.207 5.021C5.137 5.017 5.071 5 5 5a4 4 0 0 0 0 8h2.167M10 15V6m0 0L8 8m2-2 2 2"/>
                </svg>
                <p class="mb-2 text-sm text-gray-500 dark:text-gray-400"><span class="font-semibold">Click to upload</span> or drag and drop</p>
                <!-- <p class="text-xs text-gray-500 dark:text-gray-400"></p> -->
            </div>
            <input id="dropzone-file" :type="type ? type : 'file'" class="hidden" :name="name" :accept="accept" :disabled="disable" @change="handleFileChange($event)"/>
        </label>
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
        placeholder?: string,
        is_valid?:Function,
        error_message? : String ,
        type?:string ,
        value?: BinaryData,
        accept?: string,
        disable?: boolean,
    }>();
    
    const isValid = () =>{
        let v = true;
        let require:Boolean = value.value && value.value.name ? false : props.required
        v  = require ? false : true;
        v = props.is_valid ? props.is_valid(value.value) :v;
        valid.value = v;
        return valid.value;
    }

    let errorMessage:any= props.error_message ? props.error_message : "Please Upload Valid File";
    let valid  = ref<boolean>(true);
    let value = ref<Array<any>>([]);
    
    async function handleFileChange(e) {
        let file:any = e.target.files[0]  
        let fileName:string = file.name
        const extension = fileName.split('.').pop();
        if(extension == 'mp4' && file.size > 15000000){
            errorMessage = 'File size should be less than 15mb'
        }else{
            value.value = file;
        }
    }

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