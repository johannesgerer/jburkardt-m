function [ a1, a2 ] = i4vec2_sort_a ( n, a1, a2 )

%*****************************************************************************80
%
%% I4VEC2_SORT_A ascending sorts a vector of pairs of integers.
%
%  Discussion:
%
%    Each item to be sorted is a pair of integers (I,J), with the I
%    and J values stored in separate vectors A1 and A2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of items of data.
%
%    Input, integer A1(N), A2(N), the data to be sorted.
%
%    Output, integer A1(N), A2(N), the sorted data to be sorted.
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

      t     = a1(i);
      a1(i) = a1(j);
      a1(j) = t;
      t     = a2(i);
      a2(i) = a2(j);
      a2(j) = t;
%
%  Compare the I and J objects.
%
    elseif ( indx < 0 )

      isgn = i4vec2_compare ( n, a1, a2, i, j );

    elseif ( indx == 0 )

      break

    end

  end

  return
end
