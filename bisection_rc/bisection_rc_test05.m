function bisection_rc_test05 ( )

%*****************************************************************************80
%
%% BISECTION_RC_TEST05 tests BISECTION_RC for Kepler's problem.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/bisection_rc/bisection_rc_test05.m
%
%  Discussion:
%
%    Kepler's equation has the form:
%
%      X = M + E * sin ( X )
%
%    X represents the eccentric anomaly of a planet, the angle between the
%    perihelion (the point on the orbit nearest to the sun) through the sun 
%    to the center of the ellipse, and the line from the center of the ellipse
%    to the planet.
%
%    There are two parameters, E and M:
%
%    * E is the eccentricity of the orbit, which should be between 0 and 1.0;
%
%    * M is the angle from the perihelion made by a fictitious planet traveling
%      on a circular orbit centered at the sun, and traveling at a constant
%      angular velocity equal to the average angular velocity of the true
%      planet.  M is usually between 0 and 180 degrees, but can have any value.
%
%    For convenience, X and M are measured in degrees.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 January 2013
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Cleve Moler,
%    Numerical Computing with MATLAB,
%    SIAM, 2004,
%    ISBN13: 978-0-898716-60-3,
%    LC: QA297.M625,
%    ebook: http://www.mathworks.com/moler/chapters.html
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BISECTION_RC_TEST05\n' );
  fprintf ( 1, '  The Kepler equation.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Kepler''s equation has the form\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    X = M + E * sin ( X )\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  X represents the eccentric anomaly of a planet, the angle between the\n' );
  fprintf ( 1, '  perihelion (the point on the orbit nearest to the sun) through the sun \n' );
  fprintf ( 1, '  to the center of the ellipse, and the line from the center of the ellipse\n' );
  fprintf ( 1, '  to the planet.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  There are two parameters, E and M:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * E is the eccentricity of the orbit, which should be between 0 and 1.0;\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  * M is the angle from the perihelion made by a fictitious planet traveling\n' );
  fprintf ( 1, '    on a circular orbit centered at the sun, and traveling at a constant\n' );
  fprintf ( 1, '    angular velocity equal to the average angular velocity of the true\n' );
  fprintf ( 1, '    planet.  M is usually between 0 and 180 degrees, but can have any value.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  For convenience, X and M are measured in degrees.\n' );
%
%  Problem parameters.
%
  md = 24.851090;
  mr = md * pi / 180.0;
  e = 0.1;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Given eccentricity E = %g\n', e );
  fprintf ( 1, '  Given angle M = %g (degrees)\n', md );
  fprintf ( 1, '                = %g (radians)\n', mr );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Given E and M, find corresponding X.\n' );
%
%  Iteration parameters.
%
  fx_tol = 1.0E-09;
  dx_tol = 1.0E-09;
  it = 0;
  it_max = 30;
  job = 0;
  fx = 0.0;
%
%  Initial guess for interval.
%
  ad = 0.0;
  bd = 180.0;

  ar = ad * pi / 180.0;
  br = bd * pi / 180.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I      X               FX              DX\n' );
  fprintf ( 1, '\n' );

  while ( 1 )

    [ ar, br, xr, job ] = bisection_rc ( ar, br, fx, job );

    if ( job < 0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Error return.\n' );
      break;
    end

    it = it + 1;

    fx = xr - mr - e * sin ( xr );

    if ( it <= 2 )
      dx = abs ( br - ar );
    else
      dx = 0.5 * abs ( br - ar );
    end

    fprintf ( 1, '  %4d  %14.6g  %14.6g  %14.6g\n', it, xr, fx, dx );

    if ( abs ( fx ) <= fx_tol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Function is small.\n' );
      break
    end

    if ( dx <= dx_tol )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Interval is tiny.\n' );
      break
    end

    if ( it_max <= it )
      fprintf ( 1, '\n' );
      fprintf ( 1, '  Reached iteration limit.\n' );
      break
    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  In RADIANS:\n' );
  fprintf ( 1, '\n' );
  fx = ar - mr - e * sin ( ar );
  fprintf ( 1, '  A = %24.16g, F(A) = %14.6g\n', ar, fx );
  fx = xr - mr - e * sin ( xr  );
  fprintf ( 1, '  X = %24.16g, F(X) = %14.6g\n', xr, fx );
  fx = br - mr - e * sin ( br );
  fprintf ( 1, '  B = %24.16g, F(B) = %14.6g\n', br, fx );

  ad = ar * 180 / pi;
  xd = xr * 180 / pi;
  bd = br * 180 / pi;
  fprintf ( 1, '\n' );
  fprintf ( 1, '  In DEGREES:\n' );
  fprintf ( 1, '\n' );
  fx = ( ad - md ) * pi / 180 - e * sin ( ad * pi / 180 );
  fprintf ( 1, '  A = %24.16g, F(A) = %14.6g\n', ad, fx );
  fx = ( xd - md ) * pi / 180 - e * sin ( xd * pi / 180  );
  fprintf ( 1, '  X = %24.16g, F(X) = %14.6g\n', xd, fx );
  fx = ( bd - mr ) * pi / 180 - e * sin ( bd * pi / 180 );
  fprintf ( 1, '  B = %24.16g, F(B) = %14.6g\n', bd, fx );


  return
end
