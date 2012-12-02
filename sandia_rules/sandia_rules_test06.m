function sandia_rules_test06 ( )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST06 tests CLENSHAW_CURTIS_COMPUTE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 February 2009
%
%  Author:
%
%    John Burkardt
%
  order_max = 10;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SANDIA_RULES_TEST06\n' );
  fprintf ( 1, '  CLENSHAW_CURTIS_COMPUTE computes a Clenshaw Curtis rule\n' );
  fprintf ( 1, '  which is appropriate for integrands of the form\n' );
  fprintf ( 1, '    Integral ( -1 <= x <= +1 ) f(x) dx.\n' );

  for order = 1 : order_max
  
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Order = %d\n', order );

    [ x, w ] = clenshaw_curtis_compute ( order );
 
    for i = 1 : order
      fprintf ( 1, '  %8d  %24.16f  %24.16f\n', i, x(i), w(i) );
    end

  end

  return
end
