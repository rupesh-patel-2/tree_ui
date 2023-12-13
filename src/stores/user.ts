import { ref } from "vue";
import { defineStore } from 'pinia'

export type user = {
  firstName: string,
  lastName: string,
  authToken?:string,
  email?:string,
  profileUrl?:string,
}

export const userStore = defineStore('user', () => {
    let storedUser:any = localStorage.getItem('user');
    
    storedUser = storedUser ? JSON.parse(storedUser ) : false;

    const firstName = ref('Guest')
    const lastName = ref('')
    const email = ref('info@matrixhive.com');
    const authToken = ref('')
    const profileUrl = ref('/src/assets/images/users/guest.png');
    const isLoggedIn = ref(false);
    const afterLoginRoute = ref('/');
    const authType = "bearer";
    const loginRoute = ref('login');
    const getAuthBearerHeader:Function = () => {
      return authToken.value; 
    };

    const setAuthToken = ( token:string ) => {
      authToken.value = token;
    }

    const setUser:Function = (user:user) => {
      firstName.value = user.firstName;
      lastName.value = user.lastName;
      email.value = user.email ? user.email : '';
      profileUrl.value = user.profileUrl ? user.profileUrl : '';
      authToken.value = user.authToken ? user.authToken : '';
      isLoggedIn.value = true;
      localStorage.setItem('user',JSON.stringify(user))
    }

    const removeUser:Function = () => {
      firstName.value = 'Guest'
      lastName.value = ''
      email.value = 'info@matrixhive.com'
      profileUrl.value = '/src/assets/images/users/guest.png',
      authToken.value = ''
      isLoggedIn.value = false
      localStorage.removeItem('user');
    }

    
    if(Object.keys(storedUser).length > 0){
      setUser(storedUser);
    }
    return { firstName, lastName, email, authToken , profileUrl , isLoggedIn , afterLoginRoute ,getAuthBearerHeader , setUser , removeUser, loginRoute }

  })