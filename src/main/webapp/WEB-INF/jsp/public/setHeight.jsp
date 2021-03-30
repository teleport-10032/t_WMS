<%@ page contentType="text/html;charset=UTF-8" language="java" %>
let h = window.screen.height-172
let t1 = document.getElementById("elMain")
t1.style.height = h + 'px'
t1.style.background = "#eaedf1"

let t2 = document.getElementById("elAside")
t2.style.height = h + 'px'
t2.style.background = "#333744"

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
if(res.data !== 'admin')
{
this.$message.warning("越权访问")
return window.location.href="/login";
}
})
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
this.username = res.data
}
})