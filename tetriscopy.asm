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
                 1, 1, 0, 0,
                 1, 1, 0, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # left view
                 1, 1, 0, 0,
                 1, 1, 0, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # right view
                 1, 1, 0, 0,
                 1, 1, 0, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # bottom view
                 1, 1, 0, 0,
                 1, 1, 0, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0
    BLOCK_I:.byte # top view
                 1, 0, 0, 0,
                 1, 0, 0, 0,
                 1, 0, 0, 0,
                 1, 0, 0, 0,
                 # left view
                 1, 1, 1, 1,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # right view
                 1, 1, 1, 1,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # bottom view
                 1, 0, 0, 0,
                 1, 0, 0, 0,
                 1, 0, 0, 0,
                 1, 0, 0, 0
    BLOCK_S:.byte # top view
                 1, 0, 0, 0,
                 1, 1, 0, 0,
                 0, 1, 0, 0,
                 0, 0, 0, 0,
                 # left view
                 0, 1, 1, 0,
                 1, 1, 0, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # right view
                 0, 1, 1, 0,
                 1, 1, 0, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # bottom view
                 1, 0, 0, 0,
                 1, 1, 0, 0,
                 0, 1, 0, 0,
                 0, 0, 0, 0
    BLOCK_Z:.byte # top view
                 0, 1, 0, 0,
                 1, 1, 0, 0,
                 1, 0, 0, 0,
                 0, 0, 0, 0,
                 # left view
                 1, 1, 0, 0,
                 0, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # right view
                 1, 1, 0, 0,
                 0, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # bottom view
                 0, 1, 0, 0,
                 1, 1, 0, 0,
                 1, 0, 0, 0,
                 0, 0, 0, 0
    BLOCK_L:.byte # top view
                 1, 0, 0, 0,
                 1, 0, 0, 0,
                 1, 1, 0, 0,
                 0, 0, 0, 0,
                 # left view
                 1, 1, 1, 0,
                 1, 0, 0, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # right view
                 0, 0, 1, 0,
                 1, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # bottom view
                 1, 1, 0, 0,
                 0, 1, 0, 0,
                 0, 1, 0, 0,
                 0, 0, 0, 0
    BLOCK_J:.byte # top view
                 0, 1, 0, 0,
                 0, 1, 0, 0,
                 1, 1, 0, 0,
                 0, 0, 0, 0,
                 # left view
                 1, 0, 0, 0,
                 1, 1, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # right view
                 1, 1, 1, 0,
                 0, 0, 1, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # bottom view
                 1, 1, 0, 0,
                 1, 0, 0, 0,
                 1, 0, 0, 0,
                 0, 0, 0, 0

    BLOCK_T:.byte # top view
                 1, 1, 1, 0,
                 0, 1, 0, 0,
                 0, 0, 0, 0,
                 0, 0, 0, 0,
                 # left view
                 1, 0, 0, 0,
                 1, 1, 0, 0,
                 1, 0, 0, 0,
                 0, 0, 0, 0,
                 # right view
                 0, 1, 0, 0,
                 1, 1, 0, 0,
                 0, 1, 0, 0,
                 0, 0, 0, 0,
                 # bottom view
                 0, 1, 0, 0,
                 1, 1, 1, 0,
                 0, 0, 0, 0,
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
    GAME_VOID: .byte   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                       0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    GAME_LAYOUT: .byte 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
                       1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                       28, 30, 17, 31, 31, 0, 0, 0, 0, 0, 0, 0,0,0,
                       0, 38, 0, 32, 27, 0, 29, 33, 21, 32, 0,0, 0,0,
                       0, 35, 13, 31, 16, 0, 32, 27, 0, 25, 27, 34,17, 0,
    BLOCK_LIST: .space 80 # a size of 10 block_structs (which are 10 bytes each)

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
        
        li $s0, 0               # initialize s0 to be menu or game variable. starts at 0 : menu, 1 : game
        li $s1, 0               # initialize s1 to be the current clock
        jal add_block
        jal add_block
        jal add_block
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
                li $t0, 0
                game_loop_game_update_gravity_loop:
                    # loop through the entire brick_list
                    beq $t0, 10, game_loop_game_update_gravity_end # 10 total bricks
                    mul $t1, $t0, 8
                    la $t2, BLOCK_LIST
                    add $t1, $t1, $t2
                    lw $t1, 0($t1)
                    bne $t1, 0, game_loop_game_update_gravity_block # there is a actual block here
                    j game_loop_game_update_gravity_loop_end
                    game_loop_game_update_gravity_block:
                        # t0 stores the current index of the list
                        # t2 stores the current address of the STRUCT
                        mul $t3, $t0, 8 
                        add $t2, $t2, $t3
                        lb $t1, 4($t2) # get the block_ENUM
                        la $t3, BLOCK_MAPPING
                        mul $t1, $t1, 4 # change to wordsize
                        add $t1, $t1, $t3 
                        lw $t1, 0($t1) # load the address of the block_orientations list
                        lb $t3, 6($t2) # load the orientation
                        mul $t3, $t3, 16
                        add $t1, $t1, $t3 # t1 stores the address of the current orientation of the block
                        lw $t3, 0($t2) # load the base address
                        
                        # now we run a 2d loop through all 4x4 of the orientation matrix
                        li $t4, 0
                        li $t5, 0
                        game_loop_game_update_gravity_block_loop:
                            beq $t4, 4, game_loop_game_update_gravity_block_loop_end_y
                            game_loop_game_update_gravity_block_loop_x:
                                beq $t5, 4, game_loop_game_update_gravity_block_loop_end_x
                				# BODY
                                mult $t6, $t4, 4
                                add $t6, $t6, $t5
                                add $t6, $t6, $t3 # t6 is the current cell of the orientation matrix
                                lb $t6, 0($t6)
                                # check if its 1, if it if, then we check the bottom-more one
                                beq $t6, 1, game_loop_game_update_gravity_block_loop_x_cell_1
                                j game_loop_game_update_gravity_block_loop_x_end
                                
                                # if the current is 1
                                game_loop_game_update_gravity_block_loop_x_cell_1:
                                    # first check if this is the 4th row
                                    beq $t4, 3, game_loop_game_update_gravity_block_loop_check_grid_layout
                                    # if not, then we check if there is another 1 below us
                                    mult $t6, $t4, 4
                                    addi $t6, $t6, 4
                                    add $t6, $t6, $t5
                                    add $t6, $t6, $t3 # t6 is the current cell of the orientation matrix
                                    lb $t6, 0($t6)
                                    beq $t6, 1, 
                                    
                                    game_loop_game_update_gravity_block_loop_check_grid_layout:
                                
                                
                                game_loop_game_update_gravity_block_loop_x_end:
                                    addi $t5, $t5, 1
                                    j game_loop_game_update_gravity_block_loop_x
                            game_loop_game_update_gravity_block_loop_end_x:
                                li $t5, 0
                                addi $t4, $t4, 1
                                j game_loop_game_update_gravity_block_loop
                        game_loop_game_update_gravity_block_loop_end_y:
                            # we have passed all the checks, and everything below all the 1s are 0
                            # move everything down
                            li $t4, 0
                            j game_loop_game_update_gravity_loop_end
                        

                        
                    
                    game_loop_game_update_gravity_loop_end:
                        addi $t0, $t0, 1 # adding one to the current counter
                        j game_loop_game_update_gravity_loop
                        
                game_loop_game_update_gravity_end:
                    # something
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

    # block_check_move(index in block_array) -> boolean
    collision_check:
        # returns a boolean
        
    # function to generate a random block_struct to add into the BLOCK_LIST at the base-position of the game array
    # add_block() -> void
    add_block:
        # BLOCK_STRUCT:
        #     word block_base_ADDR ($t4)
        #     byte block_type_ENUM ($t1)
        #     byte brick_color_ENUM ($t2)
        #     byte block_orientation_ENUM ($t3)

        # find the current cleared area of the list
        la $t5, BLOCK_LIST
        addi $t7, $t5, 80 # size of a struct * 10
        add_block_loop:
            # check if this has a size of smaller than 10
            beq $t5, $t7, add_block_end
            # we have a current size of smaller than 10
            lw $t6, 0($t5) # load word - which should be the block type address, and then check if this is equal to 0
            beq $t6, 0 add_block_loop_end
            addi $t5, $t5, 8 # size of a struct
            j add_block_loop
            
        add_block_loop_end:
            # store the base ADDRESS within the memory area
            la $t0, GAME_VOID # store the void, so that you are 4 pixels above the actual drawing canvas
            #la $t0, GAME_LAYOUT
            addi $t0, $t0, 24 # 24 is the offset from this that coresponds to top-left corner of the screen
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
            li $a1, 13 
            syscall
            move $t0, $a0
            sb $t0, 0($t5)
            addi $t5, $t5, 1
            # store the block_orientaiton enum into memory area
            li $t0, 0
            sb $t0, 0($t5)
            addi $t5, $t5, 2
            
        add_block_end:
            jr $ra

    
    exit:
        li $v0, 10              # terminate the program gracefully
        syscall

