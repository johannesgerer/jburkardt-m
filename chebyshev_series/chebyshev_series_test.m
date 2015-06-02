function chebyshev_series_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for CHEBYSHEV_SERIES_TEST.
%
%  Discussion:
%
%    CHEBYSHEV_SERIES_TEST tests the CHEBYSHEV_SERIES library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 April 2014
%
%  Author:
%
%    Manfred Zimmer
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_SERIES_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the CHEBYSHEV_SERIES libary.\n' );

  chebyshev_series_test01 ( );
  chebyshev_series_test02 ( );
  chebyshev_series_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CHEBYSHEV_SERIES_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
