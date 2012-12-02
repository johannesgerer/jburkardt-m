function sandia_rules_test08 ( )

%*****************************************************************************80
%
%% SANDIA_RULES_TEST08 tests FEJER2_COMPUTE.
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
  fprintf ( 1, 'SANDIA_RULES_TEST08\n' );
  fprintf ( 1, '  FEJER2_COMPUTE computes a Fejer Type 2 rule\n' );
  fprintf ( 1, '  which is appropriate for integrands of the form\n' );
  fprintf ( 1, '    Integral ( -1 <= x <= +1 ) f(x) dx.\n' );

  for order = 1 : order_max
  
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Order = %d\n', order );

    [ x, w ] = fejer2_compute ( order );
 
    for i = 1 : order
      fprintf ( 1, '  %8d  %24.16f  %24.16f\n', i, x(i), w(i) );
    end

  end

  return
end
