<template>
    <div ref="container" 
    class="" @wheel="scrollHandler" 
    
    @mousedown="(event ) => { draging = true; point.x = event.clientX; point.y = event.clientY}" 
    @mouseup="draging = false" 
    @mousemove="(ev) => {handleDrag(ev)}" 

    :style="componentStyles">
    {{ draging }}   
    <slot class="no_drag"></slot>
    </div>
</template>
<script lang="ts" setup>
const container = ref();
const componentStyles = ref({
      transform: "scale(1)",
      transition: "transform 0.2s",
      transformOrigin: '0 0'
});

let min_scale = 1;
let max_scale = 3;
let speed = 0.5;

let draging = false;


const scrollHandler = (event: any) => {
    return false;
    event.preventDefault();
    console.log(event.deltaY + '  ' + speed);
    const scaleStep = event.deltaY > 0 ? 0.9 : 1.1;
    let tScale = parseFloat(componentStyles.value.transform.split("scale(")[1]) * scaleStep;
    tScale = tScale < min_scale ? min_scale : tScale;
    tScale = tScale > max_scale ? max_scale : tScale;
    componentStyles.value.transform = `scale(${tScale})`;
}
const point = {
    x : 0,
    y: 0
}
const handleDrag = (event:any) => {
    if(draging == false){
        return false;
    }
    //console.log(container.value.offsetParent);
    let scale = 1;
   let scrollTo = {
		x: container.value.offsetParent.offsetParent.scrollLeft + scale*(point.x - event.clientX),
		y: container.value.offsetParent.offsetParent.scrollTop + scale*(point.y - event.clientY)
	}
    container.value.offsetParent.scrollTo(scrollTo.x,scrollTo.y);
}

</script>

<style>
.no_drag {
    -webkit-user-drag: none;
    user-select: none;
    -moz-user-select: none;
    -webkit-user-select: none;
    -ms-user-select: none;
}
</style>
