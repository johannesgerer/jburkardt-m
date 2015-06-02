function exterior_point_characteristic_test ( )

%*****************************************************************************80
%
%% EXTERIOR_POINT_CHARACTERISTIC_TEST tests EXTERIOR_POINT_CHARACTERISTIC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'EXTERIOR_POINT_CHARACTERISTIC_TEST\n' );
  fprintf ( 1, '  EXTERIOR_POINT_CHARACTERISTIC seeks a point "outside" an object\n' );
  fprintf ( 1, '  for which a characteristic function has been provided.\n' );
  fprintf ( 1, '  We assume that we have been given a base point X0, which\n' );
  fprintf ( 1, '  is an interior point, that is, F(X0) = 1.\n' );
  fprintf ( 1, '  We also assume we have been given a direction, specified\n' );
  fprintf ( 1, '  by the vector THETA, and measured from X0, along which\n' );
  fprintf ( 1, '  we are to search for the exterior point.\n' );

  m = 2;
  a = [ 0.0; 0.0 ];
  b = [ 1.0; 1.0 ];

  xi = interior_point_characteristic ( m, a, b, @circle_characteristic );

  if ( isempty ( xi ) ) then

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Could not find an interior point!\n' );

  else

    r8vec_print ( m, xi, '  Interior point:' );
    x0 = xi;
    theta = 0.5 * pi;
    xe = exterior_point_characteristic ( m, x0, theta, @circle_characteristic );

    r8vec_print ( m, xe, '  Exterior point:' );

  end
  return
end
