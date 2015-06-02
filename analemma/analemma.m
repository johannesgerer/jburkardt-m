function analemma ( ecc, lon, obliq )

%*****************************************************************************80
%
%% ANALEMMA computes the analemma.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 January 2013
%
%  Author:
%
%    Original C version by Brian Tung.
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Optional input, double ECC, the orbital eccentricity.
%
%    Optinal input, double LON, the longitude of the perihelion in degrees.
%
%    Optional input, double OBLIQ, the obliquity in degrees.
%
  days = 365.242;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ANALEMMA\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Compute and plot the analemma, equation of time, and declination.\n' );
  fprintf ( 1, '  This program is based on a C program by Brian Tung.\n' );
%
%  Set defaults.
%  Internally, longitude and obliquity are in radians.
%
  if ( nargin < 1 )
    ecc = 0.01671;
  elseif ( ischar ( ecc ) )
    ecc = str2num ( ecc );
  end

  if ( nargin < 2 )
    lon = 1.347;
  elseif ( ischar ( lon ) )
    lon = str2num ( lon ) * pi / 180.0;
  else
    lon = lon * pi / 180.0;
  end

  if ( nargin < 3 )
    obliq = 0.4091;
  elseif ( ischar ( obliq ) )
    obliq = str2num ( obliq ) * pi / 180.0;
  else
    obliq = obliq * pi / 180.0;
  end
%
%  Compute the data using vector operations.
%
  n = 10001;

  t01 = zeros ( 1, n );
  eot = zeros ( 1, n );
  dec = zeros ( 1, n );

  i = 1 : n;
  f = ( i - 1 ) / ( n - 1 );
  tau = 2.0 * pi * f;
%
%  Set theta to the current longitude. 
%
  theta = atan2 ( sqrt ( 1.0 - ecc * ecc ) * sin ( tau ), cos ( tau ) - ecc );
%
%  Rotate clockwise in XY plane by theta, corrected by lon.
%
  x1 = cos ( theta - ( lon - pi / 2.0 ) );
  y1 = sin ( theta - ( lon - pi / 2.0 ) );
  z1 = 0.0;
% 
%  Rotate counter-clockwise in XZ plane by obliq.
%
  x2 = cos ( obliq ) * x1 + sin ( obliq ) * z1;
  y2 = y1;
  z2 = - sin ( obliq ) * x1 + cos ( obliq ) * z1;
% 
%  Set t equal to real time from tau and
%  rotate counter-clockwise by t, corrected by lon 
%
  t = tau - ecc * sin ( tau );
  x3 =   cos ( t - ( lon - pi / 2.0 ) ) .* x2 + sin ( t - ( lon - pi / 2.0 ) ) .* y2;
  y3 = - sin ( t - ( lon - pi / 2.0 ) ) .* x2 + cos ( t - ( lon - pi / 2.0 ) ) .* y2;
  z3 = z2;

  t01 = t / 2.0 / pi;
  eot = - atan2 ( y3, x3 ) * 4.0 * 180 / pi * days / ( days + 1.0 );
  dec = asin ( z3 ) * 180.0 / pi;
%
%  Plot the equation of time.
%
  figure ( 1 )
  plot ( t01, eot, 'b-' );  
  grid on
  xlabel ( '<---Normalized Date--->' );
  ylabel ( '<---Minutes Early/Late--->' );
  title ( 'Equation of Time' );
  print ( '-dpng', 'eot.png' );
%
%  Plot the declination.
%
  figure ( 2 )
  plot ( t01, dec, 'b-' );
  grid on
  xlabel ( '<---Normalized Date--->' );
  ylabel ( '<---Degrees North/South--->' );
  title ( 'Declination' );
  print ( '-dpng', 'declination.png' );
%
%  Plot the analemma.
%
  figure ( 3 )
  grid on
  plot ( eot, dec, 'b-' ); 
  grid on
  xlabel ( '<---Minutes Early/Late--->' );
  ylabel ( '<---Degrees North/South--->' );
  title ( 'Analemma' );
  print ( '-dpng', 'analemma.png' );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ANALEMMA\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return;
end
function timestamp ( )

%*****************************************************************************80
%
%% TIMESTAMP prints the current YMDHMS date as a timestamp.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  t = now;
  c = datevec ( t );
  s = datestr ( c, 0 );
  fprintf ( 1, '%s\n', s );

  return
end
