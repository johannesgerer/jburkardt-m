function simplex_coordinates_test ( )

%*****************************************************************************80
%
%% SIMPLEX_COORDINATES_TEST tests the SIMPLEX_COORDINATES library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2010
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIMPLEX_COORDINATES_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SIMPLEX_COORDINATES library.\n' );

  n = 3;
  simplex_coordinates_test01 ( n );
  simplex_coordinates_test02 ( n );

  n = 4;
  simplex_coordinates_test01 ( n );
  simplex_coordinates_test02 ( n );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SIMPLEX_COORDINATES_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
