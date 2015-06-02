function value = c8_nint ( c1 )

%*****************************************************************************80
%
%% C8_NINT returns the nearest complex integer of a C8.
%
%  Discussion:
%
%    A C8 is a complex ( kind = 8 ) value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, complex C1, the value to be NINT'ed.
%
%    Output, complex VALUE, the NINT'ed value.
%
  xc = real ( c1 );
  yc = imag ( c1 );
%
%  Lower left.
%
  x = floor ( real ( c1 ) );
  y = floor ( imag ( c1 ) );
  r = ( x - xc ) .^2 + ( y - yc ) .^2;
  r_min = r;
  x_min = x;
  y_min = y;
%
%  Lower right.
%
  x = floor ( real ( c1 ) ) + 1.0;
  y = floor ( imag ( c1 ) );
  r = ( x - xc ) .^2 + ( y - yc ) .^2 ;
  if ( r < r_min )
    r_min = r;
    x_min = x;
    y_min = y;
  end
%
%  Upper right.
%
  x = floor ( real ( c1 ) ) + 1.0;
  y = floor ( imag ( c1 ) ) + 1.0;
  r = ( x - xc ) .^2 + ( y - yc ) .^ 2;
  if ( r < r_min )
    r_min = r;
    x_min = x;
    y_min = y;
  end
%
%  Upper left.
%
  x = floor ( real ( c1 ) );
  y = floor ( imag ( c1 ) ) + 1.0;
  r = ( x - xc ) .^ 2 + ( y - yc ) .^ 2;
  if ( r < r_min )
    r_min = r;
    x_min = x;
    y_min = y;
  end

  value = x_min + i * y_min;

  return
end
