class window.Uploader
    save_images:(images,callback) ->
        image_id = 0
        _.each images, (image) =>
            image_id += 1
            $.post "/#{window.session_id()}/save/",
                file: $(image).attr 'src'
                image_id: image_id,
            
        callback()
    
    finished: ->
        $.post "/#{window.session_id()}/finished/", =>
            @wait_for_encoding_complete()
        
    wait_for_encoding_complete: ->
        $.get "/#{window.session_id()}/is_video_ready/", (data) =>
            is_video_ready = false
            is_video_ready = true if data == 'true'
            
            if is_video_ready
                $('#finished-dialog').dialog 'close'
                document.location.href = "/#{window.session_id()}/download/"
            else
                setTimeout =>
                    @wait_for_encoding_complete()
                , 2000
                
    
$(document).ready ->
    window.session_id = ->
        session_id = 'xxxxxxxxx'.replace /[x]/g , ->
            _.random 9
        
        window.session_id = ->
            session_id
        
        session_id
        
    window.uploader = new Uploader