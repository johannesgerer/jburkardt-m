function a = r82row_permute ( n, a, p )

%*****************************************************************************80
%
%% R82ROW_PERMUTE permutes an R82ROW in place.
%
%  Discussion:
%
%    An R82ROW is a (2,N) array of R8's.
%
%    This routine permutes an array of real "objects", but the same
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
%      P = (   2,    4,    5,    1,    3 )
%      A = ( 1.0,  2.0,  3.0,  4.0,  5.0 )
%          (11.0, 22.0, 33.0, 44.0, 55.0 )
%
%    Output:
%
%      A    = (  2.0,  4.0,  5.0,  1.0,  3.0 )
%             ( 22.0, 44.0, 55.0, 11.0, 33.0 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of objects.
%
%    Input, real A(2,N), the array to be permuted.
%
%    Input, integer P(N), the permutation.  P(I) = J means
%    that the I-th element of the output array should be the J-th
%    element of the input array.  P must be a legal permutation
%    of the integers from 1 to N, otherwise the algorithm will
%    fail catastrophically.
%
%    Output, real A(2,N), the permuted array.
%

%
%  Search for the next element of the permutation that has not been used.
%
  for istart = 1 : n

    if ( p(istart) < 0 )

      continue

    elseif ( p(istart) == istart )

      p(istart) = - p(istart);
      continue

    else

      a_temp(1:2) = a(1:2,istart);
      iget = istart;
%
%  Copy the new value into the vacated entry.
%
      while ( 1 )

        iput = iget;
        iget = p(iget);

        p(iput) = - p(iput);

        if ( iget < 1 || n < iget )
          fprintf ( 1, '\n' );
          fprintf ( 1, 'R82ROW_PERMUTE - Fatal error!\n' );
          fprintf ( 1, '  A permutation index is out of range.\n' );
          fprintf ( 1, '  P(%d) = %d\n', iput, iget );
          error ( 'R82ROW_PERMUTE - Fatal error!' );
        end

        if ( iget == istart )
          a(1:2,iput) = a_temp(1:2)';
          break
        end

        a(1:2,iput) = a(1:2,iget);

      end

    end

  end
%
%  Restore the signs of the entries.
%
% p(1:n) = -p(1:n);

  return
end
