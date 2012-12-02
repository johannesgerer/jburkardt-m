function [ a1, a2 ] = r8vec2_sort_d ( n, a1, a2 )

%*****************************************************************************80
%
%% R8VEC2_SORT_D descending sorts an R8VEC2.
%
%  Discussion:
%
%    An R8VEC2 is two R8VEC's.
%
%    An R8VEC is a vector of R8 values.
%
%    Each item to be sorted is a pair (I,J), with the I
%    and J values stored in separate vectors A1 and A2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 November 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of items of data.
%
%    Input, real A1(N), A2(N), the data to be sorted.
%
%    Output, real A1(N), A2(N), the sorted data.
%
  if ( n <= 1 )
    return
  end
%
%  Initialize.
%
  i = 0;
  indx = 0;
  isgn = 0;
  j = 0;
%
%  Call the external heap sorter.
%
  while ( 1 )

    [ indx, i, j ] = sort_heap_external ( n, indx, isgn );
%
%  Interchange the I and J objects.
%
    if ( 0 < indx )

      [ a1(i), a1(j) ] = r8_swap ( a1(i), a1(j) );
      [ a2(i), a2(j) ] = r8_swap ( a2(i), a2(j) );
%
%  Compare the I and J objects.
%
    elseif ( indx < 0 )

      isgn = -r8vec2_compare ( n, a1, a2, i, j );

    elseif ( indx == 0 )

      break

    end

  end

  return
end
