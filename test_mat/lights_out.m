function [ n, a ] = lights_out ( row_num, col_num )

%*****************************************************************************80
%
%% LIGHTS_OUT returns the "Lights Out" matrix.
%
%  Discussion:
%
%    This is the adjacency matrix for a set of points arranged in
%    an ROW_NUM by COL_NUM grid, with the addition of a self-edge
%    at each node.
%
%  Diagram:
%
%    ROW_NUM = 4, COL_NUM = 3
%
%     1---5---9
%     |   |   |
%     2---6--10
%     |   |   |
%     3---7--11
%     |   |   |
%     4---8--12
%
%  Example:
%
%    ROW_NUM = 4, COL_NUM = 3
%
%    1  1  0  0    1  0  0  0    0  0  0  0
%    1  1  1  0    0  1  0  0    0  0  0  0
%    0  1  1  1    0  0  1  0    0  0  0  0
%    0  0  1  1    1  0  0  1    0  0  0  0
%
%    1  0  0  0    1  1  0  0    1  0  0  0
%    0  1  0  0    1  1  1  0    0  1  0  0
%    0  0  1  0    0  1  1  1    0  0  1  0
%    0  0  0  1    0  0  1  1    0  0  0  1
%
%    0  0  0  0    1  0  0  0    1  1  0  0
%    0  0  0  0    0  1  0  0    1  1  1  0
%    0  0  0  0    0  0  1  0    0  1  1  1
%    0  0  0  0    0  0  0  1    0  0  1  1
%
%  Discussion:
%
%    A game called "Lights Out" comprises a 5 by 5 array of lights.
%    Initially, a random subset of the lights are on, and the player's
%    task is to turn all the lights off.  Pressing any light
%    reverses the state of that light and its immediate neighbors to
%    the north, south, east and west.
%
%    The "Lights Out" matrix summarizes the relationships between
%    the lights.  We represent any configuration of lights
%    by a vector B0 of 1's and 0's.  If we want to push light 17,
%    say, then we make a vector X which is all zero, except for a
%    1 in entry 17.  We multiply this perturbation matrix by A,
%    to get the vector, or list, A*X, of all the lights that switch
%    their state, and we use this to update B.
%
%    In particular, if we agree to do arithmetic modulo 2, then
%    the new state B1 can be computed by 
%
%      B1 = B0 + A*X (mod 2)
%
%    Note that if we plan to push 10 buttons, we can calculate the
%    final result by computing each change, or we can simply have
%    the vector X record all the buttons we are going to push, and
%    for the calculation in a single step.
%
%    Thus, if we start with all the lights on, and we want to end
%    with all the lights off, we are asking for the solubility
%    of the system
%
%      1 + A*X = 0 (mod 2)
%
%    or, equivalently,
%
%      A*X = 1 (mod 2)
%
%    Thus, if A has full rank, we can always solve the system,
%    but if it has null vectors, there will be some configurations of
%    lights that we cannot shut down.
%
%    In some versions of the game, "wrap-around" is allowed, so that
%    lights on the extreme right boundary can affect lights on the
%    extreme left, and similarly for lights at the top and bottom.
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is a zero/one matrix.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    A is block tridiagonal.
%
%    A is an adjacency matrix.
%
%    For ROW_NUM = COL_NUM, the dimension of the null space of A is:
%
%    ROW_NUM  N  Null
%                      
%      2      4   0
%      3      9   0
%      4     16   4
%      5     25   2
%      6     36   0
%      7     49   0
%      8     64   0
%      9     81   8
%     10    100   0
%     11    121   6
%     12    144   0
%     13    169   0
%     14    196   4
%     15    225   0
%     16    256   8
%     17    289   2
%     18    324   0
%     19    361  16
%     20    400   0
%     21    441   0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Marlow Anderson, Todd Feil,
%    Turning Lights Out With Linear Algebra,
%    Mathematics Magazine,
%    Volume 71 : number 4, October 1998, pages 300-303.
%
%  Parameters:
%
%    Input, integer ROW_NUM, COL_NUM, the number of rows and 
%    columns in the underlying array.
%
%    Output, integer N, the order of the matrix.
%
%    Output, real A(ROW_NUM*COL_NUM,ROW_NUM*COL_NUM), 
%    the N by N matrix.
%
  n = row_num * col_num;

  a(1:n,1:n) = 0.0;

  for j_block = 1 : col_num

    j = ( j_block - 1 ) * row_num + 1;

    for i_block = 1 : col_num

      i = ( i_block - 1 ) * row_num + 1;

      if ( j_block == i_block )
        a(i:i+row_num-1,j:j+row_num-1) = line_loop_adj ( row_num );
      elseif ( abs ( j_block - i_block ) == 1 )
        a(i:i+row_num-1,j:j+row_num-1) = identity ( row_num, row_num );
      else
        a(i:i+row_num-1,j:j+row_num-1) = zero ( row_num, row_num );
      end

    end
  end

  return
end
