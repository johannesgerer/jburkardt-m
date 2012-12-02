function stroud_test255 ( )

%*****************************************************************************80
%
%% TEST255 tests PYRAMID_UNIT_MONOMIAL_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 April 2009
%
%  Author:
%
%    John Burkardt
%
  degree_max = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST255\n' );
  fprintf ( 1, '  For the unit pyramid,\n' );
  fprintf ( 1, '  PYRAMID_UNIT_MONOMIAL_3D returns the exact value of the\n' );
  fprintf ( 1, ' integral of X^ALPHA Y^BETA Z^GAMMA\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Volume = %f\n', pyramid_unit_volume_3d ( ) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     ALPHA      BETA     GAMMA      INTEGRAL\n' );
  fprintf ( 1, '\n' );

  for alpha = 0 : degree_max
    for beta = 0 : degree_max - alpha
      for gamma = 0 : degree_max - alpha - beta
        value = pyramid_unit_monomial_3d ( alpha, beta, gamma );
        fprintf ( 1, '  %8d  %8d  %8d  %14.6e\n', alpha, beta, gamma, value );
      end
    end
  end

  return
end
