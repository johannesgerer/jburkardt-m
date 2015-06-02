function pdflib_test ( )

%*****************************************************************************80
%
%% PDFLIB_TEST tests the PDFLIB library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2013
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../rnglib' );

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PDFLIB_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the PDFLIB library.\n' );
%
%  Initialize the random number generator package.
%
  initialize ( );

  pdflib_test01 ( );
  pdflib_test02 ( );
  pdflib_test03 ( );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PDFLIB_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../rnglib' );

  return
end
