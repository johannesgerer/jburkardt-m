function [ resultg, resultk ] = summer_gk ( func, ng, wg, nk, xk, wk )

%*****************************************************************************80
%
%% SUMMER_GK carries out Gauss-Kronrod quadrature over a single interval.
%
%  Discussion:
%
%    The abscissas for the Gauss-Legendre rule of order NG are
%    not required, since they are assumed to be the even-indexed
%    entries of the corresponding Kronrod rule.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 April 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, external FUNC, the name of the function which
%    evaluates the integrand.  The function must have the form
%      function func ( x ).
%
%    Input, integer NG, the order of the Gauss-Legendre rule.
%
%    Input, real WG(NG), the weights of the
%    Gauss-Legendre rule.
%
%    Input, integer NK, the order of the Kronrod rule.  NK
%    must equal 2 * NG + 1.
%
%    Input, real XK(NK), the abscissas of the Kronrod rule.
%
%    Input, real WK(NK), the weights of the Kronrod rule.
%
%    Output, real RESULTG, the approximate value of the
%    integral, based on the Gauss-Legendre rule.
%
%    Output, real RESULTK, the approximate value of the integral,
%    based on the Kronrod rule.
%
  if ( nk ~= 2 * ng + 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'SUMMER_GK - Fatal error!\n' );
    fprintf ( 1, '  NK must equal 2 * NG + 1.\n' );
    fprintf ( 1, '  The input value was NG = %d\n', ng );
    fprintf ( 1, '  The input value was NK = %d\n', nk );
    error ( 'SUMMER_GK - Fatal error!' );
  end

  resultg = 0.0;
  resultk = 0.0;

  for i = 1 : nk

    fk = func ( xk(i) );

    resultk = resultk + wk(i) * fk;

    if ( mod ( i, 2 ) == 0 )
      resultg = resultg + wg(i/2) * fk;
    end

  end

  return
end
