function x = daub4_transform_inverse ( n, y )

%*****************************************************************************80
%
%% DAUB4_TRANSFORM_INVERSE inverts the DAUB4 transform of a vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%    N must be a power of 2 and at least 4.
%
%    Input, real Y(N), the transformed vector.
%
%    Output, real X(N), the original vector.
%
  c = [  0.4829629131445341E+00; ...
         0.8365163037378079E+00; ...
         0.2241438680420133E+00; ...
        -0.1294095225512603E+00 ];

  x(1:n,1) = y(1:n);
  z(1:n,1) = 0.0;

  m = 4;

  while ( m <= n )

    j = 1;
    mh = floor ( m / 2 );

    for i = 0 : mh - 1
      
      i0 = i4_wrap ( i,                   1, mh );
      i2 = i4_wrap ( i + 1,               1, mh );

      i1 = i4_wrap ( i + mh,         mh + 1, m     );
      i3 = i4_wrap ( i + mh + 1,     mh + 1, m     );

      z(j,1)   = c(3) * x(i0) + c(2) * x(i1) ...
               + c(1) * x(i2) + c(4) * x(i3);

      z(j+1,1) = c(4) * x(i0) - c(1) * x(i1) ...
               + c(2) * x(i2) - c(3) * x(i3);

      j = j + 2;

    end

    x(1:m,1) = z(1:m);

    m = m * 2;

  end

  return
end
