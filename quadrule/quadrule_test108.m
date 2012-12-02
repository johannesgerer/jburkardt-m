function quadrule_test108 ( )

%*****************************************************************************80
%
%% TEST108 compares JACOBI_EK_COMPUTE.
%
%  Discussion:
%
%    I used this test to generate tabular values of weights and
%    abscissas for Gauss-Jacobi quadrature.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    30 April 2011
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  alpha = 0.5;
  beta = 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST108\n' );
  fprintf ( 1, '  JACOBI_EK_COMPUTE computes Gauss-Jacobi data;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The printed output of this program is legal MATLAB code.\n' );

  fprintf ( 1, '%\n' );
  fprintf ( 1, '%  Abscissas X and weights W for a Gauss Jacobi rule\n' );
  fprintf ( 1, '%  of N   = %d\n', n );
  fprintf ( 1, '%  with ALPHA = %f\n', alpha );
  fprintf ( 1, '%  and  BETA  = %f\n', beta );
  fprintf ( 1, '%\n' );

  [ x, w ] = jacobi_ek_compute ( n, alpha, beta );

  for i = 1 : n
    fprintf ( 1, '    x(%d) = %f;\n', i, x(i) );
  end
  fprintf ( 1, '\n' );
  for i = 1 : n
    fprintf ( 1, '    w(%d) = %f;\n', i, w(i) );
  end

  return
end
