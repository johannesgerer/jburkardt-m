function a = i4vec_rotate ( n, m, a )

%*****************************************************************************80
%
%% I4VEC_ROTATE "rotates" an I4VEC.
%
%  Example:
%
%    Input:
%
%      N = 5, M = 2
%      A = ( 1, 2, 3, 4, 5 )
%
%    Output:
%
%      A = ( 4, 5, 1, 2, 3 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 October 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects.
%
%    Input, integer M, the number of positions to the right that
%    each element should be moved.  Elements that shift pass position
%    N "wrap around" to the beginning of the array.
%
%    Input, integer A(N), the array to be rotated.
%
%    Output, integer A(N), the rotated array.
%

%
%  Force M to be positive, between 0 and N-1.
%
  m = i4_modp ( m, n );

  if ( m == 0 )
    return
  end

  istart = 0;
  nset = 0;

  while ( 1 )

    istart = istart + 1;

    if ( n < istart )
      break
    end

    temp = a(istart);
    iget = istart;
%
%  Copy the new value into the vacated entry.
%
    while ( 1 )

      iput = iget;

      iget = iget - m;

      if ( iget < 1 )
        iget = iget + n;
      end

      if ( iget == istart )
        break
      end

      a(iput) = a(iget);
      nset = nset + 1;

    end

    a(iput) = temp;
    nset = nset + 1;

    if ( n <= nset )
      break
    end

  end

  return
end
