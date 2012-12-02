function [ x, w ] = cheb_set ( n )

%*****************************************************************************80
%
%% CHEB_SET sets abscissas and weights for Chebyshev quadrature.
%
%  Discussion:
%
%    The integral:
%
%      Integral ( -1 <= X <= 1 ) F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) W(I) * F ( X(I) )
%
%    The Chebyshev rule is distinguished by using equal weights.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964.
%
%    Hermann Engels,
%    Numerical Quadrature and Cubature,
%    Academic Press, 1980.
%
%    Zdenek Kopal,
%    Numerical Analysis,
%    John Wiley, 1955.
%
%    Daniel Zwillinger, editor,
%    Standard Mathematical Tables and Formulae,
%    30th Edition,
%    CRC Press, 1996.
%
%  Parameters:
%
%    Input, integer N, the order.
%    N may only have the values 1, 2, 3, 4, 5, 6, 7 or 9.
%    There are NO other Chebyshev rules with real abscissas.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%
  x = zeros ( n, 1 );
  w = zeros ( n, 1 );

  if ( n == 1 )

    x(1) = 0.0;

  elseif ( n == 2 )

    x(1) = - 1.0 / sqrt ( 3.0 );
    x(2) =   1.0 / sqrt ( 3.0 );

  elseif ( n == 3 )

    x(1) = - 1.0 / sqrt ( 2.0 );
    x(2) =   0.0;
    x(3) =   1.0 / sqrt ( 2.0 );

  elseif ( n == 4 )

    x(1) =   - sqrt ( ( 1.0 + 2.0 / sqrt ( 5.0 ) ) / 3.0 );
    x(2) =   - sqrt ( ( 1.0 - 2.0 / sqrt ( 5.0 ) ) / 3.0 );
    x(3) =     sqrt ( ( 1.0 - 2.0 / sqrt ( 5.0 ) ) / 3.0 );
    x(4) =     sqrt ( ( 1.0 + 2.0 / sqrt ( 5.0 ) ) / 3.0 );

  elseif ( n == 5 )

    x(1) = - sqrt ( ( 5.0 + sqrt ( 11.0) ) / 12.0 );
    x(2) = - sqrt ( ( 5.0 - sqrt ( 11.0) ) / 12.0 );
    x(3) =   0.0;
    x(4) =   sqrt ( ( 5.0 - sqrt ( 11.0) ) / 12.0 );
    x(5) =   sqrt ( ( 5.0 + sqrt ( 11.0) ) / 12.0 );

  elseif ( n == 6 )

    x(1) = - 0.866246818107820591383598;
    x(2) = - 0.422518653761111529118546;
    x(3) = - 0.266635401516704720331534;
    x(4) =   0.266635401516704720331534;
    x(5) =   0.422518653761111529118546;
    x(6) =   0.866246818107820591383598;

  elseif ( n == 7 )

    x(1) = - 0.883861700758049035704224;
    x(2) = - 0.529656775285156811385048;
    x(3) = - 0.323911810519907637519673;
    x(4) =   0.0;
    x(5) =   0.323911810519907637519673;
    x(6) =   0.529656775285156811385048;
    x(7) =   0.883861700758049035704224;

  elseif ( n == 9 )

    x(1) = - 0.911589307728434473664949;
    x(2) = - 0.601018655380238071428128;
    x(3) = - 0.528761783057879993260181;
    x(4) = - 0.167906184214803943068031;
    x(5) =   0.0;
    x(6) =   0.167906184214803943068031;
    x(7) =   0.528761783057879993260181;
    x(8) =   0.601018655380238071428128;
    x(9) =   0.911589307728434473664949;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHEB_SET - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of N = %d\n', n );
    fprintf ( 1, '  Legal values are 1 through 7, and 9.\n' );
    error ( 'CHEB_SET - Fatal error!' );

  end

  w(1:n) = 2.0 / n;

  return
end
