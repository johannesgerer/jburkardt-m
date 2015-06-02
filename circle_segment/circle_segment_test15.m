function circle_segment_test15 ( )

%*****************************************************************************80
%
%% CIRCLE_SEGMENT_TEST15 demonstrates WEIGHTS_3T.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 July 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CIRCLE_SEGMENT_TEST15\n' );
  fprintf ( 1, '  NOT WORKING!  NOT WORKING!\n' );
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
  alpha = ab(:,1);
  beta = ab(:,2);

  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEGENDRE RULE\n' );
  fprintf ( 1, '  Point   Weight\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12g  %12g\n', xw(i,1), xw(i,2) );
  end

  w = weights_3t ( xw(1:n,1), alpha(1:n-1), beta(1:n-1) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEGENDRE WEIGHTS\n' );
  fprintf ( 1, '  gauss()   weights_3t()\n' );
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '  %12g  %12g\n', xw(i,2), w(i) );
  end

  return
end
