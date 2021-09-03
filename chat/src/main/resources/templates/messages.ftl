<#include "parts/security.ftl">
<#import "parts/page.ftl" as p>

<@p.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/messages" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="search by tag">
                <button type="submit" class="btn btn-primary ml-2">Search</button>
            </form>
        </div>
    </div>

    <#if isAdmin>
        <div class="form-row">
            <div class="form-group col-md-6">
                <form method="post" action="/delete" class="form-inline">
                    <input type="text" name="id" class="form-control" placeholder="delete by id :" >
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button type="submit" class="btn btn-primary ml-2">Delete</button>
                </form>
            </div>
        </div>
    </#if>



    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
         Add new Message
         <br>
     </a>
     <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" name="text" placeholder="enter your message" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="tag" placeholder="tag">
                </div>

                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">choose file</label>
                    </div>
                </div>

                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <div class="form-group">
                    <button type="submit" class="btn btn-primary ml-2">add</button>
                </div>
            </form>
        </div>
    </div>




    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                    <a href="/img/${message.filename}" download><button  class="btn btn-primary">Скачать файл</button></a>
                </#if>
                <div class="m-2">
                    <#if isAdmin>
                        <b>${message.id}</b>
                    </#if>
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>
            </div>
        <#else>
            No message
        </#list>
    </div>
</@p.page>


