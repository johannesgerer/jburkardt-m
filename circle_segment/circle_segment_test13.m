function circle_segment_test13 ( )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST13 demonstrates GAUSS for quadrature rules.
%
%  Discussion:
%
%    Some recursion coefficients ALPHA and BETA are listed in Kautsky
%    and Elhay.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 January 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference
%
%    Jaroslav Kautsky, Sylvan Elhay,
%    Calculation of the Weights of Interpolatory Quadratures,
%    Numerische Mathematik,
%    Volume 40, Number 3, October 1982, pages 407-422.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST13\n' );
  fprintf ( 1, '  GAUSS computes the points and weights for a\n' );
  fprintf ( 1, '  Gauss quadrature rule, given the ALPHA and BETA\n' );
  fprintf ( 1, '  recursion coefficients.\n' );
%
%  Legendre rule.
%
  n = 10;

  alpha = zeros ( n, 1 );
  beta = zeros ( n, 1 );

  for i = 1 : n
    alpha(i) = 0.0;
    if ( i == 1 )
      beta(i) = 2.0;
    else
      beta(i) = 1.0 / ( 4.0 - 1.0 / ( i - 1.0 )^2 );
    end
  end

  ab(1:n,1) = alpha(1:n);
  ab(1:n,2) = beta(1:n);

  xw = gauss ( n, ab );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEGENDRE RULE\n' );
  fprintf ( 1, '  Point   Weight\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12g  %12g\n', xw(i,1), xw(i,2) );
  end
%
%  Hermite rule.
%
  n = 10;

  alpha = zeros ( n, 1 );
  beta = zeros ( n, 1 );

  for i = 1 : n
    alpha(i) = 0.0;
    if ( i == 1 )
      beta(i) = sqrt ( pi );
    else
      beta(i) = ( i - 1 ) / 2;
    end
  end

  ab(1:n,1) = alpha(1:n);
  ab(1:n,2) = beta(1:n);

  xw = gauss ( n, ab );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  HERMITE RULE\n' );
  fprintf ( 1, '  Point   Weight\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12g  %12g\n', xw(i,1), xw(i,2) );
  end
%
%  Laguerre rule.
%
  n = 10;

  alpha = zeros ( n, 1 );
  beta = zeros ( n, 1 );

  for i = 1 : n
    alpha(i) = 2.0 * i - 1.0;
    if ( i == 1 )
      beta(i) = 1;
    else
      beta(i) = ( i - 1 )^2;
    end
  end

  ab(1:n,1) = alpha(1:n);
  ab(1:n,2) = beta(1:n);

  xw = gauss ( n, ab );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LAGUERRE RULE\n' );
  fprintf ( 1, '  Point   Weight\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12g  %12g\n', xw(i,1), xw(i,2) );
  end

  return
end
