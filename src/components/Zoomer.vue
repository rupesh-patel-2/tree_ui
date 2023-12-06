<template>
    <div ref="container" 
    @wheel="scrollHandler"
    @mousedown="(ev) => { handleMouseDown(ev) }" 
    @mouseup="(ev) => { handleMouseUp(ev) }" 
    @mousemove="(ev) => {handleDrag(ev)}" 

    :style="componentStyles"
    >
    
    <slot class="no_drag"></slot>
    </div>
</template>
<script lang="ts" setup>


const container = ref();
let offsetParent:any = false;
const componentStyles:any = reactive({
      transform: "scale(1)",
      transition: "transform 0.2s",
      transformOrigin: '0 0',
      userSelect: 'none',
      cursor:'grab'
});

let min_scale = 1;
let max_scale = 3;
let speed = 0.5;

let draging = false;
let currentScale = 1;
let areaWidth = 0;
let areaHeight = 0;
let offsetX = 0;
let offsetY = 0;


const scrollHandler = (event: any) => {
    if(!event.ctrlKey){
        return false;
    } else {
        handleZoom(event);
    }
    console.log('scroll evetn');
    


}

const handleZoom = (event:any) => {
    event.preventDefault();
    // return false;
   // console.log(event.deltaY + '  ' + speed);
    /*const scaleStep = event.deltaY > 0 ? 0.9 : 1.1;
    currentScale = parseFloat(componentStyles.transform.split("scale(")[1]) * scaleStep;
    currentScale = currentScale < min_scale ? min_scale : currentScale;
    currentScale = currentScale > max_scale ? max_scale : currentScale;
    componentStyles.transform = `scale(${currentScale})`;
    componentStyles.transformOrigin = event.clientX+' '+event.clientY;
    let multiply = 1;
    const scrollLeft = offsetParent.scrollLeft + event.clientX * multiply*(currentScale -1 );
    const scrollTop = offsetParent.scrollTop + event.clientY * multiply*(currentScale -1 ); */
    
    let clientX = event.pageX - container.value.offsetX;
    let clientY = event.pageY - container.value.offsetY;
    
    let  nextScale = Math.min(max_scale, Math.max(min_scale, currentScale - event.deltaY / 100));
    
    let percentXInCurrentBox = clientX / areaWidth;
    let percentYInCurrentBox = clientY / areaHeight;

    let currentBoxWidth  = areaWidth / currentScale;
    let currentBoxHeight = areaHeight / currentScale;

    let nextBoxWidth  = areaWidth / nextScale;
    let nextBoxHeight = areaHeight / nextScale;

    let deltaX = (nextBoxWidth - currentBoxWidth) * (percentXInCurrentBox - 0.5);
    let deltaY = (nextBoxHeight - currentBoxHeight) * (percentYInCurrentBox - 0.5);

    let nextOffsetX = offsetX - deltaX;
    let nextOffsetY = offsetY - deltaY;

    componentStyles.transform = `scale(${nextScale})`;
    let scrollTo = {
        left: -1 * nextOffsetX * nextScale ,
        top: -1 * nextOffsetY * nextScale ,
        behavior: 'auto', // Use 'auto' for instant scrolling
    };
    offsetParent.scrollTo(scrollTo);
/*
    offsetX = nextOffsetX;
    offsetY = nextOffsetY;
    currentScale   = nextScale;

    let scrollTo = {
        left: scrollLeft ,
        top: scrollTop ,
        behavior: 'auto', // Use 'auto' for instant scrolling
      };
    //console.log(rect,containerRect)
    console.log(scrollTo, {left:offsetParent.scrollLeft, top:  offsetParent.scrollTop });
    offsetParent.scrollTo(scrollTo);*/
}

let point = {
    x : 0,
    y: 0
}
onMounted(()=>{
    offsetParent = container.value.offsetParent;
    areaWidth =offsetParent.offsetWidth ;
    areaHeight = offsetParent.offsetHeight ;
})


const handleDrag = (event:any) => {
    //return false;
    if(draging == false && (point.x == 0 || point.y == 0)){
        return false;
    }
   
    //console.log(container.value.offsetParent);
    let scale = 0.05;
    
    //let maxLeft = 0;
    let scrollTo = {
		x: offsetParent.scrollLeft + scale*(point.x - event.clientX),
		y: offsetParent.scrollTop + scale*(point.y - event.clientY)
	}
    //console.log(scrollTo,"scrolling to");
    
    offsetParent.scrollTo(scrollTo.x,scrollTo.y);
}

const handleMouseDown = (event: any) => {
    
    draging = true; 
    point.x = event.clientX; 
    point.y = event.clientY;
   // console.log(point, "Mouse Down");
    componentStyles.cursor = 'grabbing';
}


const handleMouseUp = (event: any) => {
    //console.log(event , "Mouse UP");
    draging = false ; point = {x:0,y:0};
    componentStyles.cursor = 'grab';
}

window.addEventListener("keydown", function(event){
    
  if(event.ctrlKey){
    console.log('ctrl found 1');
  }
});


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
