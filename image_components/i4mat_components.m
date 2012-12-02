function [ component_num, c ] = i4mat_components ( m, n, a )

%*****************************************************************************80
%
%% I4MAT_COMPONENTS assigns contiguous nonzero pixels to a common component.
%
%  Discussion:
%
%    On input, the A array contains values of 0 or 1.
%
%    The 0 pixels are to be ignored.  The 1 pixels are to be grouped
%    into connected components.
%
%    The pixel A(I,J) is "connected" to the pixels A(I-1,J), A(I+1,J),
%    A(I,J-1) and A(I,J+1), so most pixels have 4 neighbors.
%
%    (Another choice would be to assume that a pixel was connected
%    to the other 8 pixels in the 3x3 block containing it.)
%
%    On output, COMPONENT_NUM reports the number of components of nonzero
%    data, and the array C contains the component assignment for
%    each nonzero pixel, and is 0 for zero pixels.
%
%  Picture:
%
%    Input A:
%
%      0  2  0  0 17  0  3
%      0  0  3  0  1  0  4
%      1  0  4  8  8  0  7
%      3  0  6 45  0  0  0
%      3 17  0  5  9  2  5
%
%    Output:
%
%      COMPONENT_NUM = 4
%
%      C:
%
%      0  1  0  0  2  0  3
%      0  0  2  0  2  0  3
%      4  0  2  2  2  0  3
%      4  0  2  2  0  0  0
%      4  4  0  2  2  2  2
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
%    Input, integer M, N, the order of the array.
%
%    Input, integer A(M,N), the pixel array.
%
%    Output, integer COMPONENT_NUM, the number of components
%    of nonzero data.
%
%    Output, integer C(M,N), the component array.
%

%
%  Initialization.
%
  c = zeros ( m, n );
  component_num = 0;
%
%  P is simply used to store the component labels.  The dimension used
%  here is, of course, usually an absurd overestimate.
%
  p = 1 : m * n;
%
%  "Read" the array one pixel at a time.  If a (nonzero) pixel's north or
%  west neighbor already has a label, the current pixel inherits it.
%  In case the labels disagree, we need to adjust the P array so we can
%  later deal with the fact that the two labels need to be merged.
%
  for i = 1 : m

    for j = 1 : n

      if ( i == 1 )
        north = 0;
      else
        north = c(i-1,j);
      end

      if ( j == 1 )
        west = 0;
      else
        west = c(i,j-1);
      end

      if ( a(i,j) ~= 0 )

        if ( north == 0 )

          if ( west == 0 )
            component_num = component_num + 1;
            c(i,j) = component_num;
          else
            c(i,j) = west;
          end

        elseif ( north ~= 0 )

          if ( west == 0 || west == north )
            c(i,j) = north;
          else
            c(i,j) = min ( north, west );
            if ( north < west )
              p(west) = north;
            else
              p(north) = west;
            end
          end

        end

      end

    end

  end
%
%  When a component has multiple labels, have the higher labels
%  point to the lowest one.
%
  for component = component_num : -1 : 1
    b = component;
    while ( p(b) ~= b )
      b = p(b);
    end
    p(component) = b;
  end
%
%  Locate the minimum label for each component.
%  Assign these mininum labels new consecutive indices.
%
  q = zeros ( 1, component_num );
  i = 0;
  for component = 1 : component_num
    if ( p(component) == component )
      i = i + 1;
      q(component) = i;
    end
  end

  component_num = i;
%
%  Replace the labels by consecutive labels.
%  Need to avoid c(i,j) = 0.
%
  i = find ( c ~= 0 );
  c(i) = q ( p ( c(i) ) );

  return
end
