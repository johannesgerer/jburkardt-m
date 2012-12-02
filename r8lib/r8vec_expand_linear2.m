function xfat = r8vec_expand_linear2 ( n, x, before, fat, after )

%*****************************************************************************80
%
%% R8VEC_EXPAND_LINEAR2 linearly interpolates new data into an R8VEC.
%
%  Discussion:
%
%    An R8VEC is a vector of R8's.
%
%    This routine starts with a vector of data.
%
%    The intent is to "fatten" the data, that is, to insert more points
%    between successive values of the original data.
%
%    There will also be extra points placed BEFORE the first original
%    value and AFTER that last original value.
%
%    The "fattened" data is equally spaced between the original points.
%
%    The BEFORE data uses the spacing of the first original interval,
%    and the AFTER data uses the spacing of the last original interval.
%
%  Example:
%
%    N = 3
%    BEFORE = 3
%    FAT = 2
%    AFTER = 1
%
%    X    = (/                   0.0,           6.0,             7.0       /)
%    XFAT = (/ -6.0, -4.0, -2.0, 0.0, 2.0, 4.0, 6.0, 6.33, 6.66, 7.0, 7.66 /)
%            3 "BEFORE's"        Old  2 "FATS"  Old    2 "FATS"  Old  1 "AFTER"
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of input data values.
%    N must be at least 2.
%
%    Input, real X(N), the original data.
%
%    Input, integer BEFORE, the number of "before" values.
%
%    Input, integer FAT, the number of data values to interpolate
%    between each pair of original data values.
%
%    Input, integer AFTER, the number of "after" values.
%
%    Output, real XFAT(BEFORE+(N-1)*(FAT+1)+1+AFTER), the "fattened" data.
%
  xfat = zeros ( before+(n-1)*(fat+1)+1+after, 1 );

  k = 0;
%
%  Points BEFORE.
%
  for j = 1 - before + fat : fat
    k = k + 1;
    xfat(k) = ( ( fat - j + 1 ) * ( x(1) - ( x(2) - x(1) ) ) ...
              + (       j     ) *   x(1)          ) ...
              / ( fat     + 1 );
  end
%
%  Original points and FAT points.
%
  for i = 1 : n - 1

    k = k + 1;
    xfat(k) = x(i);

    for j = 1 : fat
      k = k + 1;
      xfat(k) = ( ( fat - j + 1 ) * x(i) ...
                + (       j     ) * x(i+1) ) ...
                / ( fat     + 1 );
    end

  end

  k = k + 1;
  xfat(k) = x(n);
%
%  Points AFTER.
%
  for j = 1 : after
    k = k + 1;
    xfat(k) = ( ( fat - j + 1 ) * x(n) ...   
              + (       j     ) * ( x(n) + ( x(n) - x(n-1) ) ) ) ...
              / ( fat     + 1 );
  end

  return
end
