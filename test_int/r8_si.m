function value = r8_si ( x )

%*****************************************************************************80
%
%% R8_SI computes an approximation to the value of the sine integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2009
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton.
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, real X, the argument of the sine integral.
%
%    Output, real VALUE, the value of the sine integral.
%
  nsics = 12;
  sics = [ ...
    -0.1315646598184841929, -0.2776578526973601892, ...
     0.0354414054866659180, -0.0025631631447933978, ...
     0.0001162365390497009, -0.0000035904327241606, ...
     0.0000000802342123706, -0.0000000013562997693, ...
     0.0000000000179440722, -0.0000000000001908387, ...
     0.0000000000000016670, -0.0000000000000000122 ];

  eta = 0.1 * eps;
  nsi = inits ( sics, nsics, 0.1 * eps );

  i = find ( abs ( x ) < sqrt ( eps ) );
  value(i) = x(i);

  j = find ( abs ( x ) <= 4.0 );
  value(j) = csevl ( ( x(j).^2 - 8.0 ) * 0.125, sics, nsi );
  value(j) = x(j) .* ( 0.75 + value(j) );

  k = find ( 4.0 < abs ( x ) );
  [ f, g ] = r89sifg ( abs ( x(k) ) );
  value(k) = 0.5 * pi - f .* cos ( abs ( x(k) ) ) - g .* sin ( x(k) );
  l = find ( x(k) < 0.0 );
  value(l) = - value(l);

  return
end
