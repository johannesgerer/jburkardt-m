function a = i4vec_permute ( n, a, p )

%*****************************************************************************80
%
%% I4VEC_PERMUTE permutes an I4VEC in place.
%
%  Discussion:
%
%    This routine permutes an array of integer "objects", but the same
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
%      N = 5
%      P = (   2,   4,   5,   1,   3 )
%      A = (   1,   2,   3,   4,   5 )
%
%    Output:
%
%      A    = (   2,   4,   5,   1,   3 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    21 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects.
%
%    Input, integer A(N), the array to be permuted.
%
%    Input, integer P(N), the permutation.  P(I) = J means
%    that the I-th element of the output array should be the J-th
%    element of the input array.  Pmust be a legal permutation
%    of the integers from 1 to N, otherwise the algorithm will
%    fail catastrophically.
%
%    Output, integer A(N), the permuted array.
%
  ierror = perm1_check ( n, p );

  if ( ierror ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'I4VEC_PERMUTE - Fatal error!\n' );
    fprintf ( 1, '  PERM1_CHECK says permutation is illegal.\n' );
    error ( 'I4VEC_PERMUTE - Fatal error!' );
  end
%
%  Search for the next element of the permutation that has not been used.
%
  for istart = 1 : n

    if ( p(istart) < 0 )

      continue;

    elseif ( p(istart) == istart )

      p(istart) = -p(istart);
      continue;

    else

      a_temp = a(istart);
      iget = istart;
%
%  Copy the new value into the vacated entry.
%
      while ( 1 )

        iput = iget;
        iget = p(iget);

        p(iput) = -p(iput);

        if ( iget < 1 || n < iget )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'I4VEC_PERMUTE - Fatal error!\n' );
          fprintf ( 1, '  A permutation index is out of range.\n' );
          fprintf ( 1, '  P(%d) = %d\n', iput, iget );
          error ( 'I4VEC_PERMUTE - Fatal error!' );
        end

        if ( iget == istart )
          a(iput) = a_temp;
          break;
        end

        a(iput) = a(iget);

      end

    end

  end
%
%  Restore the signs of the entries.
%
% p(1:n) = -p(1:n);

  return
end
