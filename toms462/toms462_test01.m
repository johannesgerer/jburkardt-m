function toms462_test01 ( )

%*****************************************************************************80
%
%% TOMS462_TEST01 tests BIVNOR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    13 April 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TOMS462_TEST01\n' );
  fprintf ( 1, '  Compare BIVNOR with some simple data\n' );
  fprintf ( 1, '  with 3 digit accuracy.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '       X         Y          R          P               P\n' );
  fprintf ( 1, '                                      (Tabulated)     (BIVNOR)\n' );
  fprintf ( 1, '\n' );

  x =  0.8;
  y = -1.5;
  r =  -0.9;
  expect = 0.148;
  cdf = bivnor ( x, y, r );
  fprintf ( 1, '  %9.5f  %9.5f  %9.5f  %14.6g  %14.6g\n', x, y, r, expect, cdf );

  x =  0.6;
  y = -1.4;
  r =  -0.7;
  expect = 0.208;
  cdf = bivnor ( x, y, r );
  fprintf ( 1, '  %9.5f  %9.5f  %9.5f  %14.6g  %14.6g\n', x, y, r, expect, cdf );

  x =  0.2;
  y = -1.0;
  r =  -0.5;
  expect = 0.304;
  cdf = bivnor ( x, y, r );
  fprintf ( 1, '  %9.5f  %9.5f  %9.5f  %14.6g  %14.6g\n', x, y, r, expect, cdf );

  x = -1.2;
  y =  0.1;
  r =   0.0;
  expect = 0.407;
  cdf = bivnor ( x, y, r );
  fprintf ( 1, '  %9.5f  %9.5f  %9.5f  %14.6g  %14.6g\n', x, y, r, expect, cdf );

  x = -1.2;
  y = -0.1;
  r =   0.3;
  expect = 0.501;
  cdf = bivnor ( x, y, r );
  fprintf ( 1, '  %9.5f  %9.5f  %9.5f  %14.6g  %14.6g\n', x, y, r, expect, cdf );

  x = -0.4;
  y = -0.9;
  r =   0.6;
  expect = 0.601;
  cdf = bivnor ( x, y, r );
  fprintf ( 1, '  %9.5f  %9.5f  %9.5f  %14.6g  %14.6g\n', x, y, r, expect, cdf );

  return
end
