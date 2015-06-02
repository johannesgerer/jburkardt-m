function triangulate_rectangle_test ( )

%*****************************************************************************80
%
%% TRIANGULATE_RECTANGLE_TEST tests the TRIANGULATE_RECTANGLE library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 March 2015
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATE_RECTANGLE_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TRIANGULATE_RECTANGLE library.\n' );

  triangulate_rectangle_test01 ( );
  triangulate_rectangle_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGULATE_RECTANGLE_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
