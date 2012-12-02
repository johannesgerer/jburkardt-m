%% QUAD_POOL uses the MATLABPOOL command to run the QUAD code.
%
%  Discussion:
%
%    Output printed by the function appears directly on the screen.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 March 2010
%
%  Author:
%
%    John Burkardt
%
  matlabpool open local 4

  n = 100000;
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUAD_POOL\n' );
  fprintf ( 1, '  Estimate integral using %d points\n', n );

  value = quad_fun ( n );

  matlabpool close

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Integral estimate is %f\n', value );
  fprintf ( 1, '  Exact integral    is %f\n', pi );
  fprintf ( 1, '  Error is             %e\n', abs ( value - pi ) );
