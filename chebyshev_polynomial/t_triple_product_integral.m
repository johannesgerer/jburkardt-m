function value = t_triple_product_integral ( i, j, k )

%*****************************************************************************80
%
%% T_TRIPLE_PRODUCT_INTEGRAL: integral (-1<=x<=1) T(i,x)*T(j,x)*T(k,x)/sqrt(1-x^2) dx
%
%  Discussion:
%
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 April 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Mason, David Handscomb,
%    Chebyshev Polynomials,
%    CRC Press, 2002,
%    ISBN: 0-8493-035509,
%    LC: QA404.5.M37.
%
%  Parameters:
%
%    Input, integer I, J, K, the polynomial indices.
%    0 <= I, J.
%
%    Output, real VALUE, the integral.
%
  if ( i < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'T_TRIPLE_PRODUCT_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  0 <= I is required.\n' );
    error ( 'T_TRIPLE_PRODUCT_INTEGRAL - Fatal error!' );
  end

  if ( j < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'T_TRIPLE_PRODUCT_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  0 <= J is required.\n' );
    error ( 'T_TRIPLE_PRODUCT_INTEGRAL - Fatal error!' );
  end

  if ( k < 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'T_TRIPLE_PRODUCT_INTEGRAL - Fatal error!\n' );
    fprintf ( 1, '  0 <= K is required.\n' );
    error ( 'T_TRIPLE_PRODUCT_INTEGRAL - Fatal error!' );
  end

  value = 0.5 * ( ...
      t_double_product_integral (       i + j,   k ) + ...
    + t_double_product_integral ( abs ( i - j ), k ) );

  return
end
