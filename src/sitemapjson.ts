import { TreeNode} from '@/types/TreeTypes';

let siteMapJson:TreeNode = {
    name: "Home Page", 
    id: 1,
    components: [
      
      {name:"container", 'description' : "I have your page dynamic content"},
      {name:"container2", 'description' : "I have your page dynamic content"},
      {name:"container3", 'description' : "I have your page dynamic content"},
      {name:"container4", 'description' : "I have your page dynamic content"},
      
    ],
    top_component : {name:"header", 'description' : "I contain the logo and nav bar"},
    bottom_component : {name:"footer", 'description' : "I am your page footer"},
      
      children: [
      /*  {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        },
        {
          name: "About Us", 
          id: 2,
        }, */
        {
          name: "About Us", 
          id: 2,
        },
  
        {
          name: "Contact Us", 
          id: 3,
        },
        
        {
          name: "Cart", 
          id: 3,
          children: [
            {
              name: "Shipping", 
              id: 4,
              
            },
            {
              name: "Payment", 
              id: 5,
            },
            {
              name: "Checkout", 
              id: 6,
            },
          ]
        }
      ]
    }

export { siteMapJson }