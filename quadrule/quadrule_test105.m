function quadrule_test105 ( )

%*****************************************************************************80
%
%% TEST105 tests JACOBI_EK_COMPUTE and JACOBI_SS_COMPUTE.
%
%  Discussion:
%
%    Compare with tabular values on page 178 of Stroud and Secrest.
%
%     In particular,
%
%             X              W
%
%     1  -0.9833999115   0.4615276287E-03
%     2  -0.9447138932   0.2732249104E-02
%     3  -0.8849310847   0.8045830455E-02
%    ..  .............   ................
%    19   0.9656375637   0.7613987785E-01
%    20   0.9934477866   0.3348337670E-01
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
  order = 20;

  a = -1.0;
  b =  1.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST105\n' );
  fprintf ( 1, '  JACOBI_EK_COMPUTE sets up Gauss-Jacobi quadrature;\n' );
  fprintf ( 1, '  JACOBI_SS_COMPUTE sets up Gauss-Jacobi quadrature;\n' );
  fprintf ( 1, '  Here, we simply compute a single rule and\n' );
  fprintf ( 1, '  print it, to check for accuracy.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The integration interval is [%f, %f]\n', a, b );

  alpha = 1.5;
  beta = 0.5;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N = %d\n', order );
  fprintf ( 1, '  ALPHA = %f\n', alpha );
  fprintf ( 1, '  BETA =  %f\n', beta );

  [ x, w ] = jacobi_ek_compute ( order, alpha, beta );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  JACOBI_EK_COMPUTE:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I        X(I)            W(I)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : order
    fprintf ( 1, '  %4d  %14.8f  %14.8f\n', i, x(i), w(i) );
  end

  [ x, w ] = jacobi_ss_compute ( order, alpha, beta );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  JACOBI_SS_COMPUTE:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I        X(I)            W(I)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : order
    fprintf ( 1, '  %4d  %14.8f  %14.8f\n', i, x(i), w(i) );
  end

  return
end
