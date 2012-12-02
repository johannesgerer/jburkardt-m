function x = daub6_transform_inverse ( n, y )

%*****************************************************************************80
%
%% DAUB6_TRANSFORM_INVERSE inverts the DAUB6 transform of a vector.
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
  c = [  0.3326705529500826E+00; ...
         0.8068915093110925E+00; ...
         0.4598775021184915E+00; ...
       - 0.1350110200102545E+00; ...
       - 0.08544127388202666E+00; ...
         0.03522629188570953E+00 ];
  x(1:n,1) = y(1:n);
  p = 5;
  m = 4;
  q = floor ( ( p - 1 ) / 2 );

  while ( m <= n )
  
    z(1:m,1) = 0.0;

    j = 1;

    mh = floor ( m / 2 );

    for i = - q + 1 : mh - q
      
      for k = 0 : 2 : p - 1
        i0 = i4_wrap ( i      + k / 2,     1,      mh );
        i1 = i4_wrap ( i + mh + k / 2,     mh + 1, m  );
        z(j,1)   = z(j,1)   + c(p-k)   * x(i0) + c(k+2) * x(i1);
        z(j+1,1) = z(j+1,1) + c(p-k+1) * x(i0) - c(k+1) * x(i1);
      end

      j = j + 2;

    end

    x(1:m,1) = z(1:m);

    m = m * 2;

  end

  return
end
