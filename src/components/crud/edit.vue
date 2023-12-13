<template>
    <Drawer :is_open="is_open"  >
        <template #content>
            <h5 id="drawer-label"
                class="inline-flex items-center mb-6 text-sm font-semibold text-gray-500 uppercase dark:text-gray-400">Edit Product</h5>
            <CloseButton @click="$emit('close')"></CloseButton>
            <Form  @save="saveProduct">
                <template #fields="{ refs }">
                    <!-- Example for custom validation -->
                    <TextFeild name="name"  label="Product Name"  placeholder="Add Product Name" 
                        :is_valid="customNameValidation" 
                        :error_message="nameErrorMessage" 
                        :required="true"
                        :ref="(ele:any) => { refs.push(ele) }"
                        @change="productNameChange"
                         
                        ></TextFeild>

                    <TextFeild name="sku"  label="SKU" placeholder="Add Product SKU"  :required="false" :ref="(ele:any) => { refs.push(ele) }"></TextFeild>

                    <TextFeild name="price" type="number"  label="Price" placeholder="Add Product Price"  :required="false" :ref="(ele:any) => { refs.push(ele) }"></TextFeild>
                    
                    <TextArea name="description" label="Description" placeholder="Add Product Description" error_message="Description is required"
                        :required="true" :ref="(ele:any) => { refs.push(ele) }" >
                    </TextArea>
                    
                    <!-- Example for conditional fields -->
                    <SelectDropdown v-if="show_discount" name="discount" label="Discount" placeholder="Select Discount" 
                        :options="discountOptions" :ref="(ele:any) => { refs.push(ele) }" >
                    </SelectDropdown>
                    
                    <button @click="toggleDiscount">
                        <span v-if="!show_discount">add discount</span>
                        <span v-else>remove discount</span>
                    </button>

                </template>

                <template #actions="{ refs }">
                    
                </template>
            </Form>
        </template>
    </Drawer>
</template>

<script setup lang="ts">
    import Drawer from '@/components/functional/drawer.vue'
    import Form from "@/components/crud/form.vue"
    import { CloseButton } from "@/components/functional/buttons"
    import TextFeild from "@/components/crud/fields/text.vue"
    import TextArea from "@/components/crud/fields/text-area.vue"
    import SelectDropdown from "@/components/crud/fields/select.vue"
    import type { selectOption } from '@/components/crud/interface/crud-essentials'
    import type { fieldChange } from '@/components/crud/interface/crud-essentials'

    const props = defineProps({
        is_open: { type: Boolean, default: false }
    })
    
    /** Custom Validation of the fields  */
    let nameErrorMessage = ref<String|undefined>("");
    const customNameValidation = (prodName: String) => {
        let v = true;
        if(prodName.length == 0){
            nameErrorMessage.value = "Product name can't be empty";
            v = false;
        }
        if(prodName.length > 10 ){
            nameErrorMessage.value = "Product name must be maximum 10 chars";
            v = false;
        }
        return v;
    }

    let discountOptions: Array<selectOption> = [
        { value: "10", label: "10%"},
        { value: "20", label: "20%"},
        { value: "30", label: "30%"},
        { value: "40", label: "40%"},
        { value: "50", label: "50%"},
        { value: "60", label: "60%"}
    ];

    /** Example of conditional fields  */
    let show_discount = ref<Boolean>(false);
    const toggleDiscount = () => {
        show_discount.value = !show_discount.value;
    }

    const saveProduct = (data:any) => {
        console.log(data,'Recieved Data');

    }

    const productNameChange = (change: fieldChange) =>{
        console.log(change, "Change in product name");
    }
</script>