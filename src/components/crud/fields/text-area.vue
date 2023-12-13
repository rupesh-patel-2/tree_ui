<template>
   <div>
        <label for="description"
            class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">{{ label }}</label>
        <textarea id="description" rows="4" :name="name" :maxlength="max"
            class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            :placeholder="placeholder" v-model="value" ></textarea>
        <span class="error text-red-400 text-xs" v-show="!valid">{{ errorMessage }}</span>   
    </div>
</template>


<script setup lang="ts">
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
        error_message? : String | undefined,
        value?: string,
        max? : number
    }>();

    const isValid = () =>{
        let v = true;
        v  = props.required && value.value.trim() == '' ? false : true;
        v = props.is_valid ? props.is_valid(value.value) :v;
        valid.value = v;
        return valid.value;
    }

    let errorMessage:String|undefined = props.error_message ? props.error_message : "Please insert valid value";
    let valid  = ref<boolean>(true);
    let value = ref<String>(props.value ? props.value : '');

    defineExpose({
        isValid,
        props,
        value
    });

    watch(value, (n,o) => {
        isValid();
        emit('change',{
            new : n,
            old: o
        })
    });

    watch(() => props.error_message, (n,o) => {
        errorMessage = n;
    });
    
</script>