    # find_expected_gain_from_gravity() -> int
    # returns the expected change from projection-map to game-map by adding a piece to it.
    find_expected_gain_from_gravity:
        # get the current block from block_list
        la $t0, BLOCK_LIST
        # t0 : stores address of the block in the block list
        # t1 : stores BASE_ADDR
        # t2 : stores brick color
        # t3 : stores block orientation address
        # t4 : the sum the current change
        lw $t1, 0($t0)
        lb $t2, 5($t0)
        lb $t3, 4($t0)
        la $t4, BLOCK_MAPPING
        mul $t5, $t3, 4
        add $t4, $t4, $t5
        lw $t4, 0($t4)
        lb $t3, 6($t0)
        mul $t3, $t3, 16 # size of block_orientation matrix
        add $t3, $t4, $t3
        li $t4, 0 # sum of current change
        # 2d loop to calculate the current change sum
        li $t5, 0 # y
        li $t6, 0 # x
        find_expected_gain_from_gravity_loop:
            beq $t5, 4, find_expected_gain_from_gravity_loop_end
            find_expected_gain_from_gravity_loop_x:
        		# BODY

                # check if the current address offsets are greater than GAME_ADDR
                mult $t7, $t5, 14  # GAME_ADDR width
                add $t7, $t7, $t6
                add $t7, $t7, $t1
                la $t8, GAME_LAYOUT
                bge $t7, $t8, find_expected_gain_from_gravity_loop_end
                # check if we are at the row right before the game_addr
                addi $t7, $t7, 14
                ble $t7, $t8, find_expected_gain_from_gravity_loop_x_end
                # check if current item inside the orientation is equal to 1
                mult $t7, $t5, 4
                add $t7, $t7, $t6
                add $t7, $t7, $t3
                lb $t7, 0($t7)
                beq $t7, 0, find_expected_gain_from_gravity_loop_x_end
                increment_change:
                    add $t4, $t4, $t2
        		# END
                find_expected_gain_from_gravity_loop_x_end:
                    addi $t6, $t6, 1
                    blt $t6, 4 find_expected_gain_from_gravity_loop_x
            find_expected_gain_from_gravity_loop_end_x:
                li $t6, 0
                addi $t5, $t5, 1
                j find_expected_gain_from_gravity_loop_x
        find_expected_gain_from_gravity_loop_end:
            li $t5, 0
            # push the value of $t4 onto the stack
            addi $sp, $sp, -4
            sw $t4, 0($sp)
            jr $ra

