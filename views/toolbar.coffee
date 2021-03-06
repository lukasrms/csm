class window.ToolbarView extends Backbone.View
    events: 
        'click button#zoomin': 'zoomin'
        'click button#zoomout': 'zoomout'
        'click button#shot': 'shot'
        'click button#save': 'save'
        'click button#finished': 'finished'
        'click button#preview': 'preview'
    
    initialize: ->
        @$el.find('button').button()
        
    shot: ->
        window.last_frame_view.trigger('render')
        
    save: ->
        dialog = $('#saving-dialog').dialog
            title: 'Saving'
            modal: yes
            
        window.uploader.save_images $('img'), =>
            dialog.remove()
            
    finished: ->
        window.uploader.finished()
        $('#finished-dialog').dialog
            title: 'Saving'
            modal: yes
            
    preview: ->
        window.last_frame_view.preview()
        
    zoomin: ->
        window.main_window_view.zoom.in()
        
    zoomout: ->
        window.main_window_view.zoom.out()
