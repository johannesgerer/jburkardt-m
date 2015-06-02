function v = legendre_van ( m, a, b, n, x )

%*****************************************************************************80
%
%% LEGENDRE_VAN returns the LEGENDRE_VAN matrix for [A,B].
%
%  Discussion:
%
%    The LEGENDRE_VAN matrix is the Legendre Vandermonde-like matrix.
%
%    Normally, the Legendre polynomials are defined on -1 <= XI <= +1.
%    Here, we assume the Legendre polynomials have been defined on the
%    interval A <= X <= B, using the mapping
%      XI = ( - ( B - X ) + ( X - A ) ) / ( B - A )
%    so that
%      Lab(A,B;X) = L(XI).
%
%    if ( I = 1 ) then
%      V(1,1:N) = 1
%    else if ( I = 2 ) then
%      V(2,1:N) = XI(1:N)
%    else
%      V(I,1:N) = ( (2*I-1) * XI(1:N) * V(I-1,1:N) - (I-1)*V(I-2,1:N) ) / I
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the number of rows of the matrix.
%
%    Input, real A, B, the limits of the interval.
%
%    Input, integer N, the number of columns of the matrix.
%
%    Input, real X(N), the abscissas.
%
%    Output, real V(M,N), the matrix.
%

%
%  Force X to be a row vector.
%
  x = ( x(:) .' );
%
%  Compute the normalized abscissas in [-1,+1].
%
  xi(1,1:n) = ( - 1.0 * ( b - x(1,1:n)     )   ...
                + 1.0 * (     x(1,1:n) - a ) ) ...
              /         ( b            - a );
%
%  Set up the matrix.
%
  v = zeros ( m, n );

  for i = 1 : m

    if ( i == 1 )
      v(i,1:n) = 1.0;
    elseif ( i == 2 )
      v(i,1:n) = xi(1,1:n);
    else
      v(i,1:n) = ( ( 2 * i - 1 ) * xi(1,1:n) .* v(i-1,1:n)   ...
                 + (   - i + 1 ) *              v(i-2,1:n) ) ...
                 / (     i );
    end

  end

  return
end
