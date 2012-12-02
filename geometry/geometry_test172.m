function geometry_test172 ( )

%*****************************************************************************80
%
%% TEST172 tests QUAT_CONJ, QUAT_INV, QUAT_MUL, QUAT_NORM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 May 2005
%
%  Author:
%
%    John Burkardt
%
  q1 = [ 2.0, 3.0, 4.0, 5.0 ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST172\n' );
  fprintf ( 1, '  QUAT_CONJ conjugates a quaternion;\n' );
  fprintf ( 1, '  QUAT_INV inverts a quaternion;\n' );
  fprintf ( 1, '  QUAT_MUL multiplies quaternions.\n' );
  fprintf ( 1, '  QUAT_NORM computes the norm.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Q1 =            %10f  %10f  %10f  %10f\n', q1(1:4) );

  fprintf ( 1, '  Norm ( Q1 ) = %10f\n', quat_norm ( q1 ) );

  q2 = quat_conj ( q1 );

  fprintf ( 1, '  Q2 = conj(Q1) = %10f  %10f  %10f  %10f\n', q2(1:4) );

  q3 = quat_mul ( q1, q2 );

  fprintf ( 1, '  Q3 = Q1*Q2 =    %10f  %10f  %10f  %10f\n', q3(1:4) );

  q2 = quat_inv ( q1 );

  fprintf ( 1, '  Q2 = inv(Q1) =  %10f  %10f  %10f  %10f\n', q2(1:4) );

  q3 = quat_mul ( q1, q2 );

  fprintf ( 1, '  Q3 = Q1*Q2 =    %10f  %10f  %10f  %10f\n', q3(1:4) );

  return
end
