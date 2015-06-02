function value = r8_sech ( x )

%*****************************************************************************80
%
%% R8_SECH evaluates the hyperbolic secant, while avoiding COSH overflow.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2014
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X, the argument of the function.
%
%    Output, real R8_SECH, the value of the function.
%
  log_huge = 80.0;

  if ( log_huge < abs ( x ) )
    value = 0.0;
  else
    value = 1.0 / cosh ( x );
  end

  return
end
