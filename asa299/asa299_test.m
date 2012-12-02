function asa299_test ( )

%*****************************************************************************80
%
%% MAIN is the main program for ASA299_PRB.
%
%  Discussion:
%
%    ASA299_PRB calls the ASA299 test routines.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 January 2007
%
%  Author:
%
%    John Burkardt
%
  timestamp ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA299_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Tests for the ASA299 library.\n' );

  asa299_test01 ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'ASA299_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );

  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
