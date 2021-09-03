<#include "security.ftl">
<#import "logout.ftl" as l>

<nav class="navbar navbar-expand-lg navbar-light bg-light">

    <a class="navbar-brand" href="/">CHAT</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">


            <#if isЕntered>
                <li class="nav-item">
                    <a class="nav-link" href="/profile">Profile</a>
                </li>
            </#if>


            <li class="nav-item">
                <a class="nav-link" href="/">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/messages">Messages</a>
            </li>
           <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">User list</a>
                </li>
            </#if>
        </ul>
    </div>

        <div class="navbar-text mr-3">${name}</div>

        <#if isЕntered>
                   <@l.logout />
               </#if>

               <#if !isЕntered>
                   <@l.signin />
               </#if>
</nav>



