function value = gen_hermite_integral ( expon, alpha )

%*****************************************************************************80
%
%% GEN_HERMITE_INTEGRAL evaluates a monomial generalized Hermite integral.
%
%  Discussion:
%
%    H(n,alpha) = Integral ( -oo < x < +oo ) x^n |x|^alpha exp(-x^2) dx
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, int EXPON, the exponent of the monomial.
%
%    Input, real ALPHA, the exponent of |X| in the integral.
%    -1.0 < ALPHA.
%
%    Output, real VALUE, the value of the integral.
%
  if ( mod ( expon, 2 ) == 1 )

    value = 0.0;

  else

    a = alpha + expon;

    if ( a <= -1.0 )

      value = - r8_huge ( );

    else

      value = gamma ( ( a + 1.0 ) / 2.0 );

    end

  end

  return
end
