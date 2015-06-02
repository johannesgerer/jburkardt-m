function chebyshev1_compute_test ( )

%*****************************************************************************80
%
%% CHEBYSHEV1_COMPUTE_TEST tests CHEBYSHEV1_COMPUTE.
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
  fprintf ( 1, 'CHEBYSHEV1_COMPUTE_TEST\n' );
  fprintf ( 1, '  CHEBYSHEV1_COMPUTE computes\n' );
  fprintf ( 1, '  a Chebyshev Type 1 quadrature rule over [-1,1]\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index       X             W\n' );
  fprintf ( 1, '\n' );

  for n = 1 : 10

    [ x, w ] = chebyshev1_compute ( n );

    fprintf ( 1, '\n' );

    for i = 1 : n
      fprintf ( 1, '  %2d  %12g  %12g\n', i, x(i), w(i) );
    end

  end

  return
end
