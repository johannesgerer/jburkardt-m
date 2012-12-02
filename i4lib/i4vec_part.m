function a = i4vec_part ( n, nval )

%*****************************************************************************80
%
%% I4VEC_PART partitions an integer NVAL into N nearly equal parts.
%
%  Example:
%
%    Input:
%
%      N = 5, NVAL = 17
%
%    Output:
%
%      A = ( 4, 4, 3, 3, 3 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 April 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, integer NVAL, the integer to be partitioned.
%    NVAL may be positive, zero, or negative.
%
%    Output, integer A(N), the partition of NVAL.  The entries of
%    A add up to NVAL.  The entries of A are either all equal, or
%    differ by at most 1.  The entries of A all have the same sign
%    as NVAL, and the "largest" entries occur first.
%
  a(1:n) = 0;

  if ( 0 < nval )

    j = 1;
    for i = 1 : nval
      a(j) = a(j) + 1;
      j = j + 1;
      if ( n < j )
        j = 1;
      end
    end

  elseif ( nval < 0 )

    j = 1;
    for i = nval : -1
      a(j) = a(j) - 1;
      j = j + 1;
      if ( n < j )
        j = 1;
      end
    end

  end

  return
end
