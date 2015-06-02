function chebyshev3_compute_test ( )

%*****************************************************************************80
%
%% CHEBYSHEV3_COMPUTE_TEST tests CHEBYSHEV3_COMPUTE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    17 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV3_COMPUTE_TEST\n' );
  fprintf ( 1, '  CHEBYSHEV3_COMPUTE computes\n' );
  fprintf ( 1, '  a Chebyshev Type 3 quadrature rule over [-1,1]\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index       X             W\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 10

    [ x, w ] = chebyshev3_compute ( n );

    fprintf ( 1, '\n' );

    for i = 1 : n
      fprintf ( 1, '  %2d  %12g  %12g\n', i, x(i), w(i) );
    end

  end

  return
end
