function quality_test ( )

%*****************************************************************************80
%
%% QUALITY_TEST tests the QUALITY library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 August 2005
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUALITY_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the QUALITY library.\n' );

  quality_test_cvt ( );
  quality_test_halton ( );
  quality_test_sphere ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'QUALITY_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
