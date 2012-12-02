function geometry_test221 ( )

%*****************************************************************************80
%
%% TEST221 tests VECTOR_DIRECTIONS_ND;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 February 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;
  ntest = 3;

  vtest = [ ...
    1.0, 0.0, 0.0; ...
    1.0, 2.0, 3.0; ...
    0.0, 0.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST221\n' );
  fprintf ( 1, '  VECTOR_DIRECTIONS_ND computes the angles\n' );
  fprintf ( 1, '  that a vector makes with the axes.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '    X       Y       Z      AX      AY      AZ      AX      AY      AZ\n' );
  fprintf ( 1, ...
    '                         (_____Radians_______) (_______Degrees_______)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    v(1:dim_num) = vtest(1:dim_num,i);

    angle = vector_directions_nd ( dim_num, v );

    for j = 1 : dim_num
      angle_degrees(j) = radians_to_degrees ( angle(j) );
    end

    fprintf ( 1, '  %6f  %6f  %6f  %6f  %6f  %6f  %6f  %6f  %6f\n', ...
      v(1:dim_num), angle(1:dim_num), angle_degrees(1:dim_num) );
 
  end
 
  return
end
