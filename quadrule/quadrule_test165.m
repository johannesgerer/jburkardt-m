function quadrule_test165 ( n, alpha )

%*****************************************************************************80
%
%% TEST165 compares GEN_LAGUERRE_EK_COMPUTE.
%
%  Discussion:
%
%    I used this test to generate tabular values of weights and
%    abscissas for generalized Gauss-Laguerre quadrature.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    23 April 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order.
%
%    Input, real ALPHA, the parameter.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST165\n' );
  fprintf ( 1, '  GEN_LAGUERRE_EK_COMPUTE computes generalized Gauss-Laguerre rules;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The printed output of this test can be inserted into\n' );
  fprintf ( 1, '  a MATLAB program.\n' );

  [ x, w ] = gen_laguerre_ek_compute ( n, alpha );

  fprintf ( 1, '%\n' );
  fprintf ( 1, '%  Abscissas X and weights W for a generalized Gauss Laguerre rule\n' );
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

