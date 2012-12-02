function sine_transform_test02 ( )

%*****************************************************************************80
%
%% SINE_TRANSFORM_TEST02 uses the functional form of the routine.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 December 2011
%
%  Author:
%
%    John Burkardt
%
  n = 9;
  a = 1.0;
  b = 3.0;
  x2 = linspace ( a, b, n + 2 );
  x = x2(2:n+1);

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SINE_TRANSFORM_TEST02:\n' );
  fprintf ( 1, '  SINE_TRANSFORM_FUNCTION does a sine transform of data\n' );
  fprintf ( 1, '  defined by a function F(X) evaluated at equally spaced\n' );
  fprintf ( 1, '  points in an interval [A,B].\n' );
  fprintf ( 1, '\n' ); 
  fprintf ( 1, '  Demonstrate that the transform is its own inverse.\n' );
  fprintf ( 1, '  Let X(0:N+1) be N+2 equally spaced points in [A,B].\n' );
  fprintf ( 1, '  Let S be the transform of F(X(1:N)).\n' );
  fprintf ( 1, '  Let F1 be the linear interpolant of (A,F(A)), (B,F(B)).\n' );
  fprintf ( 1, '  Let F2 be the transform of S.\n' );
  fprintf ( 1, '  Then F(X(1:N)) = F1(X(1:N)) + F2(1:N).\n' );

  s = sine_transform_function ( n, a, b, @poly5 );

  fa = poly5 ( a );
  fb = poly5 ( b );
  f1(1:n+2) = ( ( b - x2(1:n+2)     ) * fa   ...
            + (       x2(1:n+2) - a ) * fb ) ...
            / ( b               - a );

  f2 = sine_transform_data ( n, s );

  fprintf ( 1, '\n' );
  fprintf ( 1, '     I      X(I)      F(X(I))       S           F1          F2          F1+F2\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '  %4d  %10f  %10f  %10f  %10f  %10f  %10f\n', ...
    0, x2(1), poly5 ( x2(1) ), 0.0, f1(1), 0.0, f1(1) );

  for i = 1 : n
    fprintf ( 1, '  %4d  %10f  %10f  %10f  %10f  %10f  %10f\n', ...
      i, x(i), poly5 ( x(i) ), s(i), f1(i+1), f2(i), f1(i+1) + f2(i) );
  end

  fprintf ( 1, '  %4d  %10f  %10f  %10f  %10f  %10f  %10f\n', ...
    n+1, x2(n+2), poly5 ( x2(n+2) ), 0.0, f1(n+2), 0.0, f1(n+2) );

  return
end
