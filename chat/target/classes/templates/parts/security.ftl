<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>

<#if known>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = user.getUsername()
    isAdmin = user.isAdmin()
    getId = user.getId()
    isЕntered = true
    >
<#else>
    <#assign
    name = "unknown user"
    isAdmin = false
    isЕntered = false
    >
</#if>