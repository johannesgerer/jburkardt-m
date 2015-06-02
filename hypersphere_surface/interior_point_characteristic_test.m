function interior_point_characteristic_test ( )

%*****************************************************************************80
%
%% INTERIOR_POINT_CHARACTERISTIC_TEST tests the INTERIOR_POINT_CHARACTERISTIC function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 May 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'INTERIOR_POINT_CHARACTERISTIC_TEST\n' );
  fprintf ( 1, '  INTERIOR_POINT_CHARACTERISTIC seeks a point "inside" an object\n' );
  fprintf ( 1, '  for which a characteristic function has been provided.\n' );
  fprintf ( 1, '  We also assume that a hyperrectangle has been specified\n' );
  fprintf ( 1, '  which contains the search region.\n' );

  m = 2;
  a = [ 0.0; 0.0 ];
  b = [ 1.0; 1.0 ];

  xi = interior_point_characteristic ( m, a, b, @circle_characteristic );

  if ( isempty ( xi ) ) then
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Could not find an interior point!\n' );
  else
    r8vec_print ( m, xi, '  Interior point:' );
  end

  return
end
