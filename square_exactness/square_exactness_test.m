function exactness_2d_test ( )

%*****************************************************************************80
%
%% SQUARE_EXACTNESS_TEST tests the SQUARE_EXACTNESS library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 May 2014
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SQUARE_EXACTNESS_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SQUARE_EXACTNESS library.\n' );

  square_exactness_test01 ( );
  square_exactness_test02 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SQUARE_EXACTNESS_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
