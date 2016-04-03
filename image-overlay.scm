
(script-fu-register
            "script-fu-image-overlay"                        ;func name
            "Image Overlay"                                  ;menu label
            "Sets up foreground and background images \
              for editing with a channel mask"               ;description
            "Petri Ahonen"                                   ;author
            "copyright 2016, Petri Ahonen"
            "April 3, 2016"                                  ;date created
            ""                     ;image type that the script works on
	    SF-FILENAME    "Foreground"    "Foreground image"
	    SF-FILENAME    "Background"    "Background image"
	    )
(script-fu-menu-register "script-fu-image-overlay" "<Image>/File/Create")
(define (script-fu-image-overlay foregroundFile backgroundFile)
  (let*
      (
					; define our local variables
					; create a new image:
       (backImage (car (gimp-file-load RUN-NONINTERACTIVE backgroundFile "")))
       (foreLayer (car (gimp-file-load-layer RUN-NONINTERACTIVE backImage foregroundFile)))
       (foreMask (car (gimp-layer-create-mask foreLayer ADD-WHITE-MASK)))
       ) ;end of our local variables

    (gimp-display-new backImage)
    (gimp-image-insert-layer backImage foreLayer 0 0)
    (gimp-layer-add-mask foreLayer foreMask)
    )
  )
