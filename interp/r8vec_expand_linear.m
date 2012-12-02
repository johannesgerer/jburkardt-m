function xfat = r8vec_expand_linear ( n, x, fat )

%*****************************************************************************80
%
%% R8VEC_EXPAND_LINEAR linearly interpolates new data into a vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 October 2001
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of input data values.
%
%    Input, real X(N), the original data.
%
%    Input, integer FAT, the number of data values to interpolate
%    between each pair of original data values.
%
%    Output, real XFAT((N-1)*(FAT+1)+1), the "fattened" data.
%
  k = 0;

  for i = 1 : n-1

    k = k + 1;
    xfat(k) = x(i);

    for j = 1 : fat
      k = k + 1;
      xfat(k) = ( ( fat - j + 1 ) * x(i)     ...
                + (       j     ) * x(i+1) ) ...
                / ( fat     + 1 );
    end

  end

  k = k + 1;
  xfat(k) = x(n);

  return
end
