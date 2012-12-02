function x = box_behnken ( dim_num, x_num, range )

%*****************************************************************************80
%
%% BOX_BEHNKEN returns a Box-Behnken design for the given number of factors.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    George Box, Donald Behnken,
%    Some new three level designs for the study of quantitative variables,
%    Technometrics,
%    Volume 2, pages 455-475, 1960.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer X_NUM, the number of elements of the design.
%    X_NUM should be equal to DIM_NUM * 2**(DIM_NUM-1) + 1.
%
%    Input, real RANGE(DIM_NUM,2), the minimum and maximum
%    value for each component.
%
%    Output, real X(DIM_NUM,X_NUM), the elements of the design.
%

%
%  Ensure that the range is legal.
%
  if ( any ( range(1:dim_num,2) <= range(1:dim_num,1) ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BOX_BEHNKEN - Fatal error!\n' );
    fprintf ( 1, '  For some index I,\n' );
    fprintf ( 1, '  RANGE(I,2) <= RANGE(I,1).\n' );
    error ( 'BOX_BEHNKEN - Fatal error!' );
  end
%
%  The first point is the center.
%
  j = 1;

  x(1:dim_num,j) = ( range(1:dim_num,1) + range(1:dim_num,2) ) / 2.0;
%
%  For subsequent elements, one entry is fixed at the middle of the range.
%  The others are set to either extreme.
%
  for i = 1 : dim_num

    j = j + 1;

    x(1:dim_num,j) = range(1:dim_num,1);
    x(i,j) = ( range(i,1) + range(i,2) ) / 2.0;
%
%  The next element is made by finding the last low value, making it
%  high, and all subsequent high values low.
%
    while ( 1 )

      last_low = -1;

      for i2 = 1 : dim_num
        if ( x(i2,j) == range(i2,1) )
          last_low = i2;
        end
      end

      if ( last_low == -1 )
        break
      end

      j = j + 1;
      x(1:dim_num,j) = x(1:dim_num,j-1);
      x(last_low,j) = range(last_low,2);

      for i2 = last_low + 1 : dim_num
        if ( x(i2,j) == range(i2,2) )
          x(i2,j) = range(i2,1);
        end
      end

    end

  end

  return
end
