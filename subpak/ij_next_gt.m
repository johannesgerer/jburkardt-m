function [ i, j ] = ij_next_gt ( i, j, n )

%*****************************************************************************80
%
%% IJ_NEXT_GT returns the next matrix index, with the constraint that I < J.
%
%  Discussion:
%
%    For N = 5, the sequence of indices returned is:
%
%      (1,2), (1,3), (1,4), (1,5), (2,3), (2,4), (2,5), (3,4), (3,5), (4,5).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, the current pair of indices.
%
%    Input, integer N, the maximum value for I and J.
%    A value of N less than 2 is nonsense.
%
%    Output, integer I, J, the next pair of indices.  If either index
%    is illegal on input, the output value of (I,J) will be (1,2).
%
  if ( n < 2 )
    i = 0;
    j = 0;
    return
  end

  if ( i < 1 | n < i | j < 1 | n < j | j <= i )
    i = 1;
    j = 2;
    return
  end

  if ( j < n )
    j = j + 1;
  elseif ( i < n - 1 )
    i = i + 1;
    j = i + 1;
  else
    i = 0;
    j = 0;
  end

  return
end
