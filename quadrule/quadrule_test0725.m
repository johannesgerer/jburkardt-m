function quadrule_test0725 ( )

%*****************************************************************************80
%
%% TEST0725 tests CLENSHAW_CURTIS_COMPUTE
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    19 October 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0725\n' );
  fprintf ( 1, '  CLENSHAW_CURTIS_COMPUTE computes\n' );
  fprintf ( 1, '  a Clenshaw-Curtis quadrature rule over [-1,1]\n' );
  fprintf ( 1, '  of given order.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    Order  W             X\n' );
  fprintf ( 1, '\n' );

  for order = 1 : 10

    [ x, w ] = clenshaw_curtis_compute ( order );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %8d\n', order );

    for i = 1 : order
      fprintf ( 1, '            %12f  %12f\n', w(i), x(i) );
    end

  end

  return
end
