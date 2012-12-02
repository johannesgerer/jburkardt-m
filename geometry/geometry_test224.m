function geometry_test224 ( )

%*****************************************************************************80
%
%% TEST224 tests VECTOR_SEPARATION_ND;
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
  ntest = 5;

  vtest = [ ...
    1.0,  0.0,  0.0; ...
    1.0,  2.0,  3.0; ...
    0.0,  0.0,  1.0; ...
   -3.0,  2.0, -1.0; ...
   -2.0, -4.0, -6.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST224\n' );
  fprintf ( 1, '  VECTOR_SEPARATION_3D computes the separation angle\n' );
  fprintf ( 1, '  between two vectors.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, ...
    '    -----Vector 1-----      -----Vector 2-----     Radians    Degrees\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    v1(1:dim_num) = vtest(1:dim_num,i);

    for j = i+1 : ntest

      v2(1:dim_num) = vtest(1:dim_num,j);

      theta = vector_separation_nd ( dim_num, v1, v2 );

      theta_deg = radians_to_degrees ( theta );

      fprintf ( 1, '  %10f  %10f  %10f  %10f  %10f  %10f  %10f     %10f\n', ...
        v1(1:dim_num), v2(1:dim_num), theta, theta_deg );

    end

  end

  return
end
