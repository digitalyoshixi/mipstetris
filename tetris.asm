#####################################################################
# CSCB58 Summer 2025 Assembly Final Project - UTSC
# David Chen, 1011011593, chenda99, davyh.chen@mail.utoronto.ca
# Bitmap Display Configuration:
# - Unit width in pixels: 4 (update this as needed) 
# - Unit height in pixels: 4 (update this as needed)
# - Display width in pixels: 512 (update this as needed)
# - Display height in pixels: 512 (update this as needed)
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestones have been reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone 1/2/3/4/5 (choose the one the applies)
#
# Which approved features have been implemented?
# (See the assignment handout for the list of features)
# Easy Features:
# 1. (fill in the feature, if any)
# 2. (fill in the feature, if any)
# ... (add more if necessary)
# Hard Features:
# 1. (fill in the feature, if any)
# 2. (fill in the feature, if any)
# ... (add more if necessary)
# How to play:
# (Include any instructions)
# Link to video demonstration for final submission:
# - (insert YouTube / MyMedia / other URL here). Make sure we can view it!
#
# Are you OK with us sharing the video with people outside course staff?
# - yes
#
# Any additional information that the TA needs to know:
# - (write here, if any)
#
#####################################################################

##############################################################################

##############################################################################
# Immutable Data
##############################################################################
# The address of the bitmap display. Don't forget to connect it!
.data
    ADDR_DSPL:.word 0x10008000
    # The address of the keyboard. Don't forget to connect it!
    ADDR_KBRD: .word 0xffff0000
    # display will cover 14400 pixels
    ADDR_GAME_MENU_BOOL: .word 0x10008000

    BRICK_BLACK : .word    0x404040, 0x404040, 0x404040, 0x404040, 0x404040, 0x404040, 
                           0x404040, 0x303030, 0x303030, 0x303030, 0x303030, 0x303030, 
                           0x404040, 0x303030, 0x202020, 0x202020, 0x202020, 0x202020, 
                           0x404040, 0x303030, 0x202020, 0x202020, 0x202020, 0x202020, 
                           0x404040, 0x303030, 0x202020, 0x202020, 0x202020, 0x202020, 
                           0x404040, 0x303030, 0x202020, 0x202020, 0x202020, 0x202020

    BRICK_WHITE : .word    0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0xffffff, 0xf0f0f0, 0xf0f0f0, 0xf0f0f0, 0xf0f0f0, 0xf0f0f0, 
                           0xffffff, 0xf0f0f0, 0xe0e0e0, 0xe0e0e0, 0xe0e0e0, 0xe0e0e0, 
                           0xffffff, 0xf0f0f0, 0xe0e0e0, 0xe0e0e0, 0xe0e0e0, 0xe0e0e0, 
                           0xffffff, 0xf0f0f0, 0xe0e0e0, 0xe0e0e0, 0xe0e0e0, 0xe0e0e0, 
                           0xffffff, 0xf0f0f0, 0xe0e0e0, 0xe0e0e0, 0xe0e0e0, 0xe0e0e0 

    BRICK_GRAY : .word     0xa0a0a0, 0xa0a0a0, 0xa0a0a0, 0xa0a0a0, 0xa0a0a0, 0xa0a0a0, 
                           0xa0a0a0, 0x909090, 0x909090, 0x909090, 0x909090, 0x909090, 
                           0xa0a0a0, 0x909090, 0x808080, 0x808080, 0x808080, 0x808080, 
                           0xa0a0a0, 0x909090, 0x808080, 0x808080, 0x808080, 0x808080, 
                           0xa0a0a0, 0x909090, 0x808080, 0x808080, 0x808080, 0x808080, 
                           0xa0a0a0, 0x909090, 0x808080, 0x808080, 0x808080, 0x808080 

    BRICK_RED : .word      0xff8080, 0xff8080, 0xff8080, 0xff8080, 0xff8080, 0xff8080, 
                           0xff8080, 0xf06060, 0xf06060, 0xf06060, 0xf06060, 0xf06060, 
                           0xff8080, 0xf06060, 0xe04040, 0xe04040, 0xe04040, 0xe04040, 
                           0xff8080, 0xf06060, 0xe04040, 0xe04040, 0xe04040, 0xe04040, 
                           0xff8080, 0xf06060, 0xe04040, 0xe04040, 0xe04040, 0xe04040, 
                           0xff8080, 0xf06060, 0xe04040, 0xe04040, 0xe04040, 0xe04040

    BRICK_BLUE : .word     0x8080ff, 0x8080ff, 0x8080ff, 0x8080ff, 0x8080ff, 0x8080ff, 
                           0x8080ff, 0x6060f0, 0x6060f0, 0x6060f0, 0x6060f0, 0x6060f0, 
                           0x8080ff, 0x6060f0, 0x4040e0, 0x4040e0, 0x4040e0, 0x4040e0, 
                           0x8080ff, 0x6060f0, 0x4040e0, 0x4040e0, 0x4040e0, 0x4040e0, 
                           0x8080ff, 0x6060f0, 0x4040e0, 0x4040e0, 0x4040e0, 0x4040e0, 
                           0x8080ff, 0x6060f0, 0x4040e0, 0x4040e0, 0x4040e0, 0x4040e0

    BRICK_GREEN : .word    0x80ff80, 0x80ff80, 0x80ff80, 0x80ff80, 0x80ff80, 0x80ff80, 
                           0x80ff80, 0x60f060, 0x60f060, 0x60f060, 0x60f060, 0x60f060, 
                           0x80ff80, 0x60f060, 0x40e040, 0x40e040, 0x40e040, 0x40e040, 
                           0x80ff80, 0x60f060, 0x40e040, 0x40e040, 0x40e040, 0x40e040, 
                           0x80ff80, 0x60f060, 0x40e040, 0x40e040, 0x40e040, 0x40e040, 
                           0x80ff80, 0x60f060, 0x40e040, 0x40e040, 0x40e040, 0x40e040 

    BRICK_YELLOW : .word   0xffff80, 0xffff80, 0xffff80, 0xffff80, 0xffff80, 0xffff80, 
                           0xffff80, 0xf0f060, 0xf0f060, 0xf0f060, 0xf0f060, 0xf0f060, 
                           0xffff80, 0xf0f060, 0xe0e040, 0xe0e040, 0xe0e040, 0xe0e040, 
                           0xffff80, 0xf0f060, 0xe0e040, 0xe0e040, 0xe0e040, 0xe0e040, 
                           0xffff80, 0xf0f060, 0xe0e040, 0xe0e040, 0xe0e040, 0xe0e040, 
                           0xffff80, 0xf0f060, 0xe0e040, 0xe0e040, 0xe0e040, 0xe0e040, 

    BRICK_ORANGE : .word   0xffc080, 0xffc080, 0xffc080, 0xffc080, 0xffc080, 0xffc080, 
                           0xffc080, 0xf0a060, 0xf0a060, 0xf0a060, 0xf0a060, 0xf0a060, 
                           0xffc080, 0xf0a060, 0xe08040, 0xe08040, 0xe08040, 0xe08040, 
                           0xffc080, 0xf0a060, 0xe08040, 0xe08040, 0xe08040, 0xe08040, 
                           0xffc080, 0xf0a060, 0xe08040, 0xe08040, 0xe08040, 0xe08040, 
                           0xffc080, 0xf0a060, 0xe08040, 0xe08040, 0xe08040, 0xe08040, 
                           0xffc080, 0xf0a060, 0xf0a060, 0xf0a060, 0xf0a060, 0xf0a060, 
                           0xffc080, 0xffc080, 0xffc080, 0xffc080, 0xffc080, 0xffc080

    BRICK_PURPLE : .word   0xc080ff, 0xc080ff, 0xc080ff, 0xc080ff, 0xc080ff, 0xc080ff, 
                           0xc080ff, 0xa060f0, 0xa060f0, 0xa060f0, 0xa060f0, 0xa060f0, 
                           0xc080ff, 0xa060f0, 0x8040e0, 0x8040e0, 0x8040e0, 0x8040e0, 
                           0xc080ff, 0xa060f0, 0x8040e0, 0x8040e0, 0x8040e0, 0x8040e0, 
                           0xc080ff, 0xa060f0, 0x8040e0, 0x8040e0, 0x8040e0, 0x8040e0, 
                           0xc080ff, 0xa060f0, 0x8040e0, 0x8040e0, 0x8040e0, 0x8040e0

    BRICK_PINK : .word     0xfcb8fe, 0xfcb8fe, 0xfcb8fe, 0xfcb8fe, 0xfcb8fe, 0xfcb8fe, 
                           0xfcb8fe, 0xf09df3, 0xf09df3, 0xf09df3, 0xf09df3, 0xf09df3, 
                           0xfcb8fe, 0xf09df3, 0xee93ed, 0xee93ed, 0xee93ed, 0xee93ed, 
                           0xfcb8fe, 0xf09df3, 0xee93ed, 0xee93ed, 0xee93ed, 0xee93ed, 
                           0xfcb8fe, 0xf09df3, 0xee93ed, 0xee93ed, 0xee93ed, 0xee93ed, 
                           0xfcb8fe, 0xf09df3, 0xee93ed, 0xee93ed, 0xee93ed, 0xee93ed 

    BRICK_CYAN : .word     0x80ffff, 0x80ffff, 0x80ffff, 0x80ffff, 0x80ffff, 0x80ffff, 
                           0x80ffff, 0x60f0f0, 0x60f0f0, 0x60f0f0, 0x60f0f0, 0x60f0f0, 
                           0x80ffff, 0x60f0f0, 0x40e0e0, 0x40e0e0, 0x40e0e0, 0x40e0e0, 
                           0x80ffff, 0x60f0f0, 0x40e0e0, 0x40e0e0, 0x40e0e0, 0x40e0e0, 
                           0x80ffff, 0x60f0f0, 0x40e0e0, 0x40e0e0, 0x40e0e0, 0x40e0e0, 
                           0x80ffff, 0x60f0f0, 0x40e0e0, 0x40e0e0, 0x40e0e0, 0x40e0e0 

    BRICK_BROWN : .word    0xb8804c, 0xb8804c, 0xb8804c, 0xb8804c, 0xb8804c, 0xb8804c, 
                           0xb8804c, 0xa06038, 0xa06038, 0xa06038, 0xa06038, 0xa06038, 
                           0xb8804c, 0xa06038, 0x804020, 0x804020, 0x804020, 0x804020, 
                           0xb8804c, 0xa06038, 0x804020, 0x804020, 0x804020, 0x804020, 
                           0xb8804c, 0xa06038, 0x804020, 0x804020, 0x804020, 0x804020, 
                           0xb8804c, 0xa06038, 0x804020, 0x804020, 0x804020, 0x804020 

    BRICK_LIME : .word     0xc0ff80, 0xc0ff80, 0xc0ff80, 0xc0ff80, 0xc0ff80, 0xc0ff80, 
                           0xc0ff80, 0xa0f060, 0xa0f060, 0xa0f060, 0xa0f060, 0xa0f060, 
                           0xc0ff80, 0xa0f060, 0x80e040, 0x80e040, 0x80e040, 0x80e040, 
                           0xc0ff80, 0xa0f060, 0x80e040, 0x80e040, 0x80e040, 0x80e040, 
                           0xc0ff80, 0xa0f060, 0x80e040, 0x80e040, 0x80e040, 0x80e040, 
                           0xc0ff80, 0xa0f060, 0x80e040, 0x80e040, 0x80e040, 0x80e040

    BRICK_MAPPING : .word BRICK_BLACK, BRICK_WHITE, BRICK_GRAY, BRICK_RED, BRICK_BLUE, BRICK_GREEN, BRICK_YELLOW, BRICK_ORANGE, BRICK_PURPLE, BRICK_PINK, BRICK_CYAN, BRICK_BROWN, BRICK_LIME

    MENU_LAYOUT: .byte 0x9, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0x0, 0x0, 0x0, 0x0,
                       0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1,
                       0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0

##############################################################################
# Mutable Data
##############################################################################

##############################################################################
# Code
##############################################################################
.text
.globl main

    # Run the Tetris game.
    main:
        lw $t0, ADDR_DSPL       # $t0 = base address for display
        sw $t1, 0($t0)          # paint the first unit (i.e., top-left) red
        sw $t2, 4($t0)          # paint the second unit on the first row green
        sw $t3, 128($t0)        # paint the first unit on the second row blue
    
    game_loop:
    	# 1a. Check if key has been pressed
        lw $t0, ADDR_KBRD
        lw $t8, 0($t0)
        beq $t8, 0, after_input
        check_input:
            # 1b. Check which key has been pressed
            lw $s0, 4($t0)
        after_input:
            # check the state boolean
            jal draw_menu
            
            # 2a. Check for collisions
    	    # 2b. Update locations (paddle, ball)
    	    # 3. Draw the screen
    	    # 4. Sleep
        li $v0, 32
        li $a0, 1
        syscall
    
        #5. Go back to 1
        b game_loop


    draw_menu:
        # store the return address onto the stack
        addi $sp, $sp, -4
        sw $ra, 0($sp)
        # setup loop variables
        li $t1, 0 # y value
        li $t2, 0 # x value
        draw_menu_loop:
            beq $t1, 16, draw_menu_loop_y_end
            draw_menu_loop_x:
                beq $t2, 14, draw_menu_loop_x_end

                # push saved variables
                addi $sp, $sp, -4
                sw $t1, 0($sp)
                addi $sp, $sp, -4
                sw $t2, 0($sp)

                # current brick enum
                mul $t3, $t1, 14 # screen_width
                mul $t5, $t2, 1
                add $t3, $t3, $t5 # t3 = 16y + 4x
                la $t0, MENU_LAYOUT
                add $t3, $t3, $t0 # t3 = ADDR + 16 * 4 * y + 4 * x
                lb $t3, 0($t3) # t3 is the current color enum
                # current address
                mul $t4, $t1, 2016 # screen_width(16 usually) * 4 * brick_width * brick_height
                mul $t5, $t2, 24 # brick width * 4
                add $t4, $t4, $t5
                lw $t0, ADDR_DSPL
                addu $t4, $t4, $t0 # t3 = ADDR + 16 * 4 * y + 4 * x
                
                
                addi $sp, $sp, -4
                sw $t4, 0($sp)
                addi $sp, $sp, -4
                sw $t3, 0($sp)
                jal draw_brick
                
				# POP the previously saved variables
                lw $t2, 0($sp)
                addi $sp, $sp, 4
                lw $t1, 0($sp)
                addi $sp, $sp, 4
                
                addi $t2, $t2, 1
                j draw_menu_loop_x
            draw_menu_loop_x_end:
                li $t2, 0
                addi $t1, $t1, 1
                j draw_menu_loop
        draw_menu_loop_y_end:
            li $t1, 0
            # retrieve return value from stack
            lw $ra, 0($sp)
            addi $sp, $sp, 4
            jr $ra
        

    draw_brick: # draw_brick(BRICK_COLOR_ENUM, DRAW_ADDR)
        # pop the argument from the stack
        
        # compute the brick color address from the offsets
        la $t9, BRICK_MAPPING
        lb $t0, 0($sp)
        addi $sp, $sp, 4
        mul $t0, $t0, 4
        add $t9, $t9, $t0
        lw $t0, 0($t9)
        
        # get the address to draw at
        lw $t9, 0($sp)
        addi $sp, $sp, 4
        # setup loop variables
        li $t1, 0 # y-counter
        li $t2, 0 # x-counter
        draw_brick_loop:
            beq $t1, 6, end_y
            draw_brick_loop_x:
                beq $t2, 6, end_x

                # load the color into t6
                mul $t6, $t1, 24 # 4 * brick-width
                mul $t4, $t2, 4 # x * 4 * 4
                add $t6, $t6, $t4
                add $t6, $t6, $t0 # add the address of color
                lw $t6, 0($t6)
                # load the address into t5
                mul $t5, $t1, 336 # screen_width(usually 16) * 4 * brick_width
                mul $t4, $t2, 4 # x * 4 * 4
                add $t5, $t5, $t4 # t5 = y * 64 + 4x
                add $t5, $t5, $t9 # add the address of to print
                # write into screen
                sw $t6, 0($t5)
                addi $t2, $t2, 1
                j draw_brick_loop_x
            end_x:
                li $t2, 0
                addi $t1, $t1, 1
                j draw_brick_loop
        end_y:
            li $t1, 0
            jr $ra
        
    exit:
        li $v0, 10              # terminate the program gracefully
        syscall
