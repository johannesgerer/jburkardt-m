function tetrahedron_slice_display_test ( )

%*****************************************************************************80
%
%% TETRAHEDRON_SLICE_DISPLAY_TEST tests the TETRAHEDRON_SLICE_DISPLAY library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 November 2013
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_SLICE_DISPLAY_TEST\n' );
  fprintf ( 1, '  MATLAB version.\n' );
  fprintf ( 1, '  Test the TETRAHEDRON_SLICE_DISPLAY library.\n' );

  t = [ 0, 0, 0;...
        1, 0, 0;...
        0, 1, 0;
        0, 0, 1]';

  n = [ 1, 1, 0 ];

  p = [ 0.2, 0.2, 0 ];

  tetrahedron_slice_display ( p, n, t );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TETRAHEDRON_SLICE_DISPLAY_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

