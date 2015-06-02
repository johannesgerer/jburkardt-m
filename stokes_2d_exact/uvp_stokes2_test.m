function uvp_stokes2_test ( )

%*****************************************************************************80
%
%% UVP_STOKES2_TEST samples the solution #2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 January 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'UVP_STOKES2_TEST\n' );
  fprintf ( 1, '  Exact Stokes solution #2:\n' );
  fprintf ( 1, '  Estimate the range of velocity and pressure\n' );
  fprintf ( 1, '  using a region that is the unit square.\n' );

  n = 1000;
  xy_lo = 0.0;
  xy_hi = 1.0;
  seed = 123456789;

  [ x, seed ] = r8vec_uniform_ab ( n, xy_lo, xy_hi, seed );
  [ y, seed ] = r8vec_uniform_ab ( n, xy_lo, xy_hi, seed );

  [ u, v, p ] = uvp_stokes2 ( n, x, y );

  fprintf ( 1, '\n' );
  fprintf ( 1, '           Minimum       Maximum\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  U:    %14.6g  %14.6g\n', min ( u ), max ( u ) );
  fprintf ( 1, '  U:    %14.6g  %14.6g\n', min ( v ), max ( v ) );
  fprintf ( 1, '  U:    %14.6g  %14.6g\n', min ( p ), max ( p ) );

  return
end
