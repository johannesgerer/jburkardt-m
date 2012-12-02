function f1_dif = p00_f1_dif ( problem, x )

%*****************************************************************************80
%
%% P00_F1_DIF approximates the first derivative via finite differences.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem number.
%
%    Input, real X, the point where the gradient is to
%    be approximated.
%
%    Output, real F1_DIF, the approximated gradient vector.
%
  epsilon = eps^0.33;

  if ( 0.0 <= x )
    dx = epsilon * ( x + 1.0 );
  else
    dx = epsilon * ( x - 1.0 );
  end

  xi = x;
  x = xi + dx;
  fplus = p00_f ( problem, x );

  x = xi - dx;
  fminus = p00_f ( problem, x );

  f1_dif = ( fplus - fminus ) / ( 2.0 * dx );

  x = xi;

  return
end
