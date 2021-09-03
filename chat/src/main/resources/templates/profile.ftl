<#import "parts/page.ftl" as p>

<@p.page>
<div>${user.username} Profile</div>

    <table>
        <thead>
        <tr>
            <th>ID&nbsp;</th>
            <th>Name&nbsp;</th>
            <th>Role&nbsp;</th>
            <th></th>
        </tr>
        </thead>

        <tbody>
            <tr>
                <td>${user.id}</td>
                <td>${user.username!"null or missing"}</td>
                <td><#list user.roles as role>${role!"null or missing"}<#sep>, </#list></td>
                <td><a href="/profile/edit">&nbsp;&nbsp;edit</a></td>
            </tr>
        </tbody>
    </table>
</@p.page>