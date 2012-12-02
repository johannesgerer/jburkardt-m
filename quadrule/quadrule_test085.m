function quadrule_test085 ( )

%*****************************************************************************80
%
%% TEST085 tests HERMITE_EK_COMPUTE against HERMITE_INTEGRAL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 April 2011
%
%  Author:
%
%    John Burkardt
%
  n_max = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST085\n' );
  fprintf ( 1, '  HERMITE_EK_COMPUTE computes a Gauss-Hermite rule\n' );
  fprintf ( 1, '  which is appropriate for integrands of the form\n' );
  fprintf ( 1, '    f(x) * exp(-x*x) from -oo to +oo.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  HERMITE_INTEGRAL determines the exact value of\n' );
  fprintf ( 1, '  this integal when f(x) = x^m.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '         N         N       Estimate       Exact            Error\n' );

  for m = 0 : 2 : 10

    exact = hermite_integral ( m );

    fprintf ( 1, '\n' );

    for n = 1 : n_max

      [ xtab, weight ] = hermite_ek_compute ( n );

      if ( m == 0 )
        f_vec(1:n,1) = 1.0;
      else
        f_vec(1:n,1) = xtab(1:n).^m;
      end

      estimate = weight(1:n)' * f_vec(1:n);

      err = abs ( exact - estimate );

      fprintf ( 1, '  %8d  %8d  %14f  %14f  %14f\n', ...
        m, n, estimate, exact, err );

    end

  end

  return
end
