function latin_cover_test ( )

%*****************************************************************************80
%
%% LATIN_COVER_TEST tests the LATIN_COVER library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 August 2012
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_COVER_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LATIN_COVER library.\n' );

  latin_cover_test01 ( );
  latin_cover_test02 ( );
  latin_cover_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LATIN_COVER_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
