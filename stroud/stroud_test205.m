function stroud_test205 ( )

%*****************************************************************************80
%
%% TEST205 tests ELLIPSE_AREA_2D, ELLIPSE_CIRCUMFERENCE_2D, ELLIPSE_ECCENTRICITY_2D.
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
  seed = 123456789;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST205\n' );
  fprintf ( 1, '  ELLIPSE_AREA_2D returns the area of an ellipse.\n' );
  fprintf ( 1, '  ELLIPSE_ECCENTRICITY_2D returns the\n' );
  fprintf ( 1, '    eccentricity of an ellipse.\n' );
  fprintf ( 1, '  ELLIPSE_CIRCUMFERENCE_2D returns the\n' );
  fprintf ( 1, '    circumference of an ellipse.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '        R1        R2        E         Circum    Area\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 5

    if ( i == 1 )
      r1 = 25.0;
      r2 = 20.0;
    else
      [ r1, seed ] = r8_uniform_01 ( seed );
      [ r2, seed ] = r8_uniform_01 ( seed );
    end

    e = ellipse_eccentricity_2d ( r1, r2 );
    p = ellipse_circumference_2d ( r1, r2 );  
    area = ellipse_area_2d ( r1, r2 );

    fprintf ( 1, '  %9f  %9f  %9f  %10f  %12f\n', r1, r2, e, p, area );

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  (For the first example,\n' );
  fprintf ( 1, '  the eccentricity should be 0.6,\n' );
  fprintf ( 1, '  the circumference should be about 141.8).\n' );

  return
end
