<template>
    <div>
        <lable class="w-full py-4 ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{label ? label :'Select Model'}} :- </lable>
        <label v-for="(opt,index) in options" :key="index" :for="opt.value"
            class="w-full py-4 ml-2 text-sm font-medium text-gray-900 dark:text-gray-300">{{  opt.label  }}
            <input v-model="value" :value="opt.value" :type="type ? type : 'radio'" :id="opt.value" :name="name" 
            class="w-4 h-4 text-blue-600 bg-gray-100 border-gray-300 focus:ring-blue-500 dark:focus:ring-blue-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600"
                    :placeholder="placeholder" :selected="value">
        </label>
        <span class="error text-red-400 text-xs" v-show="!valid">{{ errorMessage }}</span>
    </div>
</template>

<script setup lang="ts">
    import { watch } from 'vue';
    import type { selectOption } from '../interface/crud-essentials';
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
        type?:string ,
        value?: string ,
        check?: string ,
        options: Array<selectOption>,
        checked?: string,
    }>();

    const isValid = () =>{
        let v = true;
        v  = props.required && value.value == '' ? false : true;
        v = props.is_valid ? props.is_valid(value.value) :v;
        // console.log(v);
        valid.value = v;
        return valid.value;
    }

    let errorMessage:String|undefined = props.error_message ? props.error_message : "Please Select an option";
    let valid  = ref<boolean>(true);
    let value = ref<String>(props.value ? props.value : '');

    defineExpose({
        isValid,
        props,
        value
    });

    watch(value, (n,o) => {
        isValid(),
        emit('change',{
            new : n,
            old: o
        })
    });

    watch(() => props.error_message, (n,o) => {
        errorMessage = n;
    });
    
</script>