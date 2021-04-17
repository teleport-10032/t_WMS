<%@ page contentType="text/html;charset=UTF-8" language="java" %>
//get username
let result2 =  axios({
method: 'post',
url: '/getStaffNameByToken',
headers: { 'content-type': 'application/x-www-form-urlencoded'},
data: Qs.stringify({
token: window.localStorage.getItem("token")
})
});
result2.then(res=>{
if(res.data !== null && res.data !== '')
{
this.username = res.data.username
}
})