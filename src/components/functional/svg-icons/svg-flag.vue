<template>
    <svg class="h-5 w-5 rounded-full "
            fill="currentColor" :viewBox="viewBox" xmlns="http://www.w3.org/2000/svg">
        <path v-for="path in iconPaths" v-bind="path"></path>
        <circle v-for="circle in iconCircles" v-bind="circle"></circle>
        <polygon v-for="polygon in iconPolygons" v-bind="polygon" ></polygon>
    </svg>
</template>
<script setup lang="ts">

let paths:any = {
    "usa" : {
        "paths": [
            { "fill": "#b22234", "d": "M0 0h7410v3900H0z" },
            { "d": "M0 450h7410m0 600H0m0 600h7410m0 600H0m0 600h7410m0 600H0", "stroke": "#fff", "stroke-width": "300" },
            { "fill": "#3c3b6e", "d": "M0 0h2964v2100H0z" },
            { "id": "a", "d": "M247 90l70.534 217.082-184.66-134.164h228.253L176.466 307.082z" }
        ],
        "viewBox": "0 0 3900 3900"
    },
    "india" : {
        "paths": [
        { "fill": "#138808", "d": "M0 27a4 4 0 0 0 4 4h28a4 4 0 0 0 4-4v-4H0v4z" },
        { "fill": "#EEE", "d": "M0 13h36v10H0z" },
        { "fill": "#F93", "d": "M36 13V9a4 4 0 0 0-4-4H4a4 4 0 0 0-4 4v4h36z" },
        { "fill": "#6666B3", "d": "M18 15l.146 2.264l1.001-2.035l-.73 2.147l1.704-1.498l-1.497 1.705l2.147-.731l-2.035 1.002L21 18l-2.264.146l2.035 1.001l-2.147-.73l1.497 1.704l-1.704-1.497l.73 2.147l-1.001-2.035L18 21l-.146-2.264l-1.002 2.035l.731-2.147l-1.705 1.497l1.498-1.704l-2.147.73l2.035-1.001L15 18l2.264-.146l-2.035-1.002l2.147.731l-1.498-1.705l1.705 1.498l-.731-2.147l1.002 2.035z" }
    ],
    "circles": [
        { "fill": "navy", "cx": "18", "cy": "18", "r": "4" },
        { "fill": "#EEE", "cx": "18", "cy": "18", "r": "3" },
        { "fill": "navy", "cx": "18", "cy": "18", "r": "1" }
    ],
        "viewBox" : "5 5 25 25"
    }
   
}

const props = defineProps<{
    name:string,
   
}>();
let viewBox = paths[props.name]?.viewBox ? paths[props.name]?.viewBox : '0 0 20 20';
let iconPaths = paths[props.name]?.paths ?  paths[props.name].paths : [];
let iconCircles = paths[props.name]?.circles ?  paths[props.name].circles : [];
let iconPolygons = paths[props.name]?.polygons ?  paths[props.name].polygons : [];
</script>