function a = r8vec_rotate ( n, a, m )

%*****************************************************************************80
%
%% R8VEC_ROTATE "rotates" the entries of an R8VEC in place.
%
%  Discussion:
%
%    This routine rotates an array of real "objects", but the same
%    logic can be used to permute an array of objects of any arithmetic
%    type, or an array of objects of any complexity.  The only temporary
%    storage required is enough to store a single object.  The number
%    of data movements made is N + the number of cycles of order 2 or more,
%    which is never more than N + N/2.
%
%  Example:
%
%    Input:
%
%      N = 5, M = 2
%      A    = ( 1.0, 2.0, 3.0, 4.0, 5.0 )
%
%    Output:
%
%      A    = ( 4.0, 5.0, 1.0, 2.0, 3.0 ).
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
%    Input, real A(N), the array to be rotated.
%
%    Output, real A(N), the rotated array.
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
