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

    # Pink Brick
    BRICK_PINK : .word     0xfabbfd, 0xfabbfd, 0xfabbfd, 0xfabbfd,
                           0xfabbfd, 0xe7a7e8, 0xe7a7e8, 0xcb8ecd,
                           0xfabbfd, 0xe7a7e8, 0xe7a7e8, 0xcb8ecd,
                           0xcb8ecd, 0xcb8ecd, 0xcb8ecd, 0xcb8ecd,
    
    BRICK_RED : .word      0xff9999, 0xff9999, 0xff9999, 0xff9999,
                           0xff9999, 0xe67373, 0xe67373, 0xcc4d4d,
                           0xff9999, 0xe67373, 0xe67373, 0xcc4d4d,
                           0xcc4d4d, 0xcc4d4d, 0xcc4d4d, 0xcc4d4d,
    
    BRICK_BLUE : .word     0x99ccff, 0x99ccff, 0x99ccff, 0x99ccff,
                           0x99ccff, 0x73b3e6, 0x73b3e6, 0x4d99cc,
                           0x99ccff, 0x73b3e6, 0x73b3e6, 0x4d99cc,
                           0x4d99cc, 0x4d99cc, 0x4d99cc, 0x4d99cc,
    
    BRICK_GREEN : .word    0x99ff99, 0x99ff99, 0x99ff99, 0x99ff99,
                           0x99ff99, 0x73e673, 0x73e673, 0x4dcc4d,
                           0x99ff99, 0x73e673, 0x73e673, 0x4dcc4d,
                           0x4dcc4d, 0x4dcc4d, 0x4dcc4d, 0x4dcc4d,
    
    BRICK_YELLOW : .word   0xffff99, 0xffff99, 0xffff99, 0xffff99,
                           0xffff99, 0xe6e673, 0xe6e673, 0xcccc4d,
                           0xffff99, 0xe6e673, 0xe6e673, 0xcccc4d,
                           0xcccc4d, 0xcccc4d, 0xcccc4d, 0xcccc4d,
    
    BRICK_ORANGE : .word   0xffcc99, 0xffcc99, 0xffcc99, 0xffcc99,
                           0xffcc99, 0xe6b373, 0xe6b373, 0xcc994d,
                           0xffcc99, 0xe6b373, 0xe6b373, 0xcc994d,
                           0xcc994d, 0xcc994d, 0xcc994d, 0xcc994d,
    
    BRICK_PURPLE : .word   0xcc99ff, 0xcc99ff, 0xcc99ff, 0xcc99ff,
                           0xcc99ff, 0xb373e6, 0xb373e6, 0x994dcc,
                           0xcc99ff, 0xb373e6, 0xb373e6, 0x994dcc,
                           0x994dcc, 0x994dcc, 0x994dcc, 0x994dcc,
    
    BRICK_CYAN : .word     0x99ffff, 0x99ffff, 0x99ffff, 0x99ffff,
                           0x99ffff, 0x73e6e6, 0x73e6e6, 0x4dcccc,
                           0x99ffff, 0x73e6e6, 0x73e6e6, 0x4dcccc,
                           0x4dcccc, 0x4dcccc, 0x4dcccc, 0x4dcccc,
    
    BRICK_BROWN : .word    0xcc9966, 0xcc9966, 0xcc9966, 0xcc9966,
                           0xcc9966, 0xb38552, 0xb38552, 0x99733d,
                           0xcc9966, 0xb38552, 0xb38552, 0x99733d,
                           0x99733d, 0x99733d, 0x99733d, 0x99733d,
    
    BRICK_GRAY : .word     0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc,
                           0xcccccc, 0xb3b3b3, 0xb3b3b3, 0x999999,
                           0xcccccc, 0xb3b3b3, 0xb3b3b3, 0x999999,
                           0x999999, 0x999999, 0x999999, 0x999999,
    
    BRICK_LIME : .word     0xccff99, 0xccff99, 0xccff99, 0xccff99,
                           0xccff99, 0xb3e673, 0xb3e673, 0x99cc4d,
                           0xccff99, 0xb3e673, 0xb3e673, 0x99cc4d,
                           0x99cc4d, 0x99cc4d, 0x99cc4d, 0x99cc4d,
    
    BRICK_TEAL : .word     0x66cccc, 0x66cccc, 0x66cccc, 0x66cccc,
                           0x66cccc, 0x52b3b3, 0x52b3b3, 0x3d9999,
                           0x66cccc, 0x52b3b3, 0x52b3b3, 0x3d9999,
                           0x3d9999, 0x3d9999, 0x3d9999, 0x3d9999,
    
    BRICK_CORAL : .word    0xff9966, 0xff9966, 0xff9966, 0xff9966,
                           0xff9966, 0xe68552, 0xe68552, 0xcc733d,
                           0xff9966, 0xe68552, 0xe68552, 0xcc733d,
                           0xcc733d, 0xcc733d, 0xcc733d, 0xcc733d,
    
    BRICK_BLACK : .word    0x333333, 0x333333, 0x333333, 0x333333,
                           0x333333, 0x262626, 0x262626, 0x1a1a1a,
                           0x333333, 0x262626, 0x262626, 0x1a1a1a,
                           0x1a1a1a, 0x1a1a1a, 0x1a1a1a, 0x1a1a1a,
    
    BRICK_WHITE : .word    0xffffff, 0xffffff, 0xffffff, 0xffffff,
                           0xffffff, 0xe6e6e6, 0xe6e6e6, 0xcccccc,
                           0xffffff, 0xe6e6e6, 0xe6e6e6, 0xcccccc,
                           0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc,
    
    BRICK_MAPPING : .word BRICK_BLACK, BRICK_WHITE, BRICK_GRAY, BRICK_RED, BRICK_BLUE, BRICK_GREEN, BRICK_YELLOW, BRICK_ORANGE, BRICK_PURPLE, BRICK_PINK, BRICK_CYAN, BRICK_BROWN, BRICK_LIME

    MENU_LAYOUT: .byte 0x9, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x1, 0x0,
                       0x0, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x1, 0x0,
                       0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0

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
        # Initialize the game
        li $t1, 0xff0000        # $t1 = red
        li $t2, 0x00ff00        # $t2 = green
        li $t3, 0x0000ff        # $t3 = blue
    
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
        # load the address of menu
        li $t1, 0 # y value
        li $t2, 0 # x value
        draw_menu_loop:
            beq $t1, 16, draw_menu_loop_y_end
            draw_menu_loop_x:
                beq $t2, 16, draw_menu_loop_x_end

                # push saved variables
                addi $sp, $sp, -4
                sw $t1, 0($sp)
                addi $sp, $sp, -4
                sw $t2, 0($sp)

                # draw the current brick
                mult $t3, $t1, 16  # t3 = 16 *  y
                mult $t4, $t3, 4 # t4 = 16 * 4 * y
                add $t3, $t3, $t2 # t3 = 16 * y + x
                add $t4, $t4, $t2 # t3 = 16 * y + x
                mult $t3, $t3, 16 # t3 = 16 * 4 * y + 4 * x
                mult $t4, $t4, 16 # t4 = 16 * 4 * 4 * y + 4 * x
                la $t0, MENU_LAYOUT
                add $t3, $t3, $t0 # t3 = ADDR + 16 * 4 * y + 4 * x
                lw $t0, ADDR_DSPL
                add $t4, $t4, $t0 # t3 = ADDR + 16 * 4 * y + 4 * x
                
                lb $t3, 0($t3) # t3 is the current color enum
                
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
                j draw_brick_loop
        draw_menu_loop_y_end:
            li $t1, 0
        

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
        li $t1, 0 # y-counter
        li $t2, 0 # x-counter
        draw_brick_loop:
            beq $t1, 4, end_y
            draw_brick_loop_x:
                beq $t2, 4, end_x

                # load the color into t6
                mul $t6, $t1, 16 
                mul $t4, $t2, 4 # x * 4 * 4
                add $t6, $t6, $t4
                add $t6, $t6, $t0 # add the address of color
                lw $t6, 0($t6)
                # load the address into t5
                mul $t5, $t1, 256 # t5 = y * 16 (width) * 4 (word size) * 4 (brick size)
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
