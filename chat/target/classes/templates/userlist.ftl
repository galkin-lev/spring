<#import "parts/page.ftl" as p>

<@p.page>

    List of users

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
        <#list users as user>
            <tr>
                <td>${user.id}</td>
                <td>${user.username!"null or missing"}</td>
                <td><#list user.roles as role>${role!"null or missing"}<#sep>, </#list></td>
                <td><a href="/user/${user.id}">&nbsp;&nbsp;edit</a></td>
            </tr>
        </#list>
        </tbody>
    </table>

</@p.page>