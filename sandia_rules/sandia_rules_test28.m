function sandia_rules_test28 ( )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST28 tests PATTERSON_LOOKUP against LEGENDRE_INTEGRAL.
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
  level_max = 5;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_RULES_TEST28\n' );
  fprintf ( 1, '  PATTERSON_LOOKUP computes a Gauss-Patterson rule\n' );
  fprintf ( 1, '  which is appropriate for integrands of the form\n' );
  fprintf ( 1, '    Integral ( -1 <= x <= +1 ) f(x)  dx.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  LEGENDRE_INTEGRAL determines the exact value of\n' );
  fprintf ( 1, '  this integal when f(x) = x^n.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  A rule of order ORDER should be exact for monomials X^N\n' );
  fprintf ( 1, '  up to N = (3*ORDER+1)/2\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In the following table, for each order, the LAST THREE estimates\n' );
  fprintf ( 1, '  are made on monomials that exceed the exactness limit for the rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     Order         N       Estimate       Exact            Error\n' );

  for level = 0 : level_max
  
    order = 2^(level+1) - 1;

    fprintf ( 1, '\n' );

    [ x, w ] = patterson_lookup ( order );

    if ( order == 1 )
      p = 1;
    else
      p = ( 3 * order + 1 ) / 2;
    end

    for n = 0 : p + 3
    
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
