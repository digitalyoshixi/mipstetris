#####################################################################
# CSCB58 Summer 2025 Assembly Final Project - UTSC
# David Chen, 1011011593, chenda99, davyh.chen@mail.utoronto.ca
# Bitmap Display Configuration:
# - Unit width in pixels: 4 (update this as needed) 
# - Unit height in pixels: 4 (update this as needed)
# - Display width in pixels: 84 (update this as needed)
# - Display height in pixels: 96 (update this as needed)
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
    
    # Brick mapping array
    BRICK_MAPPING: .word BRICK_BLACK, # 0
                         BRICK_WHITE, # 1
                         BRICK_GRAY, # 2
                         BRICK_RED, # 3
                         BRICK_BLUE, # 4
                         BRICK_GREEN, # 5
                         BRICK_YELLOW, # 6
                         BRICK_ORANGE, # 7
                         BRICK_PURPLE, # 8
                         BRICK_PINK, # 9
                         BRICK_CYAN, # 10 
                         BRICK_BROWN, # 11
                         BRICK_LIME, # 12
                         BRICK_A, # 13
                         BRICK_B, # 14
                         BRICK_C, # 15
                         BRICK_D, # 16
                         BRICK_E, # 17
                         BRICK_F, # 18
                         BRICK_G, # 19
                         BRICK_H, # 20
                         BRICK_I, # 21
                         BRICK_J, # 22
                         BRICK_K, # 23
                         BRICK_L, # 24
                         BRICK_M, # 25
                         BRICK_N, # 26
                         BRICK_O, # 27
                         BRICK_P, # 28
                         BRICK_Q, # 29
                         BRICK_R, # 30
                         BRICK_S, # 31
                         BRICK_T, # 32
                         BRICK_U, # 33
                         BRICK_V, # 34
                         BRICK_W, # 35
                         BRICK_X, # 36
                         BRICK_Y, # 37
                         BRICK_Z  # 38

                      

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
                       1, 0, 28, 30, 17, 31, 31, 0, 0, 0, 0, 0, 0, 1,
                       1, 0, 0, 36, 0, 32, 27, 0, 28, 24, 13, 37, 0, 1,
                       1, 0, 0, 38, 0, 32, 27, 0, 29, 33, 21, 32, 0, 1,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1
                       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                       1, 12, 5, 4, 6, 7, 8, 9, 10, 11, 4, 5, 12, 1

    BLOCK_O:.byte # top view
                 0, 1, 1, 0,
                 0, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # left view
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
    BLOCK_I:.byte # top view
                 0, 0, 0, 0,
                 1, 1, 1, 1,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # left view
                 0, 1, 0, 0,
                 0, 1, 0, 0,
                 0, 1, 0, 0,
                 0, 1, 0, 0,
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
    BLOCK_S:.byte # top view
                 0, 1, 1, 0,
                 1, 1, 0, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # left view
                 1, 0, 0, 0,
                 1, 1, 0, 0,
                 0, 1, 0, 0,
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
    BLOCK_Z:.byte # top view
                 1, 1, 0, 0,
                 0, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # left view
                 0, 1, 1, 0,
                 1, 1, 0, 0,
                 1, 0, 0, 0,
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
    BLOCK_L:.byte # top view
                 1, 0, 0, 0,
                 1, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # left view
                 1, 1, 0, 0,
                 0, 1, 0, 0,
                 0, 1, 0, 0,
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
    BLOCK_J:.byte # top view
                 1, 0, 0, 0,
                 1, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # left view
                 0, 1, 0, 0,
                 0, 1, 0, 0,
                 1, 1, 0, 0,
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

    BLOCK_T:.byte # top view
                 0, 1, 0, 0,
                 1, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # left view
                 0, 1, 0, 0,
                 1, 1, 0, 0,
                 0, 1, 0, 0,
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
    
    BLOCK_MAPPING: .word BLOCK_O, # 0
                         BLOCK_I, # 1
                         BLOCK_S, # 2
                         BLOCK_Z, # 3
                         BLOCK_L, # 4
                         BLOCK_J, # 5
                         BLOCK_T  # 6

##############################################################################
# Mutable Data
##############################################################################
    GAME_VOID: .byte   1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    GAME_LAYOUT: .byte 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 28, 26, 32, 31,
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
        li $s1, 0               # initialize s1 to be the current clock
        jal add_block
        jal projection_map_copy
    
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
            j game_loop_check_state
            
            game_loop_check_input_X_pressed:
                li $s0, 1 # go to game screen
                j game_loop_check_state
            game_loop_check_input_Z_pressed:
                li $s0, 0 # go back to menu
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
        li $t0, 1 # 1 is the offset from this that coresponds to top-left corner of the screen
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
        addi $t0, $t0, 2 # to prevent black or white color
        move $t6, $t0
        sb $t0, 0($t5)
        addi $t5, $t5, 1
        # store the block_orientaiton enum into memory area
        li $t0, 0
        sb $t0, 0($t5)
        addi $t5, $t5, 2

        # we want to draw this block to the screens now. lets first setup a 2d loop to check if our drawing void is 100$ clear.
        la $t0, GAME_VOID
        addi $t0, $t0, 1 # our offset
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
                bne $t3, 0, exit # game over
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
                add $t0, $t0, $t8
                # subtract the game map byte
                add $t8, $t7, $t6 # the current byte within the projection map
                lb $t8 0($t8)
                sub $t0, $t0, $t8
                
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
        # get color
        li $t3, 0
        # directly draw to projection map
        addi $sp, $sp, -4
        sw $t0, 0($sp)
        addi $sp, $sp, -4
        sw $t3, 0($sp)
        jal draw_block
        
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
        # overdraw the current block with black
        la $t0, BLOCK_CURRENT
        lw $t1, 0($t0)
        li $t2, 0
        la $t0, GAME_VOID
        add $t1, $t1, $t0
        addi $sp, $sp, -4
        sw $t1, 0($sp)
        addi $sp, $sp, -4
        sw $t2, 0($sp)
        jal draw_block
        
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
        

    # update_board_gravity() -> void
    # this is a function that is called once, and repeatedly will move all board items down if the lowest row of the board is all zeroed out. It updates the game_map and projection_map accordingly
    update_board_gravity:

    
    exit:
        li $v0, 10              # terminate the program gracefully
        syscall

