<%@ page contentType="text/html;charset=UTF-8" language="java" %>
//get user type
let result = axios({
method: 'post',
url: '/getStaffTypeByToken',
headers: { 'content-type': 'application/x-www-form-urlencoded'},
data: Qs.stringify({
token: window.localStorage.getItem("token")
})
});
result.then(res=>{
// console.log(res.data)
if(res.data.type !== 'whAdmin')
{
this.$message.warning("越权访问")
return window.location.href="/login";
}
})
