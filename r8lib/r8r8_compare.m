function compare = r8r8_compare ( x1, y1, x2, y2 )

%*****************************************************************************80
%
%% R8R8_COMPARE compares two R8R8's.
%
%  Discussion:
%
%    An R8R8 is simply a pair of R8 values, stored separately.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X1, Y1, the first vector.
%
%    Input, real X2, Y2, the second vector.
%
%    Output, integer COMPARE: 
%    -1, (X1,Y1) < (X2,Y2);
%     0, (X1,Y1) = (X2,Y2);
%    +1, (X1,Y2) > (X2,Y2).
%
  if ( x1 < x2 )
    compare = -1;
  elseif ( x2 < x1 )
    compare = 1;
  elseif ( y1 < y2 )
    compare = -1;
  elseif ( y2 < y1 )
    compare = 1;
  else
    compare = 0;
  end

  return
end
