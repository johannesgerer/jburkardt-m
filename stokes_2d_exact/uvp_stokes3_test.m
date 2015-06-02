function uvp_stokes3_test ( )

%*****************************************************************************80
%
%% UVP_STOKES3_TEST samples the solution #3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'UVP_STOKES3_TEST\n' );
  fprintf ( 1, '  Exact Stokes solution #3:\n' );
  fprintf ( 1, '  Estimate the range of velocity and pressure\n' );
  fprintf ( 1, '  using a region that is [-1,+1]x[-1,+1].\n' );

  n = 1000;
  xy_lo = -1.0;
  xy_hi = +1.0;
  seed = 123456789;

  [ x, seed ] = r8vec_uniform_ab ( n, xy_lo, xy_hi, seed );
  [ y, seed ] = r8vec_uniform_ab ( n, xy_lo, xy_hi, seed );

  [ u, v, p ] = uvp_stokes3 ( n, x, y );

  fprintf ( 1, '\n' );
  fprintf ( 1, '           Minimum       Maximum\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  U:    %14.6g  %14.6g\n', min ( u ), max ( u ) );
  fprintf ( 1, '  V:    %14.6g  %14.6g\n', min ( v ), max ( v ) );
  fprintf ( 1, '  P:    %14.6g  %14.6g\n', min ( p ), max ( p ) );

  return
end
