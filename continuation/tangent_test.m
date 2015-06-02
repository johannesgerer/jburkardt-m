function tangent_test ( )

%*****************************************************************************80
%
%% TANGENT_TEST does a simple test of the TANGENT function.
%
%  Discussion:
%
%    We seek a solution of the implicit function that defines a circle,
%      X^2 + Y^2 = 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 April 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TANGENT_TEST\n' );
  fprintf ( 1, '  Demonstrate the TANGENT function for continuation.\n' );
  fprintf ( 1, '  At a point X, using continuation parameter P,\n' );
  fprintf ( 1, '  compute the tangent vector of unit norm.\n' );

  n = 2;
  temp = - sqrt ( 3.0 ) / 2.0;
  x = [ 0.5; temp ];
  t = zeros ( n, 1 );
  p = 1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index of current continuation parameter P = %d\n', p );

  r8vec_print ( n, x, '  Current point X:' );

  [ t2, p2 ] = tangent ( n, x, t, p, @fp_circle );

  r8vec_print ( n, t2, '  Unit tangent vector T2:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Index of next continuation parameter P2 = %d\n', p2 );

  return
end



