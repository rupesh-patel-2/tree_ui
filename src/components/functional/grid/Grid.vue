<template>
    <div class="grid_container">
        
        <div class="cs cs1"></div>
        <div class="cs cs2"></div>
        <div class="cs cs3"></div>
        <div class="cs cs4"></div>
    </div>
</template>
<script setup lang="ts">
    import { ref , computed } from 'vue';
    const props = defineProps<{
        columns?: number,
        cellWidth?: string,
        cellHeight?:string,
        rows: number
    }>();
    
    const tColumnsStyle = computed(() => { 
        return 'repeat('+ (props.columns ? props.columns : '2')  +', '+ (props.cellWidth ? props.cellWidth :'1fr)');
    }) 
    
    const gridRows = computed(() => { return 'minmax('+props.cellHeight+', auto)' })
    const cs2Col = computed(()=>{ return props.columns })
    const cs3Col = computed(()=>{ return props.columns })
    const cs3row = computed(()=>{ return props.rows })
    const cs4row = computed(()=>{ return props.rows })
</script>
<style>
.grid_container {
    display: grid;
    grid-template-columns: v-bind(tColumnsStyle);
    grid-auto-rows: v-bind(gridRows);
}
.cs {
    background-color: red;
}
.cs1 {
    grid-column: 1;
    grid-row: 1;
}

.cs2 {
    grid-column: v-bind(cs2Col);
    grid-row: 1;
}
.cs3 {
    grid-column: v-bind(cs3Col);
    grid-row: v-bind(cs3row);
}
.cs4 {
    grid-column: 1;
    grid-row: v-bind(cs4row);
}
</style>
