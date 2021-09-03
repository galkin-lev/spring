<#import "parts/page.ftl" as p>
<#include "parts/security.ftl">

<@p.page>

    <div>
        User editor <a href="/profile">     back to profile</a>
    </div>

    <form action="/profile" method="post">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <div>user ID: ${user.id}</div>
        <label>username: <input type="text" name="username" value="${user.username}" placeholder="username"></label>
        <br>
        <label>password: <input type="password" name="password" value="${user.password}" placeholder="password"></label>
        <br>

        <#if isAdmin>
            <#list roles as role>
                <div>
                    <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>  ${role}</label>
                </div>
            </#list>
        </#if>

        <input type="hidden" value="${user.id}" name="userId">
        <button class="btn btn-primary" type="submit">Save</button>
    </form>
    <br>
    <form action="/profile/delete/${user.id}" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <input type="hidden" name="password" value="${user.password}">
        <input type="hidden" name="username" value="${user.username}">

        <button class="btn btn-primary" type="submit">DELETE USER</button>
    </form>
</@p.page>