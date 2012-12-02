function [ component_num, c ] = i4vec_components ( n, a )

%*****************************************************************************80
%
%% I4VEC_COMPONENTS assigns contiguous nonzero pixels to a common component.
%
%  Discussion:
%
%    This calculation is trivial compared to the 2D problem, and is included
%    primarily for comparison.
%
%    On input, the A array contains values of 0 or 1.
%
%    The 0 pixels are to be ignored.  The 1 pixels are to be grouped
%    into connected components.
%
%    The pixel A(I) is "connected" to the pixels A(I-1) and A(I+1).
%
%    On output, COMPONENT_NUM reports the number of components of nonzero
%    data, and the array C contains the component assignment for
%    each nonzero pixel, and is 0 for zero pixels.
%
%  Picture:
%
%    Input A:
%
%      0 0 1 2 4 0 0 4 0 0 0 8 9 9 1 2 3 0 0 5 0 1 6 0 0 0 4 0
%
%    Output:
%
%      COMPONENT_NUM = 6
%
%      C:
%
%      0 0 1 1 1 0 0 2 0 0 0 3 3 3 3 3 3 0 0 4 0 5 5 0 0 0 6 0
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the vector.
%
%    Input, integer A(N), the pixel array.
%
%    Output, integer COMPONENT_NUM, the number of components
%    of nonzero data.
%
%    Output, integer C(N), the component array.
%

%
%  Initialization.
%
  c(1,1:n) = 0;
  component_num = 0;
%
%  "Read" the array one pixel at a time.  If a (nonzero) pixel's west neighbor
%  already has a label, the current pixel inherits it.  Otherwise, we have
%  begun a new component.
%
  west = 0;

  for j = 1 : n

    if ( a(j) ~= 0 )
      if ( west == 0 )
        component_num = component_num + 1;
      end
      c(1,j) = component_num;
    end

    west = c(1,j);

  end

  return
end
