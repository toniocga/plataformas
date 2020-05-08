extends Node
#var pant_carga
var loader
var wait_frames = 20
var time_max = 100 # msec
var current_scene
onready var escena_carga

func _ready():
	
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() -1)
#	root.call_deferred("add_child()","escena_carga")
func goto_scene(path): # game requests to switch to this scene
	escena_carga = load("res://Menus/pantalla_carga/Carga.tscn").instance()
	add_child(escena_carga)
	
	loader = ResourceLoader.load_interactive(path)
	if loader == null: # check for errors
#        show_error()
		return
	set_process(true)

	current_scene.queue_free() # get rid of the old scene
	
#	node("animation").play("carga")
	
	

func _process(_time):
	if loader == null:
		
		# no need to process anymore
		set_process(false)
		return

	if wait_frames > 0: # wait for frames to let the "loading" animation show up
		wait_frames -= 1
		return

	var t = OS.get_ticks_msec()
	while OS.get_ticks_msec() < t + time_max: # use "time_max" to control for how long we block this thread

        # poll your loader
		var err = loader.poll()

		if err == ERR_FILE_EOF: # Finished loading.
			var resource = loader.get_resource()
			
			loader = null
			 
			
			set_new_scene(resource)
			
			break
		elif err == OK:
#			update_progress()
			pass
		else: # error during loading
#            show_error()
            loader = null
            break
			
#func update_progress():
#	var progress = float(loader.get_stage()) / loader.get_stage_count()
#	var length = get_node("animation").get_current_animation_length()
		
	# Update your progress bar?
#    get_node("progress").set_progress(progress)

    # ... or update a progress animation?
#   
    # Call this on a paused animation. Use "true" as the second argument to force the animation to update.
#    get_node("animation").seek(progress * length, true)

func set_new_scene(scene_resource):
	escena_carga.queue_free()
	current_scene = scene_resource.instance()
	
	get_node("/root").add_child(current_scene)
	
