#####################################################################
# CSCB58 Summer 2025 Assembly Final Project - UTSC
# David Chen, 1011011593, chenda99, davyh.chen@mail.utoronto.ca
# Bitmap Display Configuration:
# - Unit width in pixels: 1 (update this as needed) 
# - Unit height in pixels: 1 (update this as needed)
# - Display width in pixels: 84 (update this as needed)
# - Display height in pixels: 96 (update this as needed)
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestones have been reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone 3
#
# Which approved features have been implemented?
# (See the assignment handout for the list of features)
# Easy Features:
# 1. gravity
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

    BRICK_BLACK: .word     0x404040, 0x404040, 0x404040, 0x404040, 0x404040, 0x202020,
                           0x404040, 0x303030, 0x303030, 0x303030, 0x303030, 0x202020,
                           0x404040, 0x303030, 0x202020, 0x202020, 0x101010, 0x202020,
                           0x404040, 0x303030, 0x202020, 0x202020, 0x101010, 0x202020,
                           0x404040, 0x101010, 0x101010, 0x101010, 0x101010, 0x202020,
                           0x202020, 0x202020, 0x202020, 0x202020, 0x202020, 0x202020
    
    BRICK_WHITE: .word     0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xcccccc,
                           0xffffff, 0xeeeeee, 0xeeeeee, 0xeeeeee, 0xeeeeee, 0xcccccc,
                           0xffffff, 0xeeeeee, 0xdddddd, 0xdddddd, 0xbbbbbb, 0xcccccc,
                           0xffffff, 0xeeeeee, 0xdddddd, 0xdddddd, 0xbbbbbb, 0xcccccc,
                           0xffffff, 0xbbbbbb, 0xbbbbbb, 0xbbbbbb, 0xbbbbbb, 0xcccccc,
                           0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc, 0xcccccc
    
    BRICK_GRAY: .word      0xaaaaaa, 0xaaaaaa, 0xaaaaaa, 0xaaaaaa, 0xaaaaaa, 0x777777,
                           0xaaaaaa, 0x999999, 0x999999, 0x999999, 0x999999, 0x777777,
                           0xaaaaaa, 0x999999, 0x888888, 0x888888, 0x666666, 0x777777,
                           0xaaaaaa, 0x999999, 0x888888, 0x888888, 0x666666, 0x777777,
                           0xaaaaaa, 0x666666, 0x666666, 0x666666, 0x666666, 0x777777,
                           0x777777, 0x777777, 0x777777, 0x777777, 0x777777, 0x777777
    
    BRICK_RED: .word       0xff9999, 0xff9999, 0xff9999, 0xff9999, 0xff9999, 0xcc6666,
                           0xff9999, 0xff7777, 0xff7777, 0xff7777, 0xff7777, 0xcc6666,
                           0xff9999, 0xff7777, 0xff4444, 0xff4444, 0xaa4444, 0xcc6666,
                           0xff9999, 0xff7777, 0xff4444, 0xff4444, 0xaa4444, 0xcc6666,
                           0xff9999, 0xaa4444, 0xaa4444, 0xaa4444, 0xaa4444, 0xcc6666,
                           0xcc6666, 0xcc6666, 0xcc6666, 0xcc6666, 0xcc6666, 0xcc6666
    
    BRICK_BLUE: .word      0x9999ff, 0x9999ff, 0x9999ff, 0x9999ff, 0x9999ff, 0x6666cc,
                           0x9999ff, 0x7777ff, 0x7777ff, 0x7777ff, 0x7777ff, 0x6666cc,
                           0x9999ff, 0x7777ff, 0x4444ff, 0x4444ff, 0x4444aa, 0x6666cc,
                           0x9999ff, 0x7777ff, 0x4444ff, 0x4444ff, 0x4444aa, 0x6666cc,
                           0x9999ff, 0x4444aa, 0x4444aa, 0x4444aa, 0x4444aa, 0x6666cc,
                           0x6666cc, 0x6666cc, 0x6666cc, 0x6666cc, 0x6666cc, 0x6666cc
    
    BRICK_GREEN: .word     0x99ff99, 0x99ff99, 0x99ff99, 0x99ff99, 0x99ff99, 0x66cc66,
                           0x99ff99, 0x77ff77, 0x77ff77, 0x77ff77, 0x77ff77, 0x66cc66,
                           0x99ff99, 0x77ff77, 0x44ff44, 0x44ff44, 0x44aa44, 0x66cc66,
                           0x99ff99, 0x77ff77, 0x44ff44, 0x44ff44, 0x44aa44, 0x66cc66,
                           0x99ff99, 0x44aa44, 0x44aa44, 0x44aa44, 0x44aa44, 0x66cc66,
                           0x66cc66, 0x66cc66, 0x66cc66, 0x66cc66, 0x66cc66, 0x66cc66
    
    BRICK_YELLOW: .word    0xffff99, 0xffff99, 0xffff99, 0xffff99, 0xffff99, 0xcccc66,
                           0xffff99, 0xffff77, 0xffff77, 0xffff77, 0xffff77, 0xcccc66,
                           0xffff99, 0xffff77, 0xffff44, 0xffff44, 0xaaaa44, 0xcccc66,
                           0xffff99, 0xffff77, 0xffff44, 0xffff44, 0xaaaa44, 0xcccc66,
                           0xffff99, 0xaaaa44, 0xaaaa44, 0xaaaa44, 0xaaaa44, 0xcccc66,
                           0xcccc66, 0xcccc66, 0xcccc66, 0xcccc66, 0xcccc66, 0xcccc66
    
    BRICK_ORANGE: .word    0xffbb77, 0xffbb77, 0xffbb77, 0xffbb77, 0xffbb77, 0xcc8844,
                           0xffbb77, 0xff9955, 0xff9955, 0xff9955, 0xff9955, 0xcc8844,
                           0xffbb77, 0xff9955, 0xff7733, 0xff7733, 0xaa5533, 0xcc8844,
                           0xffbb77, 0xff9955, 0xff7733, 0xff7733, 0xaa5533, 0xcc8844,
                           0xffbb77, 0xaa5533, 0xaa5533, 0xaa5533, 0xaa5533, 0xcc8844,
                           0xcc8844, 0xcc8844, 0xcc8844, 0xcc8844, 0xcc8844, 0xcc8844
    
    BRICK_PURPLE: .word    0xbb99ff, 0xbb99ff, 0xbb99ff, 0xbb99ff, 0xbb99ff, 0x8866cc,
                           0xbb99ff, 0x9977ff, 0x9977ff, 0x9977ff, 0x9977ff, 0x8866cc,
                           0xbb99ff, 0x9977ff, 0x7744ff, 0x7744ff, 0x5544aa, 0x8866cc,
                           0xbb99ff, 0x9977ff, 0x7744ff, 0x7744ff, 0x5544aa, 0x8866cc,
                           0xbb99ff, 0x5544aa, 0x5544aa, 0x5544aa, 0x5544aa, 0x8866cc,
                           0x8866cc, 0x8866cc, 0x8866cc, 0x8866cc, 0x8866cc, 0x8866cc
    
    BRICK_PINK: .word      0xfcb8fe, 0xfcb8fe, 0xfcb8fe, 0xfcb8fe, 0xfcb8fe, 0xa96fa9,
                           0xfcb8fe, 0xf09df3, 0xf09df3, 0xf09df3, 0xf09df3, 0xa96fa9,
                           0xfcb8fe, 0xf09df3, 0xee93ed, 0xee93ed, 0xcc7ec8, 0xa96fa9,
                           0xfcb8fe, 0xf09df3, 0xee93ed, 0xee93ed, 0xcc7ec8, 0xa96fa9,
                           0xfcb8fe, 0xcc7ec8, 0xcc7ec8, 0xcc7ec8, 0xcc7ec8, 0xa96fa9,
                           0xa96fa9, 0xa96fa9, 0xa96fa9, 0xa96fa9, 0xa96fa9, 0xa96fa9
    
    BRICK_CYAN: .word      0x99ffff, 0x99ffff, 0x99ffff, 0x99ffff, 0x99ffff, 0x66cccc,
                           0x99ffff, 0x77ffff, 0x77ffff, 0x77ffff, 0x77ffff, 0x66cccc,
                           0x99ffff, 0x77ffff, 0x44ffff, 0x44ffff, 0x44aaaa, 0x66cccc,
                           0x99ffff, 0x77ffff, 0x44ffff, 0x44ffff, 0x44aaaa, 0x66cccc,
                           0x99ffff, 0x44aaaa, 0x44aaaa, 0x44aaaa, 0x44aaaa, 0x66cccc,
                           0x66cccc, 0x66cccc, 0x66cccc, 0x66cccc, 0x66cccc, 0x66cccc
    
    BRICK_BROWN: .word     0xbb8855, 0xbb8855, 0xbb8855, 0xbb8855, 0xbb8855, 0x885533,
                           0xbb8855, 0x996644, 0x996644, 0x996644, 0x996644, 0x885533,
                           0xbb8855, 0x996644, 0x774422, 0x774422, 0x553322, 0x885533,
                           0xbb8855, 0x996644, 0x774422, 0x774422, 0x553322, 0x885533,
                           0xbb8855, 0x553322, 0x553322, 0x553322, 0x553322, 0x885533,
                           0x885533, 0x885533, 0x885533, 0x885533, 0x885533, 0x885533
    
    BRICK_LIME: .word      0xbbff77, 0xbbff77, 0xbbff77, 0xbbff77, 0xbbff77, 0x88cc44,
                           0xbbff77, 0x99ff55, 0x99ff55, 0x99ff55, 0x99ff55, 0x88cc44,
                           0xbbff77, 0x99ff55, 0x77ff33, 0x77ff33, 0x55aa33, 0x88cc44,
                           0xbbff77, 0x99ff55, 0x77ff33, 0x77ff33, 0x55aa33, 0x88cc44,
                           0xbbff77, 0x55aa33, 0x55aa33, 0x55aa33, 0x55aa33, 0x88cc44,
                           0x88cc44, 0x88cc44, 0x88cc44, 0x88cc44, 0x88cc44, 0x88cc44
    
    BRICK_A: .word         0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff
    
    BRICK_B: .word         0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000
    
    BRICK_C: .word         0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff
    
    BRICK_D: .word         0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000
    
    BRICK_E: .word         0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff
    
    BRICK_F: .word         0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
    
    BRICK_G: .word         0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0xffffff, 0xffffff, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000
    
    BRICK_H: .word         0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff
    
    BRICK_I: .word         0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0x000000, 0x000000, 0xffffff, 0xffffff, 0x000000, 0x000000, 
                           0x000000, 0x000000, 0xffffff, 0xffffff, 0x000000, 0x000000, 
                           0x000000, 0x000000, 0xffffff, 0xffffff, 0x000000, 0x000000, 
                           0x000000, 0x000000, 0xffffff, 0xffffff, 0x000000, 0x000000, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff
    
    BRICK_J: .word         0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 0x000000, 
                           0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 0x000000, 
                           0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0xffffff, 0x000000, 
                           0x000000, 0xffffff, 0xffffff, 0xffffff, 0x000000, 0x000000
    
    BRICK_K: .word         0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0xffffff, 0xffffff, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0xffffff, 0x000000, 0xffffff, 0xffffff, 0x000000, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0xffffff, 0xffffff, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0xffffff, 0xffffff
    
    BRICK_L: .word         0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff
    
    BRICK_M: .word         0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0xffffff, 0x000000, 0x000000, 0xffffff, 0xffffff, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0xffffff, 0x000000, 0xffffff, 0xffffff, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff
    
    BRICK_N: .word         0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0xffffff, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0xffffff, 0xffffff, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0xffffff, 0xffffff, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0xffffff, 0xffffff, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0xffffff, 0xffffff
    
    BRICK_O: .word         0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000
    
    BRICK_P: .word         0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0x000000
    
    BRICK_Q: .word         0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0xffffff, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0xffffff, 0xffffff, 
                           0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000
    
    BRICK_R: .word         0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0xffffff, 0xffffff, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0xffffff, 0xffffff
    
    BRICK_S: .word         0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 0x000000, 
                           0x000000, 0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000
    
    BRICK_T: .word         0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0x000000, 0x000000, 0xffffff, 0xffffff, 0x000000, 0x000000, 
                           0x000000, 0x000000, 0xffffff, 0xffffff, 0x000000, 0x000000, 
                           0x000000, 0x000000, 0xffffff, 0xffffff, 0x000000, 0x000000, 
                           0x000000, 0x000000, 0xffffff, 0xffffff, 0x000000, 0x000000, 
                           0x000000, 0x000000, 0xffffff, 0xffffff, 0x000000, 0x000000
    
    BRICK_U: .word         0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000
    
    BRICK_V: .word         0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0xffffff, 0x000000, 0x000000, 0xffffff, 0xffffff, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0x000000, 0x000000, 0xffffff, 0xffffff, 0x000000, 0x000000
    
    BRICK_W: .word         0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0x000000, 0xffffff, 0xffffff, 0x000000, 0xffffff, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0xffffff, 0xffffff, 0x000000, 0x000000, 0xffffff, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff
    
    BRICK_X: .word         0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0xffffff, 0x000000, 0x000000, 0xffffff, 0xffffff, 
                           0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0xffffff, 0xffffff, 0x000000, 0x000000, 0xffffff, 0xffffff, 
                           0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff
    
    BRICK_Y: .word         0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 
                           0xffffff, 0xffffff, 0x000000, 0x000000, 0xffffff, 0xffffff, 
                           0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0x000000, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0x000000, 
                           0x000000, 0x000000, 0xffffff, 0xffffff, 0x000000, 0x000000, 
                           0x000000, 0x000000, 0xffffff, 0xffffff, 0x000000, 0x000000,
    
    BRICK_Z: .word         0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 
                           0x000000, 0x000000, 0x000000, 0x000000, 0xffffff, 0xffffff, 
                           0x000000, 0x000000, 0x000000, 0xffffff, 0xffffff, 0x000000, 
                           0x000000, 0xffffff, 0xffffff, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0xffffff, 0x000000, 0x000000, 0x000000, 0x000000, 
                           0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff, 0xffffff
    BRICK_SEMI_BLACK: .word 0x606060, 0x606060, 0x606060, 0x606060, 0x606060, 0x404040,
                              0x606060, 0x505050, 0x505050, 0x505050, 0x505050, 0x404040,
                              0x606060, 0x505050, 0x404040, 0x404040, 0x303030, 0x404040,
                              0x606060, 0x505050, 0x404040, 0x404040, 0x303030, 0x404040,
                              0x606060, 0x303030, 0x303030, 0x303030, 0x303030, 0x404040,
                              0x404040, 0x404040, 0x404040, 0x404040, 0x404040, 0x404040
    # Brick mapping array
    BRICK_MAPPING: .word BRICK_BLACK, # 0
                         BRICK_SEMI_BLACK, # 1
                         BRICK_WHITE, # 2
                         BRICK_GRAY, # 3
                         BRICK_RED, # 4
                         BRICK_BLUE, # 5
                         BRICK_GREEN, # 6
                         BRICK_YELLOW, # 7
                         BRICK_ORANGE, # 8
                         BRICK_PURPLE, # 9
                         BRICK_PINK, # 10
                         BRICK_CYAN, # 11 
                         BRICK_BROWN, # 12
                         BRICK_LIME, # 13
                         BRICK_A, # 14
                         BRICK_B, # 15
                         BRICK_C, # 16
                         BRICK_D, # 17
                         BRICK_E, # 18
                         BRICK_F, # 19
                         BRICK_G, # 20
                         BRICK_H, # 21
                         BRICK_I, # 22
                         BRICK_J, # 23
                         BRICK_K, # 24
                         BRICK_L, # 25
                         BRICK_M, # 26
                         BRICK_N, # 27
                         BRICK_O, # 28
                         BRICK_P, # 29
                         BRICK_Q, # 30
                         BRICK_R, # 31
                         BRICK_S, # 32
                         BRICK_T, # 33
                         BRICK_U, # 34
                         BRICK_V, # 35
                         BRICK_W, # 36
                         BRICK_X, # 37
                         BRICK_Y, # 38
                         BRICK_Z,  # 39

                      

    MENU_LAYOUT: .byte 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       6, 6, 6, 3, 3, 4, 4, 4, 5, 5, 9, 8, 8, 8,
                       0, 6, 0, 3, 0, 0, 4, 5, 0, 5, 9, 8, 0, 0,
                       0, 6, 0, 3, 3, 3, 4, 5, 5, 0, 9, 8, 8, 8,
                       0, 6, 0, 3, 0, 0, 4, 5, 5, 0, 9, 0, 0, 8,
                       0, 6, 0, 3, 3, 3, 4, 5, 0, 5, 9, 8, 8, 8,
                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,
                       1, 0, 29, 31, 18, 32, 32, 0, 0, 0, 0, 0, 0, 1,
                       1, 0, 0, 37, 0, 33, 28, 0, 29, 25, 14, 38, 0, 1,
                       1, 0, 0, 39, 0, 33, 28, 0, 30, 34, 22, 33, 0, 1,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
                       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                       1, 12, 5, 4, 6, 7, 8, 9, 10, 11, 4, 5, 12, 1

    BLOCK_O:.byte # top view
                 0, 1, 1, 0,
                 0, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # right view
                 0, 1, 1, 0,
                 0, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # bottom view
                 0, 1, 1, 0,
                 0, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0
                 # left view
                 0, 1, 1, 0,
                 0, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
    BLOCK_I:.byte # top view
                 0, 0, 0, 0,
                 1, 1, 1, 1,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # right view
                 0, 0, 1, 0,
                 0, 0, 1, 0,
                 0, 0, 1, 0,
                 0, 0, 1, 0,
                 # bottom view
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 1, 1, 1, 1,
                 0, 0, 0, 0
                 # left view
                 0, 1, 0, 0,
                 0, 1, 0, 0,
                 0, 1, 0, 0,
                 0, 1, 0, 0,
    BLOCK_S:.byte # top view
                 0, 1, 1, 0,
                 1, 1, 0, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # right view
                 0, 1, 0, 0,
                 0, 1, 1, 0,
                 0, 0, 1, 0,
                 0, 0, 0, 0,
                 # bottom view
                 0, 0, 0, 0,
                 0, 1, 1, 0,
                 1, 1, 0, 0,
                 0, 0, 0, 0
                 # left view
                 1, 0, 0, 0,
                 1, 1, 0, 0,
                 0, 1, 0, 0,
                 0, 0, 0, 0,
    BLOCK_Z:.byte # top view
                 1, 1, 0, 0,
                 0, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # right view
                 0, 0, 1, 0,
                 0, 1, 1, 0,
                 0, 1, 0, 0,
                 0, 0, 0, 0,
                 # bottom view
                 0, 0, 0, 0,
                 1, 1, 0, 0,
                 0, 1, 1, 0,
                 0, 0, 0, 0
                 # left view
                 0, 1, 1, 0,
                 1, 1, 0, 0,
                 1, 0, 0, 0,
                 0, 0, 0, 0,
    BLOCK_L:.byte # top view
                 1, 0, 0, 0,
                 1, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # right view
                 1, 0, 0, 0,
                 1, 0, 0, 0,
                 1, 1, 0, 0,
                 0, 0, 0, 0,
                 # bottom view
                 0, 0, 0, 0,
                 1, 1, 1, 0,
                 1, 0, 0, 0,
                 0, 0, 0, 0
                 # left view
                 1, 1, 0, 0,
                 0, 1, 0, 0,
                 0, 1, 0, 0,
                 0, 0, 0, 0,
    BLOCK_J:.byte # top view
                 1, 0, 0, 0,
                 1, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # right view
                 1, 1, 0, 0,
                 1, 0, 0, 0,
                 1, 0, 0, 0,
                 0, 0, 0, 0,
                 # bottom view
                 0, 0, 0, 0,
                 1, 1, 1, 0,
                 0, 0, 1, 0,
                 0, 0, 0, 0
                 # left view
                 0, 1, 0, 0,
                 0, 1, 0, 0,
                 1, 1, 0, 0,
                 0, 0, 0, 0,

    BLOCK_T:.byte # top view
                 0, 1, 0, 0,
                 1, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # right view
                 0, 1, 0, 0,
                 0, 1, 1, 0,
                 0, 1, 0, 0,
                 0, 0, 0, 0,
                 # bottom view
                 0, 0, 0, 0,
                 1, 1, 1, 0,
                 0, 1, 0, 0,
                 0, 0, 0, 0
                 # left view
                 0, 1, 0, 0,
                 1, 1, 0, 0,
                 0, 1, 0, 0,
                 0, 0, 0, 0,
    
    BLOCK_MAPPING: .word BLOCK_O, # 0
                         BLOCK_I, # 1
                         BLOCK_S, # 2
                         BLOCK_Z, # 3
                         BLOCK_L, # 4
                         BLOCK_J, # 5
                         BLOCK_T  # 6
    
    ORIGINAL_GAME_VOID: .byte   
                       2, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0,
                       2, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0,
                       2, 1, 0, 1, 0, 1, 0, 1, 0, 2, 29, 27, 33, 32,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0,
                       2, 1, 0, 1, 0, 1, 0, 1, 0, 2, 27, 18, 37, 33,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0,
                       2, 1, 0, 1, 0, 1, 0, 1, 0, 2, 0, 0, 0, 0,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0,
                       2, 1, 0, 1, 0, 1, 0, 1, 0, 2, 0, 0, 0, 0,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 2, 21, 28, 25, 17,
                       2, 1, 0, 1, 0, 1, 0, 1, 0, 2, 0, 0, 0, 0,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0,
                       2, 1, 0, 1, 0, 1, 0, 1, 0, 2, 0, 0, 0, 0,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0,
                       2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                       29, 31, 18, 32, 32, 0, 0, 0, 0, 0, 0, 0,0,0,
                       0, 39, 0, 33, 28, 0, 30, 34, 22, 33, 0,0, 0,0,
                       0, 36, 14, 32, 17, 0, 33, 28, 0, 26, 28, 35,18, 0,

##############################################################################
# Mutable Data
##############################################################################
    GAME_VOID: .byte   2, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0,
                       2, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0,
    GAME_LAYOUT: .byte 2, 1, 0, 1, 0, 1, 0, 1, 0, 2, 29, 27, 33, 33,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0,
                       2, 1, 0, 1, 0, 1, 0, 1, 0, 2, 16, 34, 31, 31,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0,
                       2, 1, 0, 1, 0, 1, 0, 1, 0, 2, 0, 0, 0, 0,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0,
                       2, 1, 0, 1, 0, 1, 0, 1, 0, 2, 21, 28, 25, 17,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0,
                       2, 1, 0, 1, 0, 1, 0, 1, 0, 2, 0, 0, 0, 0,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0,
                       2, 1, 0, 1, 0, 1, 0, 1, 0, 2, 0, 0, 0, 0,
                       2, 0, 1, 0, 1, 0, 1, 0, 1, 2, 0, 0, 0, 0,
                       2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
                       29, 31, 18, 32, 32, 0, 0, 0, 0, 0, 0, 0,0,0,
                       0, 39, 0, 33, 28, 0, 30, 34, 22, 33, 0,0, 0,0,
                       0, 36, 14, 32, 17, 0, 33, 28, 0, 26, 28, 35,18, 0,

    PROJECTION_MAP: .byte   
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 28, 26, 32, 31,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 15, 33, 30, 30,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 20, 27, 24, 16,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                       28, 30, 17, 31, 31, 0, 0, 0, 0, 0, 0, 0,0,0,
                       0, 38, 0, 32, 27, 0, 29, 33, 21, 32, 0,0, 0,0,
                       0, 35, 13, 31, 16, 0, 32, 27, 0, 25, 27, 34,17, 0,
                       
    BLOCK_CURRENT: .space 8 # a size of BLOCK STRUCT (which are 8 bytes each)
    BLOCK_HOLD: .space 8 # a size of BLOCIK STRUCT are 8 bytes each)

##############################################################################
# Code
##############################################################################
.text
.globl main

    # Run the Tetris game.
    main:
        li $s0, 0               # initialize s0 to be menu or game variable. starts at 0 : menu, 1 : game
        li $s1, 0               # initialize s1 to be the current clock of gravity
        # setup the game objects
        la $t0, PROJECTION_MAP
        la $t0, GAME_VOID
        la $t0, BLOCK_CURRENT
        jal game_map_copy
        jal projection_map_copy
        jal add_block
    
    game_loop:
        game_loop_check_input:
    	    # 1a. Check if key has been pressed
            lw $t0, ADDR_KBRD
            lw $t1, 0($t0)
            beq $t1, 0, game_loop_check_state
            # 1b. Check which key has been pressed
            lw $t1, 4($t0)
            # syscall print this
            li $v0, 1
            move $a0, $t1
            syscall
            beq $t1, 120, game_loop_check_input_X_pressed
            beq $t1, 122, game_loop_check_input_Z_pressed
            beq $t1, 119, game_loop_check_input_W_pressed
            beq $t1, 97, game_loop_check_input_A_pressed
            beq $t1, 115, game_loop_check_input_S_pressed
            beq $t1, 100, game_loop_check_input_D_pressed
            j game_loop_check_state
            
            game_loop_check_input_X_pressed:
                li $s0, 1 # go to game screen
                j game_loop_check_state
            game_loop_check_input_Z_pressed:
                li $s0, 0 # go back to menu
                j game_loop_check_state
            game_loop_check_input_W_pressed:
                jal move_piece_rotate
                j game_loop_check_state
            game_loop_check_input_A_pressed:
                jal move_piece_left
                j game_loop_check_state
            game_loop_check_input_S_pressed:
                addi $s1, $s1, 10 # increase clock by one cycle
                j game_loop_check_state
            game_loop_check_input_D_pressed:
                jal move_piece_right
                j game_loop_check_state
            
        game_loop_check_state:
        beq $s0, 0, game_loop_menu
        j game_loop_game
        
        game_loop_menu:
            # check the state boolean
            jal draw_menu
            j game_loop_end

        game_loop_game:
            # 2a. Check for collisions
    	    # 2b. Update locations (paddle, ball)
            bge $s1, 30, game_loop_game_update_gravity
            j game_loop_draw

            game_loop_game_update_gravity:
                li $s1, 0
                jal update_block_gravity
                #jal update_board_gravity
                
            game_loop_draw:


            game_loop_game_end:
    	        # 3. Draw the screen
                jal draw_game
                j game_loop_end
                
            
        game_loop_end:
    	    # 4. Sleep
            li $v0, 32
            li $a0, 1
            syscall

            # increment the clock counter
            addi $s1, $s1, 1
        
            #5. Go back to 1
            b game_loop

    draw_game:
        # store the return address onto the stack
        addi $sp, $sp, -4
        sw $ra, 0($sp)
        # setup loop variables
        li $t1, 0 # y value
        li $t2, 0 # x value
        draw_game_loop:
            beq $t1, 16, draw_game_loop_y_end
            draw_game_loop_x:
                beq $t2, 14, draw_game_loop_x_end

                # push saved variables
                addi $sp, $sp, -4
                sw $t1, 0($sp)
                addi $sp, $sp, -4
                sw $t2, 0($sp)

                # current brick enum
                mul $t3, $t1, 14 # screen_width
                mul $t5, $t2, 1
                add $t3, $t3, $t5 # t3 = 16y + 4x
                la $t0, GAME_LAYOUT
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
                j draw_game_loop_x
            draw_game_loop_x_end:
                li $t2, 0
                addi $t1, $t1, 1
                j draw_game_loop
        draw_game_loop_y_end:
            li $t1, 0
            # retrieve return value from stack
            lw $ra, 0($sp)
            addi $sp, $sp, 4
            jr $ra

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

    # function to generate a random block_struct to add into the BLOCK_CURRENT at the base-position of the game array
    # add_block() -> void
    add_block:
        # BLOCK_STRUCT:
        #     word block_BASE_ADDR_offset 
        #     byte block_type_ENUM
        #     byte brick_color_ENUM
        #     byte block_orientation_ENUM

        # lets store the return address
        # push $t0 onto the stack
        addi $sp, $sp, -4
        sw $ra, 0($sp)

        la $t5, BLOCK_CURRENT
        li $t0, 3 # 3 is the offset from this that coresponds to top-left corner of the screen
        sw $t0, 0($t5)
        addi $t5, $t5, 4
        # store the block_type_ENUM within the memory area
        li $v0, 42
        li $a0, 0
        li $a1, 7 # there are 7 blocks in total
        syscall
        move $t0, $a0
        sb $t0, 0($t5)
        addi $t5, $t5, 1
        # store the brick_type_ENUM within the memory area
        li $v0, 42
        li $a0, 0
        li $a1, 11
        syscall
        move $t0, $a0
        addi $t0, $t0, 3 # to prevent black or white colors
        move $t6, $t0
        sb $t0, 0($t5)
        addi $t5, $t5, 1
        # store the block_orientaiton enum into memory area
        li $t0, 0
        sb $t0, 0($t5)
        addi $t5, $t5, 2

        # we want to draw this block to the screens now. lets first setup a 2d loop to check if our drawing void is 100$ clear.
        la $t0, GAME_VOID
        addi $t0, $t0, 3 # our offset
        li $t1, 0 # y
        li $t2, 0 # x
        add_block_loop:
            beq $t1, 4, add_block_loop_end
            add_block_loop_x:
        		# BODY
        		mul $t3, $t1, 14
                add $t3, $t3, $t2
                add $t3, $t3, $t0
                lb $t3, 0($t3)
                beq $t3, 0, add_block_loop_x_ok # game over
                bne $t3, 1, exit # game over
                add_block_loop_x_ok:
        		# END
                add_block_loop_x_end:
                    addi $t2, $t2, 1
                    blt $t2, 4 add_block_loop_x
            add_block_loop_end_x:
                li $t2, 0
                addi $t1, $t1, 1
                j add_block_loop
        add_block_loop_end:
            li $t1, 0
        # if we dont exit, then lets draw to game screen
        addi $sp, $sp, -4
        sw $t0, 0($sp)
        addi $sp, $sp, -4
        sw $t6, 0($sp)
        jal draw_block
        # lets also draw to projection map
        la $t0, PROJECTION_MAP
        addi $sp, $sp, -4
        sw $t0, 0($sp)
        addi $sp, $sp, -4
        sw $t6, 0($sp)
        jal draw_block
        
        # pop return address
        lw $t0, 0($sp)
        addi $sp, $sp, 4
        jr $t0
    
    # swap_block() -> void
    # this function changes the list order of the blocks inside of it. Used when the user switches with X to swap HOLD and current
    swap_block:

    # function to check if the projection map has the same color frequency as the original game layout map
    # check_collisions() -> int
    # - return 0 means all good
    # - return non-zero means there is a collision error
    check_collisions:
        li $t0, 0 # this is the variable that is treated like a stack
        la $t5, PROJECTION_MAP # address of the the left-most of the projeciton map
        la $t6, GAME_VOID # address of the left-most of the game map
        # double loop to check everything
        li $t1, 0 # y
        li $t2, 0 # x
        check_collisions_loop:
            beq $t1, 16, check_collisions_loop_end
            check_collisions_loop_x:
                beq $t2, 14, check_collisions_loop_end_x
        	    # BODY
                mul $t7, $t1, 14 # t7 = screen-width * y + x
                add $t7, $t7, $t2
                # add the projection map byte
                add $t8, $t7, $t5 # the current byte within the projection map
                lb $t8 0($t8)
                beq $t8, 1, check_collisions_loop_x_skip_add_1 # dont add 1s
                add $t0, $t0, $t8
                check_collisions_loop_x_skip_add_1:
                # subtract the game map byte
                add $t8, $t7, $t6 # the current byte within the projection map
                lb $t8 0($t8)
                beq $t8, 1, check_collisions_loop_x_skip_add_2 # dont sub 1s
                sub $t0, $t0, $t8
                check_collisions_loop_x_skip_add_2:
                
                addi $t2, $t2, 1
                j check_collisions_loop_x
            check_collisions_loop_end_x:
                li $t2, 0
                addi $t1, $t1, 1
                j check_collisions_loop
        check_collisions_loop_end:
            # if t0 = 0, we are good, if t0 != 0, then we have failed
            # push $t0 onto the stack
            addi $sp, $sp, -4
            sw $t0, 0($sp)
    
    # projection_map_copy() -> void
    # function that copies all items within the game_map into projection map
    projection_map_copy:
        li $t1, 0 # y
        li $t2, 0 # x
        projeciton_map_copy_loop:
            beq $t1, 16, projeciton_map_copy_loop_end
            projeciton_map_copy_loop_x:
                # copy the current byte inside game map into projection map
                la $t0, GAME_VOID
                la $t4, PROJECTION_MAP
                mul $t3, $t1, 14
                add $t3, $t3, $t2
                add $t0, $t3, $t0
                add $t4, $t3, $t4
                lb $t0, 0($t0)
                sb $t0, 0($t4)
        		# end
                addi $t2, $t2, 1
                blt $t2, 14, projeciton_map_copy_loop_x
            projeciton_map_copy_loop_end_x:
                li $t2, 0
                addi $t1, $t1, 1
                j projeciton_map_copy_loop
        projeciton_map_copy_loop_end:
            li $t1, 0
            jr $ra


    # game_map_copy() -> void
    # function that copies all items within the original_game_map into game_map
    game_map_copy:
        li $t1, 0 # y
        li $t2, 0 # x
        game_map_copy_loop:
            beq $t1, 16, game_map_copy_loop_end
            game_map_copy_loop_x:
                # copy the current byte inside game map into projection map
                la $t0, ORIGINAL_GAME_VOID
                la $t4, GAME_VOID
                mul $t3, $t1, 14
                add $t3, $t3, $t2
                add $t0, $t3, $t0
                add $t4, $t3, $t4
                lb $t0, 0($t0)
                sb $t0, 0($t4)
        		# end
                addi $t2, $t2, 1
                blt $t2, 14, game_map_copy_loop_x
            game_map_copy_loop_end_x:
                li $t2, 0
                addi $t1, $t1, 1
                j game_map_copy_loop
        game_map_copy_loop_end:
            li $t1, 0
            jr $ra

        
    # update_block_gravity() -> void
    # this is a function that checks if the current block moving downwards will affect collisions, it updates projectionmap, checks for collisions, if not then it updates game void and game layout
    update_block_gravity:
        # push $ra onto the stack
        addi $sp, $sp, -4
        sw $ra, 0($sp)

        # copy the current game
        jal projection_map_copy

        # erase the current block (zero out the current block)
        la $t0, BLOCK_CURRENT
        lw $t1, 0($t0) 
        la $t0, PROJECTION_MAP
        add $t0, $t0, $t1 # add the offest
        la $t3, ORIGINAL_GAME_VOID
        add $t3, $t3, $t1
        # directly draw to projection map
        addi $sp, $sp, -4
        sw $t0, 0($sp)
        addi $sp, $sp, -4
        sw $t3, 0($sp)
        jal draw_block_clear
        
        # draw the current block
        la $t0, BLOCK_CURRENT
        # get color
        lb $t3, 5($t0)
        # compute offset
        lw $t1, 0($t0) 
        addi $t1, $t1, 14 # game-width
        la $t0, PROJECTION_MAP
        add $t0, $t0, $t1 # add the offest
        # directly draw to projection map
        addi $sp, $sp, -4
        sw $t0, 0($sp)
        addi $sp, $sp, -4
        sw $t3, 0($sp)
        jal draw_block

        jal check_collisions
        # pop the return value
        lw $t0, 0($sp)
        addi $sp, $sp, 4

        # check if collisions are none
        bne $t0, 0, update_block_gravity_collision
        # if they are equal, update the offest value in the structure and then update game aswell
        # clear the current block
        la $t0, BLOCK_CURRENT
        lw $t1, 0($t0)
        la $t2, ORIGINAL_GAME_VOID
        add $t2, $t2, $t1
        la $t0, GAME_VOID
        add $t1, $t1, $t0
        addi $sp, $sp, -4
        sw $t1, 0($sp)
        addi $sp, $sp, -4
        sw $t2, 0($sp)
        jal draw_block_clear
        
        # store the new value as the next offset
        la $t0, BLOCK_CURRENT
        lb $t2, 5($t0)
        lw $t1, 0($t0)
        addi $t1, $t1, 14
        sw $t1, 0($t0)
        
        # draw the game
        la $t0, GAME_VOID
        add $t1, $t1, $t0
        addi $sp, $sp, -4
        sw $t1, 0($sp)
        addi $sp, $sp, -4
        sw $t2, 0($sp)
        jal draw_block
        j update_block_gravity_end
        
        update_block_gravity_collision:
            jal add_block
            jal update_board_gravity
            
    
        update_block_gravity_end:
            
            # pop from the stack to return
            lw $t0, 0($sp)
            addi $sp, $sp, 4
            jr $t0

            
        
    # draw_block(BASE_ADDR, COLOR) -> void
    draw_block:
        # pop from the stack
        lw $t4, 0($sp)
        addi $sp, $sp, 4
        # pop from the stack
        lw $t1, 0($sp)
        addi $sp, $sp, 4
        
        la $t0, BLOCK_CURRENT
        # get orientation
        lb $t2, 4($t0)
        la $t3, BLOCK_MAPPING
        mul $t2, $t2, 4
        add $t2, $t3, $t2
        lw $t2, 0($t2)
        # block orientation enum
        lb $t3, 6($t0)
        mul $t3, $t3, 16
        add $t2, $t2, $t3
        move $t3, $t4

        li $t4, 0 # y
        li $t5, 0 # x
        
        draw_block_loop:
            beq $t4, 4, draw_block_loop_end
            draw_block_loop_x:
        		# BODY
                mul $t6, $t4, 4
                add $t6, $t6, $t5
                add $t6, $t6, $t2
                lb $t6, 0($t6)
                beq $t6, 0, draw_block_loop_x_end
                # of not, then you are going to draw!
                mul $t6, $t4, 14
                add $t6, $t6, $t5
                add $t6, $t6, $t1
                sb $t3 0($t6)

                draw_block_loop_x_end:
        		    # END
                    addi $t5, $t5, 1
                    blt $t5, 4 draw_block_loop_x
            draw_block_loop_end_x:
                li $t5, 0
                addi $t4, $t4, 1
                j draw_block_loop
        draw_block_loop_end:
            li $t4, 0
        jr $ra


    # draw_block_clear(BASE_ADDR, ORIGINAL_ADDR) -> void
    draw_block_clear:
        # pop from the stack
        lw $t4, 0($sp)
        addi $sp, $sp, 4
        # pop from the stack
        lw $t1, 0($sp)
        addi $sp, $sp, 4
        
        la $t0, BLOCK_CURRENT
        # get orientation
        lb $t2, 4($t0)
        la $t3, BLOCK_MAPPING
        mul $t2, $t2, 4
        add $t2, $t3, $t2
        lw $t2, 0($t2)
        # block orientation enum
        lb $t3, 6($t0)
        mul $t3, $t3, 16
        add $t2, $t2, $t3
        # t3 now stores the original address
        move $t3, $t4

        li $t4, 0 # y
        li $t5, 0 # x
        
        draw_block_clear_loop:
            beq $t4, 4, draw_block_clear_loop_end
            draw_block_clear_loop_x:
        		# BODY
                mul $t6, $t4, 4
                add $t6, $t6, $t5
                add $t6, $t6, $t2
                lb $t6, 0($t6)
                beq $t6, 0, draw_block_clear_loop_x_end
                # of not, then you are going to draw!
                mul $t6, $t4, 14
                add $t6, $t6, $t5
                add $t6, $t6, $t1
                # the original address
                mul $t7, $t4, 14
                add $t7, $t7, $t5
                add $t7, $t7, $t3
                lb $t7, 0($t7)
                sb $t7 0($t6)

                draw_block_clear_loop_x_end:
        		    # END
                    addi $t5, $t5, 1
                    blt $t5, 4 draw_block_clear_loop_x
            draw_block_clear_loop_end_x:
                li $t5, 0
                addi $t4, $t4, 1
                j draw_block_clear_loop
        draw_block_clear_loop_end:
            li $t4, 0
        jr $ra


    move_piece_rotate:
        # push RA onto the stack
        addi $sp, $sp, -4
        sw $ra, 0($sp)

        jal projection_map_copy
        # copy the current block and draw it to the screen
        la $t0, BLOCK_CURRENT
        lw $t1, 0($t0) # load the current offset
        la $t0, PROJECTION_MAP
        la $t2, ORIGINAL_GAME_VOID
        add $t2, $t2, $t1
        add $t1, $t1, $t0
        # push arguments onto the stack to draw
        addi $sp, $sp, -4
        sw $t1, 0($sp)
        addi $sp, $sp, -4
        sw $t2, 0($sp)
        jal draw_block_clear
        # draw block to projection map
        la $t0, BLOCK_CURRENT
        lw $t1, 0($t0) # load the current offset
        la $t2, PROJECTION_MAP
        add $t1, $t1, $t2
        
        # push the current orientation onto the stack
        lb $t3, 6($t0) 
        addi $sp, $sp, -4
        sw $t3, 0($sp)
        bne $t3, 3, move_piece_rotate_set_case_1
        li $t3, -1 # set to -1, so that it adds to 0 later
        move_piece_rotate_set_case_1:
        addi $t3, $t3, 1
        sb $t3, 6($t0) # store this value onto to change the orientation
        
        lb $t2, 5($t0) # load the block color
        addi $sp, $sp, -4
        sw $t1, 0($sp)
        addi $sp, $sp, -4
        sw $t2, 0($sp)
        jal draw_block
        jal check_collisions
        
        # pop from the stack
        lw $t0, 0($sp)
        addi $sp, $sp, 4
        # check if we have a collision
        bne $t0, 0, move_piece_rotate_yes_collision
        
        move_piece_rotate_no_collision:
            # if not, then lets update the screen and position of everything
            # lets pop from stack to restore the previously saved orientation
            la $t0, BLOCK_CURRENT
            lw $t1, 0($sp)
            addi $sp, $sp, 4
            sb $t1, 6($t0)
            
            # lets update screen
            lw $t1, 0($t0)
            la $t2, GAME_VOID
            la $t3, ORIGINAL_GAME_VOID
            add $t3, $t3, $t1
            add $t1, $t1, $t2
            move $t2, $t3
            # we clear the current block
            addi $sp, $sp, -4
            sw $t1, 0($sp)
            addi $sp, $sp, -4
            sw $t2, 0($sp)
            jal draw_block_clear
            # lets change the orientation now
            la $t0, BLOCK_CURRENT
            lw $t1, 0($t0)
            lb $t2, 6($t0)
            bne $t2, 3, move_piece_rotate_set_case_2
            li $t2, -1 # set to -1, so that it adds to 0 later
            move_piece_rotate_set_case_2:
            addi $t2, $t2, 1
            sb $t2, 6($t0)
            
            la $t2, GAME_VOID
            add $t1, $t1, $t2
            lb $t2, 5($t0)
            addi $sp, $sp, -4
            sw $t1, 0($sp)
            addi $sp, $sp, -4
            sw $t2, 0($sp)
            # draw the current block to the screen now
            jal draw_block
            j move_piece_rotate_end
            
        move_piece_rotate_yes_collision:
            # lets undo our previous damage
            lw $t1, 0($sp)
            addi $sp, $sp, 4
            la $t0, BLOCK_CURRENT
            sb $t1, 6($t0)

        move_piece_rotate_end:
            # pop the RA
            lw $t0, 0($sp)
            addi $sp, $sp, 4
            jr $t0
            
    move_piece_left:
        # push RA onto the stack
        addi $sp, $sp, -4
        sw $ra, 0($sp)

        jal projection_map_copy
        # copy the current block and draw it to the screen
        la $t0, BLOCK_CURRENT
        lw $t1, 0($t0) # load the current offset
        la $t0, PROJECTION_MAP
        la $t2, ORIGINAL_GAME_VOID
        add $t2, $t2 $t1
        add $t1, $t1, $t0
        # push arguments onto the stack to draw
        # push $t0 onto the stack
        addi $sp, $sp, -4
        sw $t1, 0($sp)
        addi $sp, $sp, -4
        sw $t2, 0($sp)
        jal draw_block_clear
        # draw block to projection map
        la $t0, BLOCK_CURRENT
        lw $t1, 0($t0) # load the current offset
        la $t2, PROJECTION_MAP
        addi $t1, $t1, -1 # adding offset 1
        add $t1, $t1, $t2
        lb $t2, 5($t0) # load the block color
        addi $sp, $sp, -4
        sw $t1, 0($sp)
        addi $sp, $sp, -4
        sw $t2, 0($sp)
        jal draw_block
        jal check_collisions
        
        # pop from the stack
        lw $t0, 0($sp)
        addi $sp, $sp, 4
        # check if we have a collision
        bne $t0, 0, move_piece_left_end
        # if not, then lets update the screen and position of everything
        la $t0, BLOCK_CURRENT
        lw $t1, 0($t0)
        la $t3, ORIGINAL_GAME_VOID
        add $t3, $t3, $t1
        la $t2, GAME_VOID
        add $t1, $t1, $t2
        move $t2, $t3
        # we clear the current block
        addi $sp, $sp, -4
        sw $t1, 0($sp)
        addi $sp, $sp, -4
        sw $t2, 0($sp)
        jal draw_block_clear
        la $t0, BLOCK_CURRENT
        lw $t1, 0($t0)
        addi $t1, $t1, -1 # add 1 to the offset to move right
        sw $t1 0($t0) # save this to the address
        la $t2, GAME_VOID
        add $t1, $t1, $t2
        lb $t2, 5($t0)
        addi $sp, $sp, -4
        sw $t1, 0($sp)
        addi $sp, $sp, -4
        sw $t2, 0($sp)
        # draw the current block to the screen now
        jal draw_block

        move_piece_left_end:
            # pop the RA
            lw $t0, 0($sp)
            addi $sp, $sp, 4
            jr $t0
        
    move_piece_right:
        # push RA onto the stack
        addi $sp, $sp, -4
        sw $ra, 0($sp)

        jal projection_map_copy
        # copy the current block and draw it to the screen
        la $t0, BLOCK_CURRENT
        lw $t1, 0($t0) # load the current offset
        la $t0, PROJECTION_MAP
        la $t2, ORIGINAL_GAME_VOID
        add $t2, $t2, $t1
        add $t1, $t1, $t0
        # push arguments onto the stack to draw
        addi $sp, $sp, -4
        sw $t1, 0($sp)
        addi $sp, $sp, -4
        sw $t2, 0($sp)
        jal draw_block_clear
        # draw block to projection map
        la $t0, BLOCK_CURRENT
        lw $t1, 0($t0) # load the current offset
        la $t2, PROJECTION_MAP
        addi $t1, $t1, 1 # adding offset 1
        add $t1, $t1, $t2
        lb $t2, 5($t0) # load the block color
        addi $sp, $sp, -4
        sw $t1, 0($sp)
        addi $sp, $sp, -4
        sw $t2, 0($sp)
        jal draw_block
        jal check_collisions
        
        # pop from the stack
        lw $t0, 0($sp)
        addi $sp, $sp, 4
        # check if we have a collision
        bne $t0, 0, move_piece_right_end
        # if not, then lets update the screen and position of everything
        la $t0, BLOCK_CURRENT
        lw $t1, 0($t0)
        la $t2, GAME_VOID
        la $t3, ORIGINAL_GAME_VOID
        add $t3, $t3, $t1
        add $t1, $t1, $t2
        move $t2, $t3
        # we clear the current block
        addi $sp, $sp, -4
        sw $t1, 0($sp)
        addi $sp, $sp, -4
        sw $t2, 0($sp)
        jal draw_block_clear
        la $t0, BLOCK_CURRENT
        lw $t1, 0($t0)
        addi $t1, $t1, 1 # add 1 to the offset to move right
        sw $t1 0($t0) # save this to the address
        la $t2, GAME_VOID
        add $t1, $t1, $t2
        lb $t2, 5($t0)
        addi $sp, $sp, -4
        sw $t1, 0($sp)
        addi $sp, $sp, -4
        sw $t2, 0($sp)
        # draw the current block to the screen now
        jal draw_block

        move_piece_right_end:
            # pop the RA
            lw $t0, 0($sp)
            addi $sp, $sp, 4
            jr $t0

    # update_board_gravity() -> void
    # this is a function that is called once, and repeatedly will move all board items down if the lowest row of the board is all zeroed out. It updates the game_map and projection_map accordingly
    update_board_gravity:
        # push the return address
        addi $sp, $sp, -4
        sw $ra, 0($sp)
        # check for all of the blocks that are full, and then clear
        # iterate through each row in the game_map and then check if we have a full row
        li $t1, 0 # y
        li $t2, 1 # x
        update_board_gravity_loop:
            beq $t1, 12, update_board_gravity_loop_end
            li $t3, 0 # the counter for the number of blocks in this row
            update_board_gravity_loop_x:
        		# BODY
                la $t4, GAME_LAYOUT
                mul $t5, $t1, 14
                add $t5, $t5, $t2
                add $t4, $t4, $t5
                lb $t4, 0($t4)
                beq $t4, 0, update_board_gravity_loop_x_end
                beq $t4, 1, update_board_gravity_loop_x_end
                addi $t3, $t3, 1 # increment if we are a color that is non-void
        		
        		# END
        		update_board_gravity_loop_end_x:
        	        addi $t2, $t2, 1
        	        blt $t2, 9 update_board_gravity_loop_x
            update_board_gravity_loop_x_end:
                li $t2, 1
                addi $t1, $t1, 1
                bne $t3, 8, update_board_gravity_loop
                # clear all the previous, and then reset the indexes
                # push the offset onto the stack as argument
                addi $sp, $sp, -4
                sw $t1, 0($sp)
                jal clear_above_pieces
                
                li $t1, 0
                li $t3, 0
                j update_board_gravity_loop
                
        update_board_gravity_loop_end:
            li $t1, 0
        # return to ra
        update_board_gravity_end:
            lw $t0, 0($sp)
            addi $sp, $sp, 4
            jr $t0

    # clear_above_pieces(y) -> void
    clear_above_pieces:
        # pop from the stack
        lw $t0, 0($sp)
        addi $sp, $sp, 4
        # loop for us to move all pieces down, start at y, then progress up, making the current color equal to the color above
        move $t1, $t0 # y
        addi $t1, $t1, -1
        li $t2, 1 # x
        clear_above_pieces_loop:
            beq $t1, 0, clear_above_pieces_loop_end # we are the highest, we can end here
            clear_above_pieces_loop_x:
        		# BODY
                # load the current address
                mul $t4, $t1, 14
                add $t4, $t4, $t2
                la $t3, GAME_LAYOUT
                la $t5, ORIGINAL_GAME_VOID
                addi $t5, $t5, 56 # 14 * 4
                add $t5, $t5, $t4
                lb $t5, 0($t5)
                add $t4, $t4, $t3
        		# load the current address, but y-1
                add $t3, $t4, -14
                # store the upper color into current color
                lb $t3, 0($t3)
                # we want to check if this current value is 0 or 1
                beq $t3, 0, clear_above_pieces_loop_x_store_zero
                beq $t3, 1, clear_above_pieces_loop_x_store_zero
                sb $t3, 0($t4) # if it is not zero
                j clear_above_pieces_loop_end_x
                clear_above_pieces_loop_x_store_zero:
                # make the current value equal to the value that is expected of it inside of ORIGINAL_GAME_VOID
                sb $t5, 0($t4) # if it is zero, store whatever is inside of original game void
                
                
        		# END
        		clear_above_pieces_loop_end_x:
        	        addi $t2, $t2, 1
        	        blt $t2, 9 clear_above_pieces_loop_x
            clear_above_pieces_loop_x_end:
                li $t2, 0
                addi $t1, $t1, -1
                j clear_above_pieces_loop
        clear_above_pieces_loop_end:
            li $t1, 0
            jr $ra
        
    
    exit:
        li $v0, 10              # terminate the program gracefully
        syscall

