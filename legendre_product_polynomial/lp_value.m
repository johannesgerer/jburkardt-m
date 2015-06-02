function value = lp_value ( n, o, x )

%*****************************************************************************80
%
%% LP_VALUE evaluates a Legendre polynomial at several points X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 September 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, integer O, the degree of the polynomial.
%    0 <= O.
%
%    Input, real X(N,1), the evaluation points.
%
%    Output, real VALUE(N,1), the value of the Legendre polynomial
%    of degree O at the points X.
%
  x = x ( : );

  v = zeros ( n, o + 1 );

  v(1:n,1) = 1.0;

  if ( 1 <= o )
 
    v(1:n,2) = x(1:n,1);

    for j = 2 : o
 
      v(1:n,j+1) = ( ( 2 * j - 1 ) * x(1:n,1) .* v(1:n,j)   ...
                  -  (     j - 1 ) *             v(1:n,j-1) ) ...
                  /  (     j     );
 
    end
 
  end

  value(1:n,1) = v(1:n,o+1);

  return
end
