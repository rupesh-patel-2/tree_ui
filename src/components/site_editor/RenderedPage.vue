<template>
    
    <div style="font-size: 10px;">
        <div> {{ props.page.name }} </div>
        <div @click="clickHandler" :id="id" style="float: left;" class=" min-h-[700px]  w-[400px] border rounded-lg bg-white">


            
            <div class="sample-header">
  <div class="sample-header-section">
    <h1>Scroll down to see the parallax effect</h1>
    <h2>Background landcape scrolls with its own depth </h2>
  </div>
</div>
<div class="sample-section-wrap">
  <div class="sample-section">
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium
      quis, sem. Nulla consequat massa quis enim. </p>

    <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean
      vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam
      ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. </p>

    <p>Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut
      libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. </p>

    <p>Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc, quis gravida magna mi a libero. Fusce vulputate eleifend sapien. Vestibulum purus quam, scelerisque ut,
      mollis sed, nonummy id, metus. Nullam accumsan lorem in dui. </p>

    <p>Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet
      nec, imperdiet iaculis, ipsum. </p>

    <p>Sed aliquam ultrices mauris. Integer ante arcu, accumsan a, consectetuer eget, posuere ut, mauris. Praesent adipiscing. Phasellus ullamcorper ipsum rutrum nunc. Nunc nonummy metus. Vestibulum volutpat pretium libero. Cras id dui. Aenean ut.</p>

    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium
      quis, sem. Nulla consequat massa quis enim. </p>

    <p>Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean
      vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam
      ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. </p>
  </div>
</div>



        </div>
    </div>

</template>

<script lang="ts" setup>


    import { TreeNode } from '@/types/TreeTypes'
    import { siteMap } from "@/stores/sitemap"
    const siteMapStore = siteMap();

    const props = defineProps({
        page: {
            type: Object as PropType<TreeNode>,
            required: true,
        },
    });
    const id = makeid(10);
    function makeid(length:number) {
        let result = '';
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        const charactersLength = characters.length;
        let counter = 0;
        while (counter < length) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
        counter += 1;
        }
        return result;
    }

    const clickHandler = (event:any) => {
        console.log("s",siteMapStore.funthing);
       siteMapStore.funthing('page_clicked', { page_id : id,event:event});
    }
</script>

<style>

.webmadewell {
  background-color: white;
}
body {
  margin: 0;
}
.sample-header {
 
  left: 0;
  top: 0;
  width: 100%;
  background-image: url("http://webmadewell.com/wp-content/uploads/2018/01/img-bg-sample-parallax-header.jpg");
  background-position: center;
  background-size: cover;
  background-repeat: no-repeat;
}
.sample-header::before {
  content: "";
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  opacity: 0.3;
}
.sample-header-section {
  position: relative;
  padding: 15% 0 10%;
  max-width: 640px;
  margin-left: auto;
  margin-right: auto;
  color: white;
  text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.5);
  font-family: "Montserrat", sans-serif;
}
h1 {
  font-weight: 500;
}
h2 {
  font-weight: 400;
}
.sample-section-wrap {
  position: relative;
  background-color: white;
}
.sample-section {
  position: relative;
  max-width: 640px;
  margin-left: auto;
  margin-right: auto;
  padding: 40px;
}


</style>