function x = daub10_transform_inverse ( n, y )

%*****************************************************************************80
%
%% DAUB10_TRANSFORM_INVERSE inverts the DAUB10 transform of a vector.
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
  c = [ ...
    0.1601023979741929; ...
    0.6038292697971895; ...
    0.7243085284377726; ...
    0.1384281459013203; ...
   -0.2422948870663823; ...
   -0.0322448695846381; ...
    0.0775714938400459; ...
   -0.0062414902127983; ...
   -0.0125807519990820; ...
    0.0033357252854738 ];
  p = 9;
  x(1:n,1) = y(1:n);
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
