function [ i, j ] = ij_next ( i, j, n )

%*****************************************************************************80
%
%% IJ_NEXT returns the next matrix index.
%
%  Discussion:
%
%    For N = 3, the sequence of indices returned is:
%
%      (1,1), (1,2), (1,3), (2,1), (2,2), (2,3), (3,1), (3,2), (3,3), (0,0).
%
%    Note that once the value (N,N) is returned, the next value returned
%    will be (0,0).
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
%
%    Output, integer I, J, the next pair of indices.  If either index is 
%    illegal on input, the output value of (I,J) will be (1,1).
%
  if ( n < 1 )
    i = 0;
    j = 0;
    return
  end

  if ( i < 1 | n < i | j < 1 | n < j )
    i = 1;
    j = 1;
    return
  end

  if ( j < n )
    j = j + 1;
  elseif ( i < n )
    i = i + 1;
    j = 1;
  else
    i = 0;
    j = 0;
  end

  return
end
