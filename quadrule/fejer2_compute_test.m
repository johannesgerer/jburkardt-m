function fejer2_compute_test ( )

%*****************************************************************************80
%
%% FEJER2_COMPUTE_TEST tests FEJER2_COMPUTE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    15 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FEJER2_COMPUTE_TEST\n' );
  fprintf ( 1, '  FEJER2_COMPUTE computes the abscissas and weights\n' );
  fprintf ( 1, '  of a Fejer type 2 quadrature rule.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    Order  W             X\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 10

    [ x, w ] = fejer2_compute ( n );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  %8d\n', n );

    for i = 1 : n
      fprintf ( 1, '            %12g  %12g\n', w(i), x(i) );
    end

  end

  return
end
