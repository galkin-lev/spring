<#import "parts/page.ftl" as p>

<@p.page>

    <div>
        User editor <a href="/user">    back to user list</a>
    </div>

    <form action="/user" method="post">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <div>user ID: ${user.id}</div>
        <label>username: <input type="text" name="username" value="${user.username}" placeholder="username"></label>
        <br>
        <label>password: <input type="password" name="password" value="${user.password}" placeholder="password"></label>
        <br>
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>  ${role}</label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <button class="btn btn-primary" type="submit">Save</button>
    </form>
    <br>
    <form action="/user/delete/${user.id}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">DELETE USER</button>
    </form>
</@p.page>