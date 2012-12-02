function llsq_test01 ( )

%*****************************************************************************80
%
%% LLSQ_TEST01 calls LLSQ to match 15 data values.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    09 March 2012
%
%  Author:
%
%    John Burkardt
%
  n = 15;

  x(1:n,1) = [ ...
    1.47, 1.50, 1.52, 1.55, 1.57, ...
    1.60, 1.63, 1.65, 1.68, 1.70, ...
    1.73, 1.75, 1.78, 1.80, 1.83 ]';
  y(1:n,1) = [ ...
    52.21, 53.12, 54.48, 55.84, 57.20, ...
    58.57, 59.93, 61.29, 63.11, 64.47, ...
    66.28, 68.10, 69.92, 72.19, 74.46 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LLSQ_TEST01\n' );
  fprintf ( 1, '  LLSQ can compute the formula for a line of the form\n' );
  fprintf ( 1, '    y = A * x + B\n' );
  fprintf ( 1, '  which minimizes the RMS error to a set of N data values.\n' );

  [ a, b ] = llsq ( n, x, y );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated relationship is y = %g * x + %g\n', a, b );
  fprintf ( 1, '  Expected value is         y = 61.272 * x - 39.062\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '     I      X       Y        B+A*X      |error|\n' );
  fprintf ( 1, '\n' );
  error = 0.0;
  for i = 1 : n
    fprintf ( 1, '  %4d  %7f  %7f  %7f  %7f\n', ...
      i, x(i), y(i), b + a * x(i), b + a * x(i) - y(i) );
    error = error + ( b + a * x(i) - y(i) ).^2;
  end
  error = sqrt ( error / n );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  RMS error =                           %g\n', error );

  return
end
