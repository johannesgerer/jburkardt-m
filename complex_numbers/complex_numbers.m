function complex_numbers ( )

%*****************************************************************************80
%
%% COMPLEX_NUMBERS is a program which demonstrates the use of complex numbers.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 November 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMPLEX_NUMBERS:\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Demonstrate complex number usage.\n' );

  complex_numbers_test01 ( );
  complex_numbers_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMPLEX_NUMBERS:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return;
end
function complex_numbers_test01 ( )

%*****************************************************************************80
%
%% COMPLEX_NUMBERS_TEST01 examines ways of assigning a complex value.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 November 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMPLEX_NUMBERS_TEST01:\n' );
  fprintf ( 1, '  Demonstrate various ways of assigning a complex value.\n' );
%
%  Assuming "i" and "j" have not been redefined, they can be used
%  to form complex numbers.
%
  a1 = 1 + 2 * i;
  a2 = 1 + 2 * j;
%
%  Alternatively, you can evaluate the square root of -1.
%
  a3 = 1 + 2 * sqrt ( -1 );
%
%  Finally, you can use the COMPLEX function.
%
  a4 = complex ( 1, 2 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  A1 = 1 + 2 * i =        ( %f, %f )\n', real ( a1 ), imag ( a1 ) );
  fprintf ( 1, '  A2 = 1 + 2 * j =        ( %f, %f )\n', real ( a2 ), imag ( a2 ) );
  fprintf ( 1, '  A3 = 1 + 2 * sqrt(-1) = ( %f, %f )\n', real ( a3 ), imag ( a3 ) );
  fprintf ( 1, '  A4 = complex(1,2) =     ( %f, %f )\n', real ( a4 ), imag ( a4 ) );

  return
end
function complex_numbers_test02 ( )

%*****************************************************************************80
%
%% COMPLEX_NUMBERS_TEST02: intrinsic functions.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 November 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'COMPLEX_NUMBERS_TEST02\n' );
  fprintf ( 1, '  Apply intrinsic functions to COMPLEX variables\n' );

  a = 1.0 + 2.0 * i;

  b = [ 1.0 + 2.0 * i; 
        3.0 + 4.0 * i;
        5.0 + 6.0 * i ];

  c = [ 1.0 + 0.1 * i, 1.0 + 0.2 * i, 1.0 + 0.3 * i;
        2.0 + 0.1 * i, 2.0 + 0.2 * i, 2.0 + 0.3 * i;
        3.0 + 0.1 * i, 3.0 + 0.2 * i, 3.0 + 0.3 * i ];
%
%  Print them.
%
  fprintf ( 1, '\n' );
  z = a;
  fprintf ( 1, '  a =              (%f,%f)\n', real ( z ), imag ( z ) );
  z = - a;
  fprintf ( 1, '  - a =            (%f,%f)\n', real ( z ), imag ( z ) );
  z = a + 3;
  fprintf ( 1, '  a + 3 =          (%f,%f)\n', real ( z ), imag ( z ) );
  z = a + 5 * i;
  fprintf ( 1, '  a + 5 * i =      (%f,%f)\n', real ( z ), imag ( z ) );
  z = 4 * a;
  fprintf ( 1, '  4 * a =          (%f,%f)\n', real ( z ), imag ( z ) );
  z = a / 8;
  fprintf ( 1, '  a / 8 =          (%f,%f)\n', real ( z ), imag ( z ) );
  z = a * a;
  fprintf ( 1, '  a * a =          (%f,%f)\n', real ( z ), imag ( z ) );
  z = a^2;
  fprintf ( 1, '  a^2 =            (%f,%f)\n', real ( z ), imag ( z ) );
  z = 1.0 / a;
  fprintf ( 1, '  1/a =            (%f,%f)\n', real ( z ), imag ( z ) );
  fprintf ( 1, '\n' );
  r = abs ( a );
  fprintf ( 1, '  abs(a) =          %f\n', r );
  z = acos ( a );
  fprintf ( 1, '  acos(a) =        (%f,%f)\n', real ( z ), imag ( z ) );
  r = angle ( a );
  fprintf ( 1, '  angle(a) =        %f\n', r );
  z = asin ( a );
  fprintf ( 1, '  asin(a) =        (%f,%f)\n', real ( z ), imag ( z ) );
  z = atan ( a );
  fprintf ( 1, '  atan(a) =        (%f,%f)\n', real ( z ), imag ( z ) );
  z = complex ( 1 );
  fprintf ( 1, '  complex(1) =     (%f,%f)\n', real ( z ), imag ( z ) );
  z = complex ( 2, 3 );
  fprintf ( 1, '  complex(2,3) =   (%f,%f)\n', real ( z ), imag ( z ) );
  z = conj ( a );
  fprintf ( 1, '  conj(a) =        (%f,%f)\n', real ( z ), imag ( z ) );
  z = cos ( a );
  fprintf ( 1, '  cos(a) =         (%f,%f)\n', real ( z ), imag ( z ) );
  z = cosh ( a );
  fprintf ( 1, '  cosh(a) =        (%f,%f)\n', real ( z ), imag ( z ) );
  z = exp ( a );
  fprintf ( 1, '  exp(a) =         (%f,%f)\n', real ( z ), imag ( z ) );
  r = imag ( a );
  fprintf ( 1, '  imag(a) =         %f\n', r );
  z = log ( a );
  fprintf ( 1, '  log(a) =         (%f,%f)\n', real ( z ), imag ( z ) );
  z = log10 ( a );
  fprintf ( 1, '  log10(a) =       (%f,%f)\n', real ( z ), imag ( z ) );
  r = real ( a );
  fprintf ( 1, '  real(a) =         %f\n', r );
  z = sin ( a );
  fprintf ( 1, '  sin(a) =         (%f,%f)\n', real ( z ), imag ( z ) );
  z = sinh ( a );
  fprintf ( 1, '  sinh(a) =        (%f,%f)\n', real ( z ), imag ( z ) );
  z = sqrt ( a );
  fprintf ( 1, '  sqrt(a) =        (%f,%f)\n', real ( z ), imag ( z ) );
  z = tan ( a );
  fprintf ( 1, '  tan(a) =         (%f,%f)\n', real ( z ), imag ( z ) );
  z = tanh ( a );
  fprintf ( 1, '  tanh(a) =        (%f,%f)\n', real ( z ), imag ( z ) );
  fprintf ( 1, '\n' );
  z = sum ( b );
  fprintf ( 1, '  sum(b) =         (%f,%f)\n', real ( z ), imag ( z ) );
  z = prod ( b );
  fprintf ( 1, '  product(b) =     (%f,%f)\n', real ( z ), imag ( z ) );
  r = norm ( b );
  fprintf ( 1, '  norm(b) =         %f\n', r );
  z = a' * a;
  fprintf ( 1, '  a''*a =           (%f,%f)\n', real ( z ), imag ( z ) );

  d = c * b;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  D = C * B\n' );
  fprintf ( 1, '\n' );

  for ii = 1 : 3
    fprintf ( 1, '  (%10f, %10f)\n', real ( d(ii) ), imag ( d(ii) ) );
  end

  return
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
