function x = c8vec_sort_a2 ( n, x )

%*****************************************************************************80
%
%% C8VEC_SORT_A2 ascending sorts a C8VEC by L2 norm.
%
%  Discussion:
%
%    The L2 norm of A+Bi is sqrt ( A**2 + B**2 ).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 September 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, complex X(N), an unsorted array.
%
%    Output, complex X(N), the sorted array.
%
  i = 0;
  indx = 0;
  isgn = 0;
  j = 0;

  while ( 1 )

    [ indx, i, j ] = sort_heap_external ( n, indx, isgn );

    if ( 0 < indx )

      temp = x(i);
      x(i) = x(j);
      x(j) = temp;

    elseif ( indx < 0 )

      if ( c8_le_l2 ( x(i), x(j) ) )
        isgn = -1;
      else
        isgn = +1;
      end

    elseif ( indx == 0 )

      break

    end

  end 

  return
end
