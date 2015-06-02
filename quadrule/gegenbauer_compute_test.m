function gegenbauer_compute_test ( n, alpha )

%*****************************************************************************80
%
%% GEGENBAUER_COMPUTE_TEST compares GEGENBAUER_COMPUTE.
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
%  Parameters:
%
%    Input, integer N, the order of the rule.
%
%    Input, real ALPHA, the parameter.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GEGENBAUER_COMPUTE_TEST\n' );
  fprintf ( 1, '  GEGENBAUER_COMPUTE computes Gauss-Gegenbauer rules;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The printed output of this test can be inserted into\n' );
  fprintf ( 1, '  a MATLAB program. ' );

  [ x, w ] = gegenbauer_compute ( n, alpha );

  fprintf ( 1, '%\n' );
  fprintf ( 1, '%  Abscissas X and weights W for a generalized Gauss Gegenbauer rule\n' );
  fprintf ( 1, '%  of order = %d\n', n );
  fprintf ( 1, '%  with ALPHA = %f\n', alpha );
  fprintf ( 1, '%\n' );

  for i = 1 : n
    fprintf ( 1, '    x(%d) = %f;\n', i, x(i) );
  end
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '    w(%d) = %f;\n', i, w(i) );
  end

  return
end

