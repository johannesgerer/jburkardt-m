function sandia_rules_test05 ( )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST05 tests CLENSHAW_CURTIS_COMPUTE against LEGENDRE_INTEGRAL.
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
  order_max = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_RULES_TEST05\n' );
  fprintf ( 1, '  CLENSHAW_CURTIS_COMPUTE computes a Clenshaw Curtis rule\n' );
  fprintf ( 1, '  which is appropriate for integrands of the form\n' );
  fprintf ( 1, '    Integral ( -1 <= x <= +1 ) f(x) dx.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEGENDRE_INTEGRAL determines the exact value of\n' );
  fprintf ( 1, '  this integal when f(x) = x^n.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A rule of order ORDER should be exact for monomials X^N up to\n' );
  fprintf ( 1, '    N = ORDER+1 if ORDER is odd,\n' );
  fprintf ( 1, '    N = ORDER   if ORDER is even.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In the following table, for each order, the LAST THREE estimates\n' );
  fprintf ( 1, '  are made on monomials that exceed the exactness limit for the rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Order         N       Estimate       Exact            Error\n' );

  for order = 1 : order_max

    fprintf ( 1, '\n' );

    [ x, w ] = clenshaw_curtis_compute ( order );

    if ( mod ( order, 2 ) == 0 )
      n_hi = order + 2;
    else
      n_hi = order + 3;
    end

    for n = 0 : n_hi

      exact = legendre_integral ( n );

      f = zeros ( order, 1 );

      if ( n == 0 )
      
        for i = 1 : order
          f(i) = 1.0;
        end
      
      else
      
        for i = 1 : order
          f(i) = x(i)^n;
        end

      end

      estimate = w(1:order)' * f(1:order);

      error = abs ( exact - estimate );
  
      fprintf ( 1, '  %8d  %8d  %14.6f  %14.6f  %14.6e\n', ...
        order, n, estimate, exact, error );

    end

  end

  return
end
